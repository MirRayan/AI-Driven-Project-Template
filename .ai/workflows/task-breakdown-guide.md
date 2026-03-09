# Task Breakdown Guide

## Overview

The **Task Breakdown Guide** helps you decompose complex architectural work into manageable, trackable tasks. Effective task breakdown improves planning, progress tracking, and completion rates for AI-assisted development.

## When to Use

Break down tasks when:
- Starting complex multi-step work
- Managing multiple related changes
- Working with AI assistants
- Need clear progress visibility
- Coordinating with team members
- Estimating effort required

## Why Task Breakdown Matters

**Benefits:**
- ✅ Clear progress tracking
- ✅ Easier to resume work after interruption
- ✅ Better scope understanding
- ✅ Identifies dependencies early
- ✅ Prevents forgotten steps
- ✅ Enables parallel work

**Without breakdown:**
- ❌ Lose track of what's done
- ❌ Forget important steps
- ❌ Unclear how much work remains
- ❌ Hard to coordinate with others
- ❌ Difficult to estimate completion

## Task Breakdown Principles

### 1. Right-Sized Tasks

**Too Large (Bad):**
```
❌ "Complete architecture phase"
❌ "Implement authentication"
❌ "Update all documentation"
```

**Too Small (Bad):**
```
❌ "Open file ADR-001.md"
❌ "Type the word 'Decision'"
❌ "Save the file"
```

**Just Right (Good):**
```
✅ "Finalize QR code security decision"
✅ "Create ADR-011 for PIN verification"
✅ "Update C4 diagram with Inventory Service"
```

**Guidelines:**
- Each task = 15-60 minutes of work
- Clear start and end point
- Single deliverable
- Independently verifiable

### 2. Action-Oriented Language

**Use imperative verbs:**

| Good ✅ | Bad ❌ |
|---------|--------|
| "Create ADR-011" | "ADR-011" |
| "Update architecture diagram" | "Diagram" |
| "Research payment gateway options" | "Payment gateways" |
| "Write service specification" | "Service spec" |

**Task Format:**
```
[Verb] + [Object] + [Optional Context]

Examples:
- "Create ADR-015 for plugin architecture"
- "Update PROJECT-INDEX.md with service count"
- "Generate C4 container diagram"
- "Research multi-gateway payment patterns"
```

### 3. Dependency Awareness

**Identify dependencies:**
```markdown
Task A → Task B → Task C

Example:
1. Research payment options → (A)
2. Finalize payment gateway decision → (depends on A)
3. Create ADR-013 → (depends on B)
4. Update tech stack docs → (depends on C)
```

**Execution order:**
- Sequential: Tasks must complete in order
- Parallel: Tasks can run simultaneously
- Mixed: Some parallel, some sequential

### 4. Completeness Criteria

**Each task should have clear "done" criteria:**

```markdown
Task: "Create ADR-011 for QR code security"

Done when:
- [ ] ADR-011 file created
- [ ] All sections completed (Context, Decision, Alternatives, Consequences)
- [ ] File saved in correct location
- [ ] ADR added to index
```

## Breakdown Methods

### Method 1: Phase-Based Breakdown

**Best for:** Multi-phase projects

```markdown
## Phase 1: Planning
1. Review existing architecture
2. Identify pending decisions
3. Prioritize decisions

## Phase 2: Research
4. Research Option A for Decision X
5. Research Option B for Decision X
6. Create comparison table

## Phase 3: Decision
7. Finalize Decision X
8. Create ADR-XXX

## Phase 4: Documentation
9. Update architecture diagram
10. Update PROJECT-INDEX.md
```

### Method 2: Component-Based Breakdown

**Best for:** Service/feature work

```markdown
## Service Design
1. Define service boundaries
2. Design database schema
3. Specify API endpoints

## Documentation
4. Create service specification document
5. Create ADR for service architecture
6. Add service to C4 diagram

## Integration
7. Define events published/consumed
8. Document integration points
9. Update API gateway config
```

### Method 3: Decision-Based Breakdown

**Best for:** Finalizing architecture decisions

```markdown
## Per Decision (Repeat for each)

### Decision: [Topic]
1. Review pending decision (PDR-XXX)
2. Research all options
3. Create comparison table
4. Formulate recommendation
5. Get stakeholder approval
6. Create ADR-XXX
7. Update related documentation

## Cross-Cutting
8. Update architecture diagrams
9. Update PROJECT-INDEX.md
10. Create commit message
```

### Method 4: Document-Based Breakdown

**Best for:** Documentation work

```markdown
## Architecture Documentation Update

1. Create/update ADR-011
2. Create/update ADR-012
3. Create/update ADR-013
4. Update ADR index (README.md)
5. Update PROJECT-INDEX.md
6. Update C4 context diagram
7. Update C4 container diagram
8. Update architecture summary
9. Prepare commit message
```

## Real-World Example

**Scenario:** Finalize 4 pending decisions in Restaurant Management project

**Initial Request:**
```
User: "Let's finalize pending decisions"
```

**Poor Breakdown (Too vague):**
```
❌ 1. Do PDR-001
❌ 2. Do PDR-002
❌ 3. Do PDR-003
❌ 4. Do PDR-004
❌ 5. Update docs
```

