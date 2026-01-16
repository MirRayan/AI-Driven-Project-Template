# Diagram Update Protocol

## Overview

The **Diagram Update Protocol** defines when and how to update architecture diagrams during project development. Keeping diagrams synchronized with architecture decisions ensures they remain valuable communication and documentation tools.

## Purpose

Architecture diagrams should:
- ✅ Reflect current system design accurately
- ✅ Stay synchronized with ADRs
- ✅ Support stakeholder communication
- ✅ Guide implementation work
- ✅ Serve as onboarding material

This protocol ensures diagrams don't become stale or misleading.

## When to Update Diagrams

### Mandatory Updates

Update diagrams immediately when:

1. **New Services/Components Added**
   - Adding microservices
   - Adding databases
   - Adding external systems
   - Adding infrastructure components

2. **Services/Components Removed**
   - Deprecating services
   - Removing dependencies
   - Consolidating components

3. **Relationships Changed**
   - New integration points
   - Changed communication patterns
   - Modified data flows
   - Updated dependencies

4. **Technology Decisions Finalized**
   - Database choice
   - Message broker selection
   - API gateway addition
   - Cache layer introduction

5. **Deployment Architecture Changes**
   - Container orchestration
   - Cloud service changes
   - Network topology updates
   - Security boundaries modified

### Recommended Updates

Consider updating when:

1. **ADRs Finalized**
   - After accepting architecture decisions
   - When decisions impact system structure
   - Before presenting to stakeholders

2. **Architecture Review**
   - Before major milestones
   - Prior to implementation phases
   - During sprint/iteration planning

3. **Onboarding New Team Members**
   - Ensure diagrams are current
   - Validate accuracy
   - Add missing details

4. **Stakeholder Presentations**
   - Before architecture reviews
   - For funding/approval meetings
   - During audits or assessments

### Optional Updates

May update for:

1. **Clarification**
   - Adding notes or annotations
   - Improving layout/readability
   - Fixing typos or labels

2. **Detail Level**
   - Adding sequence diagrams
   - Expanding component details
   - Creating deployment views

## Diagram Types and Update Triggers

### C4 Model Diagrams

#### Level 1: Context Diagram

**Shows:** System boundary, external actors, external systems

**Update when:**
- New external system integration
- New user type/actor added
- System boundary changes
- External dependencies modified

**Example triggers:**
- Adding third-party payment gateway
- Integrating with OCR service
- Adding mobile app as client
- Connecting to external API

#### Level 2: Container Diagram

**Shows:** Applications, services, databases, message brokers

**Update when:**
- New microservice added
- New database introduced
- Message broker added
- API gateway changes
- Storage service added

**Example triggers:**
- Adding Inventory Service
- Introducing Redis cache
- Adding Kafka for events
- Connecting S3 for file storage

#### Level 3: Component Diagram

**Shows:** Internal components of a container/service

**Update when:**
- Major refactoring within service
- New significant components added
- Component responsibilities change
- Internal architecture patterns change

**Example triggers:**
- Adding plugin system to API Gateway
- Refactoring service layers
- Introducing new design patterns

#### Level 4: Code Diagram

**Shows:** Classes, interfaces, relationships (rarely used)

**Update when:**
- Critical design patterns implemented
- Complex algorithms documented
- Framework-specific structures
- (Usually kept in code comments instead)

### Other Diagram Types

#### Entity-Relationship Diagrams (ERD)

**Update when:**
- New tables/collections added
- Schema changes (new columns, relationships)
- Data model refactoring
- Multi-tenancy patterns change

#### Sequence Diagrams

**Update when:**
- API flow changes
- New integration patterns
- Event flow modifications
- Authentication flow changes

#### Deployment Diagrams

**Update when:**
- Infrastructure changes
- Kubernetes/container updates
- Network topology changes
- Load balancer configurations
- CDN or edge services added

## Update Process

