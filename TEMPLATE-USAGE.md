# AI-Driven Project Template - Usage Guide

**Version:** 1.0.0
**Purpose:** How to use this template for new AI-driven projects
**Last Updated:** November 2025

---

## 🎯 **What This Template Provides**

This template gives you a **zero-context-loss** structure for AI-driven software development where:

✅ **AI can do 95-100% of coding**
✅ **Context never lost** between sessions
✅ **Documentation stays synchronized** with code
✅ **Architecture is consistently followed**
✅ **Quality is maintained** through guidelines and checklists
✅ **Projects scale** without losing organization

---

## 🚀 **Quick Start (5 Steps)**

### **Step 1: Copy Template (1 minute)**

```bash
# Copy entire template structure
cp -r project-template/ /path/to/new-project/

cd /path/to/new-project/

# Initialize git
git init
```

### **Step 2: Customize Core Files (10 minutes)**

**A. PROJECT-INDEX.md**
```markdown
Replace:
- {Project Name} → Your actual project name
- {Project Type} → e.g., "Web Application", "API", "Mobile App"
- {Architecture} → e.g., "Microservices", "Monolith", "Serverless"
- {Tech Stack} → Your technologies

Fill in:
- Quick facts table
- Current status
- Key decisions (initially empty)
- Metrics (start with zeros)
```

**B. .ai/context/project-overview.md**
```markdown
Fill in all sections:
- Project Vision: What and why?
- Target Users: Who will use it?
- Architecture: How is it built?
- Technology Stack: What technologies?
- Domain Model: Business entities and logic
- Constraints: Technical and business limits
- Success Criteria: How to measure success?
```

**C. .ai/AI-ASSISTANT-RULES.md**
```markdown
Customize:
- ALWAYS rules → Add project-specific rules
- NEVER rules → Add project-specific constraints
- Architecture constraints → Your patterns
- Code standards → Your style preferences
- Red flags → Your project's danger zones
```

### **Step 3: Remove Example Content (2 minutes)**

```bash
# Remove any project-specific examples
# Keep only templates and structure

# Example: If template has example services
rm -rf .ai/context/services/*-service.md

# Keep only the template file
# Keep .ai/context/services/service-template.md
```

### **Step 4: First Commit (1 minute)**

```bash
git add .
git commit -m "Initial project setup from AI-driven template v1.0.0"
```

### **Step 5: Test with AI (5 minutes)**

```markdown
Start AI session and test context loading:

"I'm starting a new project using this template.

Please load:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/AI-ASSISTANT-RULES.md

Then confirm you understand:
- Project purpose
- Architecture approach
- Key constraints
- Rules to follow"
```

**If AI confirms correctly → Template ready to use! 🎉**

---

## 📋 **Detailed Setup Guide**

### **Phase 1: Project Initialization**

#### **1.1 Project Basics**
```markdown
Create/Update:
- README.md: Project homepage
  * What is this project?
  * Who is it for?
  * How to get started?

- PROJECT-INDEX.md: Master index
  * Fill quick facts table
  * List essential documents
  * Set initial metrics to 0

- CHANGELOG.md: Version history
  * Add "v0.1.0 - Project initialized from template"
```

#### **1.2 Technology Decisions**
```markdown
Create:
- docs/03-architecture/decisions/ADR-001-technology-stack.md
  * What technologies chosen?
  * Why these technologies?
  * Alternatives considered?
  * Trade-offs?

Update:
- .ai/context/tech-stack-context.md
  * List all technologies
  * Explain rationale for each
  * Document learning resources
```

#### **1.3 Architecture Design**
```markdown
Create:
- docs/03-architecture/architecture-summary.md
  * High-level architecture
  * Components and their responsibilities
  * Communication patterns
  * Data flow

- docs/03-architecture/decisions/ADR-002-architecture-style.md
  * Architectural pattern chosen
  * Why this pattern?
  * Constraints it addresses

Update:
- .ai/context/architecture-context.md
  * Detailed architecture explanation
  * Patterns and principles
  * Boundaries and rules
```

### **Phase 2: Domain Modeling**

```markdown
Create:
- .ai/context/domain-model-context.md
  * Core business entities
  * Relationships between entities
  * Business rules
  * Workflows

- docs/03-architecture/diagrams/c4/01-context/system-context.md
  * Who uses the system?
  * What external systems integrate?
  * System boundaries?
```

### **Phase 3: Initial Development Setup**

```markdown
Setup:
1. Development environment
2. CI/CD pipeline
3. Testing framework
4. Documentation generation

Document in:
- docs/01-getting-started/setup-guide.md
- docs/02-guides/development/
```

---

## 🎯 **File-by-File Customization Guide**

### **Critical Files (Must Customize)**

#### **1. PROJECT-INDEX.md**
**Purpose:** Entry point for all sessions

