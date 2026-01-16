# AI-Driven Project Template

**Version:** 1.0.0
**Created:** November 2025
**Purpose:** Universal template for AI-driven software development with zero context loss

---

## 🎯 **Template Philosophy**

This template is designed for projects where:
- **AI does 95-100% of coding** (human only in emergencies)
- **Context is preserved** across sessions perfectly
- **Documentation is always current** and synchronized with code
- **Architecture is well-defined** and consistently followed
- **Quality is maintained** through automated checks and guidelines

---

## 📂 **Template Structure**

```
{project-name}/
│
├── .ai/                                # AI-specific context & rules
│   ├── README.md                       # AI context guide
│   ├── AI-ASSISTANT-RULES.md          # Rules AI must follow
│   ├── SESSION-PROTOCOL.md            # How to start/resume sessions
│   │
│   ├── context/                        # Context files for AI
│   │   ├── project-overview.md        # Master project context
│   │   ├── architecture-context.md    # Architecture details
│   │   ├── tech-stack-context.md      # Technology choices
│   │   ├── domain-model-context.md    # Domain/business logic
│   │   ├── services/                  # Per-service context
│   │   │   └── {service-name}.md      # Service-specific context
│   │   └── features/                  # Per-feature context
│   │       └── {feature-name}.md      # Feature-specific context
│   │
│   ├── prompts/                        # Reusable prompts
│   │   ├── code-generation/
│   │   ├── testing/
│   │   ├── refactoring/
│   │   ├── debugging/
│   │   └── documentation/
│   │
│   └── tools/                          # AI tool configurations
│       ├── cursor-config.md
│       ├── copilot-config.md
│       └── claude-config.md
│
├── docs/                               # Human documentation
│   ├── index.md                        # Documentation homepage
│   ├── quick-reference.md             # Quick lookup guide
│   │
│   ├── 01-getting-started/            # Onboarding
│   │   ├── README.md
│   │   ├── prerequisites.md
│   │   ├── setup-guide.md
│   │   └── first-contribution.md
│   │
│   ├── 02-guides/                      # How-to guides
│   │   ├── development/
│   │   ├── deployment/
│   │   ├── operations/
│   │   └── troubleshooting/
│   │
│   ├── 03-architecture/                # Architecture documentation
│   │   ├── architecture-summary.md     # Complete overview
│   │   ├── system-design.md
│   │   ├── data-architecture.md
│   │   ├── security-architecture.md
│   │   ├── infrastructure-architecture.md
│   │   │
│   │   ├── decisions/                  # ADRs
│   │   │   ├── README.md               # ADR index
│   │   │   ├── ADR-template.md         # Template for new ADRs
│   │   │   └── ADR-{NNN}-{title}.md    # Individual ADRs
│   │   │
│   │   └── diagrams/                   # C4 Model diagrams
│   │       ├── README.md               # Diagram guide
│   │       ├── c4/
│   │       │   ├── 01-context/         # System context
│   │       │   ├── 02-container/       # Containers
│   │       │   ├── 03-component/       # Components
│   │       │   └── 04-code/            # Code-level
│   │       ├── sequence/               # Sequence diagrams
│   │       ├── data-flow/              # Data flow diagrams
│   │       └── deployment/             # Deployment diagrams
│   │
│   ├── 04-reference/                   # Reference documentation
│   │   ├── api/                        # API documentation
│   │   ├── database/                   # Database schemas
│   │   ├── configuration/              # Configuration reference
│   │   └── glossary.md                 # Terms and definitions
│   │
│   ├── 05-product/                     # Product documentation
│   │   ├── prd.md                      # Product requirements
│   │   ├── roadmap.md                  # Development roadmap
│   │   ├── features/                   # Feature specifications
│   │   └── user-stories/               # User stories
│   │
│   └── 06-project/                     # Project management
│       ├── planning/
│       ├── meetings/
│       ├── retrospectives/
│       └── metrics/
│
├── templates/                          # Reusable templates
│   ├── service-template/               # For new services
│   ├── feature-template/               # For new features
│   ├── adr-template.md                 # ADR template
│   ├── context-file-template.md        # Context file template
│   └── test-template.md                # Test documentation
│
├── .github/                            # GitHub integration
│   ├── workflows/                      # GitHub Actions
│   │   ├── ci.yml
│   │   ├── cd.yml
│   │   └── pr-checks.yml
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── CODEOWNERS
│
├── scripts/                            # Automation scripts
│   ├── setup/
│   ├── deployment/
│   ├── maintenance/
│   └── utilities/
│
├── PROJECT-INDEX.md                    # ⭐ MASTER INDEX (start here)
├── CONTEXT-RECOVERY.md                 # ⭐ Context recovery guide
├── AI-SESSION-GUIDE.md                 # ⭐ How to use AI on this project
├── AUTOMATION-SUMMARY.md               # Automation overview
├── CONTRIBUTING.md                     # Contribution guide
├── CHANGELOG.md                        # Version history
├── README.md                           # Project homepage
└── .gitignore                          # Git ignore patterns
```

