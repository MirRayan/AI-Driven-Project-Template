# AI Session Protocol

## Overview

The **Session Protocol** defines best practices for conducting effective AI-assisted development sessions. Following this protocol ensures productive collaboration between human developers and AI assistants.

## Session Types

### 1. Planning Sessions
- **Purpose:** Architecture design, decision-making, requirement analysis
- **Duration:** 30-120 minutes
- **Outputs:** ADRs, PDRs, architecture diagrams, specifications
- **AI Role:** Research, analysis, documentation generation

### 2. Implementation Sessions
- **Purpose:** Writing code, implementing features, refactoring
- **Duration:** 60-240 minutes
- **Outputs:** Code, tests, documentation
- **AI Role:** Code generation, test writing, debugging assistance

### 3. Review Sessions
- **Purpose:** Code review, architecture review, quality assurance
- **Duration:** 30-90 minutes
- **Outputs:** Review feedback, action items, updated documentation
- **AI Role:** Analysis, validation, suggesting improvements

### 4. Research Sessions
- **Purpose:** Exploring options, investigating problems, learning
- **Duration:** 30-60 minutes
- **Outputs:** Research notes, comparison tables, recommendations
- **AI Role:** Information gathering, analysis, summarization

## Session Lifecycle

### Phase 1: Session Start

#### 1. Establish Context

**For New Sessions:**
```
"I'm working on [project name]. This is a [project description].
Current status: [brief status]
Today I want to: [session goal]"
```

**For Continuing Sessions:**
```
"Continuing from previous session where we [brief recap].
Today I want to: [session goal]"
```

**For Resumed Sessions After Break:**
```
"Resuming work on [feature/task]. Last session we completed [X].
Today I want to continue with [Y]."
```

#### 2. Set Session Goals

**SMART Goals:**
- **Specific:** "Finalize QR code security decision"
- **Measurable:** "Create 3 ADRs"
- **Achievable:** "Update architecture diagram"
- **Relevant:** "Complete pending decisions blocking implementation"
- **Time-bound:** "Within this session"

**Examples:**
- ✅ "Finalize all 4 pending architecture decisions today"
- ✅ "Implement user authentication service with tests"
- ✅ "Create comprehensive service specification for Inventory Service"
- ❌ "Work on the project" (too vague)
- ❌ "Make it better" (not specific)

#### 3. Share Relevant Files

**Provide context efficiently:**
```
"Key files for this session:
- docs/03-architecture/decisions/PDR-001-qr-security.md
- docs/03-architecture/decisions/README.md
- PROJECT-INDEX.md"
```

**Tip:** Let AI read files rather than pasting content

---

### Phase 2: Active Work

#### 1. Use Todo Lists for Complex Work

**For multi-step tasks:**
```
"This session involves multiple steps. Please create a todo list
to track progress."
```

**Benefits:**
- Clear progress visibility
- Easy to resume after interruptions
- Prevents forgotten steps
- Demonstrates thoroughness

#### 2. Ask Clarifying Questions Early

**Don't assume - ask:**
```
"Before I proceed with implementation, I want to clarify:
1. Should this use Option A or Option B approach?
2. What's the priority: speed or scalability?
3. Any constraints I should be aware of?"
```

**AI should use AskUserQuestion tool for:**
- Multiple valid approaches
- User preference needed
- Ambiguous requirements
- Trade-off decisions

#### 3. Checkpoint Progress Regularly

**For long sessions (>60 min):**
- Review completed tasks every 30-45 minutes
- Summarize progress
- Confirm direction still aligned
- Adjust plan if needed

**Example checkpoint:**
```
"We've completed:
✓ ADR-011 created
✓ ADR-012 created
✓ Diagrams updated

Remaining:
- ADR-013 (payment gateway)
- ADR-014 (monitoring)
- Update PROJECT-INDEX.md

Still aligned with your goals?"
```

#### 4. Document Decisions Immediately

**Don't defer documentation:**
- Create ADRs as decisions are made
- Update diagrams when architecture changes
- Commit incrementally (not one huge commit)
- Maintain PROJECT-INDEX.md continuously

---

### Phase 3: Session End

#### 1. Review Accomplishments

**Summarize what was done:**
```
Session Summary:
✓ Finalized 4 pending decisions
✓ Created 5 new ADRs (011-015)
✓ Added Inventory Service specification
✓ Updated C4 container diagram
✓ Updated PROJECT-INDEX.md
✓ Prepared comprehensive commit message
```

#### 2. Identify Next Steps

