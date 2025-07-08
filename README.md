# Homelab-Alpha

[![CodeQL](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/github-code-scanning/codeql/badge.svg?branch=main)](https://github.com/homelab-alpha/npm-workspaces-template/actions/workflows/github-code-scanning/codeql)

Welcome to the Homelab-Alpha NPM Workspaces Template Repository!

This project is a **Work in Progress (WIP)** a boilerplate for Node.js projects
using **npm workspaces**. It provides a structured setup with `client` and `server`
workspaces for modular full-stack development.

> [!WARNING]
> This repository is currently under **active development**. Its structure,
> features, and content may change frequently and without prior notice.
> **Contributions are not being accepted at this time, but will be welcomed once
> the project stabilizes.**

## Features

- **npm Workspaces**: Manages multi-package repositories efficiently.
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

Make sure you have the following installed:

- [Node.js](https://nodejs.org/en/download/) (v22.17.0 or higher recommended)
- [npm](https://www.npmjs.com/get-npm) (v10.9.2 or higher recommended)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes
  Docker Engine and Docker Compose)

### Local Development (Node.js Only)

> [!CAUTION]
> The `npm run dev` command is currently **untested** for full-stack local
> development. Only the client development server (`npm run dev --workspace=client`)
> is confirmed to be functional at this time. Use with caution.

To run the project directly on your machine without Docker:

1. **Install dependencies**:
   Navigate to the root of the project and install all workspace dependencies:

   ```bash
   npm install
   ```

2. **Start the development servers**:
   This command will start both the client (Vite) and server (Node.js) in development mode.

   ```bash
   npm run dev
   ```

3. **Access the application**:
   The application should be accessible in your web browser at `http://localhost:3210`.

### Local Development (with Docker Compose)

> [!CAUTION]
> The `compose.build.yml`, `compose.prod.yml`,`compose.test.yml` and `Dockerfile`
> for local development are currently **untested** and may/will not work as
> expected. Use with caution.

To get the project up and running locally using Docker Compose for development:

1. **Navigate to the `docker` directory**:
   ```bash
   cd docker
   ```
2. **Start the development environment**:
   This command will build the Docker image (if it doesn't exist or changes are
   detected) and start the containers, mounting your local code for live reloading.

   ```bash
   docker compose --file compose.build.yml up --build
   ```

   Alternatively, for detached mode:

   ```bash
   docker compose --file compose.build.yml up --build --detach
   ```

3. **Access the application**:
   The application should be accessible in your web browser at `http://localhost:3210`.

### Running Tests (with Docker Compose)

To execute project tests within a Docker container:

1. **Navigate to the `docker` directory**:
   ```bash
   cd docker
   ```
2. **Run the tests**:
   This command will build the test image and execute the configured test
   command (e.g., `npm run test --workspace=server`). The container will exit
   after tests are complete.

   ```bash
   docker compose --file compose.test.yml up --build --abort-on-container-exit
   ```

### Production Deployment (with Docker Compose)

For deploying the application using a pre-built image from a container registry:

1. **Navigate to the `docker` directory**:
   ```bash
   cd docker
   ```
2. **Start the production service**:
   This command will pull the specified Docker image (if not already present)
   and run it in production mode.

   ```bash
   docker compose --file compose.prod.yml up --detach
   ```

## License

This project is licensed under the **Apache License 2.0**.
See the [LICENSE](./LICENSE) file for more details.
