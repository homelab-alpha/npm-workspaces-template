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

- [Node.js](https://nodejs.org/en/download/) (version: 22.17.0 or higher recommended)
- [npm](https://www.npmjs.com/get-npm) (version: 10.9.0 or higher recommended)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes Docker Engine and Docker Compose)

To initialize the `npm-workspaces-template` project, follow these steps:

- **Step 1**: Open your terminal and clone the repository:

  ```bash
  git clone https://github.com/homelab-alpha/npm-workspaces-template.git
  ```

- **Step 2**: Navigate to the cloned project directory:

  ```bash
  cd npm-workspaces-template
  ```

- **Step 3**: Install all project dependencies from the root directory:

  ```bash
  npm install
  ```

- **Step 4**: Choose one of the following options for local development:
  - [Local Development (Node.js Only)](#local-development-nodejs-only)
  - [Local Development (with Docker Compose)](#local-development-with-docker-compose)
  - [Running Tests (with Docker Compose)](#running-tests-with-docker-compose)
  - [Production Deployment (with Docker Compose)](#production-deployment-with-docker-compose)
  - [Linting and Formatting](#linting-and-formatting)

### Local Development (Node.js Only)

> [!CAUTION]
> The `npm run dev` command currently only successfully starts the client
> development server (`npm run dev --workspace=client`). The server component
> is not functional at this time. Use with caution.

To run the project directly on your machine without Docker:

- **Step 1**: Start the development servers:

  This command will start both the client (Vite) and server (Node.js) in
  development mode.

  ```bash
  npm run dev
  ```

- **Step 2**: Access the application:

  The application should be accessible in your web browser at [http://localhost:3210](https://www.google.com/search?q=http://localhost:3210).

  <p align="right"> <a href="#getting-started" class="return-point">🔝</a> </p>

### Local Development (with Docker Compose)

> [!CAUTION]
> The `compose.build.yml`, `compose.prod.yml`, `compose.test.yml`, and
> `Dockerfile` for local development are currently **untested** and may/will not
> work as expected. Use with caution.

To get the project up and running locally using Docker Compose for development:

- **Step 1**: Navigate to the `docker` directory:

  ```bash
  cd docker
  ```

- **Step 2**: Start the development environment:

  This command will build the Docker image (if it doesn't exist or changes are
  detected) and start the containers, mounting your local code for live reloading.

  ```bash
  docker compose --file compose.build.yml up --build
  ```

  Alternatively, for detached mode:

  ```bash
  docker compose --file compose.build.yml up --build --detach
  ```

- **Step 3**: Access the application:

  The application should be accessible in your web browser at [http://localhost:3210](https://www.google.com/search?q=http://localhost:3210).

  <p align="right"> <a href="#getting-started" class="return-point">🔝</a> </p>

### Running Tests (with Docker Compose)

To execute project tests within a Docker container:

- **Step 1**: Navigate to the `docker` directory:

  ```bash
  cd docker
  ```

- **Step 2**: Run the tests:

  This command will build the test image and execute the configured test command
  (e.g., `npm run test --workspace=server`). The container will exit after tests
  are complete.

  ```bash
  docker compose --file compose.test.yml up --build --abort-on-container-exit
  ```

  <p align="right"> <a href="#getting-started" class="return-point">🔝</a> </p>

### Production Deployment (with Docker Compose)

For deploying the application using a pre-built image from a container registry:

- **Step 1**: Navigate to the `docker` directory:

  ```bash
  cd docker
  ```

- **Step 2**: Start the production service:

  This command will pull the specified Docker image (if not already present) and
  run it in production mode.

  ```bash
  docker compose --file compose.prod.yml up --detach
  ```

  <p align="right"> <a href="#getting-started" class="return-point">🔝</a> </p>

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

<p align="right"> <a href="#getting-started" class="return-point">🔝</a> </p>

## License

This project is licensed under the **Apache License 2.0**. See the [LICENSE](https://github.com/homelab-alpha/npm-workspaces-template/blob/main/LICENSE) file for more details.
