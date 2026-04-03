# Documentation synchronization process

**Audience:** Humans and any AI agent working in this repository.  
**Scope:** Generic — applies regardless of stack, cloud, or client technology.

## Purpose

Keep documentation **accurate**, **linked**, and **easy to navigate** without duplicating content in multiple places. Optional **manual** link checks (`scripts/check-doc-links.sh`) help with relative links; humans (or agents) handle meaning and consistency.

## Source of truth

| Layer | Role |
|-------|------|
| **Master index** (e.g. `PROJECT-INDEX.md`) | Current phase, status, metrics, and links to deeper docs |
| **Backend API registry** (if the project uses HTTP APIs) | [`BACKEND-INDEX.md`](../05-breakdown/backend/BACKEND-INDEX.md) — **`api:*` IDs**, paths, **verified** / **pending** / **not_deployed** |
| **Git history** | Immutable record of what changed and when |
| **Specifications, ADRs, reference docs** | Detailed requirements and decisions — **linked from the index**, not copied in full into the index |

## Full mechanical verification (on demand)

Run from the repo root when you choose:

```bash
./scripts/verify-project-docs.sh
```

This runs internal link checks, ADR index checks (if `docs/03-architecture/decisions/` exists), optional `docs/04-reference/` checks, and more. See [scripts/README.md](../../scripts/README.md). Use `SKIP_LYCHEE=1` if `lychee` is not installed.

**Links only:**

```bash
./scripts/check-doc-links.sh
```

Requires [lychee](https://github.com/lycheeverse/lychee) for `check-doc-links.sh`.

## Light pass (every PR that touches documentation)

**Duration:** about 15–30 minutes (or run `check-doc-links.sh` + quick skim)

- [ ] Master index “Last updated” (or equivalent) reflects material changes.
- [ ] If HTTP/API contracts changed: [`BACKEND-INDEX.md`](../05-breakdown/backend/BACKEND-INDEX.md) updated; see [PR-CHECKLIST.md](PR-CHECKLIST.md).
- [ ] New or changed ADRs appear in the ADR index (`docs/03-architecture/decisions/README.md` or your project’s index).
- [ ] Cross-references from feature/module docs to API or reference docs still resolve.
- [ ] If many links changed: `./scripts/check-doc-links.sh` passes.

## Deep pass (quarterly or before a major release)

**Duration:** about 60–90 minutes  
**Owner:** designate a DRI (directly responsible individual) per quarter.

1. Review the reading order in `.ai/workflows/architecture-review-checklist.md` (adapt paths to your repo).
2. Compare **technology and constraint** statements across:
   - Project context / overview (wherever your stack is described)
   - ADRs
   - Architecture diagrams (if present) vs `docs/03-architecture/diagrams/DIAGRAM-UPDATE-PROTOCOL.md`
3. Reconcile **intentional gaps** (e.g. “diagrams not yet added”) in the master index so readers are not misled.
4. Use `git log` since the last deep pass to spot areas that changed without doc updates.
5. Optional: short retro — what drifted, one process tweak for next quarter.

## What not to automate

Semantic consistency (e.g. whether a feature is still in scope, or whether two sections contradict each other) requires judgment. Link checkers and linters cannot replace that.

## Related

- [AGENTS.md](../../AGENTS.md) — short agent-facing summary
- [AGENT-RULES-BACKEND-API.md](AGENT-RULES-BACKEND-API.md) — API registry rules (all agents)
- [PR-CHECKLIST.md](PR-CHECKLIST.md) — docs + API PR checklist
- [Diagram update protocol](../03-architecture/diagrams/DIAGRAM-UPDATE-PROTOCOL.md)

---

*Template: AI-Driven Project Template*
