# Pull request checklist (documentation & API)

Use for PRs that touch **documentation** and/or **API client / repository** code.

## Always

- [ ] **Backend index:** If this PR **adds, removes, or changes** an HTTP endpoint the apps call (or should call), [`BACKEND-INDEX.md`](../05-breakdown/backend/BACKEND-INDEX.md) is updated: **ID**, **path**, **status**, **last verified** (when `verified`), and **detail doc** link if applicable.
- [ ] **Module / feature docs:** If backend dependencies changed, the **`api:*`** list in the relevant doc still matches the index (IDs only — no duplicate path tables).
- [ ] **Links:** Run `./scripts/check-doc-links.sh` (or `./scripts/verify-project-docs.sh`) if you edited many Markdown links.

## When changing architecture specs only

- [ ] Master index (e.g. `PROJECT-INDEX.md`) **Last updated** if the change is material.
- [ ] If this PR changes “how the system works today” (integration patterns, key routes/contracts, constraints), update `.ai/context/project-overview.md`.
- [ ] If this PR adds/updates ADRs, ensure the ADR index (commonly `docs/03-architecture/decisions/README.md`) lists them.

## Related

- [DOCUMENTATION-SYNC.md](DOCUMENTATION-SYNC.md)
- [AGENTS.md](../../AGENTS.md)
- [AGENT-RULES-BACKEND-API.md](AGENT-RULES-BACKEND-API.md)

---

*AI-Driven Project Template*
