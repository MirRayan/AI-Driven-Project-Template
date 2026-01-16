# .gitignore Patterns for AI-Assisted Projects

## Overview

This document provides recommended `.gitignore` patterns for projects using AI development tools. These patterns prevent temporary files, cache files, and sensitive data from being committed to version control.

## Purpose

AI development tools create temporary files during operation:
- Claude Code: `tmpclaude-*` files
- GitHub Copilot: Cache and log files
- Cursor: Session and cache files
- Other AI assistants: Various temp files

These files should be excluded from version control to:
- Keep repository clean
- Reduce commit noise
- Avoid tracking tool internals
- Prevent accidental sensitive data exposure

## Recommended .gitignore Template

```gitignore
# ============================================
# AI Tool Temporary Files
# ============================================

# Claude Code temporary files
tmpclaude-*
.claude/
.claude-cache/

# GitHub Copilot
.copilot/

# Cursor IDE
.cursor/
cursor-*/

# Other AI assistants
.ai-cache/
ai-temp-*

# ============================================
# IDE and Editor Files
# ============================================

# JetBrains IDEs (IntelliJ, WebStorm, etc.)
.idea/
*.iml
*.iws
*.ipr
out/

# Visual Studio Code
.vscode/
*.code-workspace
.history/

# Eclipse
.project
.classpath
.settings/
bin/

# NetBeans
nbproject/
nbbuild/
dist/
nbdist/

# Vim
*.swp
*.swo
*~
.netrwhist

# Emacs
*~
\#*\#
.\#*

# Sublime Text
*.sublime-workspace
*.sublime-project

# ============================================
# OS-Specific Files
# ============================================

# macOS
.DS_Store
.AppleDouble
.LSOverride
._*

# Windows
Thumbs.db
ehthumbs.db
Desktop.ini
$RECYCLE.BIN/
*.lnk

# Linux
.directory
.Trash-*

# ============================================
# Build Artifacts (Language-Specific)
# ============================================

## Java / Spring Boot
target/
build/
*.class
*.jar
*.war
*.ear
.gradle/
gradle-app.setting

## JavaScript / Node.js
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.npm/
dist/
build/
.next/
.nuxt/
out/

## Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
ENV/
.pytest_cache/
.mypy_cache/
*.egg-info/
dist/
build/

## .NET / C#
bin/
obj/
*.user
*.suo
*.cache
packages/

## Go
*.exe
*.exe~
*.dll
*.so
*.dylib
vendor/

## Rust
target/
Cargo.lock
**/*.rs.bk

## Ruby
*.gem
.bundle/
vendor/bundle/
.byebug_history

# ============================================
# Environment and Configuration
# ============================================

# Environment variables
.env
.env.local
.env.*.local
.envrc

# Credentials and secrets
*credentials*
*secrets*
*.pem
*.key
*.p12
*.pfx
*.jks

# Configuration (when containing secrets)
application-local.yml
application-local.properties
config/local.json

# ============================================
# Logs and Databases
# ============================================

# Log files
*.log
logs/
*.log.*

# Database files
*.db
*.sqlite
*.sqlite3

# ============================================
# Testing and Coverage
# ============================================

# Test coverage
coverage/
*.cover
.coverage
htmlcov/
.nyc_output/
lcov.info

# Test results
test-results/
junit/
*.test

# ============================================
# Documentation Build
# ============================================

# Generated documentation
docs/_build/
site/
.docusaurus/

# ============================================
# Package Manager Locks (Optional)
# ============================================

# Uncomment if your team prefers not to commit lock files
# package-lock.json
# yarn.lock
# Gemfile.lock
# composer.lock

# ============================================
# Cloud and Infrastructure
# ============================================

# Terraform
.terraform/
*.tfstate
*.tfstate.*
.terraform.lock.hcl

# AWS
.aws-sam/

# Docker
.dockerignore

# Kubernetes
kubeconfig

# ============================================
# Miscellaneous
# ============================================

# Temporary files
*.tmp
*.temp
*.bak
*.swp
*.cache

# Compressed files (if not needed in repo)
*.zip
*.tar.gz
*.rar

# Large binary files (unless explicitly needed)
*.mp4
*.mov
*.avi
*.pdf
```

## Usage Instructions

### 1. Copy to Project Root

```bash
# Copy to your project as .gitignore
cat templates/gitignore-ai-projects.md > .gitignore

# Or create from this template
curl -o .gitignore https://raw.githubusercontent.com/your-org/template/main/templates/gitignore-ai-projects.md
```

### 2. Customize for Your Project

Remove sections that don't apply:
```bash
# If not using Java, remove Java section
# If not using Node.js, remove Node.js section
# etc.
```

Add project-specific patterns:
```gitignore
# Project-specific temporary files
project-temp-*

# Project-specific build artifacts
custom-build/

# Project-specific secrets
internal-config.yml
```

### 3. Apply to Existing Repository

If files are already tracked:

```bash
# Remove already-tracked files matching .gitignore
git rm --cached tmpclaude-*

# Or remove entire directory
git rm -r --cached .claude/

# Commit the changes
git commit -m "Remove AI temp files from tracking"
```

### 4. Verify .gitignore Works

```bash
# Create a temp file
touch tmpclaude-test

# Check Git status (should not appear)
git status

# Clean up
rm tmpclaude-test
```

## Pattern Explanations

### Wildcard Patterns

