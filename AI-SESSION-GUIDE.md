# AI Session Guide

**Purpose:** How to work effectively with AI on this project (for humans)
**Audience:** Developers, architects, project leads
**Version:** 1.0.0

---

## 🎯 **Philosophy: AI-First Development**

This project is designed for **AI to do 95-100% of coding**, with humans:
- Providing direction and requirements
- Making key decisions
- Reviewing and validating AI output
- Intervening only when necessary

**Success = Efficient context loading + Clear communication + Proper validation**

---

## 🚀 **Starting a New AI Session**

### **Every Time (No Exceptions):**

1. **Load Core Context** (3-5 minutes)
   ```
   Please load these files in order:
   1. PROJECT-INDEX.md
   2. .ai/context/project-overview.md
   3. .ai/AI-ASSISTANT-RULES.md
   ```

2. **Verify Understanding**
   ```
   Please confirm:
   - Project name and purpose
   - Architecture style
   - Current phase
   - Key constraints
   ```

3. **Load Task-Specific Context**
   ```
   Also load:
   - [Service/feature context file]
   - [Relevant prompts]
   ```

4. **State Your Intent**
   ```
   Today I want to:
   - [Specific goal]
   - [Expected outcome]
   - [Any constraints]
   ```

---

## 📋 **Session Types & Templates**

### **1. Feature Development Session**

**Goal:** Implement a new feature end-to-end

**Context Loading:**
```markdown
I'm implementing [Feature Name] for [Project Name].

Load these files:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/context/architecture-context.md
4. .ai/AI-ASSISTANT-RULES.md
5. docs/05-product/features/[feature-name].md
6. .ai/context/services/[affected-service].md
7. .ai/prompts/code-generation/

Feature Requirements:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

Please confirm understanding before we begin.
```

**Work Flow:**
1. ✅ AI confirms understanding
2. ✅ Discuss implementation approach
3. ✅ AI generates code incrementally
4. ✅ Review each piece before moving forward
5. ✅ AI writes tests alongside code
6. ✅ AI updates documentation
7. ✅ Final review before commit

**Validation Checklist:**
- [ ] Feature meets requirements
- [ ] Code follows project patterns
- [ ] Tests written and passing
- [ ] Documentation updated
- [ ] No architecture violations
- [ ] No security issues

---

### **2. Bug Fix Session**

**Goal:** Identify and fix a bug

**Context Loading:**
```markdown
I need to fix a bug in [Project Name].

Load these files:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/AI-ASSISTANT-RULES.md
4. .ai/context/services/[affected-service].md
5. .ai/prompts/debugging/

Bug Description:
- What: [What's wrong]
- Where: [Which component]
- When: [When it occurs]
- Expected: [What should happen]
- Actual: [What actually happens]
- Logs: [Relevant error logs]

Please analyze and suggest fix approach.
```

**Work Flow:**
1. ✅ AI analyzes bug
2. ✅ AI suggests potential causes
3. ✅ AI proposes fix approach
4. ✅ Discuss and agree on approach
5. ✅ AI implements fix
6. ✅ AI writes test to prevent regression
7. ✅ Verify fix works
8. ✅ Update documentation if needed

---

### **3. Architecture Planning Session**

**Goal:** Make architecture decisions

**Context Loading:**
```markdown
I need architectural guidance for [Project Name].

Load these files:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. docs/03-architecture/architecture-summary.md
4. docs/03-architecture/decisions/README.md
5. docs/03-architecture/decisions/ADR-template.md

Topic:
[What architectural decision needs to be made]

Current Situation:
[What we have now]

Problem:
[What problem are we trying to solve]

Please help analyze options and create ADR.
```

**Work Flow:**
1. ✅ AI analyzes current architecture
2. ✅ AI identifies constraints
3. ✅ AI suggests alternatives
4. ✅ Discuss pros/cons of each
5. ✅ Make decision together
6. ✅ AI creates ADR document
7. ✅ AI updates architecture documentation
8. ✅ AI updates PROJECT-INDEX.md

---

### **4. Code Review Session**

**Goal:** Review AI-generated or human-written code

**Context Loading:**
```markdown
I need code review for [Project Name].

Load these files:
1. PROJECT-INDEX.md
2. .ai/AI-ASSISTANT-RULES.md (focus on code standards)
3. CONTRIBUTING.md
4. .ai/context/services/[service].md

Code to Review:
[Paste code or provide file path]

Review Focus:
- Architecture compliance
- Code quality
- Security
- Testing
- Documentation

Please provide detailed review.
```

