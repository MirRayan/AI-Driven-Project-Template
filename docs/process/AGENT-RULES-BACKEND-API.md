# Agent rules — backend API registry (all tools)

**Applies to:** Any AI assistant, automation, or human implementing or documenting HTTP/API usage — **not** tied to a specific IDE.

**Canonical registry:** [`../05-breakdown/backend/BACKEND-INDEX.md`](../05-breakdown/backend/BACKEND-INDEX.md)  
**Related:** [`AGENTS.md`](../../AGENTS.md), [`DOCUMENTATION-SYNC.md`](DOCUMENTATION-SYNC.md), [`PR-CHECKLIST.md`](PR-CHECKLIST.md)

**Note:** If this project does not expose or consume REST APIs, you can ignore this file or keep the registry empty until needed.

---

## Rule A — Before implementing or changing API client code

When work touches **repositories**, **API clients**, **OpenAPI-generated clients**, or **remote data sources** that call HTTP endpoints:

1. Identify the **module or feature doc** that lists backend dependencies (e.g. under `docs/05-breakdown/modules/` or your equivalent).
2. Collect listed **`api:*`** IDs.
3. Open **`BACKEND-INDEX.md`** and locate each ID.
4. If **Status** is **`not_deployed`** or **`pending`**, do **not** invent paths. **Stop** and obtain a confirmed route or registry update — or ship an explicit stub/feature-flag and document it.
5. Prefer **`verified`** rows for production-bound behavior; use **Detail doc** links for payloads and auth.

---

## Rule B — When adding or changing an API contract

If a change **introduces, removes, or renames** an endpoint clients should use:

1. **Update `BACKEND-INDEX.md`** in the same change: path, status, last verified when **`verified`**, detail doc link, stable **`api:*`** ID (new ID if the route replaced an old one; mark old row **`deprecated`**).
2. Adjust **module docs** only if **dependency IDs** or narrative need to change — **do not** duplicate full path tables in modules.
3. Add a line to the **Changelog** in `BACKEND-INDEX.md`.

---

## Context efficiency

- Prefer **`BACKEND-INDEX.md`** for “what path and status”; open **detail docs** only for field-level depth.

---

*AI-Driven Project Template — shared agent rules*