### Step 1: Identify Diagram Impact

**When making architecture changes, ask:**
- Does this add/remove/modify visible components?
- Does this change relationships between components?
- Does this affect system boundaries?
- Will this confuse readers if not updated?

**If yes to any → Update required**

### Step 2: Determine Affected Diagrams

**Check which diagrams need updating:**

| Change Type | Context | Container | Component | ERD | Sequence | Deployment |
|-------------|---------|-----------|-----------|-----|----------|------------|
| New service | ✓ | ✓ | - | - | Maybe | ✓ |
| New database | - | ✓ | - | ✓ | - | ✓ |
| New external system | ✓ | ✓ | - | - | Maybe | - |
| Service refactor | - | - | ✓ | - | Maybe | - |
| Schema change | - | - | - | ✓ | - | - |
| API flow change | - | - | - | - | ✓ | - |
| Infrastructure change | - | - | - | - | - | ✓ |

### Step 3: Update Source Files

**For PlantUML diagrams:**

```bash
# Edit PlantUML source
code docs/03-architecture/diagrams/c4/02-container/overall-system.puml

# Add new component
Container(inventory_service, "Inventory Service", "Spring Boot", "Receipt OCR")

# Add relationships
Rel(inventory_service, postgres, "Reads/Writes", "JDBC")
Rel(inventory_service, s3, "Stores receipts", "AWS SDK")

# Save file
```

**For draw.io/Lucidchart:**
- Open diagram file
- Add/modify elements
- Export both source and PNG/SVG
- Commit both files

### Step 4: Generate Exports

**If using PlantUML:**

```bash
# Install PlantUML (if not installed)
# brew install plantuml  # macOS
# apt-get install plantuml  # Linux
# choco install plantuml  # Windows

# Generate PNG
plantuml -tpng docs/03-architecture/diagrams/c4/02-container/overall-system.puml

# Generate SVG (recommended for web)
plantuml -tsvg docs/03-architecture/diagrams/c4/02-container/overall-system.puml

# Or generate all diagrams
find docs/03-architecture/diagrams -name "*.puml" -exec plantuml -tsvg {} \;
```

**If using other tools:**
- Export PNG (for docs, presentations)
- Export SVG (for web, scaling)
- Export source format (for editing)

### Step 5: Update Documentation

**Update references in:**
- Architecture summary documents
- ADRs that reference diagrams
- README files with embedded diagrams
- Project index (if listing diagrams)

**Example:**
```markdown
## Architecture Diagrams

- [C4 Context Diagram](docs/03-architecture/diagrams/c4/01-context/system-context.svg)
- [C4 Container Diagram](docs/03-architecture/diagrams/c4/02-container/overall-system.svg) ✨ Updated
- [Database Schema](docs/03-architecture/diagrams/database/schema-v2.svg) ✨ Updated
```

### Step 6: Commit with Context

```bash
# Stage diagram files
git add docs/03-architecture/diagrams/

# Commit with descriptive message
git commit -m "Update C4 container diagram with Inventory Service

Added Inventory Service container with:
- Connection to PostgreSQL database
- Integration with S3 for receipt storage
- Integration with OCR service (AWS Textract)

Related to ADR-015 (Plugin Architecture) and Inventory Service
specification.

Files updated:
- overall-system.puml (source)
- overall-system.svg (export)
"
```

## Diagram Quality Standards

### Visual Clarity

**DO ✅:**
- Use consistent colors/shapes
- Provide clear labels
- Include legends/keys
- Maintain readable font size
- Group related components
- Use whitespace effectively

**DON'T ❌:**
- Overcrowd diagrams
- Use ambiguous symbols
- Mix notation styles
- Create overlapping lines
- Use illegible colors

### Content Accuracy

**Ensure:**
- All components shown exist in design
- Relationships match actual integrations
- Technology labels accurate
- No outdated components shown
- Boundaries clearly marked
- Data flows correctly depicted