**What AI Should Check:**
- [ ] Follows project patterns
- [ ] No architecture violations
- [ ] Security best practices
- [ ] Error handling present
- [ ] Tests adequate
- [ ] Documentation updated
- [ ] No hardcoded values
- [ ] Performance considerations

---

### **5. Refactoring Session**

**Goal:** Improve code without changing behavior

**Context Loading:**
```markdown
I want to refactor code in [Project Name].

Load these files:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/context/architecture-context.md
4. .ai/AI-ASSISTANT-RULES.md
5. .ai/context/services/[service].md
6. .ai/prompts/refactoring/

Code to Refactor:
[Location and description]

Refactoring Goals:
- [Improve readability]
- [Better performance]
- [Reduce duplication]
- [etc.]

Constraints:
- Must maintain backward compatibility
- Must keep existing tests passing
- [Other constraints]
```

**Work Flow:**
1. ✅ AI analyzes current code
2. ✅ AI suggests refactoring approach
3. ✅ Discuss and approve approach
4. ✅ AI refactors incrementally
5. ✅ Verify tests still pass after each change
6. ✅ AI updates documentation
7. ✅ Final review

---

### **6. Testing Session**

**Goal:** Write comprehensive tests

**Context Loading:**
```markdown
I need to write tests for [Project Name].

Load these files:
1. PROJECT-INDEX.md
2. .ai/AI-ASSISTANT-RULES.md (testing requirements)
3. .ai/context/services/[service].md
4. .ai/prompts/testing/

Code to Test:
[What needs tests]

Test Requirements:
- Unit tests for business logic
- Integration tests for APIs
- Edge cases covered
- Error scenarios tested

Target Coverage: [e.g., 80%]
```

---

## 🔄 **Mid-Session Management**

### **Context Refresh (Every ~100 Messages)**

```markdown
Let's pause and refresh context.

Please re-read:
1. PROJECT-INDEX.md (check for updates)
2. Current task status

Then summarize:
- What we've completed so far
- What we're currently working on
- What's remaining
```

### **Course Correction**

If AI strays from requirements:
```markdown
Stop. Let's re-align.

Please re-read:
1. .ai/AI-ASSISTANT-RULES.md (focus on [relevant section])
2. [Relevant context file]

The current approach violates [constraint].
Please revise to follow [pattern/rule].
```

### **Escalation to Human**

AI should stop and ask human when:
- Architecture decision needed
- Unclear requirements
- Multiple valid approaches
- Security-sensitive code
- Breaking changes required
- Red flags encountered

---

## ✅ **Quality Gates**

### **Before Accepting AI-Generated Code:**

#### **Functional Check:**
- [ ] Code compiles/runs
- [ ] Meets stated requirements
- [ ] Handles edge cases
- [ ] Error handling present

#### **Architecture Check:**
- [ ] Follows project patterns
- [ ] Respects service boundaries
- [ ] No architecture violations
- [ ] Proper layering (controller → service → repository)

#### **Quality Check:**
- [ ] Readable and maintainable
- [ ] Follows naming conventions
- [ ] Adequate comments
- [ ] No code smells

#### **Security Check:**
- [ ] Input validation
- [ ] No SQL injection
- [ ] No XSS vulnerabilities
- [ ] No secrets hardcoded
- [ ] Authentication present
- [ ] Authorization checked

#### **Testing Check:**
- [ ] Unit tests written
- [ ] Integration tests (if needed)
- [ ] Edge cases tested
- [ ] Tests passing
- [ ] Coverage adequate

#### **Documentation Check:**
- [ ] Code comments adequate
- [ ] Context files updated
- [ ] ADR created (if architectural)
- [ ] README updated (if needed)
- [ ] PROJECT-INDEX.md updated (if metrics changed)

**If any unchecked, have AI fix before accepting.**

---

## 🎯 **Communication Best Practices**

### **Be Explicit:**
```markdown
❌ Bad: "Add authentication"
✅ Good: "Add JWT-based authentication following the pattern in auth-service context, with 15-minute access tokens and 7-day refresh tokens"
```

### **Provide Context:**
```markdown
❌ Bad: "Fix the bug"
✅ Good: "Fix the null pointer exception in OrderService.calculateTotal() that occurs when order has no items"
```

### **Set Expectations:**
```markdown
❌ Bad: "Implement the feature"
✅ Good: "Implement the user registration feature incrementally: 1) validate input, 2) hash password, 3) save to database, 4) send confirmation email. Stop after each step for review."
```

### **Request Verification:**
```markdown
✅ Good: "Please confirm you understand the requirement before implementing"
✅ Good: "Explain your approach before writing code"
✅ Good: "What are the potential risks with this approach?"
```

