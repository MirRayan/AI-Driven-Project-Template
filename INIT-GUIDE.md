# Project Template - Initialization Guide

**Version:** 1.0.0
**Purpose:** How to initialize a new project from this template
**Last Updated:** November 2025

---

## 🎯 **What This Does**

The initialization scripts automate the creation of a new AI-driven project from this template by:

1. ✅ Creating a new project directory with your chosen name
2. ✅ Copying the entire template structure
3. ✅ Replacing all placeholders with your project name
4. ✅ Setting up directory structure for AI context, docs, and automation
5. ✅ Initializing a git repository with initial commit
6. ✅ Generating a quick-start guide for next steps

**Time:** ~2 minutes from start to finish

---

## 🚀 **Quick Start**

### **For Linux/Mac (Bash):**

```bash
# 1. Navigate to template directory
cd /path/to/project-template/

# 2. Make script executable
chmod +x init-project.sh

# 3. Run initialization
./init-project.sh "My Awesome Project"

# 4. Navigate to new project
cd ../my-awesome-project/

# 5. Read the quick start guide
cat QUICK-START.md
```

### **For Windows (PowerShell):**

```powershell
# 1. Navigate to template directory
cd C:\path\to\project-template\

# 2. Run initialization
.\init-project.ps1 -ProjectName "My Awesome Project"

# 3. Navigate to new project
cd ..\my-awesome-project\

# 4. Read the quick start guide
Get-Content QUICK-START.md
```

---

## 📋 **Detailed Usage**

### **Script Parameters**

**Bash (`init-project.sh`):**
```bash
./init-project.sh <project-name>

# Examples:
./init-project.sh "Restaurant Management"
./init-project.sh "ecommerce-platform"
./init-project.sh "My API Service"
```

**PowerShell (`init-project.ps1`):**
```powershell
.\init-project.ps1 -ProjectName <project-name>

# Examples:
.\init-project.ps1 -ProjectName "Restaurant Management"
.\init-project.ps1 -ProjectName "ecommerce-platform"
.\init-project.ps1 -ProjectName "My API Service"
```

### **Project Name Conventions**

The script automatically converts your project name to multiple formats:

| Input | Kebab Case | Snake Case | Pascal Case | Title Case |
|-------|------------|------------|-------------|------------|
| "My Awesome Project" | my-awesome-project | my_awesome_project | MyAwesomeProject | My Awesome Project |
| "restaurant management" | restaurant-management | restaurant_management | RestaurantManagement | Restaurant Management |
| "ecommerce_platform" | ecommerce-platform | ecommerce_platform | EcommercePlatform | Ecommerce Platform |

**Usage in template:**
- **Kebab Case:** Directory names, URLs, git repository names
- **Snake Case:** Database names, environment variables
- **Pascal Case:** Class names, namespaces (in code)
- **Title Case:** Documentation headers, README titles

---

## 🔧 **What Happens During Initialization**

### **Step 1: Create Project Directory (5 seconds)**
- Creates new directory: `../<project-name-kebab>/`
- Validates directory doesn't already exist
- Parent directory must exist

### **Step 2: Copy Template Structure (10 seconds)**
- Copies all files and folders from template
- Preserves directory structure
- Includes hidden files (`.ai/`, `.github/`, `.gitignore`)

### **Step 3: Clean Up Scripts (1 second)**
- Removes `init-project.sh` from new project
- Removes `init-project.ps1` from new project
- Removes `INIT-GUIDE.md` from new project
- **Why:** New project doesn't need initialization scripts

### **Step 4: Create Directory Structure (5 seconds)**

Creates comprehensive directory hierarchy:

```
.ai/
├── context/
│   ├── services/
│   └── features/
├── prompts/
│   ├── code-generation/
│   ├── testing/
│   ├── debugging/
│   ├── refactoring/
│   └── documentation/
└── tools/

docs/
├── 01-getting-started/
├── 02-guides/
│   ├── development/
│   ├── deployment/
│   └── operations/
├── 03-architecture/
│   ├── decisions/
│   └── diagrams/
│       ├── c4/ (4 levels)
│       ├── sequence/
│       ├── data-flow/
│       └── deployment/
├── 04-reference/
│   ├── api/
│   ├── database/
│   └── configuration/
├── 05-product/
│   ├── features/
│   └── user-stories/
└── 06-project/
    ├── planning/
    ├── meetings/
    ├── retrospectives/
    └── metrics/

templates/
├── service-template/
└── feature-template/

.github/
├── workflows/
└── ISSUE_TEMPLATE/

scripts/
├── setup/
├── deployment/
├── maintenance/
└── utilities/
```

### **Step 5: Replace Placeholders (20 seconds)**

Searches all markdown, JSON, and YAML files for placeholders and replaces them:

| Placeholder | Replaced With | Example |
|-------------|---------------|---------|
| `${PROJECT_NAME}` | Title Case | "My Awesome Project" |
| `${PROJECT_NAME_KEBAB}` | Kebab Case | "my-awesome-project" |
| `${PROJECT_NAME_SNAKE}` | Snake Case | "my_awesome_project" |
| `${PROJECT_NAME_PASCAL}` | Pascal Case | "MyAwesomeProject" |
| `{Project Name}` | Title Case | "My Awesome Project" |
| `{project-name}` | Kebab Case | "my-awesome-project" |
| `{project_name}` | Snake Case | "my_awesome_project" |

**Files processed:**
- All `.md` files (documentation)
- All `.json` files (configuration)
- All `.yml` and `.yaml` files (CI/CD, configs)

**Excluded:**
- `node_modules/` directory
- `.git/` directory

### **Step 6: Initialize Git Repository (3 seconds)**
- Runs `git init`
- Creates `.git/` directory
- Sets up git tracking

### **Step 7: Create Initial Commit (5 seconds)**

Creates comprehensive initial commit with message:

```
Initial project setup from AI-Driven Template v1.0.0

Project: [Your Project Name]
Template: AI-Driven Project Template
Generated: [Date]

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
```

### **Step 8: Generate Quick Start Guide (2 seconds)**

Creates `QUICK-START.md` with:
- ✅ What's completed
- 🚀 Next steps (15 minutes)
- 📂 Project structure overview
- 📚 Key documents to read
- 💡 Tips and best practices
- 🎯 Success criteria checklist

---

## ✅ **Verification Checklist**

After initialization completes, verify:

### **Directory Structure:**
- [ ] Project directory created in parent folder
- [ ] All template files copied
- [ ] Directory structure created (`.ai/`, `docs/`, etc.)
- [ ] Init scripts removed from new project

### **Placeholders:**
- [ ] PROJECT-INDEX.md has actual project name (not placeholder)
- [ ] README.md has actual project name
- [ ] All `${PROJECT_NAME}` replaced
- [ ] No `{Project Name}` placeholders remain

### **Git:**
- [ ] `.git/` directory exists
- [ ] Initial commit created
- [ ] Git log shows commit message

### **Quick Start:**
- [ ] `QUICK-START.md` generated
- [ ] Contains correct project name
- [ ] Next steps clearly listed

**Command to verify:**
```bash
# Check placeholders
grep -r "\${PROJECT_NAME}" . --exclude-dir=node_modules --exclude-dir=.git

# Should return no results if all placeholders replaced

# Check git
git log --oneline

# Should show initial commit
```

---

## 🚨 **Troubleshooting**

### **Problem: "Directory already exists" error**

**Cause:** Project directory already exists in parent folder

**Solution:**
```bash
# Option 1: Use different project name
./init-project.sh "My Project v2"

# Option 2: Remove existing directory
rm -rf ../my-project/
./init-project.sh "My Project"

# Option 3: Move existing directory
mv ../my-project/ ../my-project-backup/
./init-project.sh "My Project"
```

### **Problem: "Permission denied" (Bash)**

**Cause:** Script not executable

**Solution:**
```bash
chmod +x init-project.sh
./init-project.sh "My Project"
```

### **Problem: "Execution policy" error (PowerShell)**

**Cause:** PowerShell execution policy blocks scripts

**Solution:**
```powershell
# Option 1: Bypass for this session
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\init-project.ps1 -ProjectName "My Project"

# Option 2: Unblock file
Unblock-File .\init-project.ps1
.\init-project.ps1 -ProjectName "My Project"

# Option 3: Run with bypass flag
powershell -ExecutionPolicy Bypass -File .\init-project.ps1 -ProjectName "My Project"
```

### **Problem: Some placeholders not replaced**

**Cause:** Placeholder format not recognized or file type not processed

**Solution:**
```bash
# Manually find and replace
cd ../my-project/
find . -type f -exec sed -i 's/${PROJECT_NAME}/My Project/g' {} \;

# For PowerShell
Get-ChildItem -Recurse -File | ForEach-Object {
    (Get-Content $_.FullName) -replace '\${PROJECT_NAME}', 'My Project' |
    Set-Content $_.FullName
}
```

### **Problem: Git not initialized**

**Cause:** Git not installed or not in PATH

**Solution:**
```bash
# Check git installation
git --version

# If not installed, install git first, then:
cd ../my-project/
git init
git add .
git commit -m "Initial commit"
```

### **Problem: Script fails partway through**

**Cause:** Various (permissions, disk space, interrupted)

**Solution:**
```bash
# Remove partial project
rm -rf ../my-project/

# Re-run initialization
./init-project.sh "My Project"

# If still fails, check:
# - Available disk space: df -h
# - Write permissions: ls -la ..
# - Error messages in terminal
```

---

## 💡 **Best Practices**

### **Naming Conventions:**

✅ **Good Project Names:**
- "Restaurant Management System"
- "E-Commerce Platform"
- "Customer Portal API"
- "inventory-tracker"
- "user_analytics_service"

❌ **Avoid:**
- Special characters: "My Project! @2024"
- Only numbers: "12345"
- Very long names: "My Super Awesome Amazing Revolutionary Project"
- Reserved words: "system", "admin", "test" (alone)

### **Before Running:**