**Good Breakdown:**
```
✅ Phase 1: Research & Decision
1. Finalize QR code security decision
2. Finalize frontend framework decision
3. Finalize payment gateway decision
4. Finalize monitoring strategy decision

✅ Phase 2: Documentation
5. Create ADR-011 (QR Code PIN Verification)
6. Create ADR-012 (React Frontend)
7. Create ADR-013 (Multi-Gateway Payments)
8. Create ADR-014 (Hybrid Monitoring)

✅ Phase 3: Architecture Updates
9. Update C4 container diagram
10. Update PROJECT-INDEX.md
11. Update ADR index

✅ Phase 4: Finalization
12. Create comprehensive commit message
```

**Task Execution:**
- Tasks 1-4: Can run in parallel (independent research)
- Tasks 5-8: Sequential after corresponding decision
- Tasks 9-11: Can run in parallel after all ADRs done
- Task 12: Final step after all updates

## Task States & Tracking

### Three-State Model

```
pending → in_progress → completed
```

**Rules:**
1. **Only ONE task** in `in_progress` at a time
2. **Complete current task** before starting next
3. **Mark completed immediately** after finishing

### Task Status Tracking

**In Code/Tools:**
```markdown
- [ ] Task 1 (pending)
- [x] Task 2 (completed)
- [ ] Task 3 (pending)
→ Task 4 (in_progress)
- [ ] Task 5 (pending)
```

**In Todo Systems:**
```json
{
  "tasks": [
    {"content": "Finalize QR decision", "status": "completed"},
    {"content": "Create ADR-011", "status": "in_progress"},
    {"content": "Update diagrams", "status": "pending"}
  ]
}
```

## Task Description Best Practices

### Content Format

**Use both forms:**
- **Imperative:** For pending tasks ("Create ADR-011")
- **Present continuous:** For in-progress tasks ("Creating ADR-011")

```markdown
Task: "Create ADR-011 for QR code security"
Active: "Creating ADR-011 for QR code security"
```

### Context Level

**Add context for clarity:**
```
❌ "Update diagram"
✅ "Update C4 container diagram with Inventory Service"

❌ "Create ADR"
✅ "Create ADR-015 for plugin architecture"

❌ "Update docs"
✅ "Update PROJECT-INDEX.md with new service count"
```

### Avoid Ambiguity

**Clear vs Unclear:**
| Unclear ❌ | Clear ✅ |
|-----------|----------|
| "Fix documentation" | "Add missing Alternatives section to ADR-011" |
| "Handle payment issue" | "Research multi-gateway payment adapter pattern" |
| "Work on diagrams" | "Generate PNG exports from PlantUML files" |

## Integration with AI Assistants

### AI Task Generation

**Prompt Pattern:**
```
"I need to [high-level goal]. Please break this
down into specific, actionable tasks with clear
completion criteria."
```

**Example:**
```
User: "I need to add a new Inventory Service with
receipt OCR functionality."

AI generates:
1. Design Inventory Service architecture
2. Define database schema (9 tables)
3. Specify API endpoints
4. Create service specification document
5. Add service to C4 diagram
6. Create ADR for service architecture
7. Update PROJECT-INDEX.md
```

### AI Progress Tracking

**AI should:**
- Mark ONE task as `in_progress` before starting
- Complete task fully before marking `completed`
- Not batch multiple completions
- Update after each task finishes

**Example workflow:**
```
AI: "I'm marking 'Create ADR-011' as in_progress"
AI: [Does the work]
AI: "ADR-011 created. Marking as completed."
AI: "Now marking 'Create ADR-012' as in_progress"
```

## Breakdown Anti-Patterns

### 1. "Mega Tasks"

**Problem:** Task too large to complete in one session
```
❌ "Complete entire architecture documentation"
```

**Solution:** Break into phases
```
✅ "Create all ADRs (5 files)"
✅ "Update all diagrams (3 diagrams)"
✅ "Update index files (2 files)"
```

### 2. "Micro Tasks"

**Problem:** Too granular, overhead exceeds value
```
❌ "Open ADR-011.md"
❌ "Type Context section"
❌ "Type Decision section"
❌ "Save file"
```

**Solution:** Combine into meaningful unit
```
✅ "Create ADR-011 for QR code security"
```

### 3. "Vague Tasks"

**Problem:** Unclear what "done" means
```
❌ "Work on authentication"
❌ "Improve documentation"
❌ "Think about scalability"
```

**Solution:** Make specific and measurable
```
✅ "Create ADR-008 for JWT authentication"
✅ "Add Alternatives section to all ADRs"
✅ "Document horizontal scaling strategy"
```

### 4. "Orphan Tasks"

**Problem:** Tasks with no clear parent or context
```
❌ "Update the thing"
❌ "Fix that issue"
❌ "Add the new part"
```

**Solution:** Include context
```
✅ "Update C4 diagram with new service"
✅ "Fix broken link in ADR-003"
✅ "Add Inventory Service to architecture"
```

## Task Breakdown Checklist

Before starting work:

**Clarity:**
- [ ] Each task has clear start/end point
- [ ] Tasks use action verbs
- [ ] Context provided where needed
- [ ] "Done" criteria obvious

**Granularity:**
- [ ] Tasks neither too large nor too small
- [ ] Each task = 15-60 minutes work
- [ ] Can complete and verify independently

**Organization:**
- [ ] Tasks logically grouped
- [ ] Dependencies identified
- [ ] Sequential vs parallel clear
- [ ] Phases/categories defined

**Completeness:**
- [ ] All work covered by tasks
- [ ] Nothing assumed or implicit
- [ ] Cross-cutting concerns included
- [ ] Final deliverable clear

## Template Examples

### Template 1: ADR Creation

```markdown
## Create ADR-XXX: [Topic]

1. Review pending decision (PDR-XXX)
2. Research all options thoroughly
3. Create comparison table
4. Draft ADR-XXX with all sections
5. Add Alternatives section for each option
6. Add Consequences section
7. Add ADR to index (README.md)
8. Link related ADRs
```

### Template 2: New Service Addition

```markdown
## Add [Service Name] Service

### Design
1. Define service boundaries and responsibilities
2. Design database schema
3. Specify API endpoints
4. Define events published/consumed

### Documentation
5. Create service specification (.ai/context/services/)
6. Create ADR for service architecture
7. Document integration points

### Architecture Updates
8. Add service to C4 container diagram
9. Update PROJECT-INDEX.md
10. Update service count in all documents
```

### Template 3: Architecture Phase Completion

```markdown
## Complete Architecture Phase

### Finalize Decisions
1. Review all pending decisions (PDRs)
2. Finalize Decision A → Create ADR-XXX
3. Finalize Decision B → Create ADR-YYY
4. Finalize Decision C → Create ADR-ZZZ

### Update Documentation
5. Update all architecture diagrams
6. Update PROJECT-INDEX.md
7. Update ADR index
8. Update architecture summary

### Quality Check
9. Run architecture review checklist
10. Create comprehensive commit message
```

## Metrics & Improvement

**Track these metrics:**
- Tasks completed per session
- Average task completion time
- Task breakdown accuracy (did breakdown match reality?)
- Forgotten tasks (tasks discovered mid-work)

**Improve over time:**
- Refine task size based on actual completion times
- Build template library for common work
- Learn from forgotten tasks
- Adjust breakdown method by work type

## Parallel Agent Execution

When working with AI agents (e.g. Claude Code with subagents), you can dramatically speed up work by identifying tasks that can run simultaneously.

### Identifying Parallelisable Tasks

Tasks can run in parallel when they:
- Write to **different files** (no shared file conflicts)
- Have **no dependency** on each other's output
- Are **independent units of work** (e.g. updating 5 separate module files)

Tasks must be **sequential** when:
- Task B needs the output of Task A
- Both tasks write to the **same file**
- A shared resource is involved (same DB, same branch)

### Parallel Breakdown Pattern

```
Instead of:
  Task 1 → wait → Task 2 → wait → Task 3 → wait → Task 4

Do:
  [ Task 1 | Task 2 | Task 3 | Task 4 ] → all complete → done
```

**Real example — updating 17 module docs:**
```
Sequential (slow):  Update module 1 → 2 → 3 → ... → 17  (~34 steps)
Parallel (fast):    Agent A: modules 1–6
                    Agent B: modules 7–12       → all run at once
                    Agent C: modules 13–17
```

### When to Split Work Across Agents

| Scenario | Approach |
|----------|----------|
| Update N independent files | Split across N agents |
| Research + implementation | Research agent first, then implement |
| Multiple modules with same change pattern | One agent per group of modules |
| Read then write same file | Must be sequential — one agent |

### Tips

- Give each agent a **clear, self-contained task** with all context it needs
- Agents do not share context — each must receive its full instructions
- Run background agents for long tasks; foreground agents when you need the result before proceeding
- After parallel agents complete, do a single review pass to ensure consistency

---

## Related Workflows

- **[decision-making-protocol.md](decision-making-protocol.md)** - Decision workflow includes task breakdown
- **[architecture-review-checklist.md](architecture-review-checklist.md)** - Review as final task
- **[pending-decision-workflow.md](pending-decision-workflow.md)** - Managing PDRs as tasks
- **[figma-review-workflow.md](figma-review-workflow.md)** - Breaking down Figma review work
- **[backend-api-mapping-workflow.md](backend-api-mapping-workflow.md)** - Breaking down API mapping work

## Tools & Integration

**Todo Systems:**
- GitHub Issues/Projects
- Jira/Linear
- Markdown checklists
- AI todo tracking

**Best Practices:**
- Keep tasks in same place as work
- Update status immediately
- Review completed tasks
- Archive when done

## Summary

Effective task breakdown:
1. **Right-sized:** 15-60 minutes per task
2. **Action-oriented:** Use verbs, be specific
3. **Dependency-aware:** Note what blocks what
4. **Complete:** Cover all work, nothing implicit
5. **Trackable:** Clear done criteria, status updates

Good breakdown = better planning + visible progress + successful completion.
