# Commands

Replace placeholders with exact repo commands. Keep this file executable in practice.

## Branching

- Create feature branch: `git checkout -b feat/<short-description>`

## Backend (`backend/`)

- Install deps: `cd backend && uv sync --frozen`
- Run API locally: `cd backend && uv run uvicorn app.main:app --reload`
- Run unit tests: `cd backend && uv run pytest -q`
- Run regression tests: `cd backend && uv run pytest`

## Frontend (`frontend/`)

- Install deps: `cd frontend && bun install --frozen-lockfile`
- Run app locally: `cd frontend && bun run dev`
- Run tests: `cd frontend && bun run test`
- Build: `cd frontend && bun run build`

## Docker

- Dev stack build: `<replace-with-your-dev-build-command>`
- Dev stack run: `<replace-with-your-dev-up-command>`
- Production image build: `<replace-with-your-prod-build-command>`

## CI checks

- Local CI-equivalent checks: `<replace-with-your-local-ci-command>`