| Pattern | Matches | Example |
|---------|---------|---------|
| `*.log` | Any file ending in .log | `app.log`, `debug.log` |
| `temp-*` | Any file starting with temp- | `temp-001`, `temp-data` |
| `*-temp.*` | Any file with -temp before extension | `data-temp.json` |
| `logs/` | Directory named logs | `logs/` and all contents |
| `**/*.class` | .class files in any subdirectory | `a/b/c/File.class` |

### Negation Patterns

Include exceptions to ignored patterns:

```gitignore
# Ignore all .env files
*.env

# But include the template
!.env.example
```

### Directory-Specific Patterns

```gitignore
# Ignore only in root
/.idea/

# Ignore in any directory
.idea/

# Ignore specific subdirectory
build/output/
```

## AI Tool Specific Sections

### Claude Code

```gitignore
# Claude Code temporary files
tmpclaude-*
.claude/
.claude-cache/

# Claude Code session files
.claude/sessions/
.claude/temp/
```

**Rationale:** Claude Code creates temporary files prefixed with `tmpclaude-` during operation.

### GitHub Copilot

```gitignore
# Copilot cache
.copilot/
.vscode/copilot/
```

**Rationale:** Copilot stores cache data that shouldn't be shared.

### Cursor IDE

```gitignore
# Cursor-specific files
.cursor/
cursor-tutor/
.cursor-tutor/
```

**Rationale:** Cursor stores AI session data locally.

## Security Considerations

### High-Risk Patterns

**Always ignore these:**
```gitignore
# Credentials
*.pem
*.key
*.p12
*.pfx
credentials.json
secrets.yml

# Environment files with secrets
.env
.env.local
.env.production

# Cloud provider credentials
.aws/credentials
gcloud-key.json
azure-credentials.json
```

### Verify No Secrets Committed

```bash
# Check for common secret patterns
git log -p | grep -i "password\|secret\|key\|token"

# Use specialized tools
# Install: npm install -g trufflehog
trufflehog git https://github.com/your/repo
```

## Template Variants

### Minimal Template (Bare Essentials)

```gitignore
# AI Tools
tmpclaude-*
.claude/
.copilot/
.cursor/

# IDE
.idea/
.vscode/
*.iml

# OS
.DS_Store
Thumbs.db

# Environment
.env
*.log
```

### Comprehensive Template (Include Everything)

Use the full template above.

### Language-Specific Templates

Only include sections for languages you use:

**Java-Only:**
```gitignore
# AI Tools
tmpclaude-*

# Java/Spring Boot
target/
*.class
*.jar
.gradle/

# IDE
.idea/
*.iml

# Environment
.env
application-local.yml
```

## Maintenance

### Regular Review

Periodically review `.gitignore`:
```bash
# Find files Git is tracking that match patterns
git ls-files | grep -E "tmpclaude|\.log$|\.cache$"

# If found, remove from tracking
git rm --cached <file>
```

### Update When Adding Tools

When adopting new AI tools:
1. Research tool's temp file patterns
2. Add patterns to `.gitignore`
3. Remove any already-tracked files
4. Commit changes

### Team Synchronization

```bash
# After updating .gitignore
git add .gitignore
git commit -m "Update .gitignore for new AI tools"
git push

# Team members should then:
git pull
git rm --cached <newly-ignored-files>
```

## Troubleshooting

### File Still Tracked Despite .gitignore

**Reason:** File was committed before `.gitignore` rule added.

**Solution:**
```bash
# Stop tracking the file
git rm --cached <file>

# Or stop tracking entire directory
git rm -r --cached <directory>

# Commit the change
git commit -m "Untrack files now in .gitignore"
```

### .gitignore Not Working

**Check:**
1. File named exactly `.gitignore` (with leading dot)
2. File in repository root (or appropriate subdirectory)
3. Pattern syntax correct
4. No trailing whitespace in patterns
5. File has Unix line endings (LF not CRLF)

**Debug:**
```bash
# Test if file would be ignored
git check-ignore -v <file>

# Check .gitignore is tracked
git ls-files .gitignore

# Verify .gitignore syntax
cat -A .gitignore  # Shows hidden characters
```

### Need to Ignore in Subdirectory Only

Create `.gitignore` in subdirectory:
```bash
# project/src/.gitignore
*.local
temp-*
```

This only affects `project/src/` and below.

## Best Practices

### DO ✅
- Add `.gitignore` before first commit
- Review patterns periodically
- Document custom patterns
- Use comments for clarity
- Include template in project template
- Test patterns before committing
- Keep sensitive patterns at top

### DON'T ❌
- Commit `.gitignore` to ignore itself
- Use overly broad patterns (like `*`)
- Ignore files needed by team
- Forget to document exceptions
- Mix tabs and spaces in file
- Leave trailing whitespace

## Related Resources

- **Git Documentation:** https://git-scm.com/docs/gitignore
- **GitHub .gitignore Templates:** https://github.com/github/gitignore
- **gitignore.io:** https://www.toptal.com/developers/gitignore

## Integration with Template

When initializing new project:

```bash
# Template initialization script includes:
cp templates/gitignore-ai-projects.md .gitignore

# Customize for project language
# Remove unused sections
# Add project-specific patterns

git add .gitignore
git commit -m "Add .gitignore for AI-assisted development"
```

## Version History

Track changes to this template:
- **v1.0:** Initial template with Claude Code patterns
- **v1.1:** Added Copilot and Cursor patterns
- **v1.2:** Added security patterns for credentials
- **v1.3:** Added language-specific sections

Keep template updated as new AI tools emerge.
