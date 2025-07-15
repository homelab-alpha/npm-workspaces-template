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
            <strong>Frontend (Client):</strong> Built with Vue.js 3, Vite, and
            TypeScript. Includes Pinia for state management and Vue Router for
            routing.
          </li>
          <li>
            <strong>Backend (Server):</strong> A lightweight Express.js server.
          </li>
          <li>
            <strong>Tooling:</strong> Comes with ESLint and Prettier for code
            consistency, and Vitest and Playwright for comprehensive testing.
          </li>
          <li>
            <strong>Monorepo Structure:</strong> Organized as an npm workspace
            to manage both client and server packages in a single repository.
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
