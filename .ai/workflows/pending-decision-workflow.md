# Pending Decision Workflow (PDR Pattern)

## Overview

The **Pending Decision Workflow** allows you to explore architectural options before committing to a final decision. This pattern emerged from the need to research, discuss, and validate choices without prematurely creating accepted ADRs.

## When to Use

Use PDRs when:
- Multiple valid approaches exist
- You need stakeholder input before deciding
- Research is required to evaluate options
- Decision impacts multiple services/components
- Timeline for decision is uncertain

## Workflow Steps

### 1. Identify Pending Decision

When you encounter a decision point that requires exploration:

```
Context: Working on feature X
Question: "How should we handle Y?"
Options: Need to research A, B, C
```

### 2. Create PDR Document

Create a Pending Decision Record in `docs/03-architecture/decisions/pending/`:

```markdown
# PDR-XXX: [Decision Title]

**Status:** Pending
**Created:** YYYY-MM-DD
**Target Resolution:** [Date or milestone]
**Owner:** [Name/Role]

## Context
[Describe the situation requiring a decision]

## Question
[Clear statement of what needs to be decided]

## Options Under Consideration
- Option A: [Brief description]
- Option B: [Brief description]
- Option C: [Brief description]

## Research Required
- [ ] Research item 1
- [ ] Research item 2
- [ ] Stakeholder input needed from: [list]

## Constraints
- Technical constraints
- Business constraints
- Timeline constraints

## Related ADRs
- [List any related existing decisions]

## Discussion Log
[Record key discussion points, research findings, stakeholder feedback]
```

### 3. Track in ADR Index

Add to `docs/03-architecture/decisions/README.md`:

```markdown
## Pending Decisions

| ID | Title | Created | Target Resolution | Owner |
|----|-------|---------|-------------------|-------|
| PDR-001 | [Title] | YYYY-MM-DD | [Date] | [Name] |
```

### 4. Research & Discussion Phase

Update the PDR as you:
- Research technical approaches
- Gather stakeholder input
- Run proof-of-concepts
- Analyze trade-offs

**Add findings to the Discussion Log section:**

```markdown
## Discussion Log

### 2024-01-15 - Initial Research
- Investigated Option A: [findings]
- Pros: [list]
- Cons: [list]

### 2024-01-18 - Stakeholder Feedback
- Team X prefers Option B because [reason]
- Concern raised about Option C: [concern]
```

### 5. Decision Point

When ready to decide, review:
- ✅ All options thoroughly researched
- ✅ Stakeholder input gathered
- ✅ Trade-offs clearly understood
- ✅ Constraints validated
- ✅ Recommendation ready

### 6. Convert PDR to ADR

Create the final ADR using the standard template:

```bash
# Move from pending to accepted
mv docs/03-architecture/decisions/pending/PDR-001-title.md \
   docs/03-architecture/decisions/ADR-XXX-title.md
```

Update the document:
```markdown
# ADR-XXX: [Decision Title]

**Status:** Accepted
**Date:** YYYY-MM-DD
**Supersedes:** PDR-001

## Context
[From PDR, refined]

## Decision
We will [clear statement of decision]

## Alternatives Considered
[From PDR options, expanded with pros/cons]

## Consequences
[Expected outcomes and implications]

## References
- PDR-001 Discussion Log
```

### 7. Update Tracking

Update ADR index:
- Remove from "Pending Decisions"
- Add to "Accepted Decisions"
- Update related ADRs if applicable

## Example: Real-World Usage

**From Restaurant Management Project:**

```
PDR-001: QR Code Security Model
- Created: Day 1 of architecture phase
- Options: Dynamic QR codes vs Static QR + PIN vs Hybrid
- Research: Security analysis, UX considerations
- Discussion: User specified preference for Static QR + PIN
- Resolution: Day 3
- Result: ADR-011 (Accepted)
```

The PDR allowed exploration without committing prematurely, and captured the decision rationale.

## Multiple PDRs

When you have multiple pending decisions:

1. **Prioritize**: Tag with priority (High/Medium/Low)
2. **Dependencies**: Note which decisions depend on others
3. **Parallelize**: Research independent decisions simultaneously
4. **Batch finalization**: Use [decision-making-protocol.md](decision-making-protocol.md)

## Best Practices

### DO ✅
- Keep PDRs lightweight during exploration
- Update regularly with findings
- Set realistic target resolution dates
- Link related PDRs together
- Archive PDR content when converting to ADR

### DON'T ❌
- Create PDRs for obvious/trivial decisions
- Let PDRs linger indefinitely without updates
- Skip PDR for decisions that affect multiple teams
- Lose PDR research when creating ADR

## Integration with AI Assistants

When working with AI:

**Prompt Pattern:**
```
"We have a pending decision PDR-XXX about [topic].
Please research [specific aspect] and update the
Discussion Log with findings."
```

**AI can help:**
- Research technical options
- Analyze trade-offs
- Generate comparison tables
- Draft ADR from finalized PDR

## File Organization

```
docs/03-architecture/decisions/
├── README.md (tracks both ADRs and PDRs)
├── pending/
│   ├── PDR-001-qr-code-security.md
│   ├── PDR-002-frontend-framework.md
│   └── PDR-003-payment-gateway.md
├── ADR-001-microservices-architecture.md
├── ADR-002-spring-boot-framework.md
└── ...
```

## Metrics to Track

- Average time from PDR creation → ADR acceptance
- Number of active PDRs (should stay low)
- PDRs abandoned/superseded (learn from these)
- Options evaluated per PDR (thoroughness indicator)

## Related Workflows

- **[decision-making-protocol.md](decision-making-protocol.md)** - Systematic finalization process
- **[architecture-review-checklist.md](architecture-review-checklist.md)** - Pre-commit review
- **ADR-TEMPLATE.md** - Final ADR format

## Template Files

- **PDR Template:** `templates/pdr-template.md` (to be created in projects)
- **ADR Template:** `docs/03-architecture/decisions/ADR-TEMPLATE.md`
