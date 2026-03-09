# Sprint Ticket Template

Use this format for all sprint tickets. One ticket serves developers, QA, and managers — write it so all three roles can understand it without additional context.

---

## Single Ticket Format

```
## {TICKET-ID} — {Title}

| | |
|---|---|
| **Module** | {Module name and number} |
| **Sprint** | S{N} — Week {X} |
| **Platform** | Both / iOS / Android / QA |
| **Layer** | Data / Domain / UI / QA |
| **Points** | {Story points if used} |
| **Dependencies** | {TICKET-IDs that must be done first} |

### User Story
> As a **{role: user / guest / admin}**,
> I want to **{action / capability}**,
> so that **{business value / outcome}**.

### Acceptance Criteria
- [ ] {Criterion 1 — observable behaviour, not implementation detail}
- [ ] {Criterion 2 — specific state or value the user can verify}
- [ ] {Criterion 3 — edge case handled (empty state, error state, loading state)}
- [ ] {Criterion 4 — negative case: what should NOT happen}

### Technical Notes
> *(For developers only — optional section)*
- API: `{METHOD} /V1/{endpoint}` — {auth}
- Response field: `{field_name}` maps to `{UI label}`
- Depends on: `{Repository / UseCase}` from `{TICKET-ID}`

### QA Notes
> *(For QA only — optional section)*
- Test on: iOS {version}+, Android {version}+
- Regression risk: {Low / Medium / High}
- Edge cases to test: {list}
```

---

## Batch Ticket List Format (for sprint planning docs)

Use this compact format when listing multiple tickets in a sprint planning file:

```markdown
| ID | Title | Layer | Platform | Points | Dependencies |
|----|-------|-------|----------|--------|--------------|
| {MOD}-001 | Implement `{Entity}Repository` | Data | Both | {pts} | — |
| {MOD}-002 | `{Feature}UseCase`: {brief} | Domain | Both | {pts} | {MOD}-001 |
| {MOD}-003 | {Screen} screen | UI | Both | {pts} | {MOD}-002 |
| {MOD}-QA-001 | {Test case description} | QA | QA | — | {MOD}-003 |
```

---

## Acceptance Criteria Writing Guide

### DO write criteria as:
- Observable behaviour: *"User sees X when Y happens"*
- Specific values: *"OTP boxes turn teal on correct code"*
- Negative cases: *"Guest user cannot access checkout screen"*
- Edge cases: *"Empty cart state shows 'Your cart is empty' message"*

### DON'T write criteria as:
- Implementation details: *"Call POST /V1/carts/mine"*
- Vague: *"Works correctly"*
- Internal state: *"ViewModel emits Loading state"*

---

## Ticket Layers Reference

| Layer | What it covers | Who writes it |
|-------|----------------|---------------|
| **Data** | Repository, API client, DTO, local DB | Backend/API lead |
| **Domain** | UseCase, domain model, business rules | Tech lead |
| **UI** | Screen, component, navigation wiring | Frontend dev |
| **QA** | Test cases, regression, acceptance testing | QA engineer |

---

## Platform Values

| Value | Meaning |
|-------|---------|
| `Both` | Implement on iOS and Android |
| `iOS` | iOS only |
| `Android` | Android only |
| `QA` | Test/verification task (no platform code) |
| `Backend` | Backend task (tracked here for visibility) |
