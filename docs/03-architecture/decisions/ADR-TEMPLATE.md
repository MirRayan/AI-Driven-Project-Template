# ADR-XXX: [Decision Title]

**Status:** [Proposed | Accepted | Deprecated | Superseded]
**Date:** YYYY-MM-DD
**Decision Makers:** [Names/Roles]
**Supersedes:** [ADR-XXX] *(if applicable)*
**Superseded by:** [ADR-XXX] *(if applicable)*

---

## Context

**What is the issue or situation that requires a decision?**

Describe the forces at play:
- Technical constraints or requirements
- Business drivers or goals
- Team capabilities or preferences
- Timeline or resource constraints
- Regulatory or compliance requirements
- Existing architecture or technical debt

**Guidelines:**
- Explain "why" we need to decide, not "what" we decided
- Provide enough context for future readers who lack current knowledge
- Reference related ADRs if applicable
- Mention stakeholders or teams affected
- Keep focused on facts, not opinions

**Example:**
> Our restaurant SaaS platform needs a frontend framework for the web application. We currently have no frontend code. The team has experience with React and Vue but limited Angular experience. We need to choose a framework that supports our multi-tenant architecture, integrates well with our Spring Boot backend, and can be developed quickly by our current team.

---

## Decision

**What is the decision we have made?**

State the decision clearly and concisely:
- What approach/technology/pattern are we adopting?
- Key aspects of the implementation
- Scope and boundaries

**Use active, declarative language:**
- ✅ "We will use React 18+ with TypeScript for the web frontend"
- ❌ "Maybe we should try React"

**Guidelines:**
- Be specific and unambiguous
- Include version numbers for technologies
- Mention key configuration or approach details
- Keep this section brief (1-3 paragraphs max)

**Example:**
> We will use **React 18+ with TypeScript** as the frontend framework for the web application. The tech stack will include:
>
> - **Framework:** React 18+
> - **Language:** TypeScript 5+
> - **Build Tool:** Vite
> - **UI Library:** Material-UI (MUI)
> - **State Management:** Zustand or Redux Toolkit
> - **API Client:** TanStack Query (React Query)
>
> Component structure will follow atomic design principles with a clear separation between container and presentational components.

---

## Alternatives Considered

**What other options did we evaluate?**

For each alternative, document:
1. **Option name/title**
2. **Brief description**
3. **Pros** (advantages)
4. **Cons** (disadvantages)
5. **Why not chosen** (key reason for rejection)

**Guidelines:**
- List ALL serious options considered (minimum 2-3 alternatives)
- Be fair and objective about each option
- Include quantitative comparisons if available
- Note if option was close runner-up
- This section prevents re-litigation of decisions

**Template per alternative:**

### Alternative 1: [Option Name]

**Description:**
[Brief description of this approach]

**Pros:**
- Advantage 1
- Advantage 2
- Advantage 3

**Cons:**
- Disadvantage 1
- Disadvantage 2
- Disadvantage 3

**Why not chosen:**
[Primary reason this option was rejected]

---

### Alternative 2: [Option Name]

[Same structure as Alternative 1]

---

### Alternative 3: [Option Name]

[Same structure as Alternative 1]

---

**Example:**

### Alternative 1: Vue.js 3 with TypeScript

**Description:**
Progressive framework with composition API and TypeScript support. Similar developer experience to React with smaller bundle size.

**Pros:**
- Smaller learning curve for developers familiar with HTML templates
- Excellent documentation in English
- Smaller bundle size than React
- Official TypeScript support
- Good ecosystem and community

**Cons:**
- Team has limited Vue 3 Composition API experience
- Fewer enterprise-grade UI component libraries
- Smaller job market for hiring
- Less mature TypeScript ecosystem than React

**Why not chosen:**
Team expertise heavily weighted toward React. The time needed to train the team on Vue 3 Composition API would delay the project timeline by 2-3 weeks. React's larger ecosystem also provides more third-party libraries for our specific needs (multi-tenancy, advanced data grids).

---

### Alternative 2: Angular 17

**Description:**
Full-featured framework with TypeScript as default, includes routing, forms, HTTP client, and dependency injection out of the box.

**Pros:**
- Complete framework with all features included
- Strong TypeScript integration (TypeScript-first)
- Excellent for large enterprise applications
- Opinionated structure reduces decision fatigue
- Good testing framework built-in

**Cons:**
- Steeper learning curve (team has minimal Angular experience)
- More opinionated and restrictive than React
- Larger bundle size
- Requires learning RxJS for state management
- More verbose code structure

**Why not chosen:**
Team has no production Angular experience, and the framework's steep learning curve would significantly delay development. The opinionated structure, while beneficial for large teams, is unnecessary for our current team size (4 developers).

---

## Consequences

**What are the implications of this decision?**

Document expected outcomes in three categories:

### Positive Consequences

Benefits we expect from this decision:
- Immediate advantages
- Long-term benefits
- Risk reductions
- Capability improvements

