// Import necessary modules for ESLint configuration.
import js from "@eslint/js";
import prettierConfig from "eslint-config-prettier";
import jestPlugin from "eslint-plugin-jest";
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

  // Specific configuration for test files to include Jest globals and plugin rules.
  {
    files: ["**/*.test.{js,mjs,ts,tsx}"], // Apply to test files.
    languageOptions: {
      globals: {
        ...globals.jest, // Enable Jest global variables (e.g., describe, test, expect).
      },
    },
    plugins: {
      jest: jestPlugin, // Register the Jest plugin.
    },
    rules: {
      ...jestPlugin.configs.recommended.rules, // Apply recommended Jest rules.
      // You can add or override specific Jest rules here if needed.
      // For example:
      // "jest/no-disabled-tests": "warn",
      // "jest/no-focused-tests": "error",
    },
  },

  // This must be the last element to override other configs.
  // It disables ESLint rules that might conflict with Prettier's formatting.
  prettierConfig
);