### Documentation

**Include:**
- Diagram title and version
- Last updated date
- Legend explaining symbols
- Notes on key decisions
- Links to related ADRs
- Contact for questions

**Example:**
```
Title: Container Diagram - Overall System
Version: 2.0
Last Updated: 2024-01-15
Related ADRs: ADR-001, ADR-015
Legend: [Standard C4 notation]
```

## Automation Opportunities

### CI/CD Integration

**Automatic diagram generation:**

```yaml
# .github/workflows/diagrams.yml
name: Generate Diagrams

on:
  push:
    paths:
      - 'docs/03-architecture/diagrams/**/*.puml'

jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Generate PlantUML diagrams
        uses: cloudbees/plantuml-github-action@master
        with:
          args: -v -tsvg docs/**/*.puml

      - name: Commit generated files
        run: |
          git config user.name github-actions
          git config user.email github-actions@github.com
          git add docs/**/*.svg
          git commit -m "Auto-generate diagram exports" || exit 0
          git push
```

### Validation Checks

**Verify diagrams stay current:**

```bash
#!/bin/bash
# scripts/validate-diagrams.sh

# Check if .puml files have corresponding exports
for puml in $(find docs -name "*.puml"); do
  svg="${puml%.puml}.svg"
  if [ ! -f "$svg" ]; then
    echo "Missing export: $svg"
    exit 1
  fi

  # Check if export is older than source
  if [ "$puml" -nt "$svg" ]; then
    echo "Stale export: $svg"
    exit 1
  fi
done

echo "All diagrams up to date"
```

## Version Control Best Practices

### File Organization

```
docs/03-architecture/diagrams/
├── c4/
│   ├── 01-context/
│   │   ├── system-context.puml     # Source
│   │   ├── system-context.svg      # Export
│   │   └── README.md               # Description
│   ├── 02-container/
│   │   ├── overall-system.puml
│   │   ├── overall-system.svg
│   │   └── README.md
│   └── 03-component/
│       └── [service-name]/
├── database/
│   ├── schema-v1.sql
│   ├── schema-v1.png
│   └── schema-v2.png               # Version when schema changes
├── sequence/
│   ├── authentication-flow.puml
│   └── order-processing.puml
└── deployment/
    ├── kubernetes-architecture.png
    └── aws-infrastructure.png
```

### Commit Granularity

**Separate commits for:**
- Diagram source changes
- Diagram export generation
- Documentation updates referencing diagrams

**Or combined commit:**
```bash
git add docs/03-architecture/diagrams/c4/02-container/*
git add docs/03-architecture/architecture-summary.md
git commit -m "Update container diagram with Inventory Service

[Details...]
"
```

### Binary Files

**Consider:**
- Using Git LFS for large binary exports
- Storing only SVG (text-based, diffable)
- Keeping PNG only for presentations
- Archiving old versions outside repo

## Real-World Example

**Scenario:** Restaurant Management project added Inventory Service

### Changes Required:
1. New service (Inventory Service)
2. New database tables (9 tables)
3. New external system (OCR service)
4. New storage (S3 for receipts)

### Diagrams Updated:

**C4 Container Diagram:**
```diff
# overall-system.puml

+ Container(inventory_service, "Inventory Service", "Spring Boot",
+   "Receipt OCR, purchase tracking")
+ ContainerDb(s3, "S3", "AWS S3", "Receipt image storage")
+ System_Ext(ocr_service, "OCR Service", "AWS Textract")

+ Rel(inventory_service, postgres, "Reads/Writes", "JDBC")
+ Rel(inventory_service, s3, "Stores receipts", "AWS SDK")
+ Rel(inventory_service, ocr_service, "Extracts text", "AWS SDK")
```

**Database ERD:**
- Added 9 new tables (inventory_purchases, inventory_items, etc.)
- Added relationships to tenant table