**Customize:**
```markdown
## Quick Facts
| Aspect | Detail |
|--------|--------|
| Project Name | [Your project] |
| Type | [Your type] |
| Architecture | [Your architecture] |
| Backend | [Your tech] |
| Frontend | [Your tech] |
| Database | [Your choice] |
| Current Phase | Planning/Development/Production |

## Essential Documents
For Architects: [List your key arch docs]
For Developers: [List your dev guides]
For Stakeholders: [List your product docs]

## Architecture Summary
[8-10 sentence overview of your architecture]

## Current Work Status
### In Progress
- [ ] [Your current work]

### Recently Completed
- [x] Template setup

### Next Up
- [ ] [Your next tasks]

## Metrics
- Services/Components: 0 → [Your count]
- ADRs: 0 → [Your count]
- Features: 0 → [Your count]
```

#### **2. .ai/context/project-overview.md**
**Purpose:** Complete project context

**Customize All Sections:**
```markdown
# {Project Name} - Complete Project Context

## Project Vision
[What are you building? Why does it matter?]

## Target Users
[Who will use this? What are their needs?]

## Core Features
[Top 5-10 features]

## Architecture Overview
[Your architecture explained in detail]

## Technology Stack
[All technologies with rationale]
Why X? Because [reason]
Why Y? Because [reason]

## Domain Model
[Your business entities and relationships]

## Key Concepts
[Important terminology and concepts]

## Constraints
Technical: [Your limits]
Business: [Your rules]
Time/Budget: [Your deadlines]

## Success Criteria
[How do you measure success?]
```

#### **3. .ai/AI-ASSISTANT-RULES.md**
**Purpose:** Rules AI must follow

**Add Your Project-Specific Rules:**
```markdown
## ALWAYS Do This
✅ [Your project-specific rule 1]
✅ [Your project-specific rule 2]
✅ [Your patterns to follow]
✅ [Your quality standards]

## NEVER Do This
❌ [Your project-specific constraint 1]
❌ [Your project-specific constraint 2]
❌ [Your anti-patterns]
❌ [Your security no-nos]

## Architecture Constraints
[Your specific architectural rules]

## Code Standards
[Your naming conventions]
[Your file structure]
[Your testing requirements]

## Red Flags
🚩 [Your project-specific red flags]
```

### **Important Files (Should Customize)**

#### **4. CONTRIBUTING.md**
```markdown
Customize:
- Branch naming for your workflow
- Commit message format for your team
- PR process for your organization
- Code review checklist for your standards
- Common mistakes in your project
```

#### **5. .github/PULL_REQUEST_TEMPLATE.md**
```markdown
Customize:
- Add project-specific checklist items
- Add technology-specific checks
- Add deployment-specific items
- Remove irrelevant sections
```

#### **6. docs/03-architecture/architecture-summary.md**
```markdown
Replace all sections with your architecture:
- Your components
- Your data stores
- Your communication patterns
- Your deployment architecture
```

### **Template Files (Keep As-Is)**

**Do NOT customize:**
- CONTEXT-RECOVERY.md (universal process)
- AI-SESSION-GUIDE.md (universal patterns)
- ADR-template.md (standard format)
- Templates in `/templates/` (reusable patterns)

**These are universal and work for any project.**

---

## 📊 **Validation Checklist**

Before starting development, verify:

### **Core Setup:**
- [ ] PROJECT-INDEX.md filled with project details
- [ ] project-overview.md complete
- [ ] AI-ASSISTANT-RULES.md customized
- [ ] README.md explains project
- [ ] Git initialized

### **Architecture:**
- [ ] Architecture style decided (ADR created)
- [ ] Technology stack decided (ADR created)
- [ ] Architecture summary written
- [ ] System context diagram planned
- [ ] Component boundaries defined

### **AI Readiness:**
- [ ] Tested context loading with AI
- [ ] AI can state project purpose
- [ ] AI can explain architecture
- [ ] AI knows constraints
- [ ] AI understands rules

### **Documentation:**
- [ ] All template placeholders replaced
- [ ] Example content removed
- [ ] Links updated to actual files
- [ ] File structure makes sense

**All checked? Ready to develop! 🚀**

---

## 🎯 **Usage Patterns**

### **Pattern 1: Greenfield Project**
```
1. Copy template
2. Customize core files (Project INDEX, overview, rules)
3. Create architecture ADRs
4. Plan features
5. Start first development session with AI
```

### **Pattern 2: Migrating Existing Project**
```
1. Copy template structure only
2. Move existing docs to appropriate places
3. Create missing context files from existing code
4. Create ADRs for existing decisions
5. Update PROJECT-INDEX.md with current state
6. Test with AI on existing codebase
```

### **Pattern 3: Proof of Concept**
```
1. Copy template (minimal setup)
2. Fill only Tier 1 files (INDEX, overview, rules)
3. Skip detailed architecture docs
4. Focus on rapid iteration
5. Promote to full template if successful
```

### **Pattern 4: Multi-Team Project**
```
1. Copy template
2. Create team-specific context files
3. Define clear ownership in CODEOWNERS
4. Each team customizes their service contexts
5. Share core context files across teams
```

---

## 🔄 **Template Evolution**

### **When to Update Template:**

