# Context Recovery Guide

**Purpose:** Recover full project context in < 5 minutes for any AI session
**When to Use:** New session, after context loss, switching AI tools, long break
**Version:** 1.0.0

---

## 🚨 **Emergency Context Recovery (60 seconds)**

If you need context IMMEDIATELY:

```markdown
Load these 2 files in order:
1. PROJECT-INDEX.md (30 seconds)
2. .ai/context/project-overview.md (30 seconds)

You now have 80% of context. Proceed carefully.
```

---

## ⚡ **Quick Context Recovery (3 minutes)**

**For most sessions:**

### Step 1: Load Core (90 seconds)
```markdown
1. PROJECT-INDEX.md - Current state, metrics, quick facts
2. .ai/context/project-overview.md - Complete project context
3. .ai/AI-ASSISTANT-RULES.md - Rules to follow
```

### Step 2: Verify Context (30 seconds)
Ask AI to confirm:
- What is the project?
- What architecture style?
- Current phase?
- Key constraints?

### Step 3: Load Work-Specific (60 seconds)
**If coding:** `.ai/context/services/{current-service}.md`
**If planning:** `docs/05-product/roadmap.md`
**If debugging:** `.ai/prompts/debugging/` + error logs
**If architecting:** `docs/03-architecture/architecture-summary.md`

---

## 🎯 **Full Context Recovery (10 minutes)**

**For complex work or after long break:**

### Phase 1: Project State (3 minutes)
1. **PROJECT-INDEX.md** (2 min)
   - Read: Quick facts, current status, metrics
   - Note: What's completed, in-progress, pending
   - Check: Last updated date

2. **CHANGELOG.md** (1 min)
   - Read: Recent changes
   - Note: What happened since last session

### Phase 2: Architecture (4 minutes)
3. **.ai/context/project-overview.md** (2 min)
   - Read: Complete overview
   - Note: Architecture, tech stack, constraints

4. **docs/03-architecture/architecture-summary.md** (2 min)
   - Read: Detailed architecture
   - Note: Service boundaries, patterns, decisions

### Phase 3: Current Work (3 minutes)
5. **Relevant Context Files** (2 min)
   - Service context if coding
   - Feature specs if implementing
   - Bug reports if debugging

6. **.ai/session-memory.md** (1 min)
   - Read: Recent sessions
   - Note: What was done, what's next

---

## 📋 **Context Loading by Session Type**

### **1. New Feature Development**

**Load (5 minutes):**
```markdown
Required:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/context/architecture-context.md
4. .ai/AI-ASSISTANT-RULES.md

Feature-Specific:
5. docs/05-product/features/{feature-name}.md
6. .ai/context/services/{affected-service}.md
7. .ai/prompts/code-generation/

Context Verification:
- Confirm feature requirements understood
- Confirm architecture patterns clear
- Confirm affected services identified
```

### **2. Bug Fixing**

**Load (4 minutes):**
```markdown
Required:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/AI-ASSISTANT-RULES.md

Bug-Specific:
4. .ai/context/services/{affected-service}.md
5. .ai/prompts/debugging/
6. Recent error logs
7. Related tests

Context Verification:
- Confirm bug understood
- Confirm affected area identified
- Confirm fix approach clear
```

### **3. Architecture Planning**

**Load (8 minutes):**
```markdown
Required:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. docs/03-architecture/architecture-summary.md
4. docs/03-architecture/decisions/README.md

Planning-Specific:
5. Recent ADRs
6. System diagrams
7. Tech stack context
8. Constraint documentation

Context Verification:
- Confirm current architecture understood
- Confirm constraints clear
- Confirm decision history known
```

### **4. Code Review**

**Load (3 minutes):**
```markdown
Required:
1. PROJECT-INDEX.md
2. .ai/AI-ASSISTANT-RULES.md (focus on code standards)
3. CONTRIBUTING.md

Review-Specific:
4. Code being reviewed
5. Related service context
6. Test coverage reports

Context Verification:
- Confirm code standards clear
- Confirm architecture patterns known
- Confirm testing requirements understood
```

### **5. Refactoring**

**Load (6 minutes):**
```markdown
Required:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/context/architecture-context.md
4. .ai/AI-ASSISTANT-RULES.md

Refactoring-Specific:
5. Current code to refactor
6. Service context
7. Test suite
8. .ai/prompts/refactoring/

Context Verification:
- Confirm refactoring goals clear
- Confirm patterns to follow known
- Confirm backward compatibility understood
```

---

## 🔄 **Context Refresh During Long Sessions**

### **After 100 Messages:**
```markdown
Reload:
1. PROJECT-INDEX.md (check for updates)
2. Current work status
3. Recent session notes

Ask AI: "Summarize current task and progress"
```

### **After Topic Change:**
```markdown
Reload:
1. New topic context file
2. Related service/feature context
3. Relevant prompts

Ask AI: "Confirm understanding of new task"
```

### **Before Committing:**
```markdown
Review:
1. Pre-commit checklist (.ai/AI-ASSISTANT-RULES.md)
2. Documentation update requirements
3. Test requirements

Ask AI: "Verify all checklist items completed"
```

---

## 🎯 **Context Verification Questions**

**Ask AI these to verify context loaded correctly:**

### **Project Understanding:**
- "What is the primary purpose of this project?"
- "What architecture style are we using?"
- "What are the key technology choices?"