**Updated in commit:**
```
Update C4 container diagram with Inventory Service

Added 9th microservice (Inventory Service) to container diagram
along with S3 storage and OCR service integration.

Also updated database ERD with 9 new inventory tables.

Related to ADR-015 (Plugin Architecture) and Inventory Service
specification in .ai/context/services/inventory-service.md.

Files updated:
- docs/03-architecture/diagrams/c4/02-container/overall-system.puml
- docs/03-architecture/diagrams/c4/02-container/overall-system.svg
- docs/03-architecture/diagrams/database/schema-v2.sql
- docs/03-architecture/diagrams/database/schema-v2.png
```

## Common Pitfalls

### Pitfall 1: Forgetting to Update Diagrams

**Problem:** Architecture changes committed without diagram updates

**Prevention:**
- Architecture review checklist includes diagram check
- CI/CD validation of diagram freshness
- Pair diagram update with ADR creation

### Pitfall 2: Updating Only Source, Not Exports

**Problem:** PlantUML source updated, but PNG/SVG not regenerated

**Prevention:**
- Automated export generation in CI/CD
- Pre-commit hooks to generate exports
- Checklist item to regenerate exports

### Pitfall 3: Inconsistent Notation

**Problem:** Different diagram styles across project

**Prevention:**
- Document notation standards
- Use consistent templates
- Code review for diagrams

### Pitfall 4: Overly Detailed Diagrams

**Problem:** Diagrams too complex to maintain

**Prevention:**
- Follow C4 model levels strictly
- Create multiple focused diagrams
- Avoid implementation details in high-level diagrams

## Integration with Workflows

### With Decision Making Protocol

```
1. Research options
2. Finalize decision
3. Create ADR
4. Update affected diagrams ← Protocol step
5. Update documentation
6. Commit all changes
```

### With Architecture Review

```
Pre-Review Checklist:
- [ ] All ADRs created
- [ ] All diagrams updated ← Protocol check
- [ ] Diagrams match ADRs
- [ ] Exports generated
- [ ] Documentation references correct
```

## Tools and Resources

### Diagram Tools

**PlantUML:**
- Text-based (version control friendly)
- Automated generation
- Consistent styling
- Free and open source

**Draw.io/Diagrams.net:**
- Visual editing
- Templates available
- Export multiple formats
- Free

**Lucidchart:**
- Collaborative
- Professional templates
- Real-time collaboration
- Paid (with free tier)

**Mermaid:**
- Markdown-native
- GitHub-rendered
- Simple syntax
- Free

### C4 Model Resources

- **C4 Model Website:** https://c4model.com/
- **PlantUML C4:** https://github.com/plantuml-stdlib/C4-PlantUML
- **Structurizr:** https://structurizr.com/ (C4 tooling)

## Best Practices Summary

### DO ✅
- Update diagrams with architecture changes
- Generate both source and exports
- Commit diagrams with related ADRs
- Use consistent notation
- Add legends and documentation
- Version diagrams with project
- Automate generation where possible
- Review diagrams regularly

### DON'T ❌
- Let diagrams become stale
- Commit only source without exports
- Use ambiguous or unclear notation
- Create overly complex diagrams
- Forget to update related documentation
- Mix multiple notation styles
- Skip diagram updates for "small" changes
- Assume diagrams self-explanatory

## Related Workflows

- **[decision-making-protocol.md](../../../.ai/workflows/decision-making-protocol.md)** - Includes diagram update step
- **[architecture-review-checklist.md](../../../.ai/workflows/architecture-review-checklist.md)** - Validates diagram accuracy
- **[commit-message-template.md](../../../templates/commit-message-template.md)** - Documenting diagram changes

## Continuous Improvement

Periodically review:
- Are diagrams still valuable?
- Are they being maintained?
- Do they match reality?
- Should any be deprecated?
- Are new diagrams needed?

Update this protocol as you learn what works for your team.
