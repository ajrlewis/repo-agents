# Workflow Rules

Use these steps for each non-trivial task.

## Feature workflow

1. Sync your local default branch and start from a clean state.
2. Create and checkout a feature branch.
3. Keep the change small and scoped to one objective.
4. Implement code with unit tests in the same branch.
5. Run regression tests for touched areas.
6. If backend/frontend runtime or build behavior changed, update Docker dev and production containers/images.
7. Update docs/instructions if commands or behavior changed.
8. Open PR with test evidence and any rollout notes.

## Branch naming

Use readable names such as:

- `feat/<short-description>`
- `fix/<short-description>`
- `chore/<short-description>`

## Quality bar

- New code should include or update unit tests.
- Regressions should be caught before PR by running relevant test suites.
- Avoid mixing unrelated refactors into feature PRs.
