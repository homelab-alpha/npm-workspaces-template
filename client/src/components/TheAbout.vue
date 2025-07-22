<script setup lang="ts">
import AboutItem from "./AboutItem.vue";
</script>

<template>
  <div class="about">
    <div class="about-content">
      <AboutItem>
        <template #heading><h1>About This Template</h1></template>
        <p>
          This project is a monorepo template for modern web development using
          npm workspaces. It provides a solid foundation for building full-stack
          applications with a pre-configured client and server. For more
          detailed information, please refer to the
          <a
            href="https://github.com/homelab-alpha/npm-workspaces-template"
            target="_blank"
            rel="noopener"
            >README</a
          >
          file in the repository.
        </p>
      </AboutItem>

      <AboutItem>
        <template #heading>Key Features</template>
        <ul>
          <li>
            <strong>Automated Project Setup:</strong> Includes an initialization
            script to automate the initial configuration and setup process.
          </li>
          <li>
            <strong>Modular Workspaces:</strong>
            <ul>
              <li>
                <strong>Frontend (Client):</strong> Built with Vue.js 3, Vite,
                and TypeScript. Includes Pinia for state management and Vue
                Router for routing.
              </li>
              <li>
                <strong>Backend (Server):</strong> A lightweight Express.js
                server.
              </li>
            </ul>
          </li>
          <li>
            <strong>Tooling:</strong> Comes with ESLint and Prettier for code
            consistency, and Vitest and Playwright for comprehensive testing.
          </li>
          <li>
            <strong>Docker Integration:</strong> Containerized development and
            deployment with Docker and Docker Compose.
          </li>
          <li>
            <strong>Multi-Stage Dockerfile:</strong> Optimized Dockerfile for
            efficient builds and smaller images.
          </li>
          <li>
            <strong>Environment-Specific Docker Compose:</strong> Separate
            configurations for build, test, and production environments.
          </li>
          <li>
            <strong>Easy Setup:</strong> Quickly get started with full-stack
            JavaScript development.
          </li>
          <li>
            <strong>Minimal Config:</strong> Designed for fast, straightforward
            project initialization.
          </li>
        </ul>
      </AboutItem>

      <AboutItem>
        <template #heading>Contribution</template>
        <p>
          We welcome contributions! If you're interested in improving this
          template, please refer to our
          <a
            href="https://github.com/homelab-alpha/npm-workspaces-template/blob/main/CONTRIBUTING.md"
            target="_blank"
            rel="noopener"
            >Contribution Guidelines</a
          >
          for more information on how to submit pull requests and report issues.
        </p>
      </AboutItem>

      <AboutItem>
        <template #heading>License</template>
        <p>
          This project is licensed under the Apache License 2.0. See the
          <a
            href="https://github.com/homelab-alpha/npm-workspaces-template/blob/main/LICENSE"
            target="_blank"
            rel="noopener"
            >LICENSE</a
          >
          file for more details.
        </p>
      </AboutItem>
    </div>
  </div>
</template>
