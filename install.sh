#!/usr/bin/env bash
set -euo pipefail

TEMPLATE="fastapi-nextjs"
FORCE=0

usage() {
  cat <<'USAGE'
Usage:
  ./install.sh [template] [--force]

Examples:
  ./install.sh
  ./install.sh fastapi-nextjs
  ./install.sh fastapi-nextjs --force
USAGE
}

for arg in "$@"; do
  case "$arg" in
    --force)
      FORCE=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      TEMPLATE="$arg"
      ;;
  esac
done

TARGET_DIR="$PWD"
SCRIPT_DIR=""
if [[ -n "${0-}" && "${0}" != "bash" && "${0}" != "-bash" && -f "${0}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${0}")" && pwd)"
fi

LOCAL_TEMPLATE_DIR=""
if [[ -n "$SCRIPT_DIR" ]]; then
  LOCAL_TEMPLATE_DIR="$SCRIPT_DIR/templates/$TEMPLATE"
fi

REMOTE_BASE_URL="${REPO_AGENTS_REMOTE_BASE_URL:-https://raw.githubusercontent.com/ajrlewis/repo-agents/main/templates}"

FILES=(
  "AGENTS.md"
  ".agents/PROJECT.md"
  ".agents/WORKFLOWS.md"
  ".agents/STACK.md"
  ".agents/CODE_STYLE.md"
  ".agents/COMMANDS.md"
  ".agents/CHECKLISTS.md"
  ".agents/MEMORY.md"
  ".cursor/rules/project.mdc"
  ".github/copilot-instructions.md"
)

SOURCE_MODE=""
if [[ -n "$LOCAL_TEMPLATE_DIR" && -d "$LOCAL_TEMPLATE_DIR" ]]; then
  SOURCE_MODE="local"
else
  if ! command -v curl >/dev/null 2>&1; then
    echo "ERROR: template '$TEMPLATE' not found locally and 'curl' is unavailable for remote install."
    exit 1
  fi

  SOURCE_MODE="remote"
fi

echo "Installing template '$TEMPLATE' into: $TARGET_DIR"
[[ "$FORCE" -eq 1 ]] && echo "Overwrite mode: enabled (--force)"

CREATED=0
OVERWRITTEN=0
SKIPPED=0

for rel in "${FILES[@]}"; do
  dest="$TARGET_DIR/$rel"
  existed_before=0
  [[ -e "$dest" ]] && existed_before=1

  mkdir -p "$(dirname "$dest")"

  if [[ "$existed_before" -eq 1 && "$FORCE" -ne 1 ]]; then
    echo "SKIP      $rel (already exists)"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  if [[ "$SOURCE_MODE" == "local" ]]; then
    src="$LOCAL_TEMPLATE_DIR/$rel"
    if [[ ! -f "$src" ]]; then
      echo "ERROR: missing file in template: $src"
      exit 1
    fi
    cp "$src" "$dest"
  else
    url="$REMOTE_BASE_URL/$TEMPLATE/$rel"
    if ! curl -fsSL "$url" -o "$dest"; then
      echo "ERROR: failed to download $url"
      echo "Check that template '$TEMPLATE' exists in: $REMOTE_BASE_URL"
      echo "You can override this with REPO_AGENTS_REMOTE_BASE_URL=<raw-templates-url>"
      exit 1
    fi
  fi

  if [[ "$existed_before" -eq 1 ]]; then
    echo "OVERWRITE $rel"
    OVERWRITTEN=$((OVERWRITTEN + 1))
  else
    echo "CREATE    $rel"
    CREATED=$((CREATED + 1))
  fi
done

echo
echo "Done. Created: $CREATED, Overwritten: $OVERWRITTEN, Skipped: $SKIPPED"
