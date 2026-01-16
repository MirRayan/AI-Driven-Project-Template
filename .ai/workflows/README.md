# AI Workflow Catalog

This directory contains **meta-level workflow patterns** and **process best practices** for AI-assisted development. These are universal patterns that apply across all projects using this template.

## Purpose

Workflows document **how to work** with AI assistants effectively, not **what to build**. They capture:

- Decision-making processes
- Review protocols
- Task breakdown strategies
- Documentation maintenance patterns

## Available Workflows

### 1. Decision Management
- **[pending-decision-workflow.md](pending-decision-workflow.md)** - How to track and manage pending architecture decisions (PDRs)
- **[decision-making-protocol.md](decision-making-protocol.md)** - Systematic process for finalizing architecture decisions

### 2. Quality Assurance
- **[architecture-review-checklist.md](architecture-review-checklist.md)** - Pre-commit review process for architecture changes
- **[task-breakdown-guide.md](task-breakdown-guide.md)** - Breaking complex work into trackable tasks

## When to Use These Workflows

| Workflow | When to Use | Output |
|----------|-------------|--------|
| **Pending Decision Workflow** | When you need to explore options before committing | PDR documents |
| **Decision Making Protocol** | When finalizing pending decisions | Accepted ADRs |
| **Architecture Review** | Before committing major architecture changes | Review checklist |
| **Task Breakdown** | Starting complex multi-step work | Todo list |

## Workflow Lifecycle

```
1. Planning Phase
   └─→ Task Breakdown Guide (break work into steps)

2. Exploration Phase
   └─→ Pending Decision Workflow (track options)

3. Decision Phase
   └─→ Decision Making Protocol (finalize choices)

4. Review Phase
   └─→ Architecture Review Checklist (verify completeness)

5. Implementation Phase
   └─→ (Feature-specific work)
```

## Integration with Project

These workflows integrate with the project structure:

- **PDRs** → Stored in `docs/03-architecture/decisions/pending/`
- **ADRs** → Stored in `docs/03-architecture/decisions/`
- **Reviews** → Use PROJECT-INDEX.md and documentation files
- **Tasks** → Tracked via todo system or issue tracker

## Customization

These workflows are templates. Adapt them to your:
- Team size and structure
- Review requirements
- Decision-making authority
- Tool preferences

## Best Practices

1. **Use workflows consistently** - Don't skip steps for "simple" changes
2. **Document deviations** - If you skip a workflow, note why
3. **Improve workflows** - Update them as you learn what works
4. **Share learnings** - Contribute improvements back to template

## Related Documentation

- [ADR Template](../../docs/03-architecture/decisions/ADR-TEMPLATE.md) - Architecture decision format
- [SESSION-PROTOCOL.md](../SESSION-PROTOCOL.md) - AI session management
- [CONTEXT-RECOVERY.md](../../CONTEXT-RECOVERY.md) - Context recovery procedures
