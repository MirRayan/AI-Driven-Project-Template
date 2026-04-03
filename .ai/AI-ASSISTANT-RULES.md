# AI assistant rules

**Template file** — customize per project after copying this template.

## Universal (keep)

- Follow [AGENTS.md](../AGENTS.md) for **documentation synchronization** (index, ADRs, links, quarterly review). That policy is **tool- and platform-agnostic**.
- Follow [docs/process/DOCUMENTATION-SYNC.md](../docs/process/DOCUMENTATION-SYNC.md) for light vs deep documentation passes.
- If the project **calls or documents HTTP APIs**, follow [docs/process/AGENT-RULES-BACKEND-API.md](../docs/process/AGENT-RULES-BACKEND-API.md) and keep [docs/05-breakdown/backend/BACKEND-INDEX.md](../docs/05-breakdown/backend/BACKEND-INDEX.md) current (single source of truth for route readiness).
- Run [scripts/check-doc-links.sh](../scripts/check-doc-links.sh) locally when you change many Markdown links (optional; requires `lychee`). No GitHub Action is required by default.

## Project-specific (fill in)

### ALWAYS

- (Add project-specific rules: architecture patterns, testing, security, etc.)

### NEVER

- (Add project-specific prohibitions.)

### Architecture and code standards

- (Describe stack-appropriate constraints when the project chooses languages and frameworks.)

---

*Replace placeholders when initializing the project. Remove sections that do not apply.*
