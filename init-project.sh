#!/bin/bash

# AI-Driven Project Template - Initialization Script
# Version: 1.0.0
# Usage: ./init-project.sh <project-name>

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Function to convert project name to different formats
convert_name() {
    local name=$1
    local format=$2

    case $format in
        "kebab")
            echo "$name" | tr '[:upper:]' '[:lower:]' | tr ' _' '--'
            ;;
        "snake")
            echo "$name" | tr '[:upper:]' '[:lower:]' | tr ' -' '__'
            ;;
        "pascal")
            echo "$name" | sed -r 's/(^|[_ -])([a-z])/\U\2/g' | tr -d ' _-'
            ;;
        "title")
            echo "$name" | sed 's/.*/\L&/; s/[a-z]*/\u&/g'
            ;;
        *)
            echo "$name"
            ;;
    esac
}

# Check if project name is provided
if [ -z "$1" ]; then
    print_error "Project name is required!"
    echo ""
    echo "Usage: ./init-project.sh <project-name>"
    echo ""
    echo "Examples:"
    echo "  ./init-project.sh my-awesome-app"
    echo "  ./init-project.sh \"My Awesome App\""
    echo "  ./init-project.sh ecommerce-platform"
    exit 1
fi

PROJECT_NAME_RAW="$1"
PROJECT_NAME_KEBAB=$(convert_name "$PROJECT_NAME_RAW" "kebab")
PROJECT_NAME_SNAKE=$(convert_name "$PROJECT_NAME_RAW" "snake")
PROJECT_NAME_PASCAL=$(convert_name "$PROJECT_NAME_RAW" "pascal")
PROJECT_NAME_TITLE=$(convert_name "$PROJECT_NAME_RAW" "title")

echo ""
echo "======================================================"
echo "  AI-Driven Project Template Initialization"
echo "======================================================"
echo ""
print_info "Project Name: $PROJECT_NAME_TITLE"
print_info "Directory: $PROJECT_NAME_KEBAB"
echo ""

# Confirm with user
read -p "$(echo -e ${YELLOW}Create project with these names? [y/N]:${NC} )" -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_warning "Initialization cancelled."
    exit 0
fi

echo ""
print_info "Starting project initialization..."
echo ""

# Step 1: Create project directory
print_info "[1/8] Creating project directory..."
PARENT_DIR=$(dirname "$(pwd)")
PROJECT_DIR="$PARENT_DIR/$PROJECT_NAME_KEBAB"

if [ -d "$PROJECT_DIR" ]; then
    print_error "Directory '$PROJECT_NAME_KEBAB' already exists!"
    exit 1
fi

mkdir -p "$PROJECT_DIR"
print_success "Created: $PROJECT_DIR"

