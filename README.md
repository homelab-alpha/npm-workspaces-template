# npm Workspaces Template

[![Linting](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/linting.yml/badge.svg)](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/linting.yml)
[![CodeQL](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/github-code-scanning/codeql/badge.svg?branch=main)](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/github-code-scanning/codeql)

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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#script-development">Script Development</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#features">Features</a><br>
    &nbsp;&nbsp;&nbsp; <a href="#getting-started">Getting Started</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#prerequisites">Prerequisites</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#using-this-template">Using this Template</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-1-open-your-terminal-and-clone-the-repository">Step 1: Open your terminal and clone the repository</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-2-navigate-to-the-cloned-project-directory">Step 2: Navigate to the cloned project directory</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3-prepare-the-npm-workspace-for-your-own-project">Step 3: Prepare the npm workspace for your own project</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3a-remove-existing-homelab-alpha-git-history-and-specific-files">Step 3a: Remove existing Homelab-Alpha Git history and specific files</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3b-update-the-root-folder-name">Step 3b: Update the root folder name</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3c-initialize-a-new-git-repository">Step 3c: Initialize a new Git repository</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3d-update-project-details-in-the-root-packagejson">Step 3d: Update project details in the root `package.json`</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3e-update-service-and-image-names-in-docker-compose-files">Step 3e: Update service and image names in Docker Compose files</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3f-review-and-update-remaining-project-documentation-and-configuration-files">Step 3f: Review and update remaining project documentation and configuration files</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-3g-install-the-renovate-github-app">Step 3g: Install the Renovate GitHub App</a><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#step-4-install-all-project-dependencies-from-the-root-directory">Step 4: Install all project dependencies from the root directory</a><br>
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
    &nbsp;&nbsp;&nbsp; <a href="#license">License</a><br>
  </p>
</details>

## Project Progress

> [!WARNING] Active Development
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

- [x] Set up core linting tools.
  - [ ] Configure ESLint for JavaScript/TypeScript standards.
  - [ ] Configure Prettier for consistent code formatting.

#### Documentation

- [ ] Write detailed usage and setup instructions for `init.sh`.
- [ ] Finalize and update **Step 3: Prepare the npm workspaces** once `init.sh`
      is complete.
- [ ] Expand documentation for Docker setup, usage, and environment-specific notes.
- [ ] Remove the **Caution** notice once the project reaches a stable phase.
- [ ] Remove the **Caution** notice once the **Docker & Containerization** setup
      is fully functional.

#### Script Development

- [ ] Develop `init.sh` for automated project setup and configuration.
- [ ] Add clear and thorough inline documentation within `init.sh`.
- [ ] Apply shell scripting standards (**shellcheck** compliance).
- [ ] Test script functionality across various environments (Linux, etc.).

## Features

This template offers the following key features:

- **npm Workspaces**: Efficiently manages multi-package repositories.
- **Automated Project Setup** (Coming Soon): Includes an initialization script
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

### Step 1: Open your terminal and clone the repository

```bash
git clone https://github.com/homelab-alpha/npm-workspaces-template.git
```

### Step 2: Navigate to the cloned project directory

```bash
cd npm-workspaces-template
```

### Step 3: Prepare the npm workspaces for your own project

This step guides you through removing Homelab-Alpha specific files and updating
project details for a new project.

#### Step 3a: Remove existing Homelab-Alpha Git history and specific files

```bash
rm -rf \
  .git \
  .github/DISCUSSION_TEMPLATE \
  .github/ISSUE_TEMPLATE \
  .github/pull_request_template.md \
  .github/review_process_template.md \
  .github/workflows/stale_and_unreproducible_issue_management.yml \
  .github/workflows/validate_pr_title.yml \
  .github/workflows/welcome_greetings.yml
```

#### Step 3b: Update the root folder name

Choose one of the following options to set up your project folder with your
desired name (e.g., `my-new-app`):

> [!IMPORTANT]
>
> Replace `my-new-app` with your actual desired folder name in the commands below.

**Option 1: Rename the folder (moves and renames)**

If you don't need to keep the original `npm-workspaces-template` folder, you
can rename it directly:

```bash
cd ..
mv npm-workspaces-template my-new-app
cd my-new-app
```