**Clear action items:**
```
Next Steps:
- [ ] Review all documentation (use architecture review checklist)
- [ ] Commit changes
- [ ] Begin Menu Service POC implementation
- [ ] Set up development environment
```

#### 3. Prepare for Context Handoff

**If session might be summarized:**

Document critical information:
- Key decisions made and rationale
- User preferences or requirements specified
- Approach chosen (especially if user specified)
- Important file locations
- Pending work status

**What to preserve:**
```
Critical Context to Preserve:
1. User explicitly chose Option B for payment gateway (à la carte billing)
2. User specified admin-controlled service enablement (not self-service)
3. QR code approach: User's exact specification (static QR + PIN)
4. Inventory Service: User's original vision (receipt OCR → verify → history)
5. All 15 ADRs finalized, ready for Menu Service POC
```

#### 4. Create Commit (if applicable)

**Use commit message template:**
- Comprehensive summary
- Key changes categorized
- Architecture decisions listed
- Impact documented
- Next steps defined
- Co-authorship credited

---

## Best Practices for Effective Sessions

### DO ✅

**Communication:**
- State goals clearly at session start
- Ask clarifying questions early
- Provide feedback on AI suggestions
- Confirm understanding before major changes
- Speak up when something doesn't align

**Organization:**
- Use todo lists for complex work
- Break large tasks into smaller steps
- Commit incrementally
- Keep documentation updated
- Follow established workflows

**Quality:**
- Review before committing
- Run tests when available
- Validate architecture decisions
- Check cross-references
- Ensure consistency

