# Commit Message Template for Architecture Work

## Overview

This template provides a structured format for commit messages when committing architecture decisions, documentation updates, and significant design work. Well-formatted commit messages improve project history readability and help teams understand changes.

## When to Use This Template

Use this template for commits that include:
- Architecture Decision Records (ADRs)
- New services or components
- Architecture diagram updates
- Significant documentation changes
- Multiple related architecture changes
- Completion of architecture phases

For simple commits (bug fixes, minor tweaks), use standard conventional commit format.

## Template Structure

```
[Brief Summary Title]

[Detailed Multi-Paragraph Description]

Key Changes:
- Change category 1
  - Specific change A
  - Specific change B
- Change category 2
  - Specific change C

Architecture Decisions:
- ADR-XXX: [Title] - [One line summary]
- ADR-YYY: [Title] - [One line summary]

Impact:
- Impact area 1
- Impact area 2

Files Changed:
- Created: X files ([list categories])
- Modified: Y files ([list categories])
- Deleted: Z files ([list categories])

Next Steps:
- [ ] Next action 1
- [ ] Next action 2

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

## Section Guidelines

### 1. Brief Summary Title

**Format:** `[Action] [scope] and [action] [scope]`

**Guidelines:**
- Max 72 characters (Git standard)
- Active voice, present tense
- Capture main accomplishment
- No period at end

**Examples:**
```
✅ Finalize all pending architecture decisions and add Inventory Service
✅ Add multi-tenant plugin architecture with à la carte pricing
✅ Complete authentication and authorization architecture design
✅ Update architecture diagrams for new microservices structure

❌ Updated some files (too vague)
❌ Made changes to architecture (not specific)
❌ Architecture work done today (not descriptive)
```

### 2. Detailed Description

**Format:** 2-4 paragraphs explaining:
- **Para 1:** What was done (high level)
- **Para 2:** Why it was needed (context)
- **Para 3:** How it was approached (method)
- **Para 4 (optional):** Additional context or implications

**Guidelines:**
- Use full sentences
- Provide context for future readers
- Explain rationale for major decisions
- Mention any trade-offs made
- Keep paragraphs focused (3-5 sentences each)

**Example:**
```
This commit finalizes all four pending architecture decisions
(QR code security, frontend framework, payment gateway strategy,
and monitoring approach) and adds a new Inventory Service with
receipt OCR functionality.

The pending decisions were blocking implementation work. Each
decision required research into multiple options, stakeholder
input, and evaluation of trade-offs. All decisions are now
documented as accepted ADRs with comprehensive alternatives analysis.

Additionally, this commit introduces a fundamental architectural
shift to a plugin-based service model where restaurants can
enable/disable services à la carte. This addresses the requirement
for flexible feature adoption and differentiated pricing tiers.

The Inventory Service was added based on user requirements for
grocery purchase management through receipt OCR, manual verification,
and price history tracking.
```

### 3. Key Changes Section

**Format:** Nested bullet list by category

**Categories:**
- New ADRs / Architecture Decisions
- New Services / Components
- Documentation Updates
- Diagram Updates
- Configuration Changes
- Cleanup / Maintenance

**Guidelines:**
- Group related changes
- Use consistent indentation
- Be specific but concise
- Mention file counts when relevant

**Example:**
```
Key Changes:
- Architecture Decisions (5 new ADRs)
  - ADR-011: QR Code PIN Verification
  - ADR-012: React Frontend Framework
  - ADR-013: Multi-Gateway Payment Strategy
  - ADR-014: Hybrid Monitoring Strategy
  - ADR-015: Modular Plugin-Based Service Architecture

- New Services
  - Inventory Service (9th microservice)
  - Receipt OCR with AWS Textract/Tesseract
  - Purchase history and price tracking

- Documentation Updates
  - Updated PROJECT-INDEX.md (service count, pricing model)
  - Updated ADR index (15 total ADRs)
  - Added Inventory Service specification

- Diagram Updates
  - Updated C4 container diagram with Inventory Service
  - Added S3 and OCR service integrations

- Repository Cleanup
  - Created .gitignore for AI temp files
  - Removed 34 tmpclaude-* temporary files
