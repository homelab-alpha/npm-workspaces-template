# npm Workspaces Template

[![Linting](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/linting.yml/badge.svg)](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/linting.yml)
[![CodeQL](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/codeql.yml/badge.svg)](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/codeql.yml)
[![Last commit](https://img.shields.io/github/last-commit/homelab-alpha/npm-workspaces-template?style=flat&logo=github&logoColor=96a1a9&label=Last%20commit&labelColor=313A41&color=BA935B&cacheSeconds=3600)](https://github.com/homelab-alpha/npm-workspaces-template/commits/main/)
[![Repo Size](https://img.shields.io/github/repo-size/homelab-alpha/npm-workspaces-template?style=flat&logo=github&logoColor=96a1a9&label=Repo%20size&labelColor=313A41&color=BA935B&cacheSeconds=3600)](https://github.com/homelab-alpha/npm-workspaces-template/tree/main?tab=readme-ov-file#npm-workspaces-template)
[![Changelog](https://img.shields.io/badge/Changelog-Keep%20a%20Changelog%20v1.1.1-313A41?style=flat&logo=keepachangelog&logoColor=96a1a9&&labelColor=313A41&color=BA935B)](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/CHANGELOG.md)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-3.0-313A41?style=flat&logo=contributorcovenant&logoColor=96a1a9&&labelColor=313A41&color=BA935B)](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/CODE_OF_CONDUCT.md)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-313A41?style=flat&logo=conventionalcommits&logoColor=96a1a9&&labelColor=313A41&color=BA935B)](https://conventionalcommits.org)
[![Semantic Versioning](https://img.shields.io/badge/SemVer-2.0.0-313A41?style=flat&logo=semver&logoColor=96a1a9&&labelColor=313A41&color=BA935B)](https://github.com/semver/semver/blob/master/semver.md)

<!-- [![Downloads](https://img.shields.io/github/downloads/homelab-alpha/npm-workspaces-template/npm-workspaces-template?style=flat&logo=github&logoColor=96a1a9&label=Downloads&labelColor=313A41&color=BA935B&cacheSeconds=3600)](https://github.com/homelab-alpha/npm-workspaces-template/releases) -->

Welcome to the Homelab-Alpha npm Workspaces Template repository!

This project is a boilerplate for Node.js projects
using **npm workspaces**. It provides a structured setup with **client** and
**server** workspaces for modular full-stack development.

<details>
  <summary><strong>Table of Contents</strong> (click to expand)</summary>
  <p>
    <a href="#npm-workspaces-template">npm Workspaces Template</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#project-progress">Project Progress</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#to-do-list">To-Do List</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#client">Client</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#docker">Docker</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#server">Server</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#documentation">Documentation</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#features">Features</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#getting-started">Getting Started</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#prerequisites">Prerequisites</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#using-this-template">Using this Template</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-1-clone-the-repository">Step 1: Clone the repository</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-2-navigate-to-the-project-directory">Step 2: Navigate to the project directory</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3-initialize-the-project">Step 3: Initialize the project</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-4-install-project-dependencies">Step 4: Install project dependencies</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#development">Development</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#available-commands">Available Commands</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#local-development-npm-only">Local Development (npm Only)</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-1-start-the-development-servers">Step 1: Start the development servers</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-2-access-the-application">Step 2: Access the application</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#local-development-with-docker-compose">Local Development (with Docker Compose)</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-1-navigate-to-the-docker-directory">Step 1: Navigate to the `docker` directory</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-2-start-the-development-environment">Step 2: Start the development environment</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3-access-the-application">Step 3: Access the application</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#running-tests-with-docker-compose">Running Tests (with Docker Compose)</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-1-navigate-to-the-docker-directory-1">Step 1: Navigate to the `docker` directory</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-2-run-the-tests">Step 2: Run the tests</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#production-deployment-with-docker-compose">Production Deployment (with Docker Compose)</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-1-navigate-to-the-docker-directory-2">Step 1: Navigate to the `docker` directory</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-2-start-the-production-service">Step 2: Start the production service</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#linting-and-formatting">Linting and Formatting</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#checking-code-style">Checking Code Style</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#fixing-code-style">Fixing Code Style</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#contributing">Contributing</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#known-issues">Known Issues</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#currently-being-addressed">Currently Being Addressed</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#quick-installation">Quick Installation</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#prerequisites-1">Prerequisites</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#run-the-quick-script">Run the Quick script</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#license">License</a><br>
  </p>
</details>

## Project Progress

> [!WARNING]
>
> **Status:** Work in Progress (WIP)
>
> This project is currently under **active development**. Its structure,
> features, and content are subject to change **frequently and without notice**.
> At this time, **contributions are not being accepted**. Community contributions
> will be welcomed once the project reaches a more stable state.

### To-Do List

- [ ] Create a final pre-release checklist.

#### Client

- [ ] Pending tasks (to be defined).

#### Docker

- [x] Create base Dockerfile.
- [x] Set up Docker Compose files:
  - [x] `docker-compose.build.yml` for building.
  - [x] `docker-compose.prod.yml` for production.
  - [x] `docker-compose.test.yml` for testing.
- [ ] Validate Dockerfile builds and functions correctly.
- [ ] Test all Docker Compose files for intended behavior.
- [ ] Implement and verify the full containerized build & deploy workflow.

#### Server

- [ ] Pending tasks (to be defined).

#### Documentation

- [ ] Expand documentation for Docker setup, usage, and environment-specific notes.
- [ ] Remove the **Caution** notice once the project reaches a stable phase.
- [ ] Remove the **Caution** notice once the **Docker & Containerization** setup
      is fully functional.

## Features

This template offers the following key features:

- **npm Workspaces**: Efficiently manages multi-package repositories.
- **Automated Project Setup**: Includes an initialization script
  to automate the initial configuration and setup process.
- **Modular Workspaces**:
  - **Frontend (Client)**: Built with Vue.js 3, Vite, and TypeScript. Includes Pinia
    for state management and Vue Router for routing.
  - **Backend (Server)**: A lightweight Express.js server.
- **Tooling**: Comes with ESLint and Prettier for code consistency, and Vitest
  and Playwright for comprehensive testing.
- **Docker Integration**: Containerized development and deployment with Docker
  and Docker Compose.
- **Multi-Stage Dockerfile**: Optimized Dockerfile for efficient builds and
  smaller images.
- **Environment-Specific Docker Compose**: Separate configurations for build,
  test, and production environments.
- **Easy Setup**: Quickly get started with full-stack JavaScript development.
- **Minimal Config**: Designed for fast, straightforward project initialization.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Git](https://git-scm.com/downloads) (version: 2.50.0 or higher recommended)
- [Node.js](https://nodejs.org/en/download/) (version: 22.17.0 or higher recommended)
- [npm](https://www.npmjs.com/get-npm) (version: 10.9.0 or higher recommended)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes
  Docker Engine and Docker Compose)

### Using this Template

To initialize a new project based on this template, follow these steps.

> [!NOTE]
> These steps are for creating a **new project**. If you want to contribute to
> this template itself, please see the [Contributing](#contributing) section.

### Step 1: Clone the repository

Open your terminal and run the following command:

```bash
git clone https://github.com/homelab-alpha/npm-workspaces-template.git
```

### Step 2: Navigate to the project directory

Change into the newly cloned project directory:

```bash
cd npm-workspaces-template
```

### Step 3: Initialize the project

> [!Note]
>
> The initialization script is fully **functional**. New features and updates
> will be introduced over time.

Run the `init.sh` script to prepare the npm workspaces for your new project.
This script handles the initial setup, including cleaning up template-specific
files and configuring the project for use.

```bash
./scripts/init.sh
```

This script will guide you through the following:

- **Removing existing Git history**: The `.git` directory will be removed to
  dissociate the new project from the template's Git history.
- **Setting up a new Git repository** (Optional): You will be prompted to
  initialize a new Git repository for your project.
- **Updating project details**: The script will assist you in updating relevant
  project details in the root, client and server `package.json` and Docker
  Compose files.

> [!IMPORTANT]
> **Essential: Verify Project Setup**: After initialization, it is crucial to
> review and **if necessary** adjust project documentation and configuration
> files to align with your specific project requirements.

> [!NOTE]
> Install the [Renovate GitHub App](https://github.com/apps/renovate) if not already installed.
> It will help you keep your dependencies up to date automatically.

### Step 4: Install project dependencies

From the root directory of your project, install all required dependencies:

```bash
npm install
```

## Development

Once the project is set up, you can use the following commands for development,
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

```bash
npm run dev
```

### Step 2: Access the application

The application should be accessible in your web browser at [http://localhost:5173](http://localhost:5173).

[⬆️ Go Back to Available Commands](#available-commands)

## Local Development (with Docker Compose)

> [!CAUTION]
> The `compose.build.yml`, `compose.prod.yml`, `compose.test.yml`, and
> `Dockerfile` for local development are currently **untested** and may/will not
> work as expected. Use with caution.

To get the project up and running locally using Docker Compose for development:

### Step 1: Navigate to the `docker` directory

```bash
cd docker
```

### Step 2: Start the development environment

This command will build the Docker image (if it doesn't exist or changes are
detected) and start the containers, mounting your local code for live reloading.

```bash
docker compose --file compose.build.yml up --build
```

Alternatively, for detached mode:

```bash
docker compose --file compose.build.yml up --build --detach
```

### Step 3: Access the application

The application should be accessible in your web browser at [http://localhost:5173](http://localhost:5173).

[⬆️ Go Back to Available Commands](#available-commands)

## Running Tests (with Docker Compose)

To execute project tests within a Docker container:

### Step 1: Navigate to the `docker` directory

```bash
cd docker
```

### Step 2: Run the tests

This command will build the test image and execute the configured test command
(e.g., `npm run test --workspace=server`). The container will exit after tests
are complete.

```bash
docker compose --file compose.test.yml up --build --abort-on-container-exit
```

[⬆️ Go Back to Available Commands](#available-commands)

## Production Deployment (with Docker Compose)

For deploying the application using a pre-built image from a container registry:

### Step 1: Navigate to the `docker` directory

```bash
cd docker
```

### Step 2: Start the production service

This command will pull the specified Docker image (if not already present) and
run it in production mode.

```bash
docker compose --file compose.prod.yml up --detach
```

[⬆️ Go Back to Available Commands](#available-commands)

## Linting and Formatting

This project uses **ESLint** for code linting, **Prettier** for code formatting,
and **Markdownlint** for Markdown file linting.

### Checking Code Style

To check for any linting or formatting issues across all workspaces and Markdown
files:

```bash
npm run format:check
```

This command will run `format:check` for both the `client` and `server`
workspaces, and then `markdown:format:check` for all Markdown files.

### Fixing Code Style

To automatically fix most linting and formatting issues:

```bash
npm run lint
```

This command will run `lint` for both the `client` and `server` workspaces, and
then `markdown:lint` for all Markdown files.

[⬆️ Go Back to Available Commands](#available-commands)

## Contributing

This repository serves as a template. If you want to contribute to the template's
development, please follow these steps:

1. Fork the repository
2. Clone your forked repository: `git clone https://github.com/your-username/npm-workspaces-template.git`
3. Install the dependencies `npm ci`
4. Create a new branch for your feature or bug fix
5. Submit a pull request from your branch to our `main` branch

For more detailed guidelines, please refer to the [CODE OF CONDUCT](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/CODE_OF_CONDUCT.md), [CONTRIBUTING](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/CONTRIBUTING.md),
and [Code Style and Standards Guide](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/CODE_STYLE_AND_STANDARDS_GUIDES.md) files.

[⬆️ Go Back to Getting Started](#getting-started)

## Known Issues

The Homelab-Alpha team strives to provide a seamless experience. Below, we
document any known bugs, limitations, or issues you might encounter while using
this template. This section will be regularly updated to reflect the latest
information.

### Currently Being Addressed

No known issues at this time.

If you discover a bug or experience an issue not listed here, please help us
improve by [opening an issue on GitHub](https://github.com/homelab-alpha/npm-workspaces-template/issues/new/choose).

[⬆️ Go Back to Getting Started](#getting-started)

## Quick Installation

Get started in seconds by running the command below in your terminal.
This single command streamlines the setup process for you.

This will:

- Clone the **npm Workspaces Template** repository.
- Run the included `init.sh` initialization script.
- Re-evaluate the shell's current directory to reflect any changes made by the
  initialization script.
- Install all npm dependencies.
- Launch **Visual Studio Code** in the project folder.
- Open your default browser to [http://localhost:5173](http://localhost:5173).
- Start the development servers for both the **client** and the **server** side.

### Prerequisites

Ensure you have the following installed:

- [Git](https://git-scm.com/downloads) (version: 2.50.0 or higher recommended)
- [Node.js](https://nodejs.org/en/download/) (version: 22.17.0 or higher recommended)
- [npm](https://www.npmjs.com/get-npm) (version: 10.9.0 or higher recommended)
- [Visual Studio Code](https://code.visualstudio.com/Download) (Optional)

### Run the Quick script

Open your terminal and copy and paste the following code:

```bash
#!/usr/bin/env bash

# Strict Mode
# -e: Exit immediately if a command exits with a non-zero status.
# -o pipefail: The return value of a pipeline is the status of the last command
#    to exit with a non-zero status, or zero if no command exited with a
#    non-zero status.
# -u: Treat unset variables as an error when substituting.

set -eo pipefail
set -u

# --- Initial Setup ---
echo # Blank line for spacing
echo "Cloning repository..."
git clone https://github.com/homelab-alpha/npm-workspaces-template.git
cd npm-workspaces-template

echo # Blank line for spacing
echo "Running initialization script..."
./scripts/init.sh
# Re-evaluate shell's current directory to apply changes from init.sh
cd .

# --- OS-specific Command Setup ---
# Set commands based on the detected Operating System to ensure compatibility.
if [[ "$OSTYPE" == "darwin"* ]]; then # macOS
  SLEEP_CMD="sleep 5"
  OPEN_CMD="open"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then # Windows
  SLEEP_CMD="timeout /T 5 /NOBREAK >nul"
  OPEN_CMD="start"
else # Linux
  SLEEP_CMD="sleep 5"
  OPEN_CMD="xdg-open"
fi

# --- Execution Sequence ---
echo # Blank line for spacing
echo "Installing npm dependencies..."
npm install

# Launch Visual Studio Code if the 'code' command is available.
if command -v code &> /dev/null; then
  echo # Blank line for spacing
  echo "Launching Visual Studio Code..."
  code .
else
  echo # Blank line for spacing
  echo "Visual Studio Code 'code' command not found, skipping."
  eval "$SLEEP_CMD"
fi

echo # Blank line for spacing
echo "Opening application in browser at http://localhost:5173..."
$OPEN_CMD http://localhost:5173/
eval "$SLEEP_CMD"

echo # Blank line for spacing
echo "Starting development server... (Press Ctrl+C to stop)"
npm run dev
```

> [!TIP]
> After completing the Quick Installation, your browser should automatically
> open to the application. You may need to refresh the page (using
> **F5** or **Ctrl+R**) to ensure the latest content is loaded; or if you
> encounter any issues, please open your web browser and navigate to
> [http://localhost:5173](http://localhost:5173) manually.

> [!NOTE]
> When using the **Quick Installation**, you may encounter extra logs at
> `Opening application in browser at http://localhost:5173...` in the terminal.
> These logs are from the browser and may include initial connection errors or
> additional messages when attempting to open `http://localhost:5173`. This is
> expected behavior, as the development server may not have fully started yet.

[⬆️ Go Back to Available Commands](#available-commands)

## License

This project is licensed under the **Apache License 2.0**. See the [LICENSE](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/LICENSE) file for more details.

[🔝 Go Back to Top](#npm-workspaces-template)
