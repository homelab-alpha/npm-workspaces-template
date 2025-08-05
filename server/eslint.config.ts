// Import necessary modules for ESLint configuration.
import js from "@eslint/js";
import vitestPlugin from "@vitest/eslint-plugin";
import prettierConfig from "eslint-config-prettier";
import globals from "globals";
import tseslint from "typescript-eslint";

// `tseslint.config` is a helper function for creating a type-safe ESLint config.
export default tseslint.config(
  // Global ignores for files and directories that should never be linted.
  {
    ignores: ["**/dist/", "**/node_modules/"],
  },

  // Apply the recommended base rules from ESLint for JavaScript.
  js.configs.recommended,

  // Specific configuration for all JavaScript files in the project.
  {
    files: ["**/*.{js,mjs}"],
    languageOptions: {
      ecmaVersion: "latest", // Use the latest ECMAScript features.
      sourceType: "module", // The project uses ES modules (`import`/`export`).
      globals: {
        ...globals.node, // Enable all Node.js global variables (e.g., `process`, `__dirname`).
      },
    },
  },

  // Apply Vitest recommended rules to test files.
  // This ensures that Vitest-specific globals (like `describe`, `test`, `expect`)
  // are recognized by ESLint and proper linting rules are applied.
  {
    files: ["**/*.test.{js,mjs,ts}"], // Apply to test files.
    ...vitestPlugin.configs.recommended, // Apply recommended Vitest rules.
    languageOptions: {
      globals: {
        ...globals.vitest, // Add Vitest global variables.
      },
    },
  },

  // This must be the last element to override other configs.
  // It disables ESLint rules that might conflict with Prettier's formatting.
  prettierConfig
);
