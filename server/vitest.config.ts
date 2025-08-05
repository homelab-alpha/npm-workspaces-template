// Import the `defineConfig` helper from Vitest.
// This helper provides autocompletion and type checking for the configuration.
import { defineConfig } from "vitest/config";

// Define the Vitest configuration.
export default defineConfig({
  test: {
    // Set the test environment to 'node'.
    // This is crucial for server-side tests as it ensures that Node.js globals
    // and APIs are available during test execution.
    environment: "node",
    // Enable global APIs (e.g., describe, test, expect) so they don't need to be imported.
    // This makes your test files look cleaner and more similar to Jest's default behavior.
    globals: true,
    // You can add other Vitest options here if needed, for example:
    // reporters: 'verbose', // To get more detailed test output
    // coverage: {
    //   provider: 'v8', // Specify the coverage provider
    //   reporter: ['text', 'json', 'html'], // Output formats for coverage reports
    // },
  },
});
