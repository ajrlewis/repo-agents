# Stable Memory

Use this file for stable repo facts that should persist across tasks.

## When to write to this file

Add entries when you discover or establish facts such as:

- canonical service names or directories
- actual backend/frontend paths used in this repo
- confirmed commands that differ from defaults
- deployment targets or environments
- required CI/CD job names
- important conventions used consistently in the repo

## Good examples

- Backend lives in `apps/api`
- Frontend lives in `apps/web`
- CI command is `make ci`
- Production deploy uses Vercel project `portfolio-web`

## Do not store

- temporary task notes
- one-off assumptions
- debugging logs
- step-by-step reasoning

## Style

- Use concise bullet points
- Prefer concrete, verifiable facts
- Avoid speculation