**Add new file when:**
- You discover missing critical context
- You find pattern that prevents context loss
- You create reusable component

**Update existing file when:**
- You find better way to explain something
- Context loading process improves
- New AI capabilities require different approach

**Remove file when:**
- Proves unnecessary
- Better alternative exists
- Causes confusion

### **Version Control:**
```markdown
Template Versioning:
- v1.0.0 - Initial template
- v1.1.0 - Added [new feature]
- v2.0.0 - Breaking changes to structure

In PROJECT-INDEX.md:
Template Version: [version used]

Allows upgrading template while preserving customizations
```

### **Template Upgrade Path:**
```
1. Check template changelog
2. Backup current project
3. Copy new template files
4. Merge customizations
5. Test with AI
6. Update template version in PROJECT-INDEX.md
```

---

## 💡 **Best Practices**

### **DO:**
✅ Spend time on quality context files
✅ Test context loading before heavy use
✅ Update template as you learn
✅ Share improvements back to template
✅ Keep context files synchronized
✅ Use templates for consistency
✅ Validate with AI regularly

### **DON'T:**
❌ Skip customizing core files
❌ Leave placeholder text in production
❌ Add project code to template
❌ Customize universal process docs
❌ Let context files drift
❌ Forget to update PROJECT-INDEX.md
❌ Use without testing

---

## 🎓 **Learning Curve**

**Time Investment:**

| Phase | Time | Result |
|-------|------|--------|
| Initial Setup | 30 min | Template ready |
| Full Customization | 2-3 hours | Project-specific |
| First AI Session | 30 min | Validate it works |
| Refinement | Ongoing | Optimize over time |

**ROI:**
- Initial investment: ~3 hours
- Time saved per session: ~10-30 minutes
- Break-even: ~10-20 sessions
- Long-term: **Massive** time savings

---

## 📚 **Examples**

### **Web Application Example:**
```
Template → Customized for Next.js + FastAPI + PostgreSQL
- PROJECT-INDEX.md: Web app facts
- Architecture: Client-server with API
- Tech stack: React, Python, Postgres
- Services: Frontend + Backend API
```

### **Microservices Example:**
```
Template → Customized for Spring Boot microservices
- PROJECT-INDEX.md: 5 microservices
- Architecture: Event-driven microservices
- Tech stack: Java, Kafka, PostgreSQL
- Services: 5 service context files
```

### **Mobile App Example:**
```
Template → Customized for React Native + Firebase
- PROJECT-INDEX.md: Mobile app facts
- Architecture: Client + BaaS
- Tech stack: React Native, Firebase
- Services: Mobile app + Cloud functions
```

---

## 🚀 **Success Stories**

*Document your successes here:*

```markdown
## Project: [Name]
- Setup time: [time]
- AI understanding: [excellent/good/okay]
- Context loss incidents: [number]
- Development speed: [fast/normal/slow]
- Code quality: [high/medium/low]
- Template effectiveness: [rating/10]

Lessons learned:
- [What worked well]
- [What could improve]
- [Tips for others]
```

---

## 🔧 **Troubleshooting**

### **Problem: AI Doesn't Understand Project**
**Solution:**
1. Verify PROJECT-INDEX.md is comprehensive
2. Expand project-overview.md
3. Add more examples to context
4. Test context loading explicitly

### **Problem: Context Loading Takes Too Long**
**Solution:**
1. Create quick-summary.md (2-min version)
2. Use layered context approach
3. Optimize context files (remove redundancy)
4. Prioritize essential information

### **Problem: Documentation Drifts from Code**
**Solution:**
1. Strengthen pre-commit checklist
2. Add documentation requirement to PR template
3. Make context updates mandatory
4. Review PROJECT-INDEX.md regularly

### **Problem: Template Doesn't Fit Project Type**
**Solution:**
1. Keep core files (INDEX, overview, rules)
2. Modify structure to fit your needs
3. Document changes for future projects
4. Consider contributing improvements

---

## 📞 **Support**

**Template Issues:**
- Check TEMPLATE-USAGE.md (this file)
- Review example projects
- Test with fresh AI session
- Document and fix

**Project-Specific Issues:**
- Check AI-SESSION-GUIDE.md
- Review CONTEXT-RECOVERY.md
- Verify customization complete
- Test AI understanding

---

## 🎯 **Next Steps**

After template setup:

1. **Week 1: Foundation**
   - [ ] All core files customized
   - [ ] Architecture documented
   - [ ] First AI session successful
   - [ ] First feature planned

2. **Week 2-4: Development**
   - [ ] First features implemented with AI
   - [ ] Context files refined
   - [ ] Patterns established
   - [ ] Documentation synchronized

3. **Month 2+: Optimization**
   - [ ] Template optimized for your project
   - [ ] Session efficiency high
   - [ ] Context loss near zero
   - [ ] AI productivity maximized

---

**Template Version:** 1.0.0
**Last Updated:** November 2025
**Maintained By:** Template Community
**Contribute:** Share improvements and lessons learned!
