# Project Shape (FastAPI + Next.js Monorepo)

This template assumes a monorepo with at least:

- `backend/`: FastAPI app and Python services
- `frontend/`: Next.js App Router app
- `infra/` or root Docker files: local/dev/prod container definitions

## Backend expectations

- Python managed with `uv`
- Tests with `pytest`
- FastAPI API surface
- Agentic/runtime libraries may use LangGraph/LangChain
- PostgreSQL plus `pgvector` for embeddings/search

## Frontend expectations

- Next.js App Router
- `bun` for frontend dependency and script execution

## Infra expectations

- Docker flow for local development and production images
- Two Vercel projects (typically one for production, one for preview/staging)
- GitHub Actions that build Docker images

## Fill in repo-specific details here

Document concrete paths, environment files, deployment names, and ownership for your real repo. Keep this section current as structure evolves.
