# AI-Driven Project Template - Initialization Script (PowerShell)
# Version: 1.0.0
# Usage: .\init-project.ps1 -ProjectName "My Project Name"

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$ProjectName
)

# Colors for output
function Write-Success { Write-Host "✓ $args" -ForegroundColor Green }
function Write-Error { Write-Host "✗ $args" -ForegroundColor Red }
function Write-Info { Write-Host "ℹ $args" -ForegroundColor Blue }
function Write-Warning { Write-Host "⚠ $args" -ForegroundColor Yellow }

# Function to convert project name to different formats
function Convert-Name {
    param(
        [string]$Name,
        [string]$Format
    )

    switch ($Format) {
        "kebab" {
            return $Name.ToLower() -replace '[\s_]+', '-'
        }
        "snake" {
            return $Name.ToLower() -replace '[\s-]+', '_'
        }
        "pascal" {
            $words = $Name -split '[\s_-]+'
            return ($words | ForEach-Object {
                $_.Substring(0,1).ToUpper() + $_.Substring(1).ToLower()
            }) -join ''
        }
        "title" {
            $words = $Name -split '[\s_-]+'
            return ($words | ForEach-Object {
                $_.Substring(0,1).ToUpper() + $_.Substring(1).ToLower()
            }) -join ' '
        }
        default {
            return $Name
        }
    }
}

# Convert project name to different formats
$PROJECT_NAME_RAW = $ProjectName
$PROJECT_NAME_KEBAB = Convert-Name -Name $PROJECT_NAME_RAW -Format "kebab"
$PROJECT_NAME_SNAKE = Convert-Name -Name $PROJECT_NAME_RAW -Format "snake"
$PROJECT_NAME_PASCAL = Convert-Name -Name $PROJECT_NAME_RAW -Format "pascal"
$PROJECT_NAME_TITLE = Convert-Name -Name $PROJECT_NAME_RAW -Format "title"

Write-Host ""
Write-Host "======================================================"
Write-Host "  AI-Driven Project Template Initialization"
Write-Host "======================================================"
Write-Host ""
Write-Info "Project Name: $PROJECT_NAME_TITLE"
Write-Info "Directory: $PROJECT_NAME_KEBAB"
Write-Host ""

# Confirm with user
$confirmation = Read-Host "Create project with these names? [y/N]"
if ($confirmation -ne 'y' -and $confirmation -ne 'Y') {
    Write-Warning "Initialization cancelled."
    exit 0
}

Write-Host ""
Write-Info "Starting project initialization..."
Write-Host ""

# Step 1: Create project directory
Write-Info "[1/8] Creating project directory..."
$PARENT_DIR = Split-Path -Parent (Get-Location)
$PROJECT_DIR = Join-Path $PARENT_DIR $PROJECT_NAME_KEBAB

if (Test-Path $PROJECT_DIR) {
    Write-Error "Directory '$PROJECT_NAME_KEBAB' already exists!"
    exit 1
}

New-Item -ItemType Directory -Path $PROJECT_DIR | Out-Null
Write-Success "Created: $PROJECT_DIR"

# Step 2: Copy template structure
Write-Info "[2/8] Copying template structure..."
$currentDir = Get-Location
Get-ChildItem -Path $currentDir -Recurse | ForEach-Object {
    $targetPath = $_.FullName.Replace($currentDir, $PROJECT_DIR)
    if ($_.PSIsContainer) {
        if (-not (Test-Path $targetPath)) {
            New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
        }
    } else {
        Copy-Item -Path $_.FullName -Destination $targetPath -Force
    }
}
Write-Success "Template structure copied"

# Step 3: Remove initialization scripts from new project
Write-Info "[3/8] Cleaning up initialization scripts..."
Remove-Item -Path (Join-Path $PROJECT_DIR "init-project.sh") -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path $PROJECT_DIR "init-project.ps1") -ErrorAction SilentlyContinue
Remove-Item -Path (Join-Path $PROJECT_DIR "INIT-GUIDE.md") -ErrorAction SilentlyContinue
Write-Success "Initialization scripts removed"

# Step 4: Create directory structure
Write-Info "[4/8] Creating directory structure..."
Set-Location $PROJECT_DIR

