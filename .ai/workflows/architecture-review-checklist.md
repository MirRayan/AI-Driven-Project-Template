# Architecture Review Checklist

## Overview

The **Architecture Review Checklist** provides a systematic process for reviewing architecture decisions and documentation before committing major changes. This ensures completeness, consistency, and quality of architectural artifacts.

## When to Use

Perform architecture review:
- Before committing finalized ADRs
- After completing architecture phase
- Before starting implementation
- After adding new services/components
- When updating architecture diagrams
- Before presenting to stakeholders

## Purpose

Architecture review ensures:
- ✅ All decisions are properly documented
- ✅ Documentation is complete and consistent
- ✅ Diagrams reflect current architecture
- ✅ No pending decisions remain unresolved
- ✅ Implementation readiness

## The Review Process

### Pre-Review Preparation

**1. Create Serialized Reading List**

Generate an ordered list of files for review:

```markdown
## Architecture Review Reading List

### Phase 1: Overview (5-10 min)
1. PROJECT-INDEX.md - Current project state

### Phase 2: Core Decisions (20-30 min)
2. ADR-XXX - Critical decision #1
3. ADR-YYY - Critical decision #2
4. ADR-ZZZ - Critical decision #3

### Phase 3: Services/Features (15-20 min)
5. .ai/context/services/service-name.md
6. .ai/context/features/feature-name.md

### Phase 4: Visual Verification (10-15 min)
7. docs/03-architecture/diagrams/c4/...
8. docs/03-architecture/architecture-summary.md

### Phase 5: Cross-Check (5 min)
9. docs/03-architecture/decisions/README.md
10. COMMIT_MESSAGE.txt (if prepared)
```

**Reading List Principles:**
- Start with overview/index
- Critical decisions before supporting details
- Visual diagrams after text
- Cross-reference documents last
- Estimate reading time per phase

**2. Prepare Review Checklist**

Use the comprehensive checklist below, customized for your changes.

### Core Review Checklist

#### A. Decision Completeness

**Pending Decisions:**
- [ ] All PDRs resolved or explicitly deferred
- [ ] No unaddressed questions in discussions
- [ ] Decision authority clearly assigned
- [ ] Timeline for deferred decisions documented

**ADR Quality:**
- [ ] Each ADR follows standard template
- [ ] Status field accurate (Accepted/Superseded/Deprecated)
- [ ] Date field populated
- [ ] Context section explains "why" not just "what"
- [ ] Decision section clearly states chosen approach
- [ ] Alternatives section includes all viable options
- [ ] Each alternative has pros/cons documented
- [ ] Consequences section identifies impacts
- [ ] References section includes related ADRs

**ADR Coverage:**
- [ ] All major architecture decisions have ADRs
- [ ] Technology stack choices documented
- [ ] Infrastructure decisions documented
- [ ] Security approach documented
- [ ] Data management strategy documented
- [ ] Integration patterns documented

#### B. Documentation Consistency

**Index Files:**
- [ ] `docs/03-architecture/decisions/README.md` lists all ADRs
- [ ] ADR numbers sequential with no gaps
- [ ] PROJECT-INDEX.md reflects current state
- [ ] Service count accurate across all docs
- [ ] Technology stack consistent everywhere

**Cross-References:**
- [ ] ADRs reference related ADRs
- [ ] Service specs reference relevant ADRs
- [ ] Diagrams match documented decisions
- [ ] PROJECT-INDEX.md links to key documents

**Terminology:**
- [ ] Consistent naming across documents
- [ ] Abbreviations defined on first use
- [ ] No conflicting terminology
- [ ] Domain language consistent

#### C. Architecture Integrity

**Component Coverage:**
- [ ] All services/components documented
- [ ] Each service has specification (if applicable)
- [ ] Database schemas documented
- [ ] API contracts defined
- [ ] Integration points identified

**Design Patterns:**
- [ ] Patterns consistently applied
- [ ] No conflicting architectural approaches
- [ ] Dependencies properly managed
- [ ] Clear separation of concerns

