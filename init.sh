#!/usr/bin/env bash

# Strict Mode
# -e: Exit immediately if a command exits with a non-zero status.
# -o pipefail: The return value of a pipeline is the status of the last command
#    to exit with a non-zero status, or zero if no command exited with a
#    non-zero status.
# -u: Treat unset variables as an error when substituting.

set -eo pipefail
set -u

################################################################################
#                                                                              #
#                  ██╗███╗   ██╗██╗████████╗███████╗██╗  ██╗                   #
#                  ██║████╗  ██║██║╚══██╔══╝██╔════╝██║  ██║                   #
#                  ██║██╔██╗ ██║██║   ██║   ███████╗███████║                   #
#                  ██║██║╚██╗██║██║   ██║   ╚════██║██╔══██║                   #
#                  ██║██║ ╚████║██║   ██║██╗███████║██║  ██║                   #
#                  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝╚═╝  ╚═╝                   #
#                                                                              #
################################################################################

# Filename: init.sh
# Author: GJS (homelab-alpha)
# Date: 2025-07-22T12:42:06+02:00
# Version: 0.1.0

# Description: This script automates the setup of a new project from the template.
#   It personalizes the project by updating package.json files, Docker
#   configurations, CODEOWNERS, LICENSE, and optionally re-initializing the Git
#   repository with a choice between public or private visibility.

# Usage: ./init.sh

# --- Global Constants and Variables ---
SCRIPT_NAME=$(basename "$0")
readonly SCRIPT_NAME

LOGFILE="init.sh_$(date +'%Y-%m-%d_%H-%M-%S').log"
readonly LOGFILE

YEAR=$(date +'%Y')
readonly YEAR

# This variable will store the original directory name
ORIGINAL_DIR_NAME=$(basename "$PWD")
readonly ORIGINAL_DIR_NAME

# --- Color Definitions ---
readonly COLOR_BLUE='\033[1;34m'
readonly COLOR_GREEN='\033[1;32m'
readonly COLOR_CYAN='\e[36m'
readonly COLOR_RESET='\033[0m'

# This variable will be set by the user.
INITIALIZE_GIT=""
REPOSITORY_VISIBILITY=""

# --- Helper Functions ---

# Function to log messages to stdout and a log file.
# Parameters:
#   $1: The message to log.
log() {
    local message="$1"
    # The '|| true' prevents the script from exiting if 'date' fails, which is highly unlikely.
    local timestamp
    timestamp=$(date +'%Y-%m-%d %H:%M:%S') || true
    echo "$timestamp - $message" | tee -a "$LOGFILE"
}