---

## 🎯 **Core Template Files**

### **1. PROJECT-INDEX.md** ⭐ (CRITICAL - Start Here)

**Purpose:** Single source of truth for project state and navigation

**Must Include:**
- Project quick facts (name, type, phase, tech stack)
- Current status snapshot
- Essential documents by role (architect, developer, stakeholder)
- Architecture summary (high-level)
- Key decisions summary table
- Pending decisions
- Work status (completed/in-progress/todo)
- Metrics (services, decisions, diagrams, LOC, coverage)
- Quick Q&A section
- Context loading protocol for AI

**Why Critical:** First file loaded in every AI session

---

### **2. CONTEXT-RECOVERY.md** ⭐ (For New Sessions)

**Purpose:** Restore full context in < 5 minutes

**Must Include:**
- What to do if context is lost
- Files to load in exact order
- Context loading prompt template
- Project phase checklist
- Quick context verification questions
- Common session types (planning, coding, debugging, refactoring)
- Context preservation tips

**Example:**
```markdown
## Context Recovery in 3 Steps

### Step 1: Load Core Context (2 minutes)
1. PROJECT-INDEX.md (project state)
2. .ai/context/project-overview.md (full context)
3. docs/03-architecture/architecture-summary.md (architecture)

### Step 2: Load Work-Specific Context (2 minutes)
**If coding:** .ai/context/services/{current-service}.md
**If planning:** docs/05-product/roadmap.md
**If debugging:** .ai/prompts/debugging/

### Step 3: Verify Context (1 minute)
Ask AI these questions:
- What is the project architecture?
- What are we currently working on?
- What are the key constraints?
```

---

### **3. AI-SESSION-GUIDE.md** ⭐ (How AI Works on This Project)

**Purpose:** Instructions for humans on how to work with AI on this project

**Must Include:**
- How to start a new session
- Context loading templates
- Best practices for AI interaction
- Common prompts and workflows
- How to handle different session types
- Quality checks before committing AI-generated code
- When to involve humans

**Example:**
```markdown
## Starting a New AI Session

### Quick Start Prompt:
```
I'm working on [Project Name].

Context files to load:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/context/architecture-context.md
4. .ai/AI-ASSISTANT-RULES.md