**Efficiency:**
- Let AI read files (don't paste)
- Provide context up front
- Use established patterns
- Reference existing decisions
- Parallel work when possible

### DON'T ❌

**Communication:**
- Assume AI knows unstated preferences
- Skip context when resuming work
- Accept suggestions without review
- Leave ambiguities unresolved
- Forget to specify constraints

**Organization:**
- Try to do everything in one commit
- Skip documentation "for later"
- Defer creating ADRs
- Forget to update index files
- Leave PDRs unresolved

**Quality:**
- Commit without review
- Skip testing
- Create inconsistent documentation
- Ignore broken cross-references
- Rush through important decisions

**Efficiency:**
- Paste large file contents
- Repeat context multiple times
- Work sequentially when parallel possible
- Reinvent existing patterns
- Skip using established templates

---

## Context Management

### Providing Effective Context

**Essential Context Elements:**
1. **Project identity:** Name, type, stage
2. **Current state:** What's done, what's not
3. **Session goal:** What you want to accomplish
4. **Constraints:** Time, resources, requirements
5. **Preferences:** Approaches you prefer/avoid

**Context Tiers:**

**Tier 1: Always Provide**
- What you're working on (project/feature)
- What you want to accomplish (goal)
- Any constraints or requirements

**Tier 2: Provide for New Topics**
- Project architecture overview
- Key technical decisions
- Relevant file locations
- Related documentation

**Tier 3: Provide on Request**
- Detailed file contents
- Historical context
- Alternative approaches considered
- Previous attempts

### Context Preservation for Summarization

**When approaching context limits, preserve:**

**Must Preserve:**
- User's explicit requirements and specifications
- User's choices between options (which option chosen and why)
- Key architectural decisions (ADRs)
- File locations and names
- Current status and next steps
- User preferences stated during session

**Should Preserve:**
- Decision rationale (why not other options)
- Important trade-offs discussed
- Technical constraints or requirements
- Timeline or milestone information
- Error patterns encountered and solutions

**Can Summarize:**
- Detailed implementation discussions
- Code snippets (keep outcomes, not details)
- Research process (keep findings, not steps)
- Routine operations (just record what was done)
- Tool usage details

**Can Discard:**
- Routine acknowledgments
- Process descriptions
- Temporary working notes
- Debugging iterations (keep solution)
- Minor clarifications

**Example of Good Preservation:**
```
User Request: "Finalize pending decisions"

Must Preserve:
- 4 pending decisions (PDR-001 to PDR-004)
- User specified: Static QR + PIN approach (not hybrid option AI suggested)
- User chose Option B for payment (à la carte billing)
- User chose Option A for enablement (admin-controlled)
- 5 ADRs created (ADR-011 through ADR-015)
- Inventory Service added (9th microservice, receipt OCR)
- All PDRs converted to accepted ADRs
- Ready for Menu Service POC implementation

Can Summarize:
- Research process for each decision (keep chosen options)
- Detailed code examples in ADRs (keep references)
- Step-by-step file creation process (keep outcomes)
```

---

## Handling Interruptions

### Mid-Session Interruptions

**When interrupted during work:**

1. **Complete current task** if close to done
2. **Save current state:**
   ```
   "Pausing here. Completed:
   ✓ Task A
   ✓ Task B

   In progress:
   → Task C (50% done - schema defined, need API endpoints)

   Remaining:
   - Task D
   - Task E"
   ```
3. **Commit safe checkpoints** (even if work incomplete)
4. **Document where you left off**

### Resuming After Interruption

**When resuming:**

```
"Resuming work on [feature].

Last session completed:
- Item 1
- Item 2

I was in the middle of:
- Item 3 (specifically: [detail])

Today I want to:
- Finish Item 3
- Complete Item 4
```

---

## Session Templates

### Template 1: Architecture Decision Session

```
Session Goal: Finalize [decision topic]

Context:
- Current state: [status]
- Pending decision: PDR-XXX
- Blocking: [what this blocks]

Plan:
1. Review PDR-XXX
2. Research all options
3. Create comparison table
4. Get user input on choice
5. Create ADR-XXX
6. Update diagrams
7. Update documentation

Expected Outcome:
- ADR-XXX accepted
- PDR-XXX resolved
- Documentation updated
```

### Template 2: Feature Implementation Session

```
Session Goal: Implement [feature name]

Context:
- Feature spec: [file location]
- Related ADRs: [list]
- Dependencies: [list]

Plan:
1. Review specification
2. Create service skeleton
3. Implement core logic
4. Add database schema
5. Create API endpoints
6. Write tests
7. Update documentation

Expected Outcome:
- Working feature with tests
- Documentation complete
- Ready for review
```

### Template 3: Review Session

```
Session Goal: Review [scope of review]

Context:
- What changed: [summary]
- Files affected: [list]
- Review checklist: [link]

Plan:
1. Create reading list
2. Review each file serially
3. Check for completeness
4. Validate consistency
5. Verify cross-references
6. Document findings

Expected Outcome:
- Review complete
- Issues identified
- Approval decision made
```

---

## Working with AI Tools

### Task Tool Usage

**Use Task tool for:**
- Complex exploration (not specific file queries)
- Multi-step research
- Codebase analysis
- Pattern discovery

**Don't use Task tool for:**
- Simple file reads (use Read tool)
- Specific class/function search (use Grep/Glob)
- Known file locations
- Quick lookups

### Todo Management

**Create todos for:**
- Multi-step tasks (3+ steps)
- Complex architecture work
- Feature implementation
- Long sessions

**Update todos:**
- Mark in_progress BEFORE starting
- Mark completed IMMEDIATELY after finishing
- One task in_progress at a time
- Don't batch completions

### File Operations

**Prefer:**
- Read tool for reading files
- Edit tool for modifying files
- Write tool for new files
- Glob/Grep for finding files

**Avoid:**
- Bash cat/head/tail for file reading
- Bash sed/awk for editing
- Bash echo/redirection for writing

---

## Quality Gates

### Before Committing

**Run through checklist:**
- [ ] All planned tasks completed
- [ ] Tests passing (if applicable)
- [ ] Documentation updated
- [ ] Diagrams current
- [ ] Cross-references valid
- [ ] Commit message prepared
- [ ] Review conducted

### Before Ending Session

**Ensure:**
- [ ] Session goal achieved or status clear
- [ ] Work committed or saved safely
- [ ] Next steps documented
- [ ] Critical context preserved
- [ ] Files closed cleanly

---

## Continuous Improvement

### After Each Session

**Reflect:**
- What worked well?
- What could be improved?
- What would make next session better?
- What should be standardized?

### Update Protocol

**When you learn better approaches:**
- Document them
- Update this protocol
- Share with team
- Incorporate into templates

---

## Related Resources

- **[Task Breakdown Guide](workflows/task-breakdown-guide.md)** - Breaking work into tasks
- **[Decision Making Protocol](workflows/decision-making-protocol.md)** - Finalizing decisions
- **[Architecture Review Checklist](workflows/architecture-review-checklist.md)** - Pre-commit review
- **[CONTEXT-RECOVERY.md](../CONTEXT-RECOVERY.md)** - Recovering from context loss

---

## Summary

Effective AI sessions require:
1. **Clear goals** - Know what you want to accomplish
2. **Good context** - Provide relevant information
3. **Active management** - Guide the session
4. **Regular checkpoints** - Verify progress and alignment
5. **Proper documentation** - Capture decisions and outcomes
6. **Quality review** - Validate before committing
7. **Context preservation** - Document critical information

Follow this protocol to maximize productivity and maintain quality throughout your AI-assisted development sessions.
