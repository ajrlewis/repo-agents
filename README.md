# repo-agents

Minimal starter kit for adding coding-agent instructions to application repositories.

## What this repo does

This repo provides installable templates that drop a small, opinionated agent scaffold into another repo.

## Why `AGENTS.md` is the main entrypoint

`AGENTS.md` lives at the target repo root where most coding agents look first. It acts as the single routing file that tells the agent exactly which supporting docs to read in `.agents/`.

## What gets installed

For the `fastapi-nextjs` template, the installer adds:

- `AGENTS.md`
- `.agents/PROJECT.md`
- `.agents/WORKFLOWS.md`
- `.agents/STACK.md`
- `.agents/COMMANDS.md`
- `.agents/CHECKLISTS.md`
- `.agents/MEMORY.md`
- `.cursor/rules/project.mdc`
- `.github/copilot-instructions.md`

## Run locally

From this repo:

```bash
./install.sh fastapi-nextjs
```

Or rely on the default template:

```bash
./install.sh
```

Install into a different repo by running the script from that repo and referencing this installer path.

## Run via curl

```bash
curl -fsSL https://raw.githubusercontent.com/ajrlewis/repo-agents/main/install.sh | bash -s -- fastapi-nextjs
```

Optional: install from a fork or custom branch by overriding template base URL:

```bash
curl -fsSL https://raw.githubusercontent.com/ajrlewis/repo-agents/main/install.sh | REPO_AGENTS_REMOTE_BASE_URL="https://raw.githubusercontent.com/<org>/<repo>/<branch>/templates" bash -s -- fastapi-nextjs
```

## Scope

The initial template is intentionally minimal: no auto-detection, no merge engine, no extra abstractions.