**Non-Functional Requirements:**
- [ ] Security considerations addressed
- [ ] Scalability approach defined
- [ ] Performance targets documented
- [ ] Monitoring strategy defined
- [ ] Disaster recovery considered

#### D. Visual Documentation

**Diagram Completeness:**
- [ ] C4 Context diagram exists
- [ ] C4 Container diagram exists
- [ ] Component diagrams for complex services
- [ ] Database schema diagrams
- [ ] Deployment architecture diagram

**Diagram Accuracy:**
- [ ] All services shown in diagrams
- [ ] Relationships correctly depicted
- [ ] Technology choices match ADRs
- [ ] Integration patterns match design
- [ ] Diagram legend/key provided

**Diagram Quality:**
- [ ] Clear and readable
- [ ] Consistent notation
- [ ] Appropriate level of detail
- [ ] Source files available (PlantUML, etc.)
- [ ] PNG/SVG exports up to date

#### E. Implementation Readiness

**Clarity:**
- [ ] Implementation path clear from documentation
- [ ] No ambiguous or vague decisions
- [ ] Acceptance criteria defined
- [ ] Success metrics identified

**Feasibility:**
- [ ] Technical approach validated
- [ ] Resource requirements identified
- [ ] No unresolved technical risks
- [ ] Dependencies clearly understood

**Completeness:**
- [ ] All services designed
- [ ] APIs specified
- [ ] Data models defined
- [ ] Security model complete

#### F. Stakeholder Alignment

**Approval:**
- [ ] Key stakeholders consulted
- [ ] Technical team aligned
- [ ] Business requirements validated
- [ ] Operations/DevOps input gathered

**Communication:**
- [ ] Changes communicated to team
- [ ] Documentation accessible to all
- [ ] Review feedback incorporated
- [ ] Dissenting opinions documented

### Domain-Specific Checklists

#### For Multi-Tenant SaaS

- [ ] Tenant isolation strategy documented
- [ ] Data separation approach defined
- [ ] Per-tenant configuration managed
- [ ] Tenant provisioning process designed
- [ ] Tenant-specific customization handled

#### For Microservices Architecture

- [ ] Service boundaries clearly defined
- [ ] Inter-service communication documented
- [ ] Service discovery approach defined
- [ ] Circuit breaker pattern considered
- [ ] Distributed tracing planned

#### For Event-Driven Systems

- [ ] Event schemas defined
- [ ] Event sourcing strategy documented
- [ ] Message broker choice justified
- [ ] Event ordering considerations addressed
- [ ] Event replay strategy defined

#### For API-First Projects

- [ ] API versioning strategy defined
- [ ] Rate limiting approach documented
- [ ] Authentication method chosen
- [ ] API documentation tooling selected
- [ ] Backward compatibility plan exists

## Review Execution

### Individual Review

**Step 1: Read Serially**
- Follow the reading list order
- Take notes on issues/questions
- Mark items for clarification
- Don't skip sections

**Step 2: Complete Checklist**
- Work through relevant checklists
- Mark each item complete or note issue
- Capture specific concerns
- Identify missing items

**Step 3: Validate Cross-References**
- Check links between documents
- Verify ADR references
- Confirm diagram consistency
- Test document paths

**Step 4: Summarize Findings**
```markdown
## Review Summary

**Reviewer:** [Name]
**Date:** [YYYY-MM-DD]
**Scope:** [What was reviewed]

### Critical Issues (Must fix)
1. Issue 1
2. Issue 2

### Major Concerns (Should fix)
1. Concern 1
2. Concern 2

### Minor Issues (Nice to fix)
1. Issue 1
2. Issue 2

### Questions for Clarification
1. Question 1
2. Question 2

### Approval Status
- [ ] Approved - Ready to commit
- [ ] Approved with minor changes
- [ ] Not approved - requires rework
```

### Team Review

**Step 1: Distribute Materials**
- Share reading list
- Provide review checklist
- Set review deadline
- Schedule review meeting

