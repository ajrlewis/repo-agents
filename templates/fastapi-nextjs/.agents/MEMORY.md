# Stable Memory

Use this file for stable repo facts that should persist across tasks.
This is not a task log.

## When to write

Write to this file when you discover, confirm, or change durable facts, including:

- actual API path (default template path is `apps/api`)
- actual web path (default template path is `apps/web`)
- canonical commands used for install, run, and test
- deployment target names and environment names
- required CI/CD job names
- durable repo conventions used consistently

## Good examples

- API lives in `apps/api`
- Web app lives in `apps/web`
- CI command is `make ci`
- Production deploy uses Vercel project `portfolio-web`
- API tests run with `cd apps/api && uv run pytest -q`
- Web dev server runs with `cd apps/web && bun run dev`

## Do not store

- temporary task notes
- one-off assumptions
- debugging logs
- chain-of-thought or step-by-step reasoning

## Style

- Use concise bullet points
- Prefer concrete, verifiable facts
- Avoid speculation
- Update or replace stale entries when facts change

## Example update

- API path changed from `apps/api` to `services/api`
- Updated commands now use `cd services/api && uv run pytest -q`