### **Current State:**
- "What development phase are we in?"
- "What was completed recently?"
- "What are we currently working on?"
- "What's coming next?"

### **Constraints:**
- "What are the main technical constraints?"
- "What patterns must we follow?"
- "What should we never do?"

### **Work-Specific:**
- "What service/feature are we working on?"
- "What are the acceptance criteria?"
- "What tests need to be written?"

**If AI cannot answer confidently, reload relevant context.**

---

## 📊 **Context Quality Checklist**

Before starting work, verify:

- [ ] AI can state project name and purpose
- [ ] AI can describe architecture style
- [ ] AI can list key technologies
- [ ] AI can identify current phase
- [ ] AI can explain main constraints
- [ ] AI knows what task to work on
- [ ] AI understands acceptance criteria
- [ ] AI knows documentation update requirements
- [ ] AI knows testing requirements
- [ ] AI can identify red flags to avoid

**If any unchecked, reload relevant context.**

---

## 🚨 **When Context Is Corrupted**

**Symptoms:**
- AI suggests patterns not used in project
- AI forgets key constraints
- AI violates architecture rules
- AI asks basic questions repeatedly

**Solution:**
1. Stop current work immediately
2. Do Full Context Recovery (10 min)
3. Verify with Context Verification Questions
4. Document what caused corruption
5. Update context files if needed
6. Resume work

---

## 💾 **Context Preservation Tips**

### **During Work:**
1. **Update PROJECT-INDEX.md** after completing major tasks
2. **Document decisions** in ADRs immediately
3. **Keep session-memory.md current**
4. **Commit frequently** with detailed messages
5. **Update service context** when code patterns change

### **End of Session:**
1. **Update PROJECT-INDEX.md** work status
2. **Add session notes** to session-memory.md
3. **Document next steps** clearly
4. **Commit all documentation** changes
5. **Review** what context files might need updates

### **Before Long Break:**
1. **Full PROJECT-INDEX.md update**
2. **Comprehensive session notes**
3. **Clear next steps** documented
4. **All documentation** synchronized
5. **CHANGELOG.md** updated

---

## 🔧 **Context Optimization**

### **If Context Load Takes Too Long:**

**Option 1: Create Summary**
```markdown
.ai/context/quick-summary.md (2 min read)
- Project in 1 paragraph
- Architecture in 3 bullets
- Current phase in 1 sentence
- Key constraints in 5 bullets
- Current task in 2 sentences
```

**Option 2: Layer Context**
```markdown
Layer 1 (Must Read - 3 min):
- PROJECT-INDEX.md
- quick-summary.md
- AI-ASSISTANT-RULES.md

Layer 2 (If Needed - 5 min):
- project-overview.md
- architecture-summary.md

Layer 3 (Task-Specific - 3 min):
- Service/feature context
- Relevant prompts
```

**Option 3: Context Compression**
```markdown
Archive old details:
- Move completed features to archive/
- Summarize old decisions
- Keep only active context hot
```

---

## 📚 **Context File Relationships**

```
PROJECT-INDEX.md (Master - Always Load)
    ↓
    ├→ .ai/context/project-overview.md (Complete Context)
    │     ↓
    │     ├→ architecture-context.md (Architecture)
    │     ├→ tech-stack-context.md (Technologies)
    │     └→ domain-model-context.md (Business Logic)
    │
    ├→ .ai/AI-ASSISTANT-RULES.md (Rules)
    │     ↓
    │     ├→ Code standards
    │     ├→ Testing requirements
    │     └→ Security requirements
    │
    └→ Work-Specific Context
          ├→ services/{service}.md
          ├→ features/{feature}.md
          └→ prompts/{category}/
```

---

## 🎯 **Success Metrics**

Track these to improve context recovery:

| Metric | Target | How to Measure |
|--------|--------|----------------|
| Context Load Time | < 5 min | Time to full understanding |
| Context Accuracy | > 95% | Verification questions passed |
| Context Retention | Full session | No mid-session reloads needed |
| Context Loss Incidents | 0 | Times had to fully reload |
| AI Understanding Score | > 90% | Quality of first responses |

---

## 📝 **Context Recovery Log Template**

Keep in `.ai/context-recovery-log.md`:

```markdown
## Context Recovery: 2025-11-14 14:00

**Reason:** New session after 2 days
**Method Used:** Full Context Recovery (10 min)
**Files Loaded:**
1. PROJECT-INDEX.md
2. project-overview.md
3. architecture-summary.md
4. menu-service.md

**Verification:**
- ✅ Project understood
- ✅ Architecture clear
- ✅ Current task identified
- ✅ Constraints known

**Quality:** Excellent - AI ready in 10 minutes
**Notes:** None
**Improvements:** Consider creating quick-summary.md
```

---

## 🚀 **Quick Start Template**

**Copy-paste this to start any AI session:**

```markdown
I'm resuming work on [Project Name].

Please load these context files in order:
1. PROJECT-INDEX.md - Current project state
2. .ai/context/project-overview.md - Complete context
3. .ai/AI-ASSISTANT-RULES.md - Rules to follow
4. [Work-specific context file]

After loading, please:
1. Confirm you understand the project architecture
2. State the current development phase
3. List the key constraints
4. Identify what we're working on

Ready to proceed after confirmation.
```

---

**Document Version:** 1.0.0
**Last Updated:** November 2025
**Maintained By:** Project Team
**Review Frequency:** Monthly or after major changes