# Create AI directories
$aiDirs = @(
    ".ai/context/services",
    ".ai/context/features",
    ".ai/prompts/code-generation",
    ".ai/prompts/testing",
    ".ai/prompts/debugging",
    ".ai/prompts/refactoring",
    ".ai/prompts/documentation",
    ".ai/tools"
)
$aiDirs | ForEach-Object { New-Item -ItemType Directory -Path $_ -Force | Out-Null }

# Create docs directories
$docDirs = @(
    "docs/01-getting-started",
    "docs/02-guides/development",
    "docs/02-guides/deployment",
    "docs/02-guides/operations",
    "docs/03-architecture/decisions",
    "docs/03-architecture/diagrams/c4/01-context",
    "docs/03-architecture/diagrams/c4/02-container",
    "docs/03-architecture/diagrams/c4/03-component",
    "docs/03-architecture/diagrams/c4/04-code",
    "docs/03-architecture/diagrams/sequence",
    "docs/03-architecture/diagrams/data-flow",
    "docs/03-architecture/diagrams/deployment",
    "docs/04-reference/api",
    "docs/04-reference/database",
    "docs/04-reference/configuration",
    "docs/05-product/features",
    "docs/05-product/user-stories",
    "docs/06-project/planning",
    "docs/06-project/meetings",
    "docs/06-project/retrospectives",
    "docs/06-project/metrics"
)
$docDirs | ForEach-Object { New-Item -ItemType Directory -Path $_ -Force | Out-Null }

# Create other directories
$otherDirs = @(
    "templates/service-template",
    "templates/feature-template",
    ".github/workflows",
    ".github/ISSUE_TEMPLATE",
    "scripts/setup",
    "scripts/deployment",
    "scripts/maintenance",
    "scripts/utilities"
)
$otherDirs | ForEach-Object { New-Item -ItemType Directory -Path $_ -Force | Out-Null }

Write-Success "Directory structure created"

# Step 5: Replace placeholders in files
Write-Info "[5/8] Replacing placeholders with project details..."

Get-ChildItem -Path . -Include *.md,*.json,*.yml,*.yaml -Recurse |
    Where-Object { $_.FullName -notmatch '\\node_modules\\' -and $_.FullName -notmatch '\\.git\\' } |
    ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        $content = $content -replace '\$\{PROJECT_NAME\}', $PROJECT_NAME_TITLE
        $content = $content -replace '\$\{PROJECT_NAME_KEBAB\}', $PROJECT_NAME_KEBAB
        $content = $content -replace '\$\{PROJECT_NAME_SNAKE\}', $PROJECT_NAME_SNAKE
        $content = $content -replace '\$\{PROJECT_NAME_PASCAL\}', $PROJECT_NAME_PASCAL
        $content = $content -replace '\{Project Name\}', $PROJECT_NAME_TITLE
        $content = $content -replace '\{project-name\}', $PROJECT_NAME_KEBAB
        $content = $content -replace '\{project_name\}', $PROJECT_NAME_SNAKE
        Set-Content -Path $_.FullName -Value $content -NoNewline
    }

Write-Success "Placeholders replaced"

# Step 6: Initialize git repository
Write-Info "[6/8] Initializing git repository..."
git init | Out-Null
Write-Success "Git repository initialized"

# Step 7: Create initial commit
Write-Info "[7/8] Creating initial commit..."
git add .

$commitDate = Get-Date -Format "yyyy-MM-dd"
$commitMessage = @"
Initial project setup from AI-Driven Template v1.0.0

Project: $PROJECT_NAME_TITLE
Template: AI-Driven Project Template
Generated: $commitDate

This project is structured for AI-driven development with:
- Zero context loss architecture
- Comprehensive documentation
- AI assistant rules and guidelines
- Quality gates and checklists

Next steps:
1. Customize PROJECT-INDEX.md
2. Fill in .ai/context/project-overview.md
3. Update .ai/AI-ASSISTANT-RULES.md
4. Test context loading with AI
5. Start development!
"@

git commit -m $commitMessage | Out-Null
Write-Success "Initial commit created"

# Step 8: Generate summary
Write-Info "[8/8] Generating project summary..."

$quickStartContent = @"
# ${PROJECT_NAME_TITLE} - Quick Start