---

## 🚨 **Red Flags & Stop Signals**

**Stop AI immediately if:**

1. **Architecture Violation**
   - AI suggests cross-service database access
   - AI violates service boundaries
   - AI suggests patterns not in project

2. **Security Issue**
   - AI suggests storing secrets in code
   - AI skips authentication
   - AI trusts user input without validation

3. **Quality Issue**
   - AI generates code without tests
   - AI skips error handling
   - AI creates overly complex solution

4. **Context Loss**
   - AI forgets key constraints
   - AI asks questions already answered
   - AI suggests things contrary to rules

**Action:** Re-load context and re-align

---

## 📊 **Session Effectiveness Metrics**

Track these to improve sessions:

| Metric | Target | Notes |
|--------|--------|-------|
| Context Load Time | < 5 min | Time to AI ready |
| First Response Quality | > 90% | Accuracy of first code/answer |
| Acceptance Rate | > 85% | % of AI code used as-is |
| Revision Rounds | < 3 | Average revisions needed |
| Documentation Sync | 100% | Docs updated with code |
| Zero Bugs | > 95% | % of AI code with no bugs |

---

## 💡 **Tips for Success**

### **1. Front-Load Context**
- Spend 5 minutes loading context well
- Save hours of correction later
- Better first responses = faster development

### **2. Verify Early, Verify Often**
- Check understanding before coding
- Review code incrementally
- Catch issues early

### **3. Update as You Go**
- Don't batch documentation
- Update context files immediately
- Keep PROJECT-INDEX.md current

### **4. Use Templates**
- Use provided prompt templates
- Consistent structure = better results
- Templates encode best practices

### **5. Trust But Verify**
- AI is smart but not perfect
- Always review before committing
- Run tests before accepting

### **6. Iterate**
- First version rarely perfect
- Refine prompts based on results
- Learn what works for your project

---

## 🔧 **Troubleshooting**

### **Problem: AI Produces Low-Quality Code**
**Solutions:**
1. Verify context loaded correctly
2. Be more specific in requirements
3. Ask AI to explain approach first
4. Provide examples of good code
5. Reference specific patterns from context

### **Problem: AI Forgets Constraints**
**Solutions:**
1. Reload AI-ASSISTANT-RULES.md
2. Explicitly state constraint in prompt
3. Context refresh mid-session
4. Add constraint to project context permanently

### **Problem: AI Is Too Slow**
**Solutions:**
1. Break tasks into smaller pieces
2. Use incremental approach
3. Load only necessary context
4. Use layer-based context loading

### **Problem: AI Makes Mistakes Repeatedly**
**Solutions:**
1. Add rule to AI-ASSISTANT-RULES.md
2. Provide counter-example
3. Update context to be more explicit
4. Consider updating template

---

## 📚 **Advanced Techniques**

### **1. Chaining Sessions**
```markdown
End of Session 1:
"Please summarize what we accomplished and document next steps in session-memory.md"

Start of Session 2:
"Read session-memory.md from last session and continue where we left off"
```

### **2. Parallel Development**
```markdown
Use multiple AI instances for different components:
- AI Instance 1: Frontend
- AI Instance 2: Backend API
- AI Instance 3: Database migrations

Each has relevant context loaded.
Synchronize at integration points.
```

### **3. Specification-Driven Development**
```markdown
Session 1: AI generates detailed spec from requirements
Session 2: AI implements code following spec
Session 3: AI writes tests verifying spec

Spec serves as contract and validation.
```

### **4. Test-Driven Development with AI**
```markdown
1. AI writes failing tests from requirements
2. AI implements minimum code to pass tests
3. AI refactors with tests as safety net

TDD + AI = high-quality code
```

---

## ✅ **End-of-Session Checklist**

Before ending session:

- [ ] All code committed
- [ ] All tests passing
- [ ] Documentation updated
- [ ] PROJECT-INDEX.md updated
- [ ] Session notes added to session-memory.md
- [ ] Next steps documented
- [ ] Open questions documented
- [ ] Context files updated if needed

---

## 🎓 **Learning Resources**

### **For This Project:**
- Read: PROJECT-INDEX.md
- Read: CONTEXT-RECOVERY.md
- Read: .ai/AI-ASSISTANT-RULES.md
- Study: Successful past sessions in session-memory.md

### **General AI Development:**
- Prompt engineering best practices
- Context management strategies
- AI pair programming techniques

---

**Document Version:** 1.0.0
**Last Updated:** November 2025
**Maintained By:** Project Team
**Feedback:** Document what works/doesn't work to improve this guide
