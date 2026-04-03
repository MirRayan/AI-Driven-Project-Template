#!/usr/bin/env bash
# Manual full-doc verification for any project using AI-Driven Project Template.
# Run when you want a mechanical sweep — not on CI unless you wire it (e.g. workflow_dispatch).
#
# Checks (generic):
#   1) Internal Markdown links — lychee --offline (via check-doc-links.sh)
#   2) If docs/03-architecture/decisions/ exists: every ADR-*.md is listed in decisions/README.md
#   3) If docs/04-reference/ exists: at least one .md at top level; warn if PROJECT-INDEX.md does not reference docs
#   4) TODO/FIXME/TBD counts under docs/ (informational)
#   5) Reminder for diagram update protocol if present
#
# Customize: add project-specific expected files in Phase 3 (see comments).
# Cannot verify: prose matches code — use human or AI review after this passes.
#
# Usage: ./scripts/verify-project-docs.sh
#        SKIP_LYCHEE=1 ./scripts/verify-project-docs.sh

set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

FAIL=0
WARN=0

echo "=============================================="
echo "  Project documentation — mechanical verify"
echo "  $ROOT"
echo "=============================================="
echo ""

echo "=== Phase 1: Internal Markdown links (lychee) ==="
if [[ "${SKIP_LYCHEE:-}" == "1" ]]; then
  echo "SKIP_LYCHEE=1 — skipped"
else
  if [[ -x "$ROOT/scripts/check-doc-links.sh" ]]; then
    if ! "$ROOT/scripts/check-doc-links.sh"; then
      echo "Phase 1: FAILED"
      FAIL=1
    else
      echo "Phase 1: OK"
    fi
  else
    echo "check-doc-links.sh missing or not executable"
    FAIL=1
  fi
fi
echo ""

echo "=== Phase 2: ADR files vs decisions/README.md (if ADR tree exists) ==="
ADR_README="$ROOT/docs/03-architecture/decisions/README.md"
if [[ -f "$ADR_README" ]]; then
  P2_FAIL=0
  while IFS= read -r -d '' f; do
    base="$(basename "$f")"
    [[ "$base" == "ADR-TEMPLATE.md" ]] && continue
    if ! grep -qF "$base" "$ADR_README" 2>/dev/null; then
      echo "  MISSING from ADR README: $base"
      P2_FAIL=1
      FAIL=1
    fi
  done < <(find "$ROOT/docs/03-architecture/decisions" -type f -name 'ADR-*.md' ! -name 'ADR-TEMPLATE.md' -print0 2>/dev/null)
  if [[ "$P2_FAIL" -eq 0 ]]; then
    echo "Phase 2: OK"
  fi
else
  echo "  (no docs/03-architecture/decisions/README.md — skipped)"
fi
echo ""

echo "=== Phase 3: docs/04-reference (if present) ==="
REF_DIR="$ROOT/docs/04-reference"
if [[ -d "$REF_DIR" ]]; then
  count=0
  while IFS= read -r -d '' _; do
    count=$((count + 1))
  done < <(find "$REF_DIR" -maxdepth 1 -type f -name '*.md' -print0 2>/dev/null)
  if [[ "$count" -eq 0 ]]; then
    echo "  INFO: no top-level *.md in docs/04-reference/"
  else
    echo "  Found $count top-level Markdown file(s) in docs/04-reference/"
  fi
  IDX="$ROOT/PROJECT-INDEX.md"
  if [[ -f "$IDX" ]]; then
    if grep -qiE '04-reference|reference' "$IDX" 2>/dev/null; then
      echo "Phase 3: PROJECT-INDEX mentions reference docs (OK)"
    else
      echo "  WARN: link docs/04-reference from PROJECT-INDEX.md when ready"
      WARN=$((WARN + 1))
    fi
  else
    echo "  INFO: no PROJECT-INDEX.md — add reference links to your master index"
    WARN=$((WARN + 1))
  fi
  # --- Optional: require specific API doc filenames (uncomment and edit) ---
  # for name in api-overview.md; do
  #   [[ -f "$REF_DIR/$name" ]] || { echo "  MISSING: docs/04-reference/$name"; FAIL=1; }
  # done
else
  echo "  (no docs/04-reference/ — skipped)"
fi
echo ""

echo "=== Phase 3b: Backend API index (if present) ==="
BI="$ROOT/docs/05-breakdown/backend/BACKEND-INDEX.md"
if [[ -f "$BI" ]]; then
  echo "  Found BACKEND-INDEX.md — keep rows updated per docs/process/AGENT-RULES-BACKEND-API.md"
else
  echo "  (no docs/05-breakdown/backend/BACKEND-INDEX.md — add from template if you use HTTP APIs)"
fi
echo ""

echo "=== Phase 4: TODO/FIXME/TBD in docs (informational) ==="
if [[ -d "$ROOT/docs" ]]; then
  if command -v rg >/dev/null 2>&1; then
    n=$(rg -l 'TODO|FIXME|TBD' "$ROOT/docs" --glob '*.md' 2>/dev/null | wc -l | tr -d ' ')
    echo "  Files with markers: $n"
  elif command -v grep >/dev/null 2>&1; then
    n=$(grep -R -E -l 'TODO|FIXME|TBD' "$ROOT/docs" --include='*.md' 2>/dev/null | wc -l | tr -d ' ')
    echo "  Files with markers: $n"
  fi
else
  echo "  (no docs/ yet)"
fi
echo ""

echo "=== Phase 5: Diagrams ==="
DIAG="$ROOT/docs/03-architecture/diagrams/DIAGRAM-UPDATE-PROTOCOL.md"
if [[ -f "$DIAG" ]]; then
  echo "  Follow after architecture changes: docs/03-architecture/diagrams/DIAGRAM-UPDATE-PROTOCOL.md"
else
  echo "  (add DIAGRAM-UPDATE-PROTOCOL.md under docs/03-architecture/diagrams/ when you introduce diagrams)"
fi
echo ""

echo "=============================================="
if [[ "$FAIL" -ne 0 ]]; then
  echo "RESULT: FAILED — fix items above"
  exit 1
fi
echo "RESULT: PASSED (warnings: $WARN)"
exit 0
