# Agent Instructions

Read these files before making changes:

1. `.agents/PROJECT.md`
2. `.agents/STACK.md`
3. `.agents/WORKFLOWS.md`
4. `.agents/COMMANDS.md`
5. `.agents/CHECKLISTS.md`
6. `.agents/MEMORY.md`
7. `.agents/CODE_STYLE.md`

## Operating rules

- Treat this file as the entrypoint and `.agents/*` as the source of truth.
- Follow the workflows in `.agents/WORKFLOWS.md` for all changes.

- Keep changes small and scoped to the task.
- Add or update tests for any new or changed behavior.
- Run relevant tests before finishing.
- Prefer incremental changes over large rewrites.

- Use commands from `.agents/COMMANDS.md` instead of guessing.
- Avoid unrelated refactors or broad changes.

- If backend, frontend, or API behavior changes, verify impacted areas.
- If runtime or dependencies change, check Docker and deployment implications.

- Follow code style guidelines in `.agents/CODE_STYLE.md`.

- Only write to `.agents/MEMORY.md` for stable, long-lived repo facts.