Current phase: [Planning/Development/Testing]
Task: [What you're working on]
Context: [Any specific context]

Please confirm you understand the architecture and constraints.
```

### For Different Session Types:

**New Feature:**
- Load: project-overview, architecture-context, feature specs
- Prompt: "Implement [feature] following existing patterns"

**Bug Fix:**
- Load: project-overview, affected service context, debugging prompts
- Prompt: "Debug [issue] in [service], check [specific areas]"

**Refactoring:**
- Load: project-overview, code-to-refactor context, refactoring prompts
- Prompt: "Refactor [component] to improve [aspect]"
```

---

### **4. .ai/AI-ASSISTANT-RULES.md** ⭐ (AI Rules & Constraints)

**Purpose:** Non-negotiable rules AI must follow

**Must Include:**
- Context loading protocol (mandatory)
- ALWAYS rules (must do)
- NEVER rules (must not do)
- Architecture constraints (patterns, boundaries)
- Code generation standards
- Documentation update rules
- Security requirements
- Testing requirements
- Pre-commit checklist
- Red flags (stop and ask human)

**Template Structure:**
```markdown
## Context Loading (MANDATORY)

At start of EVERY session:
1. Load PROJECT-INDEX.md
2. Load .ai/context/project-overview.md
3. Load architecture-context.md
4. Load relevant service/feature context
5. Load this file (AI-ASSISTANT-RULES.md)

## ALWAYS Do This

1. ✅ Follow project architecture patterns
2. ✅ Update documentation with code changes
3. ✅ Write tests alongside code
4. ✅ Follow naming conventions
5. ✅ Include error handling
6. ✅ Add logging appropriately
7. ✅ [Project-specific rules]

## NEVER Do This

1. ❌ Generate code without context
2. ❌ Violate architecture boundaries
3. ❌ Skip tests
4. ❌ Hardcode configuration
5. ❌ Commit secrets
6. ❌ [Project-specific constraints]

## Architecture Constraints

[Project-specific patterns]
[Boundaries and rules]
[Technology constraints]

## Code Standards

[Language-specific]
[Framework-specific]
[Project-specific]

## Pre-Commit Checklist

- [ ] Code follows patterns
- [ ] Tests written and passing
- [ ] Documentation updated
- [ ] No secrets committed
- [ ] [Project-specific checks]
```

---

### **5. .ai/SESSION-PROTOCOL.md** ⭐ (Session Management)

**Purpose:** Standardize how AI sessions work

**Must Include:**
- Session types and their workflows
- Context loading for each type
- Session handoff protocol (one AI to another)
- Mid-session context refresh
- End-of-session documentation
- Session memory management
- Context verification steps

**Example:**
```markdown
## Session Types

### 1. Planning Session
**Context Needed:**
- PROJECT-INDEX.md
- project-overview.md
- architecture-context.md
- product requirements

**Protocol:**
1. Load context files
2. Review current state
3. Discuss approach
4. Document decisions (ADRs)
5. Update PROJECT-INDEX.md

### 2. Development Session
**Context Needed:**
- PROJECT-INDEX.md
- project-overview.md
- architecture-context.md
- service/feature context
- AI-ASSISTANT-RULES.md

**Protocol:**
1. Load context files
2. Verify architecture understanding
3. Generate code incrementally
4. Test continuously
5. Update documentation
6. Commit with proper message

### 3. Session Handoff
**When:** Switching AI assistants or continuing later

**Protocol:**
1. Document: What was done
2. Document: What's in progress
3. Document: Next steps
4. Update PROJECT-INDEX.md work status
5. New session loads: PROJECT-INDEX.md + work status
```

---

### **6. .ai/context/project-overview.md** ⭐ (Complete Context)

**Purpose:** Everything AI needs to know about the project

**Must Include:**
- Project vision and goals
- Target users and use cases
- Complete architecture explanation
- All technology choices with rationale
- Domain model and business logic
- Key concepts and terminology
- Project constraints and limitations
- Success criteria
- Current phase and next milestones

**Template:**
```markdown
# {Project Name} - Complete Project Context

## Project Vision
[What are we building and why?]

## Target Users
[Who will use this?]

## Architecture Overview
[High-level architecture]
[Key patterns and principles]
[Service boundaries]
[Communication patterns]

## Technology Stack
[All technologies with rationale]

## Domain Model
[Key entities and relationships]
[Business logic]
[Workflows]

## Constraints
[Technical constraints]
[Business constraints]
[Time/budget constraints]

## Current Phase
[Where are we now?]
[What's next?]

## Success Criteria
[How do we measure success?]
```

---

## 🔄 **Context Management Strategy**

### **Layered Context Approach**

```
Layer 1: Universal (Always Load)
├── PROJECT-INDEX.md              # 2 min read
├── project-overview.md           # 5 min read
└── AI-ASSISTANT-RULES.md         # 3 min read

Layer 2: Architecture (Load for Technical Work)
├── architecture-context.md       # 5 min read
├── tech-stack-context.md         # 3 min read
└── architecture-summary.md       # 10 min read

Layer 3: Work-Specific (Load for Current Task)
├── services/{service}.md         # 5 min read
├── features/{feature}.md         # 3 min read
└── Relevant prompts              # 2 min read

Total Context Load Time: 15-40 minutes depending on depth
```

### **Context Refresh Strategy**

**Every 100 Messages:** Reload Layer 1
**Every Major Topic Change:** Reload relevant Layer 3
**Every Session Start:** Full context load
**Mid-Session:** Use summary prompts

---

## 📋 **Mandatory Template Files**

### **Tier 1: Cannot Skip (Session Start)**
1. ✅ PROJECT-INDEX.md
2. ✅ CONTEXT-RECOVERY.md
3. ✅ AI-SESSION-GUIDE.md
4. ✅ .ai/AI-ASSISTANT-RULES.md
5. ✅ .ai/SESSION-PROTOCOL.md
6. ✅ .ai/context/project-overview.md

### **Tier 2: Architecture Work**
7. ✅ .ai/context/architecture-context.md
8. ✅ docs/03-architecture/architecture-summary.md
9. ✅ docs/03-architecture/decisions/README.md
10. ✅ ADR-template.md

### **Tier 3: Development Work**
11. ✅ .ai/context/services/{service}.md (per service)
12. ✅ .ai/prompts/{category}/ (as needed)
13. ✅ CONTRIBUTING.md
14. ✅ .github/PULL_REQUEST_TEMPLATE.md

---

## 🎯 **Context Preservation Features**

### **1. Explicit State Tracking**

In PROJECT-INDEX.md, always maintain:
```markdown
## Current Work Status

### In Progress
- [ ] Feature X (60% complete)
  - ✅ Design done
  - ✅ Backend API done
  - 🔲 Frontend in progress
  - 🔲 Tests pending

### Recently Completed
- [x] Feature Y (Completed: 2025-11-10)

### Next Up
- [ ] Feature Z (Not started)
```

### **2. Session Memory**

Create `.ai/session-memory.md`:
```markdown
## Recent Sessions

### Session 2025-11-14 14:00
**Focus:** Implemented authentication
**Completed:** JWT implementation, user login API
**In Progress:** User registration
**Next:** Email verification
**Context Used:** project-overview, auth-service context
**Files Changed:** AuthService.java, UserController.java

### Session 2025-11-13 16:00
...
```

### **3. Decision Trail**

In each ADR and context file:
```markdown
## Change History
- 2025-11-14: Updated to include async handling
- 2025-11-10: Initial version
- Related to: ADR-005, Feature-Auth
```

### **4. Automatic Context Validation**

Add to AI-ASSISTANT-RULES.md:
```markdown
## Context Verification Protocol

Before starting work, AI must confirm:
1. "I understand this is a [project type] with [architecture]"
2. "Current phase is [phase]"
3. "Key constraints are [list]"
4. "I'm working on [specific task]"

If unsure, AI must ask: "Please confirm [specific detail]"
```

---

## 🚀 **Usage Instructions**

### **To Use This Template:**

1. **Copy Template Structure**
   ```bash
   cp -r project-template/ /path/to/new-project/
   ```

2. **Customize Core Files**
   - Replace `{Project Name}` with actual name
   - Update PROJECT-INDEX.md with project specifics
   - Fill in project-overview.md
   - Customize AI-ASSISTANT-RULES.md with project constraints

3. **Remove Project-Specific Content**
   - Delete example services
   - Delete example features
   - Keep templates and structure

4. **Initialize Git**
   ```bash
   git init
   git add .
   git commit -m "Initial project setup from AI-driven template"
   ```

5. **First AI Session**
   - Have AI read PROJECT-INDEX.md
   - Have AI read CONTEXT-RECOVERY.md
   - Have AI read AI-SESSION-GUIDE.md
   - Start work

---

## 📊 **Template Metrics**

Track these in PROJECT-INDEX.md:

| Metric | Purpose |
|--------|---------|
| Context Load Time | How long to get full context |
| Session Success Rate | % of sessions where AI understood context |
| Documentation Drift | How often docs were out of sync |
| Context Loss Incidents | Times context was lost |
| AI Code Acceptance Rate | % of AI code used without modification |

---

## 🔧 **Template Maintenance**

### **Update Frequency:**
- **Core files:** Every major project phase
- **Context files:** Every significant change
- **Rules:** When patterns change
- **Metrics:** Weekly

### **Version Control:**
- Tag template versions
- Document template changes in CHANGELOG.md
- Keep template changelog separate from project changelog

---

## 💡 **Advanced Features**

### **1. Multi-AI Support**
Structure allows multiple AI tools:
- Claude for architecture and planning
- Copilot for code completion
- Cursor for refactoring

### **2. Context Compression**
For long projects:
- Archive old sessions
- Maintain "hot" vs "cold" context
- Summary files for historical decisions

### **3. Human Intervention Points**
Clearly mark in rules:
- When human approval needed
- What decisions need human input
- Emergency escalation process

---

## 🎓 **Best Practices**

1. **Never Skip Core Context:** Always load Tier 1 files
2. **Update as You Go:** Don't batch documentation updates
3. **Verify Understanding:** AI should confirm context regularly
4. **Version Context Files:** Track context file versions with code
5. **Keep It Current:** Outdated context is worse than no context
6. **Use Templates:** Don't reinvent structure for each file
7. **Link Everything:** Every file should link to PROJECT-INDEX.md
8. **Test Context Loading:** Periodically test with fresh AI session

---

## 📚 **References**

- C4 Model: https://c4model.com/
- Diátaxis Framework: https://diataxis.fr/
- ADR: https://adr.github.io/
- Documentation-as-Code

---

## ✅ **Template Checklist**

Before using template, ensure:
- [ ] PROJECT-INDEX.md created and filled
- [ ] All Tier 1 files exist
- [ ] Architecture context complete
- [ ] AI rules customized for project
- [ ] PR template customized
- [ ] Example content removed
- [ ] Git initialized
- [ ] First session successfully loaded context

---

**Template Version:** 1.0.0
**Last Updated:** November 2025
**Maintained By:** AI-Driven Development Team
**License:** MIT (adapt as needed)