```

### 4. Architecture Decisions Section

**Format:** One line per ADR

**Structure:** `- ADR-XXX: [Title] - [One sentence summary]`

**Guidelines:**
- List all ADRs in this commit
- Include both new and updated ADRs
- Brief summary of the decision
- Link to ADR file if possible

**Example:**
```
Architecture Decisions:
- ADR-011: QR Code PIN Verification - Static QR codes with waiter-issued PINs
- ADR-012: React Frontend Framework - React 18+ with TypeScript for web app
- ADR-013: Multi-Gateway Payment Strategy - Tenant-configurable payment gateways
- ADR-014: Hybrid Monitoring Strategy - CloudWatch for POC, Prometheus for prod
- ADR-015: Plugin-Based Service Architecture - À la carte service enablement
```

### 5. Impact Section

**Format:** Bullet list of affected areas

**Include:**
- Components/services affected
- Team workflows changed
- Documentation requiring updates
- Downstream dependencies
- Breaking changes (if any)

**Example:**
```
Impact:
- All 9 microservices now support plugin architecture
- Tenant configuration schema updated with service enablement
- API Gateway requires tenant service check on routing
- Pricing model changed from fixed tiers to à la carte
- Ready to begin Menu Service POC implementation
- No breaking changes to existing code (planning phase only)
```

### 6. Files Changed Section

**Format:** Categorized counts with details

**Structure:**
```
Files Changed:
- Created: X files (categories)
- Modified: Y files (categories)
- Deleted: Z files (categories)
```

**Guidelines:**
- Provide counts
- Categorize file types
- Mention important individual files
- Include directory context

**Example:**
```
Files Changed:
- Created: 8 files
  - 5 ADRs (docs/03-architecture/decisions/)
  - 1 service spec (.ai/context/services/inventory-service.md)
  - 1 C4 diagram (overall-system.puml)
  - 1 .gitignore

- Modified: 4 files
  - ADR index (README.md)
  - PROJECT-INDEX.md
  - Architecture summary
  - C4 container diagram

- Deleted: 34 files
  - Temporary AI files (tmpclaude-*)
```

### 7. Next Steps Section

**Format:** Checkbox list of follow-up actions

**Guidelines:**
- Actionable items
- Clear ownership (if known)
- Realistic scope
- Prioritized order

**Example:**
```
Next Steps:
- [ ] Generate PNG/SVG from PlantUML diagrams
- [ ] Begin Menu Service POC implementation (Week 1-4)
- [ ] Set up development environment per ADR-002
- [ ] Create database schemas for core services
- [ ] Review architecture with full team
```

### 8. Co-Authorship

**Always include when working with AI:**

```
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

**For multiple contributors:**
```
Co-Authored-By: John Doe <john@example.com>
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

## Complete Example

```
Finalize all pending architecture decisions and add Inventory Service

This commit finalizes all four pending architecture decisions
(QR code security, frontend framework, payment gateway strategy,
and monitoring approach) and adds a new Inventory Service with
receipt OCR functionality.

The pending decisions were blocking implementation work. Each
decision required research into multiple options, stakeholder
input, and evaluation of trade-offs. All decisions are now
documented as accepted ADRs with comprehensive alternatives analysis.

Additionally, this commit introduces a fundamental architectural
shift to a plugin-based service model where restaurants can
enable/disable services à la carte. This addresses the requirement
for flexible feature adoption and differentiated pricing tiers.

The Inventory Service was added based on user requirements for
grocery purchase management through receipt OCR, manual verification,
and price history tracking.

Key Changes:
- Architecture Decisions (5 new ADRs)
  - ADR-011: QR Code PIN Verification
  - ADR-012: React Frontend Framework
  - ADR-013: Multi-Gateway Payment Strategy
  - ADR-014: Hybrid Monitoring Strategy
  - ADR-015: Modular Plugin-Based Service Architecture

- New Services
  - Inventory Service (9th microservice)
  - Receipt OCR with AWS Textract/Tesseract
  - Purchase history and price tracking

- Documentation Updates
  - Updated PROJECT-INDEX.md (service count, pricing model)
  - Updated ADR index (15 total ADRs)
  - Added Inventory Service specification

- Diagram Updates
  - Updated C4 container diagram with Inventory Service
  - Added S3 and OCR service integrations

- Repository Cleanup
  - Created .gitignore for AI temp files
  - Removed 34 tmpclaude-* temporary files

