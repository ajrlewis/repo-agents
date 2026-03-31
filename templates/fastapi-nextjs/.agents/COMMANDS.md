# Commands

Use these commands instead of guessing. If a command is missing or incorrect, update this file.

## Branching

- Create feature branch: `git checkout -b feat/<short-description>`

## Backend (`backend/`)

> Replace `backend/` with the actual backend path for this repo if different.

- Install deps: `cd backend && uv sync --frozen`
- Run API locally: `cd backend && uv run uvicorn app.main:app --reload`
- Run unit tests: `cd backend && uv run pytest -q`
- Run full test suite: `cd backend && uv run pytest`

## Frontend (`frontend/`)

> Replace `frontend/` with the actual frontend path for this repo if different.

- Install deps: `cd frontend && bun install --frozen-lockfile`
- Run app locally: `cd frontend && bun run dev`
- Run tests: `cd frontend && bun run test`
- Build: `cd frontend && bun run build`

## Docker

> Replace all placeholders with real commands before relying on them.

- Dev stack build: `<replace-with-your-dev-build-command>`
- Dev stack run: `<replace-with-your-dev-up-command>`
- Production image build: `<replace-with-your-prod-build-command>`

## CI / validation

> Prefer a single command that runs all required checks if available.

- Local CI-equivalent checks: `<replace-with-your-local-ci-command>`
