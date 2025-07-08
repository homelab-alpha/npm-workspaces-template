# Code Style and Standards Guide

## Introduction

This guide helps contributors understand how we write code in the NPM
Workspaces Template. We use **npm workspaces** for a **Node.js** project,
splitting it into a `client` (Vue.js) and `server` (Express.js, TypeScript) part,
with **Docker** for easy setup. Following these guidelines keeps our code
consistent and easy to manage.

## Our Main Guidelines

### General Code Quality

- **Be Consistent**: Always match the existing code style. Consistency is more
  important than personal preferences.
- **Keep it Simple**: Write clear, easy-to-read code. Use names that make sense
  for variables, functions, and classes.
- **Add Comments (When Needed)**: Explain complex parts of your code briefly.
- **Break Down Tasks**: Organize your code into small, reusable pieces
  (modules or components).
- **Handle Errors**: Make sure your code can handle errors gracefully and logs
  them properly.

### Formatting

We use **Prettier** and **ESLint** to automatically format and check our code.
These tools ensure consistent style across the entire project.

- **Indentation**: Always use **2 spaces** for indentation.
- **Semicolons**: Always use semicolons at the end of statements (`semi: true`).
- **Quotes**: Use **double quotes** (`"`) for strings (`singleQuote: false`).
- **Line Length**: Code lines should not exceed **80 characters**
  (`printWidth: 80`). For `.editorconfig` files, the maximum line length is
  **100 characters** (`max_line_length = 100`).
- **Trailing Commas**: Use trailing commas for ES5 compatible objects
  (`trailingComma: "es5"`).
- **Bracket Spacing**: Include spaces inside object literals
  (`bracketSpacing: true`).
- **Final Newline**: Ensure files end with a final newline
  (`insert_final_newline = true`).
- **Trailing Whitespace**: Remove any whitespace at the end of lines
  (`trim_trailing_whitespace = true`).
- **Plugins**: Prettier uses `prettier-plugin-tailwindcss` for Tailwind CSS
  sorting.

### JavaScript/TypeScript Best Practices

Since we use TypeScript, Vue.js, and Node.js:

- **ESLint**: Configured with `flat/essential` rules for Vue and `recommended`
  for TypeScript. It also includes rules for Vitest (in `src/**/__tests__/*`)
  and Playwright (in `e2e/**/*.{test,spec}.{js,ts,jsx,tsx}`).
- **Naming**:
  - **Variables/Functions**: `camelCase` (e.g., `myVariable`, `calculateTotal`).
  - **Classes/Types**: `PascalCase` (e.g., `MyClass`, `UserType`).
  - **Constants**: `SCREAMING_SNAKE_CASE` (e.g., `MAX_RETRIES`).
- **TypeScript**: Use types to make code safer and clearer. Prefer `interface`
  for object structures.

### Vue.js (Client Side)

- Follow the official [Vue.js Style Guide].
- **Component Names**:
  - Files: `PascalCase` (e.g., `UserProfile.vue`).
  - Usage: `kebab-case` (e.g., `<user-profile>`).
- **Props & Emits**: Define props with types; use `kebab-case` for custom
  events (emits).
- **Styling**: Use scoped CSS for component-specific styles.

### Node.js/Express.js (Server Side)

- Use **ES Modules** (`import`/`export`) for modern JavaScript.
- For async operations, use `async/await`.
- Implement central **error handling** in Express.
- Keep your server code organized (e.g., separate files for routes, controllers,
  services).

## Git Guidelines

These guidelines ensure our commit history is clean and easy to follow.

### Commit Message Guidelines

Always write commit messages in **English**.

- **Header (First Line)**:
  - **Format**: `type(scope): brief subject`
  - **Types**:
    - `feat`: New feature.
    - `fix`: Bug fix.
    - `docs`: Documentation changes.
    - `style`: Code formatting (no logic change).
    - `refactor`: Code restructuring (no feature/fix).
    - `perf`: Performance improvements.
    - `test`: Test updates.
    - `chore`: General maintenance, build updates.
    - `revert`: Reverting a previous commit.
  - **Scope (Optional)**: What part of the code changed (e.g., `(auth)`,
    `(UI)`, `(server)`).
  - **Subject**: Short, in **imperative mood** (e.g., "Add user", "Fix bug").
    Keep it **under 50 characters**.
  - **Example**: `feat(auth): add user login feature`
- **Body (Optional)**:
  - Leave a **blank line** after the header.
  - Explain **what** you changed and **why**.
  - Use **bullet points** (`-`) for multiple details.
  - Keep lines under 72 characters.

### Example Commit Messages

```git
fix(layout): resolve broken layout issue on homepage

- Fixed CSS styles that caused misalignment of elements on smaller screens.
- Ensured proper responsiveness across all screen sizes.
```

```git
feat(flatpak): improve error handling

- Adjusted Flatpak configuration for better system compatibility.
- Enhanced error reporting with more detailed logs.
```

## Branch Naming Guidelines

Name your branches to clearly describe their purpose.

- **Format**: `type/short-description`
- **Case**: Use **lowercase** letters, separate words with **hyphens**.
- **Prefixes (Types)**:
  - `feat/`: New features.
  - `fix/`: Bug fixes.
  - `docs/`: Documentation.
  - `refactor/`: Code restructuring.
  - `chore/`: General tasks.
  - `hotfix/`: Urgent production fixes.
- **Description**: Be specific and brief. Avoid vague names. Aim for
  under 50 characters.

### Examples of Valid Branch Names

```none
feat/add-user-authentication
fix/login-page-display-error
chore/update-dependencies
```

### Invalid Branch Names

```none
login-error-fix  (missing type)
bug123           (too vague)
Feature/AddUserAuth (wrong casing)
```
