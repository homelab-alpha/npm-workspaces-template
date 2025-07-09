# Review Process

> [!IMPORTANT]
> This document is currently under active development. Its structure and
> content may change frequently and without prior notice.

> [!NOTE]
> This document outlines the comprehensive review process for pull requests
> within this project. Its primary goal is to ensure the **quality, consistency,
> and functionality** of all code contributions before they're merged into the
> main branch. This process is designed to be a collaborative effort, fostering
> learning and maintaining a high standard for our codebase.

## 1. Understanding the Review Process

Submitting a pull request (PR) is a crucial step in contributing to this project.
A thorough review process helps us catch potential issues early, maintain code
health, and share knowledge across the team. Every PR will undergo a review by
at least one designated reviewer before it can be merged.

### Roles and Responsibilities

- **Author:** The person who creates the pull request. Responsible for ensuring
  the code meets initial quality standards, addressing feedback, and providing
  all necessary context for reviewers.
- **Reviewer:** A designated team member who critically evaluates the PR.
  Responsible for providing constructive feedback, identifying potential issues,
  and ensuring the changes align with project standards and goals.

## 2. Author Self-Review Checklist

Before submitting your pull request for review, please complete this self-review
checklist. This helps streamline the process and ensures your contribution meets
our baseline quality requirements.

- [ ] **Code Functionality:**
  - All **tests pass** locally, and new tests have been added for new features
    or bug fixes where applicable.
  - The changes resolve the stated problem or correctly implement the intended
    feature.
  - The application (if applicable) runs as expected with the changes.
- [ ] **Code Quality & Style:**
  - The code adheres to project **linting standards** (e.g., ESLint, Prettier)
    and has no warnings or errors.
  - Variable, function, and class names are clear, descriptive, and follow
    established naming conventions.
  - Code is well-structured, readable, and follows "clean code" principles.
- [ ] **Project Structure & Dependencies:**
  - The changes align with the overall project architecture and the specific
    structure of **npm workspaces**.
  - `package.json` files are consistent and correctly configured across all
    affected workspaces.
  - Any new dependencies are necessary, correctly installed, and documented if
    significant.
  - There are no unintended side effects on other parts of the workspaces.
- [ ] **Security & Best Practices:**
  - There is **no sensitive information** (e.g., API keys, personal data,
    hardcoded credentials) directly committed in the code.
  - Security best practices have been considered during implementation.
- [ ] **Documentation & Context:**
  - Important functionality, new features, or complex logic are **documented**
    within the code (comments) and/or in relevant project documentation (e.g.,
    README updates).
  - The pull request description provides a clear and concise **summary** of the
    changes and their purpose.
  - Screenshots or GIFs are included if the changes impact the UI or user flow.

## 3. Creating a Review Request

Once your self-review is complete, you can submit your pull request for review.
Please ensure your PR description provides all the necessary context for reviewers.

### Pull Request Description Template

Use the following template for your PR description to guide reviewers effectively:

### Summary

In one to two paragraphs, clearly state the **primary objectives** of this pull
request. Explain what **problems** it solves, what **features** it adds, or what
**improvements** it brings. Briefly describe how these changes contribute to the
`npm-workspaces-template` project.

For an example, please follow the [Pull Request Template](./pull_request_template.md?plain=1).

### Code Review Focus Areas

To help reviewers, highlight specific areas or files that require particular
attention, and pose any specific questions you have for them.

- Is the new `DateFormatter` class in `./client/shared-utils/src/date.ts`
  implemented efficiently and correctly?
- Are there any potential edge cases for `[specific function/module]` that I
  might have missed?
- Does the integration in `./client/src/components/MyComponent.tsx` make
  sense from a component design perspective?
- Does the workspace configuration in `package.json` files correctly reflect the
  new inter-package dependency?

### Testing and Validation

Provide clear instructions on how reviewers can test and validate your changes.
Be as precise as possible.

- `Step 1:` Check out this branch locally: `git checkout your-feature-branch`
- `Step 2:` Install dependencies in the project root: `npm install`
- `Step 3:` Run all unit tests: `npm test`
- `Step 4:` To manually verify the new date formatting, start the development
  server in the `server` directory: `cd server && npm run dev`
- `Step 5:` Then, start the development client in the `client` directory:
  `cd client && npm run dev`. Open your browser and go to `http://localhost:3210`
  to observe the date display on the homepage.

### Impact and Risks

Discuss any known risks, potential complexities, or significant impacts of this
change on the project structure, performance, or existing features.

_Example: "This change introduces a new shared package, which slightly increases the
overall dependency graph. Performance impact is expected to be minimal,
but it introduces a new potential point of failure if the utility is misused."_

### Notes

Include any additional information that might be helpful for the reviewer, such as:

- Design choices and their rationale.
- Known limitations or issues that will be addressed in a follow-up PR.
- Any areas where you'd appreciate a deeper discussion or alternative suggestions.
- References to related issues, design documents, or external resources.

## 4. During the Review

- **Be Responsive:** Actively monitor your PR for comments and questions from
  reviewers. Respond promptly and clearly to all feedback.
- **Iterate:** Make necessary changes based on the feedback. Push new commits to
  the same branch; GitHub will automatically update the PR.
- **Communicate:** If you disagree with a suggestion, explain your reasoning
  respectfully. Open discussions lead to better solutions.
- **Mark as Resolved:** Once you've addressed a comment, resolve the
  conversation on GitHub to indicate it's been handled.

## 5. Completing the Review

A pull request is ready to merge once:

1. All required reviews have been completed and approved.
2. All automated checks (CI/CD pipelines, tests, linting) have passed
   successfully.
3. All conversations on the PR have been resolved.

The PR can then be merged by an authorized maintainer.