# Function to print a section header, adjusting to terminal width.
# Parameters:
#   $1: Header text.
print_section_header() {
    local header_text="$1"
    local terminal_width

    # Get terminal width, default to 80 if tput is not available or fails.
    terminal_width=$(tput cols 2>/dev/null) || terminal_width=80

    local max_width=80
    [[ "$terminal_width" -gt "$max_width" ]] && terminal_width=$max_width

    local padding_len=$((terminal_width - ${#header_text} - 4))
    # Ensure padding length is not negative.
    [[ "$padding_len" -lt 0 ]] && padding_len=0

    local padding
    padding=$(printf '%*s' "$padding_len" '' | tr ' ' '=')

    echo # Blank line for spacing
    echo -e "${COLOR_CYAN}== ${header_text} ${padding}${COLOR_RESET}" | tee -a "$LOGFILE"
    echo # Blank line for spacing
}

# Function to run a command and log its execution status.
# Parameters:
#   $1: A descriptive name for the command being run.
#   $2...: The command and its arguments.
run_and_log() {
    local description="$1"
    shift
    log "Attempting to $description..."
    if "$@"; then
        log "Successfully $description."
    else
        log "ERROR: Failed to $description."
        # The script will exit here due to `set -e`.
        exit 1
    fi
}

# Function to ask a question and read the user's input.
# Parameters:
#   $1: The variable name to store the input in.
#   $2: The question to ask the user.
#   $3: (Optional) The default value if the user enters nothing.
ask() {
    local -n var_name="$1" # Use nameref for direct assignment
    local question="$2"
    local default_value="${3:-}" # Use parameter expansion for default
    local prompt="$question"

    [[ -n "$default_value" ]] && prompt+=" [$default_value]"

    read -r -p "$(echo -e "${COLOR_BLUE}${prompt}: ${COLOR_RESET}")" input

    var_name="${input:-$default_value}"
    log "User input for '$question': $var_name"
    echo # Blank line for spacing
}

# Function to check for required command-line tools.
check_dependencies() {
    local missing_deps=0
    for cmd in git tput sed date node npm; do
        if ! command -v "$cmd" &>/dev/null; then
            log "ERROR: Required command '$cmd' is not installed."
            missing_deps=1
        fi
    done

    if [[ "$missing_deps" -eq 1 ]]; then
        log "Please install the missing dependencies and run the script again."
        exit 1
    fi
}

# --- Project Setup Functions ---

# Gathers project information from the user.
gather_project_information() {
    ask PROJECT_NAME "Enter your project's name (e.g., my-new-app)" "my-new-app"
    ask PROJECT_DESCRIPTION "Enter a brief description for your project" "A new awesome full-stack project."
    ask AUTHOR_NAME "Enter your full name (e.g., John Doe)" "John Doe"
    ask AUTHOR_EMAIL "Enter your email address (e.g., your-email@example.com)" "johndoe@example.com"
    ask GITHUB_USERNAME "Enter your GitHub username (e.g., john-doe)" "john-doe"
    ask INITIALIZE_GIT "Initialize a new Git repository? (Optional) default no (y/n)" "n"

    # Only ask for repository visibility if Git initialization is requested
    if [[ "${INITIALIZE_GIT,,}" == "y" || "${INITIALIZE_GIT,,}" == "yes" ]]; then
        ask REPOSITORY_VISIBILITY "Choose repository visibility (public/private):" "private"
    fi

    # Export variables to be accessible by sub-shells if needed.
    export PROJECT_NAME PROJECT_DESCRIPTION AUTHOR_NAME AUTHOR_EMAIL GITHUB_USERNAME INITIALIZE_GIT REPOSITORY_VISIBILITY
    export AUTHOR="${AUTHOR_NAME} <${AUTHOR_EMAIL}>"
    log "Constructed author string: $AUTHOR"
}

# Removes template-specific files and Git history.
clean_up_template_files() {
    if [ -d ".git" ]; then
        run_and_log "remove old .git directory" rm -rf .git
    else
        log "No .git directory found to remove. Skipping."
    fi

    local files_to_remove=(
        ".github/DISCUSSION_TEMPLATE"
        ".github/ISSUE_TEMPLATE"
        ".github/pull_request_template.md"
        ".github/review_process_template.md"
        ".github/workflows/stale_and_unreproducible_issue_management.yml"
        ".github/workflows/validate_pr_title.yml"
        ".github/workflows/welcome_greetings.yml"
        ".gitleaksignore"
        "CODE_STYLE_AND_STANDARDS_GUIDES.md"
        "CONTRIBUTING.md"
        "SECURITY.md"
    )

    log "Removing Homelab-Alpha specific GitHub files..."
    for file in "${files_to_remove[@]}"; do
        if [ -e "$file" ]; then
            rm -rf "$file"
            log "Removed $file"
        else
            log "File not found, skipping: $file"
        fi
    done
}

# Safely updates a file using sed with a temporary file.
# Parameters:
#   $1: Path to the file to update.
#   $2...: sed expressions.
safe_sed_update() {
    local file_path="$1"
    shift

    if [[ ! -f "$file_path" ]]; then
        log "WARNING: File not found: $file_path. Skipping update."
        return
    fi

    log "Updating: $file_path"

    # Create a temporary file for sed output
    local tmp_file
    tmp_file=$(mktemp)

    # Apply all sed expressions in one go
    sed "$@" "$file_path" > "$tmp_file"

    # Replace the original file with the updated temporary file
    mv "$tmp_file" "$file_path"

    log "$file_path updated successfully."
}

# Updates all project configuration files.
update_configuration_files() {
    # Update root package.json
    safe_sed_update "package.json" \
        -e "s|\"name\": \".*\"|\"name\": \"$PROJECT_NAME\"|" \
        -e "s|\"description\": \".*\"|\"description\": \"$PROJECT_DESCRIPTION\"|" \
        -e "s|\"author\": \".*\"|\"author\": \"$AUTHOR\"|" \
        -e "s|git+https://github.com/homelab-alpha/npm-workspaces-template.git|git+https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git|" \
        -e "s|https://github.com/homelab-alpha/npm-workspaces-template/issues|https://github.com/$GITHUB_USERNAME/$PROJECT_NAME/issues|" \
        -e "s|https://github.com/homelab-alpha/npm-workspaces-template#readme|https://github.com/$GITHUB_USERNAME/$PROJECT_NAME#readme|"

    # Update client/package.json
    safe_sed_update "client/package.json" \
        -e "s|\"name\": \".*\"|\"name\": \"frontend-$PROJECT_NAME\"|" \
        -e "s|\"description\": \".*\"|\"description\": \"Client-side for $PROJECT_NAME\"|" \
        -e "s|\"author\": \".*\"|\"author\": \"$AUTHOR\"|" \
        -e "s|git+https://github.com/homelab-alpha/npm-workspaces-template.git|git+https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git|" \
        -e "s|https://github.com/homelab-alpha/npm-workspaces-template/issues|https://github.com/$GITHUB_USERNAME/$PROJECT_NAME/issues|" \
        -e "s|https://github.com/homelab-alpha/npm-workspaces-template#readme|https://github.com/$GITHUB_USERNAME/$PROJECT_NAME#readme|"

    # Update server/package.json
    safe_sed_update "server/package.json" \
        -e "s|\"name\": \".*\"|\"name\": \"backend-$PROJECT_NAME\"|" \
        -e "s|\"description\": \".*\"|\"description\": \"Server-side for $PROJECT_NAME\"|" \
        -e "s|\"author\": \".*\"|\"author\": \"$AUTHOR\"|" \
        -e "s|git+https://github.com/homelab-alpha/npm-workspaces-template.git|git+https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git|" \
        -e "s|https://github.com/homelab-alpha/npm-workspaces-template/issues|https://github.com/$GITHUB_USERNAME/$PROJECT_NAME/issues|" \
        -e "s|https://github.com/homelab-alpha/npm-workspaces-template#readme|https://github.com/$GITHUB_USERNAME/$PROJECT_NAME#readme|"

    # Update package-lock.json
    safe_sed_update "package-lock.json" \
        -e "s|\"name\": \"npm-workspaces-template\"|\"name\": \"$PROJECT_NAME\"|" \
        -e "s|\"name\": \"frontend-npm-workspaces-template\"|\"name\": \"frontend-$PROJECT_NAME\"|" \
        -e "s|\"name\": \"backend-npm-workspaces-template\"|\"name\": \"backend-$PROJECT_NAME\"|" \
        -e "s|\"node_modules/frontend-npm-workspaces-template\"|\"node_modules/frontend-$PROJECT_NAME\"|" \
        -e "s|\"node_modules/backend-npm-workspaces-template\"|\"node_modules/backend-$PROJECT_NAME\"|"

    # Update Docker Compose files
    local docker_files=("docker/compose.build.yml" "docker/compose.prod.yml" "docker/compose.test.yml")
    for file in "${docker_files[@]}"; do
        safe_sed_update "$file" \
            -e "s|container_name: .*-template|container_name: $PROJECT_NAME|" \
            -e "s|image: ghcr.io/homelab-alpha/npm-workspaces-template:.*|image: ghcr.io/$GITHUB_USERNAME/$PROJECT_NAME:0.1.0|" \
            -e "s|com.docker.compose.project: \".*\"|com.docker.compose.project: \"$PROJECT_NAME\"|" \
            -e "s|com.npm-workspaces-template.description: \".*\"|com.$PROJECT_NAME.description: \"$PROJECT_DESCRIPTION\"|"
    done

    # Update .github/CODEOWNERS
    safe_sed_update ".github/CODEOWNERS" \
        -e "s|npm-workspaces-template|$PROJECT_NAME|" \
        -e "s|\* @homelab-alpha|\* @$GITHUB_USERNAME|"

    # Update .github/renovate.json
    safe_sed_update ".github/renovate.json" \
        -e "s/\"assignees\": \[[^]]*\]/\"assignees\": [\"$GITHUB_USERNAME\"]/" \
        -e "s/\"labels\": \[[^]]*\]/\"labels\": []/"

    # Update LICENSE
    safe_sed_update "./LICENSE" \
        -e "s|   Copyright 2025 Homelab-Alha ( GJS )|   Copyright $YEAR $AUTHOR_NAME|"

}

update_readme_file() {
    log "Updating README.md with custom content."

    # Constructing the README content using a heredoc for multi-line string assignment.
    readme_content=$(
      cat << EOF
# 🎉 Your new project \`$PROJECT_NAME\` is ready! 🎉

## Getting Started

> [!NOTE]
> Install the [Renovate GitHub App](https://github.com/apps/renovate) if not already installed.
> It will help you keep your dependencies up to date automatically.

### Install project dependencies

From the root directory of your project, install all required dependencies:

\`\`\`bash
npm install
\`\`\`

## Development

Now your project is set up, you can use the following commands for development,
testing, and deployment.

### Available Commands

- [Local Development (npm Only)](#local-development-npm-only)
- [Local Development (with Docker Compose)](#local-development-with-docker-compose)
- [Running Tests (with Docker Compose)](#running-tests-with-docker-compose)
- [Production Deployment (with Docker Compose)](#production-deployment-with-docker-compose)
- [Linting and Formatting](#linting-and-formatting)

## Local Development (npm Only)

To run the project directly on your machine without Docker:

### Step 1: Start the development servers

This command will start both the client (Vite) and server (Express.js) in
development mode.

\`\`\`bash
npm run dev
\`\`\`

### Step 2: Access the application

The application should be accessible in your web browser at [http://localhost:5173](http://localhost:5173).

## Local Development (with Docker Compose)

To get the project up and running locally using Docker Compose for development:

### Step 1: Navigate to the \`docker\` directory

\`\`\`bash
cd docker
\`\`\`

### Step 2: Start the development environment

This command will build the Docker image (if it doesn't exist or changes are
detected) and start the containers, mounting your local code for live reloading.

\`\`\`bash
docker compose --file compose.build.yml up --build
\`\`\`

Alternatively, for detached mode:

\`\`\`bash
docker compose --file compose.build.yml up --build --detach
\`\`\`

### Step 3: Access the application

The application should be accessible in your web browser at [http://localhost:5173](http://localhost:5173).

## Running Tests (with Docker Compose)

To execute project tests within a Docker container:

### Step 1: Navigate to the \`docker\` directory

\`\`\`bash
cd docker
\`\`\`

### Step 2: Run the tests

This command will build the test image and execute the configured test command
(e.g., \`npm run test --workspace=server\`). The container will exit after tests
are complete.

\`\`\`bash
docker compose --file compose.test.yml up --build --abort-on-container-exit
\`\`\`

## Production Deployment (with Docker Compose)

For deploying the application using a pre-built image from a container registry:

### Step 1: Navigate to the \`docker\` directory

\`\`\`bash
cd docker
\`\`\`

### Step 2: Start the production service

This command will pull the specified Docker image (if not already present) and
run it in production mode.

\`\`\`bash
docker compose --file compose.prod.yml up --detach
\`\`\`

## Linting and Formatting

This project uses **ESLint** for code linting, **Prettier** for code formatting,
and **Markdownlint** for Markdown file linting.

### Checking Code Style

To check for any linting or formatting issues across all workspaces and Markdown
files:

\`\`\`bash
npm run format:check
\`\`\`

This command will run \`format:check\` for both the \`client\` and \`server\`
workspaces, and then \`markdown:format:check\` for all Markdown files.

### Fixing Code Style

To automatically fix most linting and formatting issues:

\`\`\`bash
npm run lint
\`\`\`

This command will run \`lint\` for both the \`client\` and \`server\` workspaces, and
then \`markdown:lint\` for all Markdown files.

## License

This project is licensed under the **Apache License 2.0**. See the [LICENSE](https://github.com/$GITHUB_USERNAME/$PROJECT_NAME/blob/main/LICENSE) file for more details.

EOF
  )

    # Writing the constructed content to the README.md file, overwriting any
    # existing content.
    echo "$readme_content" > README.md
    log "README.md updated successfully."
}

# Initializes a new Git repository and creates the first commit.
finalize_setup() {
    run_and_log "initialize new Git repository" git init
    run_and_log "add all files to staging" git add .
    run_and_log "create initial commit" git commit -m "Initial commit: Setup project '$PROJECT_NAME' from template"
    run_and_log "create main branch" git branch -M "main"
}

# Removes the initialization script itself.
clean_up_script() {
    run_and_log "remove initialization script" rm -- "$SCRIPT_NAME"
}

# Rename the project directory.
rename_project_directory() {
    # Check if the current directory name is different from the desired project name.
    if [[ "$ORIGINAL_DIR_NAME" != "$PROJECT_NAME" ]]; then
        log "Attempting to rename directory from '$ORIGINAL_DIR_NAME' to '$PROJECT_NAME'..."

        # Get the parent directory.
        local parent_path
        parent_path=$(dirname "$PWD")

        # Construct the full path for the potential new directory.
        local new_project_path="${parent_path}/${PROJECT_NAME}"

        # Check if the target directory already exists in the parent path.
        if [[ -d "$new_project_path" ]]; then
            log "ERROR: The target directory '$new_project_path' already exists. Aborting rename to prevent data loss."
            exit 1 # Exit the script if the directory already exists.
        fi

        # Change to the parent directory.
        if cd "$parent_path"; then
            if mv "$ORIGINAL_DIR_NAME" "$PROJECT_NAME"; then
                # Change back into the new project directory.
                if ! cd "$parent_path/$PROJECT_NAME"; then # Changed to use parent_path for clarity
                    log "ERROR: Failed to change into the new project directory '$PROJECT_NAME'. Please navigate manually."
                    return 1
                else
                    # Force the shell to re-evaluate its current directory path.
                    cd .
                    log "Successfully renamed directory to '$PROJECT_NAME'."
                fi
            else
                log "ERROR: Failed to rename directory from '$ORIGINAL_DIR_NAME' to '$PROJECT_NAME'. Please rename it manually."
                return 1
            fi
        else
            log "ERROR: Failed to change to parent directory '$parent_path'. Cannot rename the project directory."
            return 1
        fi
    else
        log "Directory name is already '$PROJECT_NAME'. No rename needed."
    fi
}

# This function displays a final success message along with the next steps for the user.
display_final_message() {

    # Display a visually appealing success banner using ANSI escape codes for colors.
    echo # Blank line for spacing
    echo -e "${COLOR_GREEN}=====================================================${COLOR_RESET}"
    echo -e "${COLOR_GREEN}    🎉 Your new project '$PROJECT_NAME' is ready! 🎉   ${COLOR_RESET}"
    echo -e "${COLOR_GREEN}=====================================================${COLOR_RESET}"
    echo # Blank line for spacing
    echo "Next steps:"

    # Step 1: Instruct the user to refresh their terminal's current directory.
    echo "  1. Refresh your terminal's current directory path (important after renaming):"
    echo "     cd ." # Suggests the user runs 'cd .' to refresh their prompt.

    # Check if the user opted for Git initialization.
    # The variable `INITIALIZE_GIT` is converted to lowercase to ensure a case-insensitive comparison.
    if [[ "${INITIALIZE_GIT,,}" == "y" || "${INITIALIZE_GIT,,}" == "yes" ]]; then
        # Determine the Git remote URL based on repository visibility
        local git_remote_url="https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git"
        if [[ "${REPOSITORY_VISIBILITY,,}" == "private" ]]; then
            git_remote_url="git@github.com:$GITHUB_USERNAME/$PROJECT_NAME.git"
        fi

        # If Git was initialized, provide steps for linking to a remote repository and making the initial push.
        echo "  2. Create a new repository on GitHub named '$PROJECT_NAME' (${REPOSITORY_VISIBILITY} repository, e.g., via: https://github.com/new)"
        echo "  3. Link your local repository to the remote:"
        echo "     git remote add origin $git_remote_url"
        echo "  4. Push your initial commit to GitHub:"
        echo "     git push -u origin main"
        echo "  5. Install project dependencies:"
        echo "     npm install"
        echo "  6. Start developing your application:"
        echo "     npm run dev"
    else
        # If Git was not initialized, provide the final steps.
        echo "  2. Install project dependencies:"
        echo "     npm install"
        echo "  3. Start developing your application:"
        echo "     npm run dev"
    fi

    echo # Blank line for spacing

    # Inform the user about the location of the detailed setup log file.
    echo "A detailed log of this setup is available at: $LOGFILE"
}

# --- Main Function ---
main() {
    # Clear the screen for a clean start
    clear

    # Initialize log file
    : > "$LOGFILE"

    print_section_header "Project Initialization Wizard"
    log "Starting project initialization wizard."

    # 1. Check Dependencies
    print_section_header "Checking Dependencies"
    check_dependencies
    log "All dependencies are satisfied."

    # 2. Gather Project Information
    print_section_header "Gathering Project Information"
    gather_project_information

    # 3. Clean Up Template Files
    print_section_header "Cleaning Up Template Files"
    clean_up_template_files

    # 4. Update Configuration Files
    print_section_header "Updating Configuration Files"
    update_configuration_files

    # 5. Update Readme Files
    print_section_header "Updating README File"
    update_readme_file

    # 6. Rename the project directory
    print_section_header "Renaming Project Directory"
    rename_project_directory

    # 7. Finalize Git Setup (Optional)
    # Check the user's choice for Git initialization.
    if [[ "${INITIALIZE_GIT,,}" == "y" || "${INITIALIZE_GIT,,}" == "yes" ]]; then
        print_section_header "Finalizing Git Setup"
        finalize_setup
    else
        print_section_header "Finalizing Git Setup (Optional)"
        log "Skipping Git repository initialization as requested by the user."
    fi

    # 8. Self-destruct Script
    print_section_header "Cleaning Up"
    clean_up_script

    log "Project initialization completed successfully. Enjoy your new project!"
    log "END OF LOG"

    # 9. Display Final Message
    display_final_message | tee -a "$LOGFILE"
}

# --- Script Execution ---
# The trap ensures that if the script is exited prematurely, a message is logged.
trap 'log "Script exited prematurely."' EXIT

# Run the main function
main

# Disable the trap on successful exit.
trap - EXIT