Architecture Decisions:
- ADR-011: QR Code PIN Verification - Static QR codes with waiter-issued PINs
- ADR-012: React Frontend Framework - React 18+ with TypeScript
- ADR-013: Multi-Gateway Payment Strategy - Tenant-configurable gateways
- ADR-014: Hybrid Monitoring Strategy - CloudWatch POC, Prometheus prod
- ADR-015: Plugin-Based Architecture - À la carte service enablement

Impact:
- All 9 microservices now support plugin architecture
- Tenant configuration schema updated
- API Gateway requires tenant service checks
- Pricing model changed to à la carte
- Ready for Menu Service POC implementation
- No breaking changes (planning phase only)

Files Changed:
- Created: 8 files
  - 5 ADRs (docs/03-architecture/decisions/)
  - 1 service spec (.ai/context/services/inventory-service.md)
  - 1 C4 diagram update (overall-system.puml)
  - 1 .gitignore

- Modified: 4 files
  - docs/03-architecture/decisions/README.md (ADR index)
  - PROJECT-INDEX.md (metrics and status)
  - docs/03-architecture/architecture-summary.md
  - docs/03-architecture/diagrams/c4/02-container/overall-system.md

- Deleted: 34 files
  - Temporary AI files (tmpclaude-*)

Next Steps:
- [ ] Generate PNG/SVG exports from PlantUML diagrams
- [ ] Begin Menu Service POC implementation (Week 1-4)
- [ ] Set up development environment per ADR-002
- [ ] Create database schemas for core services

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

## Quick Reference Card

**Minimal Commit Message (Use for simple changes):**
```
[Brief title]

[One paragraph description]

Files Changed:
- Created: X files
- Modified: Y files

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

**Standard Commit Message (Use for moderate changes):**
```
[Brief title]

[2-3 paragraphs description]

Key Changes:
- Category 1
  - Change A
  - Change B

Files Changed:
- Created: X files
- Modified: Y files

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

**Comprehensive Commit Message (Use for major architecture changes):**
```
Use the complete template above
```

## Best Practices

### DO ✅
- Write for future readers who lack context
- Include "why" not just "what"
- Mention trade-offs and alternatives considered
- Link to relevant issues/PRs
- Use consistent formatting
- Proofread before committing
- Include co-authorship for AI assistance

### DON'T ❌
- Write vague summaries ("Updated files")
- Omit context or rationale
- Mix unrelated changes
- Use abbreviations without definition
- Skip sections that apply
- Forget to list file changes
- Commit without review

## Integration with Git

### Commit from File

```bash
# Save commit message to file
cat > COMMIT_MESSAGE.txt << 'EOF'
[Your commit message following template]
EOF

# Commit using message file
git commit -F COMMIT_MESSAGE.txt
```

### Commit with Editor

```bash
# Set Git editor (if not set)
git config --global core.editor "code --wait"

# Commit (opens editor with template)
git commit
```

### Template as Git Default

```bash
# Save template
cat > ~/.gitmessage << 'EOF'
# Brief Summary (max 72 chars)

# Detailed Description
# - Why was this change needed?
# - What approach was taken?

# Key Changes:
# -

# Files Changed:
# - Created:
# - Modified:
# - Deleted:

# Co-Authored-By:
EOF

# Configure Git to use template
git config --global commit.template ~/.gitmessage
```

## Adaptation Guidelines

**Customize for your project:**
- Add/remove sections based on needs
- Adjust categories to match workflow
- Include project-specific metadata
- Add links to issue tracker
- Include deployment notes if relevant

**Examples of customizations:**
- Add "Security Considerations" section
- Add "Database Migrations" section
- Add "Performance Impact" section
- Add "Test Coverage" section
- Add "Deployment Instructions" section

## Related Resources

- **[architecture-review-checklist.md](../.ai/workflows/architecture-review-checklist.md)** - Review before commit
- **[decision-making-protocol.md](../.ai/workflows/decision-making-protocol.md)** - Decision process
- **Conventional Commits:** https://www.conventionalcommits.org/
- **Git Best Practices:** https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project

## Metrics

**Track commit message quality:**
- Time to understand commit from message alone
- Questions asked about commits
- Usefulness during blame/bisect operations
- Onboarding effectiveness

**Good metrics indicate:**
- Commit messages provide sufficient context
- Future developers can understand decisions
- Less time spent investigating history