# Step 2: Copy template structure
print_info "[2/8] Copying template structure..."
cp -r "$(pwd)"/* "$PROJECT_DIR/" 2>/dev/null || true
cp -r "$(pwd)"/.[!.]* "$PROJECT_DIR/" 2>/dev/null || true
print_success "Template structure copied"

# Step 3: Remove initialization scripts from new project
print_info "[3/8] Cleaning up initialization scripts..."
rm -f "$PROJECT_DIR/init-project.sh"
rm -f "$PROJECT_DIR/init-project.ps1"
rm -f "$PROJECT_DIR/INIT-GUIDE.md"
print_success "Initialization scripts removed"

# Step 4: Create directory structure
print_info "[4/8] Creating directory structure..."
cd "$PROJECT_DIR"

# Create AI directories
mkdir -p .ai/{context/{services,features},prompts/{code-generation,testing,debugging,refactoring,documentation},tools}

# Create docs directories
mkdir -p docs/{01-getting-started,02-guides/{development,deployment,operations},03-architecture/{decisions,diagrams/{c4/{01-context,02-container,03-component,04-code},sequence,data-flow,deployment}},04-reference/{api,database,configuration},05-product/{features,user-stories},06-project/{planning,meetings,retrospectives,metrics}}

# Create other directories
mkdir -p templates/{service-template,feature-template}
mkdir -p .github/{workflows,ISSUE_TEMPLATE}
mkdir -p scripts/{setup,deployment,maintenance,utilities}

print_success "Directory structure created"

# Step 5: Replace placeholders in files
print_info "[5/8] Replacing placeholders with project details..."

# Find all markdown files and replace placeholders
find . -type f \( -name "*.md" -o -name "*.json" -o -name "*.yml" -o -name "*.yaml" \) ! -path "*/node_modules/*" ! -path "*/.git/*" -exec sed -i.bak \
    -e "s/\${PROJECT_NAME}/$PROJECT_NAME_TITLE/g" \
    -e "s/\${PROJECT_NAME_KEBAB}/$PROJECT_NAME_KEBAB/g" \
    -e "s/\${PROJECT_NAME_SNAKE}/$PROJECT_NAME_SNAKE/g" \
    -e "s/\${PROJECT_NAME_PASCAL}/$PROJECT_NAME_PASCAL/g" \
    -e "s/{Project Name}/$PROJECT_NAME_TITLE/g" \
    -e "s/{project-name}/$PROJECT_NAME_KEBAB/g" \
    -e "s/{project_name}/$PROJECT_NAME_SNAKE/g" \
    {} \;

# Remove backup files
find . -name "*.bak" -type f -delete

print_success "Placeholders replaced"

# Step 6: Initialize git repository
print_info "[6/8] Initializing git repository..."
git init
print_success "Git repository initialized"

# Step 7: Create initial commit
print_info "[7/8] Creating initial commit..."
git add .
git commit -m "Initial project setup from AI-Driven Template v1.0.0

Project: $PROJECT_NAME_TITLE
Template: AI-Driven Project Template
Generated: $(date +%Y-%m-%d)

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
"
print_success "Initial commit created"

# Step 8: Generate summary
print_info "[8/8] Generating project summary..."

cat > QUICK-START.md << EOF
# ${PROJECT_NAME_TITLE} - Quick Start

**Project:** ${PROJECT_NAME_TITLE}
**Created:** $(date +%Y-%m-%d)
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
\`\`\`bash
# Edit this file and fill in:
- Project type and phase
- Technology stack
- Architecture summary
- Current status
\`\`\`

**B. .ai/context/project-overview.md**
\`\`\`bash
# Fill in all sections:
- Project vision
- Target users
- Architecture
- Technology stack
- Domain model
- Constraints
\`\`\`

**C. .ai/AI-ASSISTANT-RULES.md**
\`\`\`bash
# Add project-specific rules:
- ALWAYS rules
- NEVER rules
- Architecture constraints
- Code standards
\`\`\`

### 2. Test with AI (5 minutes)

\`\`\`markdown
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
\`\`\`

**If AI confirms correctly → Ready to develop! 🎉**

---

## 📂 Project Structure

\`\`\`
${PROJECT_NAME_KEBAB}/
├── .ai/                    # AI context & rules
├── docs/                   # Documentation
├── templates/              # Reusable templates
├── .github/                # GitHub integration
├── scripts/                # Automation scripts
├── PROJECT-INDEX.md        # ⭐ Master index (start here)
├── CONTRIBUTING.md         # How to contribute
└── README.md              # Project homepage
\`\`\`

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
EOF

print_success "Project summary generated"

echo ""
echo "======================================================"
echo "  ✅ Project Initialization Complete!"
echo "======================================================"
echo ""
print_success "Project: $PROJECT_NAME_TITLE"
print_success "Location: $PROJECT_DIR"
print_success "Git: Initialized with initial commit"
echo ""
print_info "Next steps:"
echo "  1. cd $PROJECT_NAME_KEBAB"
echo "  2. Read QUICK-START.md"
echo "  3. Customize core files (10 min)"
echo "  4. Test with AI (5 min)"
echo "  5. Start developing! 🚀"
echo ""
print_info "Documentation:"
echo "  - PROJECT-INDEX.md - Master index"
echo "  - QUICK-START.md - Next steps"
echo "  - CONTEXT-RECOVERY.md - Context management"
echo ""
print_success "Happy coding with AI! 🤖"
echo ""
