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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$PWD"
LOCAL_TEMPLATE_DIR="$SCRIPT_DIR/templates/$TEMPLATE"
REMOTE_BASE_URL="${REPO_AGENTS_REMOTE_BASE_URL:-https://raw.githubusercontent.com/<your-org>/repo-agents/main/templates}"

FILES=(
  "AGENTS.md"
  ".agents/PROJECT.md"
  ".agents/WORKFLOWS.md"
  ".agents/STACK.md"
  ".agents/COMMANDS.md"
  ".agents/CHECKLISTS.md"
  ".agents/MEMORY.md"
  ".cursor/rules/project.mdc"
  ".github/copilot-instructions.md"
)

SOURCE_MODE=""
if [[ -d "$LOCAL_TEMPLATE_DIR" ]]; then
  SOURCE_MODE="local"
else
  if [[ "$REMOTE_BASE_URL" == *"<your-org>"* ]]; then
    echo "ERROR: template '$TEMPLATE' not found at $LOCAL_TEMPLATE_DIR"
    echo "Set REPO_AGENTS_REMOTE_BASE_URL to your GitHub raw templates path,"
    echo "or run this installer from a local clone of repo-agents."
    exit 1
  fi

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