**Step 2: Individual Reviews**
- Each reviewer completes independently
- Submit findings before meeting
- Identify common themes

**Step 3: Review Meeting**
- Discuss findings
- Resolve disagreements
- Prioritize issues
- Assign action items

**Step 4: Sign-off**
- Document approval decision
- Capture action items
- Update documentation
- Schedule follow-up

## Real-World Example

**Restaurant Management Project Review:**

**Context:**
- 4 pending decisions finalized → 5 new ADRs
- 1 new service added (Inventory)
- Architecture diagrams updated
- Ready to commit and start implementation

**Reading List Created:**
1. PROJECT-INDEX.md (overview)
2. ADR-015 (plugin architecture - most critical)
3. ADR-011 through ADR-014 (new decisions)
4. Inventory Service specification
5. Updated C4 diagrams
6. ADR index
7. Commit message

**Review Execution:**
- User follows reading list serially
- Validates all decisions align with vision
- Checks for consistency
- Verifies completeness
- Confirms ready for implementation

**Outcome:**
- All checks passed
- Ready to commit
- Implementation can begin

## Critical Checkpoints

During review, verify these key items:

### Decision Alignment
✅ All decisions support overall architecture
✅ No conflicting approaches
✅ Consistent with project goals

### Quality Standards
✅ ADRs complete and well-reasoned
✅ Documentation professional quality
✅ Diagrams clear and accurate

### Completeness
✅ No major gaps in documentation
✅ All services specified
✅ Implementation path clear

### Team Alignment
✅ Stakeholders consulted
✅ Concerns addressed
✅ Consensus achieved

## Post-Review Actions

### If Approved

1. **Commit changes**
   ```bash
   git add .
   git commit -F COMMIT_MESSAGE.txt
   ```

2. **Communicate approval**
   - Notify team
   - Update project status
   - Archive review artifacts

3. **Proceed with implementation**
   - Follow documented approach
   - Reference ADRs during development
   - Update docs as needed

### If Not Approved

1. **Prioritize issues**
   - Critical: Must fix before proceeding
   - Major: Should fix soon
   - Minor: Can fix later

2. **Address issues**
   - Update ADRs
   - Revise diagrams
   - Fill gaps
   - Clarify ambiguities

3. **Re-review**
   - Focused review on changes
   - Verify issues resolved
   - Obtain approval

## Best Practices

### DO ✅
- Review before major commits
- Follow reading list serially
- Take notes during review
- Ask clarifying questions
- Validate cross-references
- Check diagram consistency
- Verify implementation readiness

### DON'T ❌
- Skip review for "small" changes
- Review out of order
- Rush through checklist
- Ignore minor inconsistencies
- Assume diagrams are correct
- Skip stakeholder validation
- Commit without review

## Integration with AI Assistants

**Prompt Pattern for Reading List:**
```
"I need to review [scope of changes]. Please create
a serialized reading list organized by importance,
with estimated reading times."
```

**Prompt Pattern for Review:**
```
"Review the following architecture documents against
the checklist. Identify any gaps, inconsistencies,
or missing items."
```

**AI can help:**
- Generate reading lists
- Check cross-references
- Verify consistency
- Identify gaps
- Validate diagrams match text
- Suggest improvements

## Checklist Customization

Adapt the checklist for your project:
- Add domain-specific items
- Remove irrelevant sections
- Adjust depth based on project size
- Include project-specific standards
- Add regulatory requirements

## Metrics to Track

- Review time (target vs actual)
- Issues found per review
- Critical issues (should trend toward zero)
- Review cycle time
- Time from review to commit

## Related Workflows

- **[decision-making-protocol.md](decision-making-protocol.md)** - Finalizing decisions before review
- **[pending-decision-workflow.md](pending-decision-workflow.md)** - Managing PDRs
- **DIAGRAM-UPDATE-PROTOCOL.md** - When/how to update diagrams

## Templates

- **Review Summary Template:** (included above)
- **Reading List Template:** (included above)
- **Issue Tracker Template:** Create in your project