**Option 2: Copy the folder (creates a new project while keeping the original
template)**

If you want to keep the original `npm-workspaces-template` folder as a
template, create a copy:

```bash
cd ..
cp -r npm-workspaces-template my-new-app
cd my-new-app
```

> [!NOTE]
>
> For both options, these commands will first move you one directory up.
> Then, they will either rename or copy the `npm-workspaces-template` folder
> to your chosen project name, and finally navigate you into your new
> project directory.

#### Step 3c: Initialize a new Git repository

```bash
git init
```

#### Step 3d: Update project details in the root `package.json`

Modify the `name`, `version`, `description`, `repository`, `author`, `bugs`, and
`homepage` fields in the `/package.json` file to reflect your new project's
details.

```json
{
  "name": "your-project-name", // Change this to your desired project name (e.g., 'my-new-app')
  "version": "0.1.0", // Update if necessary; '0.1.0' is a good starting point
  "description": "A brief description of your new project.", // Provide a brief description of your project
  // ... other fields ...
  "repository": {
    "type": "git",
    "url": "git+https://github.com/your-username/your-project-name.git" // Update 'your-username' and 'your-project-name'
  },
  "author": "Your Name <your-email@example.com>", // Replace with your name and email
  "license": "Apache-2.0",
  "bugs": {
    "url": "https://github.com/your-username/your-project-name/issues" // Update 'your-username' and 'your-project-name'
  },
  "homepage": "https://github.com/your-username/your-project-name#readme" // Update 'your-username' and 'your-project-name'
  // ... rest of the file ...
}
```

Also update the `client` and `server` workspaces. Remember to update the `name`
and `description` fields within their respective `package.json` files:

- `/client/package.json`
- `/server/package.json`

#### Step 3e: Update service and image names in Docker Compose files

Modify the `container_name`, `image`, and `labels` fields in your Docker Compose
files (`/docker/compose.build.yml`, `/docker/compose.prod.yml`, and `/docker/compose.test.yml`)
to match your project's name.

For example, in `/docker/compose.prod.yml`:

```yml
services:
  app:
    container_name: your-project-name # Change this to your project's container name
    image: ghcr.io/your-username/your-project-name:0.1.0 # Change this (e.g., your GitHub Container Registry path)
    pull_policy: if_not_present
    ports:
      - "3210:3210"
    restart: unless-stopped
    healthcheck:
      disable: true
    logging:
      driver: "json-file"
      options:
        max-size: "1M"
        max-file: "2"
    stop_grace_period: 1m
    security_opt:
      - no-new-privileges:true
    labels:
      com.docker.compose.project: "Your Project Name" # Change this to your project's display name
      com.your-project-name.description: "A brief description of your new project." # Change this to your project's description
    # volumes:
    #   - if needed
```

Apply similar changes to `/docker/compose.build.yml` and `/docker/compose.test.yml`.
Ensure the `image` name in `compose.build.yml` (if specified) and `compose.test.yml`
also reflects your new project name.

#### Step 3f: Review and update remaining project documentation and configuration files

These files often contain references to the original template name or specific
Homelab-Alpha details that you'll need to update for your project:

- `/LICENSE` (Update copyright year and owner)
- `/README.md` (This file itself, ensuring all references match your project)
- `/SECURITY.md` (Update contact information and policy details)
- `/CONTRIBUTING.md` (Adapt contribution guidelines to your project)
- `/CODE_STYLE_AND_STANDARDS_GUIDES.md` (Review and adjust as needed)
- `.github/CODEOWNERS` (Update to your GitHub usernames/teams)
- `.github/renovate.json` (Review configuration for your project's dependencies)

#### Step 3g: Install the Renovate GitHub App

Install the [Renovate Github App](https://github.com/apps/renovate) if not
already installed.

### Step 4: Install all project dependencies from the root directory

From the root directory, run:

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
3. Install the dependencies `npm install`
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

Last updated: July 16, 2025

[⬆️ Go Back to Getting Started](#getting-started)

## License

This project is licensed under the **Apache License 2.0**. See the [LICENSE](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/LICENSE) file for more details.

[🔝 Go Back to Top](#npm-workspaces-template)