1. **Backup template if customized:**
   ```bash
   cp -r project-template/ project-template-backup/
   ```

2. **Verify parent directory:**
   ```bash
   pwd  # Should be inside project-template/
   ls .. # Parent directory should exist
   ```

3. **Check available space:**
   ```bash
   df -h .  # Ensure > 100MB available
   ```

### **After Running:**

1. **Immediately customize core files** (10 minutes):
   - PROJECT-INDEX.md
   - .ai/context/project-overview.md
   - .ai/AI-ASSISTANT-RULES.md

2. **Test with AI** (5 minutes):
   - Load context files
   - Verify AI understands project
   - Confirm placeholders replaced

3. **Set up remote repository:**
   ```bash
   git remote add origin <your-repo-url>
   git branch -M main
   git push -u origin main
   ```

4. **Create first branch:**
   ```bash
   git checkout -b feature/initial-setup
   ```

---

## 🎯 **Success Criteria**

Initialization is successful when:

- ✅ New project directory created
- ✅ All files copied from template
- ✅ All placeholders replaced with project name
- ✅ Directory structure complete
- ✅ Git initialized with initial commit
- ✅ QUICK-START.md generated
- ✅ No errors in terminal output
- ✅ Can navigate to project directory
- ✅ PROJECT-INDEX.md shows correct project name
- ✅ Ready to customize core files

---

## 📚 **What to Do Next**

After successful initialization:

### **Immediate (15 minutes):**
1. Read `QUICK-START.md` in new project
2. Customize `PROJECT-INDEX.md`
3. Fill in `.ai/context/project-overview.md`
4. Update `.ai/AI-ASSISTANT-RULES.md`
5. Test context loading with AI

### **First Session (1 hour):**
1. Create first architecture decision (ADR-001)
2. Plan technology stack
3. Design high-level architecture
4. Create system context diagram
5. Document initial decisions

### **First Week:**
1. Complete all Tier 1 documentation
2. Set up development environment
3. Configure CI/CD pipeline
4. Create first service/feature
5. Validate template works for your project

---

## 🔄 **Using Template Multiple Times**

The template can be reused unlimited times:

```bash
# Project 1
./init-project.sh "E-Commerce Platform"
cd ../e-commerce-platform/
# ... customize ...

# Project 2
cd ../project-template/
./init-project.sh "User Analytics Service"
cd ../user-analytics-service/
# ... customize ...

# Project 3
cd ../project-template/
./init-project.sh "Inventory Tracker"
cd ../inventory-tracker/
# ... customize ...
```

**Each project is independent with its own:**
- Directory
- Git repository
- Customized documentation
- Project-specific context

---

## 📊 **Script Performance**

Expected timing on typical hardware:

| Step | Time | Notes |
|------|------|-------|
| Directory creation | 1s | Instant |
| Copy files | 5-15s | Depends on template size |
| Clean up | 1s | Delete 3 files |
| Directory structure | 2s | ~50 directories |
| Replace placeholders | 10-30s | Depends on file count |
| Git init | 1s | Instant |
| Initial commit | 2s | All files |
| Generate summary | 1s | One file |
| **Total** | **25-60s** | ~1 minute average |

---

## 🎓 **Advanced Usage**

### **Custom Parent Directory:**

**Bash:**
```bash
# Edit script line 100
PROJECT_DIR="/custom/path/$PROJECT_NAME_KEBAB"
```

**PowerShell:**
```powershell
# Edit script line 95
$PROJECT_DIR = "C:\custom\path\$PROJECT_NAME_KEBAB"
```

### **Batch Initialization:**

Create multiple projects at once:

**Bash:**
```bash
#!/bin/bash
projects=(
    "Project Alpha"
    "Project Beta"
    "Project Gamma"
)

for project in "${projects[@]}"; do
    ./init-project.sh "$project"
done
```

**PowerShell:**
```powershell
$projects = @(
    "Project Alpha",
    "Project Beta",
    "Project Gamma"
)

foreach ($project in $projects) {
    .\init-project.ps1 -ProjectName $project
}
```

### **Additional Customization:**

Add custom steps to script after line 186 (bash) or 252 (PowerShell):

```bash
# Example: Create custom config file
cat > "$PROJECT_DIR/config.json" << EOF
{
  "projectName": "$PROJECT_NAME_TITLE",
  "createdAt": "$(date +%Y-%m-%d)",
  "template": "ai-driven-template-v1.0.0"
}
EOF
```

---

## 📞 **Support**

**Issues:**
- Script fails: Check troubleshooting section
- Placeholders remain: Run manual replacement
- Git errors: Check git installation

**Questions:**
- Read TEMPLATE-USAGE.md for detailed template guide
- Read TEMPLATE-SUMMARY.md for quick overview
- Check example projects for reference

**Improvements:**
- Document what could be better
- Update script with enhancements
- Share improvements with team

---

**Script Version:** 1.0.0
**Template Version:** 1.0.0
**Last Updated:** November 2025
**Maintained By:** Template Community

**Ready to initialize your first AI-driven project! 🚀**
