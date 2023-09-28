# Contributing to Flutter Capstone Project

## Things to know (Summary).

1. Always (almost) create a new branch from MAIN.
2. **REBASE** from **MAIN** if needed
3. Squash your commits! (Via Github)
4. Always delete branch after merged to release branch.
5. **IMPORTANT**: commit message should also be in format `<type>: <ticket-number> <description>`.
6. If MR title is incorrect, it will get rejected

## Branch Naming (Branch must Be short-lived)

- main: Main branch. Remember we are using [Trunk-Based Development](https://cloud.google.com/architecture/devops/devops-tech-trunk-based-development)
- `feat/<ticket-number>-<short-detail>`: Feature branch. Ex: feat/122-login-page
- `fix/<ticket-number>-<short-detail>`: Bugfix branch. Ex: fix/122-integration-login
- `refactor/<ticket-number>-<short-detail>`: Branch for cleanup code or refactor code. Ex: refactor/122-missing-comments
- `test/<ticket-number>-<short-detail>`: Branch for missing tests or adding tests. Ex: test/122-missing-test-when-update-user

## Merge Request Title & Commit Message Format.

- Each MR & commit title should include a type and a subject:

  `<type>[optional scope]: <ticket-number> <description>`

- Lines should not exceed 100 characters, ie:

  ```
  feat: 122 adding authentication
  fix: 122 fix the order list
  ```

## Commit Type.

Must be one of the following:
More examples https://www.conventionalcommits.org/en/v1.0.0/#summary

- feat: A new feature
- fix: A bug fix
- refactor: A code change that neither fixes a bug or adds a feature
- test: Adding missing tests
- chore: bump changelog and dependencies

## Subject.

- The subject contains a succinct description of the change:
  use the imperative, present tense: "change" not "changed" nor "changes" https://examples.yourdictionary.com/imperative-sentence-examples.html
- don't capitalize first letter
- no dot (.) at the end
