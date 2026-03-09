# Module {NN} — {Module Name}

| | |
|---|---|
| **Sprint** | S{N} (Weeks {X}–{Y}) |
| **Spec Ref** | {FR-XXX, FR-YYY} |
| **Dependencies** | {List dependent modules} |
| **Milestone** | {Alpha / Beta 1 / Beta 2 / RC / GA} |

> **Out of Scope:** {List what is explicitly NOT included in this module and why.}

---

## Data Layer

| ID | Title | Platform |
|----|-------|----------|
| {MOD}-001 | Implement `{Entity}Repository` ({list operations: get, create, update, delete}) | Both / iOS / Android |
| {MOD}-002 | Implement {API/SDK} integration | Both |
| {MOD}-003 | Implement local caching / persistence for {entity} | Both |

> **Platform values:** `Both` | `iOS` | `Android`

---

## Domain / Business Logic

| ID | Title | Platform |
|----|-------|----------|
| {MOD}-004 | `{Feature}UseCase`: {what it does} | Both |
| {MOD}-005 | `{Feature}UseCase`: {what it does} | Both |

---

## UI / Presentation

> ⚠️ Pending Figma — tickets are high-level. Detailed breakdown after designs are available.

*(Remove the above warning line once Figma has been reviewed and this section updated.)*

| ID | Title | Platform | Figma Status |
|----|-------|----------|--------------|
| {MOD}-006 | {Screen name} screen ({brief description of content}) | Both | ⏳ Pending |
| {MOD}-007 | {Screen name} screen ({brief description of content}) | Both | ✅ Designed |

> **Figma Status values:** `✅ Designed` | `⏳ Pending` | `🔄 In Review` | `❌ Not Designed`

---

## QA

| ID | Title | Platform |
|----|-------|----------|
| {MOD}-QA-001 | {Describe testable acceptance criterion — what the user sees/does, not an implementation detail} | QA |
| {MOD}-QA-002 | {Edge case — what happens when X is empty/missing/fails} | QA |
| {MOD}-QA-003 | {Negative test — feature Y is NOT accessible to guest user / feature Z is hidden when toggle is OFF} | QA |

> **QA ticket format:** Each row is a self-contained test case. Write from user perspective.

---

## API Mapping

> **Auth:** {Customer Token `Authorization: Bearer <token>` / Anonymous / Admin Token}
> **Base URL:** `https://<backend-domain>/rest/V1/`

---

### 1. {Operation Name}
**`{METHOD} /V1/{endpoint}`** — {Auth requirement}

**Request:**
```json
{
  "field": "value"
}
```

**Response:**
```json
{
  "field": "value"
}
```

> {Any important notes — pagination, filtering, status mapping, edge cases}

---

### 2. {Operation Name}
**`{METHOD} /V1/{endpoint}`** — {Auth requirement}

> **Endpoint TBD** — No REST endpoint confirmed yet. Expected shape:
> `{METHOD} /V1/{expected-path}` — {Auth}
>
> Confirm with backend team before implementation.

**Expected Response:**
```json
{
  "field": "value"
}
```

---

## Status Mapping (if applicable)

| API Value | Display Label |
|-----------|---------------|
| `{api_status}` | {Human-readable label} |

---

## Notes

- {Any important implementation notes for developers}
- {SDK integration notes}
- {Dependency notes — what must be built first}