**Example:**
- Team can start development immediately with existing React knowledge
- Large ecosystem provides solutions for common problems
- Strong TypeScript support improves code quality and maintainability
- Excellent component libraries (MUI) accelerate UI development
- Hot reload with Vite improves developer experience
- Growing job market makes hiring easier

---

### Negative Consequences

Drawbacks or trade-offs we're accepting:
- Known limitations
- Technical debt introduced
- Costs or overhead
- Risks accepted

**For each negative consequence, include mitigation where possible:**

**Example:**
- **Larger bundle size than Vue**
  *Mitigation:* Use code splitting, lazy loading, and tree shaking to optimize bundle size

- **React's complex state management ecosystem**
  *Mitigation:* Standardize on Zustand or Redux Toolkit to avoid decision paralysis

- **Potential over-reliance on third-party libraries**
  *Mitigation:* Document critical dependencies and maintain upgrade schedule

---

### Neutral Consequences

Changes that are neither clearly positive nor negative:
- New processes or workflows required
- Training or ramp-up needs
- Team structure implications
- Long-term maintenance considerations

**Example:**
- Team needs to decide on state management library (Zustand vs Redux Toolkit)
- Component library standardization required to maintain consistency
- Need to establish React coding standards and best practices
- May need to train new hires on our specific React patterns

---

## Implementation Notes

**How should this decision be implemented?**

Provide practical guidance:
- Setup steps or prerequisites
- Configuration details
- Integration points with existing system
- Key files or directories affected
- Timeline or phasing

**Example:**
> **Phase 1 - Setup (Week 1):**
> - Initialize Vite project with React + TypeScript template
> - Configure ESLint and Prettier for code quality
> - Set up MUI theme with restaurant branding
> - Configure TanStack Query for API integration
>
> **Phase 2 - Foundation (Week 2-3):**
> - Create base layout components
> - Implement authentication flow
> - Build component library (buttons, forms, cards)
> - Set up routing structure
>
> **Phase 3 - Features (Week 4+):**
> - Implement feature modules (menu, orders, etc.)
> - Integrate with backend APIs
> - Add state management as needed

---

## References

**Supporting materials and related resources:**

- **Related ADRs:** [ADR-XXX], [ADR-YYY]
- **External Resources:**
  - [React Documentation](https://react.dev/)
  - [TypeScript Handbook](https://www.typescriptlang.org/docs/)
  - [MUI Components](https://mui.com/)
- **Research Documents:** Link to PDR or spike results
- **Discussions:** Link to GitHub issues, Slack threads, or meeting notes
- **Benchmarks:** Link to performance comparisons or proof-of-concepts

---

## Review and Update History

Track when this ADR is reviewed or updated:

| Date | Reviewer | Changes | Reason |
|------|----------|---------|--------|
| YYYY-MM-DD | [Name] | Initial version | Created during architecture phase |
| YYYY-MM-DD | [Name] | Updated consequences | After 6 months of implementation |

---

## Notes for Template Users

**When creating a new ADR:**

1. **Copy this template** to `ADR-XXX-[kebab-case-title].md`
2. **Replace XXX** with next sequential number
3. **Fill all sections** - don't skip any
4. **Delete this "Notes" section** before committing
5. **Update ADR index** in `README.md`
6. **Link from related docs** (PROJECT-INDEX.md, related ADRs)

**Section Guidelines:**

- **Context:** 2-4 paragraphs explaining the situation
- **Decision:** 1-3 paragraphs stating what was decided
- **Alternatives:** 2-5 options with objective analysis
- **Consequences:** Balanced view of outcomes
- **Implementation:** Practical guidance for developers

**Quality Checklist:**

- [ ] Context explains "why" not just "what"
- [ ] Decision is clear and specific
- [ ] At least 2 alternatives documented
- [ ] Each alternative has pros, cons, and rejection reason
- [ ] Consequences include positive, negative, and neutral
- [ ] Implementation notes provide actionable guidance
- [ ] References include related ADRs
- [ ] Status field accurate
- [ ] Date field populated

**Common Mistakes to Avoid:**

- ❌ Vague context that doesn't explain why decision was needed
- ❌ Decision section that just repeats context
- ❌ Alternatives section with only one option (the chosen one)
- ❌ Unfair or biased representation of alternatives
- ❌ Missing "why not chosen" for alternatives
- ❌ Consequences only listing positives (ignoring trade-offs)
- ❌ Implementation notes too abstract to be useful
- ❌ No references to related decisions

**Tips for Success:**

✅ Write for future readers who lack current context
✅ Be honest about trade-offs and limitations
✅ Include enough detail to understand rationale
✅ Keep alternatives balanced and objective
✅ Link to supporting materials and discussions
✅ Update status field if decision changes
✅ Review periodically (every 6-12 months)

---

## Template Version

**Version:** 2.0
**Last Updated:** 2024-01-15
**Changelog:**
- v2.0: Added comprehensive alternatives section guidance
- v2.0: Enhanced consequences section with mitigation strategies
- v2.0: Added implementation notes section
- v2.0: Added quality checklist and common mistakes
- v1.0: Initial template
