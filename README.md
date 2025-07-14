# Homelab-Alpha

[![Linting](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/linting.yml/badge.svg)](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/linting.yml)
[![CodeQL](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/github-code-scanning/codeql/badge.svg?branch=main)](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/github-code-scanning/codeql)

Welcome to the Homelab-Alpha NPM Workspaces Template Repository!

This project **Work in Progress (WIP)** is a boilerplate for Node.js projects
using **npm workspaces**. It provides a structured setup with `client` and
`server` workspaces for modular full-stack development.

> [!WARNING]
> This repository is currently under **active development**. Its structure,
> features, and content may change frequently and without prior notice.
> **Contributions are not being accepted at this time, but will be welcomed once
> the project stabilizes.**

## Features

This template offers the following key features:

- **npm Workspaces**: Efficiently manages multi-package repositories.
- **Two Workspaces**:
  - `client`: For your front-end application (e.g., Vue.js).
  - `server`: For your back-end API/server (e.g., Express.js).
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
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes Docker Engine and Docker Compose)

To initialize the `npm-workspaces-template` project, follow these steps:

## Step 1: Open your terminal and clone the repository

```bash
git clone https://github.com/homelab-alpha/npm-workspaces-template.git
```

## Step 2: Navigate to the cloned project directory

```bash
cd npm-workspaces-template
```

## Step 3: Prepare the NPM workspace for your own project

> [!IMPORTANT]
>
> - **New Project:** If you are starting a new project with this template,
>   continue with the sub-steps of **Step 3**.
> - **Contribute:** If you are contributing to this repository, skip **Step 3**
>   and proceed to **Step 4**.

This step guides you through removing Homelab-Alpha specific files and updating project details for a new project.

### Step 3a: Remove existing Homelab-Alpha Git history and specific files

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

### Step 3b: Update the root folder name

Choose one of the following options to set up your project folder with your
desired name (e.g., `my-new-app`):

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
> For both options, these commands will first move you one directory up.
> Then, they will either rename or copy the `npm-workspaces-template` folder
> to your chosen project name, and finally navigate you into your new
> project directory.

### Step 3c: Initialize a new Git repository

```bash
git init
```

### Step 3d: Update project details in the root `package.json`

Modify the `name`, `version`, `description`, `repository`, `author`, `bugs`, and `homepage` fields in the `/package.json` file to reflect your new project's details.

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

Also update the `client` and `server` workspaces. Remember to update the `name` and `description` fields within their respective `package.json` files:

- `/client/package.json`
- `/server/package.json`

### Step 3e: Update service and image names in Docker Compose files

Modify the `container_name`, `image`, and `labels` fields in your Docker Compose files (`/docker/compose.build.yml`, `/docker/compose.prod.yml`, and `/docker/compose.test.yml`) to match your project's name.

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

Apply similar changes to `/docker/compose.build.yml` and `/docker/compose.test.yml`. Ensure the `image` name in `compose.build.yml` (if specified) and `compose.test.yml` also reflects your new project name.

### Step 3f: Review and update remaining project documentation and configuration files

These files often contain references to the original template name or specific Homelab-Alpha details that you'll need to update for your project:

- `/LICENSE` (Update copyright year and owner)
- `/README.md` (This file itself, ensuring all references match your project)
- `/SECURITY.md` (Update contact information and policy details)
- `/CONTRIBUTING.md` (Adapt contribution guidelines to your project)
- `/CODE_STYLE_AND_STANDARDS_GUIDES.md` (Review and adjust as needed)
- `.github/CODEOWNERS` (Update to your GitHub usernames/teams)
- `.github/renovate.json` (Review configuration for your project's dependencies)

### Step 3g: Install the Renovate GitHub App

Install the [Renovate Github App](https://github.com/apps/renovate) if not already installed.

## Step 4: Install all project dependencies from the root directory

```bash
npm install
```

## Step 5: Choose one of the following options for local development

- [Local Development (Node.js Only)](#local-development-nodejs-only)
- [Local Development (with Docker Compose)](#local-development-with-docker-compose)
- [Running Tests (with Docker Compose)](#running-tests-with-docker-compose)
- [Production Deployment (with Docker Compose)](#production-deployment-with-docker-compose)
- [Linting and Formatting](#linting-and-formatting)

## Local Development (Node.js Only)

> [!CAUTION]
> The `npm run dev` command currently only successfully starts the client
> development server (`npm run dev --workspace=client`). The server component
> is not functional at this time. Use with caution.

To run the project directly on your machine without Docker:

### Step 1: Start the development servers

This command will start both the client (Vite) and server (Node.js) in
development mode.

```bash
npm run dev
```

### Step 2: Access the application

The application should be accessible in your web browser at [http://localhost:3210](http://localhost:3210).

[⬆️ Go Back to Local Development Options](#step-5-choose-one-of-the-following-options-for-local-development)

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

The application should be accessible in your web browser at [http://localhost:3210](http://localhost:3210).

[⬆️ Go Back to Local Development Options](#step-5-choose-one-of-the-following-options-for-local-development)

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

[⬆️ Go Back to Local Development Options](#step-5-choose-one-of-the-following-options-for-local-development)

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

[⬆️ Go Back to Local Development Options](#step-5-choose-one-of-the-following-options-for-local-development)

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

> [!WARNING]
> The current linting settings are **preliminary** and undergoing **active
> development**. These configurations are subject to frequent changes as the
> project evolves.

To automatically fix most linting and formatting issues:

```bash
npm run lint
```

This command will run `lint` for both the `client` and `server` workspaces, and
then `markdown:lint` for all Markdown files.

[⬆️ Go Back to Local Development Options](#step-5-choose-one-of-the-following-options-for-local-development)

## License

This project is licensed under the **Apache License 2.0**. See the [LICENSE](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/LICENSE) file for more details.