**Project:** ${PROJECT_NAME_TITLE}
**Created:** $commitDate
**Template:** AI-Driven Project Template v1.0.0

---

## ✅ What's Done

- [x] Project structure created
- [x] Template files copied
- [x] Placeholders replaced
- [x] Git repository initialized
- [x] Initial commit created

---

## 🚀 Next Steps (15 minutes)

### 1. Customize Core Files (10 minutes)

**A. PROJECT-INDEX.md**
``````bash
# Edit this file and fill in:
- Project type and phase
- Technology stack
- Architecture summary
- Current status
``````

**B. .ai/context/project-overview.md**
``````bash
# Fill in all sections:
- Project vision
- Target users
- Architecture
- Technology stack
- Domain model
- Constraints
``````

**C. .ai/AI-ASSISTANT-RULES.md**
``````bash
# Add project-specific rules:
- ALWAYS rules
- NEVER rules
- Architecture constraints
- Code standards
``````

### 2. Test with AI (5 minutes)

``````markdown
Start AI session and paste:

I'm working on ${PROJECT_NAME_TITLE}.

Please load these files:
1. PROJECT-INDEX.md
2. .ai/context/project-overview.md
3. .ai/AI-ASSISTANT-RULES.md

Then confirm you understand:
- Project name and purpose
- Architecture approach
- Key constraints
- Rules to follow
``````

**If AI confirms correctly → Ready to develop! 🎉**

---

## 📂 Project Structure

``````
${PROJECT_NAME_KEBAB}/
├── .ai/                    # AI context & rules
├── docs/                   # Documentation
├── templates/              # Reusable templates
├── .github/                # GitHub integration
├── scripts/                # Automation scripts
├── PROJECT-INDEX.md        # ⭐ Master index (start here)
├── CONTRIBUTING.md         # How to contribute
└── README.md              # Project homepage
``````

---

## 📚 Key Documents

**Must Read:**
1. [PROJECT-INDEX.md](PROJECT-INDEX.md) - Master index
2. [.ai/context/project-overview.md](.ai/context/project-overview.md) - Complete context
3. [.ai/AI-ASSISTANT-RULES.md](.ai/AI-ASSISTANT-RULES.md) - AI rules

**Reference:**
- [CONTEXT-RECOVERY.md](CONTEXT-RECOVERY.md) - Recover context
- [AI-SESSION-GUIDE.md](AI-SESSION-GUIDE.md) - Work with AI
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guide

---

## 💡 Tips

✅ **DO:**
- Customize core files before starting
- Test context loading with AI
- Update docs with code changes
- Keep PROJECT-INDEX.md current

❌ **DON'T:**
- Skip customization step
- Leave placeholder text
- Let docs drift from code
- Ignore context loading

---

## 🎯 Success Criteria

Project setup is complete when:
- [x] Project created from template
- [ ] Core files customized
- [ ] AI successfully loads context
- [ ] First feature planned
- [ ] Ready to start development

---

**Created with:** AI-Driven Project Template
**Next:** Customize core files and test with AI
**Time:** ~15 minutes to full setup
"@

Set-Content -Path "QUICK-START.md" -Value $quickStartContent
Write-Success "Project summary generated"

Write-Host ""
Write-Host "======================================================"
Write-Host "  ✅ Project Initialization Complete!"
Write-Host "======================================================"
Write-Host ""
Write-Success "Project: $PROJECT_NAME_TITLE"
Write-Success "Location: $PROJECT_DIR"
Write-Success "Git: Initialized with initial commit"
Write-Host ""
Write-Info "Next steps:"
Write-Host "  1. cd $PROJECT_NAME_KEBAB"
Write-Host "  2. Read QUICK-START.md"
Write-Host "  3. Customize core files (10 min)"
Write-Host "  4. Test with AI (5 min)"
Write-Host "  5. Start developing! 🚀"
Write-Host ""
Write-Info "Documentation:"
Write-Host "  - PROJECT-INDEX.md - Master index"
Write-Host "  - QUICK-START.md - Next steps"
Write-Host "  - CONTEXT-RECOVERY.md - Context management"
Write-Host ""
Write-Success "Happy coding with AI! 🤖"
Write-Host ""
