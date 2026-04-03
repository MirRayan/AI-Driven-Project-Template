# Agent instructions (all tools)

This file is **tool-agnostic**: follow it in Cursor, Copilot, Claude Code, local scripts, or any other assistant. It is **not** tied to a programming language, framework, or deployment platform.

## Documentation and architecture consistency

1. **Single narrative index** — Keep the project’s master index (typically `PROJECT-INDEX.md` at the repo root) accurate: phase, status, links to specs and ADRs, and “last updated” when meaning changes.
2. **Backend API registry (when the project has HTTP/API contracts)** — The single place for **which endpoints are ready** is [`docs/05-breakdown/backend/BACKEND-INDEX.md`](docs/05-breakdown/backend/BACKEND-INDEX.md). Feature/module docs reference stable **`api:*`** IDs; **update the index** when routes change. **Procedure (any agent):** [`docs/process/AGENT-RULES-BACKEND-API.md`](docs/process/AGENT-RULES-BACKEND-API.md). Optional IDE hint files (e.g. `.cursor/rules/backend-api-registry.mdc`) point to that doc only.
3. **Git is the audit trail** — Do not duplicate history in a separate changelog unless the team maintains one on purpose. Prefer `git log` plus an updated index.
4. **After structural doc changes** — When you add or change an ADR, update the ADR index (e.g. `docs/03-architecture/decisions/README.md` if present). When you change requirements, ensure the path from **index → spec → breakdown → reference** still links correctly.
5. **Tiered review** — Small doc edits: fix links and index dates. Periodic deep review: follow `docs/process/DOCUMENTATION-SYNC.md`.
6. **Mechanical verification (manual, you run)** — Run [`scripts/verify-project-docs.sh`](scripts/verify-project-docs.sh) before a big docs merge; extend it for your API paths and diagrams. For links only, use [`scripts/check-doc-links.sh`](scripts/check-doc-links.sh) (requires [lychee](https://github.com/lycheeverse/lychee)). No GitHub Action by default — add one if your team wants it.

## Where to look next

| Document | Purpose |
|----------|---------|
| [docs/05-breakdown/backend/BACKEND-INDEX.md](docs/05-breakdown/backend/BACKEND-INDEX.md) | API readiness (`api:*` IDs) — update when routes change |
| [docs/process/AGENT-RULES-BACKEND-API.md](docs/process/AGENT-RULES-BACKEND-API.md) | Rule A / B — read index before API work; update index when contracts change |
| [docs/process/PR-CHECKLIST.md](docs/process/PR-CHECKLIST.md) | PR checklist when docs or API clients change |
| [docs/process/DOCUMENTATION-SYNC.md](docs/process/DOCUMENTATION-SYNC.md) | Full checklist (light vs quarterly deep pass) |
| [.ai/workflows/architecture-review-checklist.md](.ai/workflows/architecture-review-checklist.md) | Architecture/doc review steps |
| [.ai/AI-ASSISTANT-RULES.md](.ai/AI-ASSISTANT-RULES.md) | Project-specific ALWAYS / NEVER (fill per project) |

## Platform-specific rules

Put language, framework, or cloud rules in **`.ai/AI-ASSISTANT-RULES.md`** or in your team’s coding guidelines — not in this file. Keep `AGENTS.md` generic so it can ship with the template unchanged.

---

*Template: AI-Driven Project Template — documentation sync policy*
