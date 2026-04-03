# Backend index — API readiness (single source of truth)

**Canonical path:** `docs/05-breakdown/backend/BACKEND-INDEX.md`  
**Audience:** Engineers and any AI agent working on clients or contracts.

This file is the **registry** for **which HTTP/API endpoints are ready** for implementation, with **stable IDs** for cross-reference. Feature or module documents should list **`api:*` dependency IDs** only — not duplicate full path tables here.

**Agent procedure (all tools):** [`../process/AGENT-RULES-BACKEND-API.md`](../process/AGENT-RULES-BACKEND-API.md)

---

## How to use (reading order)

1. Open the **module or feature doc** and read its **Backend dependencies** (IDs).
2. Find each ID in the tables below.
3. Use **Detail doc** for payloads and edge cases.

---

## Conventions

| Column | Meaning |
|--------|---------|
| **ID** | Stable slug `api:<area>:<feature>`. Do not rename once in use; add a new row if the route is replaced; mark old row **`deprecated`**. |
| **Method + path** | Relative to your API base (e.g. `https://<host>/api/v1/` or `.../rest/V1/`). |
| **Status** | **`verified`** — smoke-tested · **`pending`** — not yet confirmed · **`not_deployed`** — missing on target env · **`deprecated`** — do not use |
| **Last verified** | Date + environment when **`verified`**. |
| **Detail doc** | Deep contract (optional). |

---

## Changelog

| Date | Change |
|------|--------|
| *Template* | Initial skeleton — fill rows as endpoints are confirmed. |

---

## Example area (rename / extend)

| ID | Feature | Method + path | Status | Last verified | Detail doc |
|----|---------|----------------|--------|---------------|------------|
| *`api:example:health`* | Liveness check | `GET /health` | pending | — | — |

---

## Implementation guidance

- Implement against **`verified`** rows unless the change explicitly documents a stub or feature flag.
- When you **add or change** a row, follow [`AGENT-RULES-BACKEND-API.md`](../process/AGENT-RULES-BACKEND-API.md) and update the **Changelog** above.

---

*AI-Driven Project Template — customize tables per product*
