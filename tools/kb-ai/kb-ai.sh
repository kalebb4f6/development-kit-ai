#!/usr/bin/env bash
#
# kb-ai - Local AI bootstrapper CLI
# A project-local CLI tool for AI-assisted development
#

set -euo pipefail

VERSION="1.0.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Try to find project root (look for .ai or .git directory)
find_project_root() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/.ai" ]] || [[ -d "$dir/.git" ]]; then
            echo "$dir"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    echo "$PWD"
}

PROJECT_ROOT="$(find_project_root)"
AI_DIR="$PROJECT_ROOT/.ai"
CLAUDE_DIR="$PROJECT_ROOT/.claude"
FEATURES_DIR="$PROJECT_ROOT/features"

OLLAMA_API="http://localhost:11434/api"
DEFAULT_MODEL="qwen2.5:7b"
MODELS=("qwen2.5:7b" "llama3.1:8b" "deepseek-coder:6.7b")

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_step() { echo -e "${CYAN}[STEP]${NC} $1"; }

#######################################
# SETUP COMMAND
#######################################
cmd_setup() {
    echo ""
    echo "========================================="
    echo "       kb-ai Setup"
    echo "========================================="
    echo ""

    # Check if Ollama exists
    log_step "Checking for Ollama..."
    if ! command -v ollama &> /dev/null; then
        log_error "Ollama not found!"
        echo ""
        echo "Please install Ollama first:"
        echo "  curl -fsSL https://ollama.com/install.sh | sh"
        echo ""
        exit 1
    fi
    log_success "Ollama found: $(which ollama)"

    # Try to start Ollama service
    log_step "Starting Ollama service (best effort)..."
    if pgrep -x "ollama" > /dev/null; then
        log_success "Ollama is already running"
    else
        ollama serve &> /dev/null &
        sleep 2
        if pgrep -x "ollama" > /dev/null; then
            log_success "Ollama service started"
        else
            log_warn "Could not start Ollama service automatically"
            echo "  Please start it manually: ollama serve"
        fi
    fi

    # Pull models
    echo ""
    log_step "Pulling models..."
    for model in "${MODELS[@]}"; do
        echo ""
        log_info "Pulling $model..."
        if ollama pull "$model"; then
            log_success "Model $model ready"
        else
            log_warn "Failed to pull $model (continuing...)"
        fi
    done

    # Sanity check
    echo ""
    log_step "Running sanity check..."
    if curl -s "$OLLAMA_API/tags" > /dev/null 2>&1; then
        log_success "Ollama API is responding"
        echo ""
        echo "Available models:"
        curl -s "$OLLAMA_API/tags" | grep -o '"name":"[^"]*"' | sed 's/"name":"//;s/"//' | while read -r model; do
            echo "  - $model"
        done
    else
        log_error "Ollama API is not responding at $OLLAMA_API"
        echo "  Make sure Ollama is running: ollama serve"
        exit 1
    fi

    echo ""
    log_success "Setup complete!"
    echo ""
}

#######################################
# INIT-KIT COMMAND
#######################################
cmd_init_kit() {
    echo ""
    echo "========================================="
    echo "       kb-ai Init Kit"
    echo "========================================="
    echo ""

    # Create directories
    log_step "Creating directories..."
    mkdir -p "$AI_DIR/commands"
    mkdir -p "$FEATURES_DIR"
    log_success "Directories created"

    # Global header for all command files
    GLOBAL_HEADER='You already analyzed this repository using /init.
Use the existing architecture, layering, and conventions from THIS repo.
Reference concrete projects/folders/layers when proposing changes.
If something is unclear, do NOT guess — present options and state what must be verified.'

    # Create/update .ai/README.md
    log_step "Creating .ai/README.md..."
    safe_write_file "$AI_DIR/README.md" "$(cat <<'READMEEOF'
# AI Development Kit

This directory contains AI-assisted development tools and prompts for this repository.

## Structure

```
.ai/
├── README.md              # This file
└── commands/              # Agent kit prompts
    ├── 00-repo-architecture-summary.md
    ├── 01-analyze-feature.md
    ├── 02-plan-feature.md
    ├── 03-tech-design.md
    ├── 04-implementation-plan.md
    ├── 05-review-and-critique.md
    └── 06-final-execution-output.md
```

## Usage

These commands are designed to work with AI assistants (Claude, Cursor, etc.) that have access to the codebase.

### Workflow

1. **Architecture Summary** (`00-repo-architecture-summary.md`)
   Run `/init` first to analyze the repository structure.

2. **Analyze Feature** (`01-analyze-feature.md`)
   Break down a feature request into technical requirements.

3. **Plan Feature** (`02-plan-feature.md`)
   Create an implementation plan with steps and dependencies.

4. **Tech Design** (`03-tech-design.md`)
   Design the technical architecture for the feature.

5. **Implementation Plan** (`04-implementation-plan.md`)
   Detailed step-by-step implementation guide.

6. **Review and Critique** (`05-review-and-critique.md`)
   Review code or design for issues and improvements.

7. **Final Execution Output** (`06-final-execution-output.md`)
   Generate the final deliverable with all code and documentation.

## Features Directory

The `features/` directory contains feature-specific analysis and plans generated by `kb-ai feature run`.

Each feature gets its own subdirectory with:
- `01-analysis.md` - Feature analysis
- `02-plan.md` - Implementation plan
- `03-review.md` - Design review
- `04-runbook.md` - Execution runbook

## Local AI Setup

To use local AI models with Ollama:

```bash
# Install kb-ai
./scripts/kb-ai install

# Setup Ollama and models
./bin/kb-ai setup

# Run feature analysis
./bin/kb-ai feature run --title "My Feature" --input feature.txt
```
READMEEOF
)"

    # Create command files
    log_step "Creating command files..."

    # 00-repo-architecture-summary.md
    safe_write_file "$AI_DIR/commands/00-repo-architecture-summary.md" "$(cat <<EOF
$GLOBAL_HEADER

---

# Repo Architecture Summary

## Purpose
Generate a comprehensive summary of the repository architecture to serve as context for all subsequent AI-assisted tasks.

## Instructions
Analyze the repository and produce a structured summary covering:

## Output Sections

### 1. Overview
- Repository purpose and main functionality
- Primary language(s) and framework(s)
- Build system and package manager

### 2. Directory Structure
- Top-level directories and their purposes
- Key configuration files
- Entry points

### 3. Architecture Patterns
- Design patterns used (MVC, Clean Architecture, etc.)
- Layering strategy
- Dependency injection approach

### 4. Key Components
- Core modules/packages
- External dependencies
- Internal libraries

### 5. Data Flow
- How data moves through the system
- API boundaries
- State management

### 6. Testing Strategy
- Test organization
- Testing frameworks
- Coverage approach

### 7. Build & Deploy
- Build commands
- Environment configuration
- Deployment targets

### 8. Conventions
- Naming conventions
- File organization patterns
- Code style guidelines

## Format
Output as structured markdown with clear headings and bullet points.
EOF
)"

    # 01-analyze-feature.md
    safe_write_file "$AI_DIR/commands/01-analyze-feature.md" "$(cat <<EOF
$GLOBAL_HEADER

---

# Analyze Feature

## Purpose
Break down a feature request into technical requirements and identify affected areas of the codebase.

## Input
Provide the feature description or user story.

## Output Sections

### 1. Feature Summary
- One-paragraph description of the feature
- Primary user benefit

### 2. Technical Requirements
- Functional requirements (what it must do)
- Non-functional requirements (performance, security, etc.)
- Constraints and limitations

### 3. Affected Areas
- Files/modules that need modification
- New files/modules to create
- Dependencies to add or update

### 4. Data Changes
- Database schema changes
- API contract changes
- State management changes

### 5. Integration Points
- External services affected
- Internal APIs to use or modify
- Event/message flows

### 6. Risks & Unknowns
- Technical risks
- Questions to clarify
- Assumptions made

### 7. Acceptance Criteria
- Testable conditions for completion
- Edge cases to handle

## Format
Output as structured markdown with clear sections.
EOF
)"

    # 02-plan-feature.md
    safe_write_file "$AI_DIR/commands/02-plan-feature.md" "$(cat <<EOF
$GLOBAL_HEADER

---

# Plan Feature

## Purpose
Create a detailed implementation plan with ordered steps and dependencies.

## Input
Feature analysis from the previous step.

## Output Sections

### 1. Implementation Overview
- High-level approach
- Key decisions made

### 2. Prerequisites
- Required setup or configuration
- Dependencies to install
- Environment requirements

### 3. Implementation Steps
For each step:
- **Step N: [Title]**
  - Description
  - Files to modify/create
  - Dependencies on other steps
  - Estimated complexity (Low/Medium/High)

### 4. Testing Plan
- Unit tests to write
- Integration tests needed
- Manual testing checklist

### 5. Rollout Strategy
- Feature flag requirements
- Migration steps
- Rollback plan

### 6. Documentation
- Code documentation needs
- User documentation updates
- API documentation changes

## Format
Output as structured markdown with numbered steps.
EOF
)"

    # 03-tech-design.md
    safe_write_file "$AI_DIR/commands/03-tech-design.md" "$(cat <<EOF
$GLOBAL_HEADER

---

# Technical Design

## Purpose
Design the technical architecture for implementing a feature.

## Input
Feature analysis and implementation plan.

## Output Sections

### 1. Design Overview
- Architecture diagram (ASCII or description)
- Component responsibilities
- Data flow

### 2. API Design
- New endpoints or methods
- Request/response schemas
- Error handling

### 3. Data Model
- New entities or modifications
- Relationships
- Indexes and constraints

### 4. Component Design
For each new/modified component:
- **[Component Name]**
  - Purpose
  - Public interface
  - Internal structure
  - Dependencies

### 5. Error Handling
- Error types
- Recovery strategies
- User-facing messages

### 6. Security Considerations
- Authentication/authorization
- Input validation
- Data protection

### 7. Performance Considerations
- Caching strategy
- Query optimization
- Resource limits

### 8. Alternatives Considered
- Other approaches evaluated
- Trade-offs
- Why this approach was chosen

## Format
Output as structured markdown with diagrams where helpful.
EOF
)"

    # 04-implementation-plan.md
    safe_write_file "$AI_DIR/commands/04-implementation-plan.md" "$(cat <<EOF
$GLOBAL_HEADER

---

# Implementation Plan

## Purpose
Provide a step-by-step implementation guide with code locations and specific changes.

## Input
Technical design document.

## Output Sections

### 1. Setup
- Branch naming
- Environment setup
- Dependencies to install

### 2. Implementation Order
Ordered list of changes:

#### Phase 1: [Foundation]
- [ ] **File:** \`path/to/file\`
  - Change description
  - Code snippet or pseudocode
  - Tests to add

#### Phase 2: [Core Logic]
- [ ] **File:** \`path/to/file\`
  - Change description
  - Code snippet or pseudocode
  - Tests to add

#### Phase 3: [Integration]
- [ ] **File:** \`path/to/file\`
  - Change description
  - Code snippet or pseudocode
  - Tests to add

### 3. Testing Checklist
- [ ] Unit tests for [component]
- [ ] Integration tests for [flow]
- [ ] Manual testing for [scenario]

### 4. PR Checklist
- [ ] Code follows project conventions
- [ ] Tests pass
- [ ] Documentation updated
- [ ] No security issues
- [ ] Performance acceptable

## Format
Output as markdown with checkboxes for tracking.
EOF
)"

    # 05-review-and-critique.md
    safe_write_file "$AI_DIR/commands/05-review-and-critique.md" "$(cat <<EOF
$GLOBAL_HEADER

---

# Review and Critique

## Purpose
Review code, design, or implementation for issues, improvements, and best practices.

## Input
Code, design document, or implementation to review.

## Output Sections

### 1. Summary
- Overall assessment
- Key strengths
- Primary concerns

### 2. Critical Issues
Issues that must be fixed:
- **[Issue Title]**
  - Location: \`file:line\`
  - Problem: Description
  - Impact: Why it matters
  - Fix: Suggested solution

### 3. Improvements
Recommended but not blocking:
- **[Improvement Title]**
  - Location: \`file:line\`
  - Current: What exists
  - Suggested: Better approach
  - Benefit: Why it's better

### 4. Security Review
- Authentication/authorization issues
- Input validation gaps
- Data exposure risks

### 5. Performance Review
- Potential bottlenecks
- Resource usage concerns
- Optimization opportunities

### 6. Code Quality
- Readability issues
- Maintainability concerns
- Testing gaps

### 7. Architecture Alignment
- Consistency with project patterns
- Separation of concerns
- Dependency management

### 8. Positive Highlights
- Well-implemented aspects
- Good patterns used
- Effective solutions

## Format
Output as structured markdown with severity indicators.
EOF
)"

    # 06-final-execution-output.md
    safe_write_file "$AI_DIR/commands/06-final-execution-output.md" "$(cat <<EOF
$GLOBAL_HEADER

---

# Final Execution Output

## Purpose
Generate the complete, ready-to-use implementation with all code and documentation.

## Input
Approved implementation plan and design.

## Output Sections

### 1. Summary
- What was implemented
- Key decisions made
- Any deviations from plan

### 2. Files Created/Modified
List all files with their complete content:

#### \`path/to/file.ext\`
\`\`\`language
// Complete file content here
\`\`\`

### 3. Database Migrations
If applicable:
\`\`\`sql
-- Migration content
\`\`\`

### 4. Configuration Changes
Environment variables, config files, etc.

### 5. Commands to Run
\`\`\`bash
# Installation commands
# Migration commands
# Build commands
\`\`\`

### 6. Testing Instructions
How to verify the implementation works.

### 7. Documentation
Updated documentation content.

### 8. Rollback Instructions
How to undo changes if needed.

## Format
Output as complete, copy-paste ready content.
EOF
)"

    # Mirror to .claude/commands if it exists
    if [[ -d "$CLAUDE_DIR" ]]; then
        log_step "Mirroring commands to .claude/commands/..."
        mkdir -p "$CLAUDE_DIR/commands"

        # Copy each command file to claude format (without number prefix)
        safe_write_file "$CLAUDE_DIR/commands/repo-architecture-summary.md" "$(cat "$AI_DIR/commands/00-repo-architecture-summary.md")"
        safe_write_file "$CLAUDE_DIR/commands/analyze-feature.md" "$(cat "$AI_DIR/commands/01-analyze-feature.md")"
        safe_write_file "$CLAUDE_DIR/commands/plan-feature.md" "$(cat "$AI_DIR/commands/02-plan-feature.md")"
        safe_write_file "$CLAUDE_DIR/commands/tech-design.md" "$(cat "$AI_DIR/commands/03-tech-design.md")"
        safe_write_file "$CLAUDE_DIR/commands/implementation-plan.md" "$(cat "$AI_DIR/commands/04-implementation-plan.md")"
        safe_write_file "$CLAUDE_DIR/commands/review-and-critique.md" "$(cat "$AI_DIR/commands/05-review-and-critique.md")"
        safe_write_file "$CLAUDE_DIR/commands/final-execution-output.md" "$(cat "$AI_DIR/commands/06-final-execution-output.md")"

        log_success "Commands mirrored to .claude/commands/"
    fi

    echo ""
    log_success "Init kit complete!"
    echo ""
    echo "Created/updated:"
    echo "  - $AI_DIR/README.md"
    echo "  - $AI_DIR/commands/*.md"
    if [[ -d "$CLAUDE_DIR" ]]; then
        echo "  - $CLAUDE_DIR/commands/*.md"
    fi
    echo "  - $FEATURES_DIR/"
    echo ""
}

# Safe file write with backup
safe_write_file() {
    local filepath="$1"
    local content="$2"

    if [[ -f "$filepath" ]]; then
        # Create backup
        cp "$filepath" "${filepath}.bak"
        log_warn "Backed up existing: ${filepath}.bak"

        # Write new content
        echo "$content" > "${filepath}.new"
        log_info "Created: ${filepath}.new (review and rename)"
    else
        echo "$content" > "$filepath"
        log_success "Created: $filepath"
    fi
}

#######################################
# FEATURE COMMAND
#######################################
cmd_feature() {
    local subcmd="${1:-}"
    shift || true

    case "$subcmd" in
        run)
            cmd_feature_run "$@"
            ;;
        *)
            echo "Usage: kb-ai feature run --title \"...\" --input file.txt [--model model]"
            exit 1
            ;;
    esac
}

cmd_feature_run() {
    local title=""
    local input_file=""
    local model="$DEFAULT_MODEL"

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --title)
                title="$2"
                shift 2
                ;;
            --input)
                input_file="$2"
                shift 2
                ;;
            --model)
                model="$2"
                shift 2
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done

    # Validate
    if [[ -z "$title" ]]; then
        log_error "Missing --title"
        exit 1
    fi
    if [[ -z "$input_file" ]]; then
        log_error "Missing --input"
        exit 1
    fi
    if [[ ! -f "$input_file" ]]; then
        log_error "Input file not found: $input_file"
        exit 1
    fi

    # Create slug from title
    local slug
    slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//')

    local feature_dir="$FEATURES_DIR/$slug"
    mkdir -p "$feature_dir"

    local input_content
    input_content=$(cat "$input_file")

    echo ""
    echo "========================================="
    echo "       Feature: $title"
    echo "========================================="
    echo ""
    log_info "Model: $model"
    log_info "Output: $feature_dir/"
    echo ""

    # Check Ollama is running
    if ! curl -s "$OLLAMA_API/tags" > /dev/null 2>&1; then
        log_error "Ollama API not responding. Run 'kb-ai setup' first."
        exit 1
    fi

    # Generate each document
    log_step "Generating 01-analysis.md..."
    generate_document "$model" "$input_content" "analysis" > "$feature_dir/01-analysis.md"
    log_success "Created 01-analysis.md"

    log_step "Generating 02-plan.md..."
    generate_document "$model" "$input_content" "plan" > "$feature_dir/02-plan.md"
    log_success "Created 02-plan.md"

    log_step "Generating 03-review.md..."
    generate_document "$model" "$input_content" "review" > "$feature_dir/03-review.md"
    log_success "Created 03-review.md"

    log_step "Generating 04-runbook.md..."
    generate_document "$model" "$input_content" "runbook" > "$feature_dir/04-runbook.md"
    log_success "Created 04-runbook.md"

    echo ""
    log_success "Feature analysis complete!"
    echo ""
    echo "Output files:"
    echo "  - $feature_dir/01-analysis.md"
    echo "  - $feature_dir/02-plan.md"
    echo "  - $feature_dir/03-review.md"
    echo "  - $feature_dir/04-runbook.md"
    echo ""
}

generate_document() {
    local model="$1"
    local input="$2"
    local doc_type="$3"

    local prompt=""
    case "$doc_type" in
        analysis)
            prompt="You are a senior software engineer. Analyze this feature request and provide a technical analysis including: 1) Feature Summary, 2) Technical Requirements, 3) Affected Areas, 4) Data Changes, 5) Integration Points, 6) Risks & Unknowns, 7) Acceptance Criteria. Be specific and actionable.

Feature Request:
$input"
            ;;
        plan)
            prompt="You are a senior software engineer. Create a detailed implementation plan for this feature including: 1) Implementation Overview, 2) Prerequisites, 3) Step-by-step Implementation (with files and changes), 4) Testing Plan, 5) Rollout Strategy. Be specific about file paths and code changes.

Feature Request:
$input"
            ;;
        review)
            prompt="You are a senior software engineer doing a design review. Review this feature proposal and provide: 1) Summary Assessment, 2) Potential Issues, 3) Suggested Improvements, 4) Security Considerations, 5) Performance Considerations, 6) Questions to Clarify. Be constructive and specific.

Feature Request:
$input"
            ;;
        runbook)
            prompt="You are a senior software engineer. Create an execution runbook for implementing this feature including: 1) Setup Commands, 2) Implementation Checklist, 3) Testing Commands, 4) Deployment Steps, 5) Verification Steps, 6) Rollback Procedure. Make it copy-paste ready.

Feature Request:
$input"
            ;;
    esac

    # Call Ollama API
    local response
    response=$(curl -s "$OLLAMA_API/chat" \
        -H "Content-Type: application/json" \
        -d "$(jq -n \
            --arg model "$model" \
            --arg prompt "$prompt" \
            '{
                model: $model,
                messages: [{role: "user", content: $prompt}],
                stream: false
            }')")

    # Extract content from response
    echo "$response" | jq -r '.message.content // "Error generating content"'
}

#######################################
# MAIN
#######################################
show_help() {
    echo "kb-ai v$VERSION - Local AI bootstrapper CLI"
    echo ""
    echo "Usage: kb-ai <command> [options]"
    echo ""
    echo "Commands:"
    echo "  setup       Check Ollama, pull models, run sanity check"
    echo "  init-kit    Create/update .ai/ directory with command prompts"
    echo "  feature     Feature analysis commands"
    echo ""
    echo "Feature Commands:"
    echo "  feature run --title \"...\" --input file.txt [--model model]"
    echo ""
    echo "Options:"
    echo "  --help, -h     Show this help"
    echo "  --version, -v  Show version"
    echo ""
    echo "Examples:"
    echo "  kb-ai setup"
    echo "  kb-ai init-kit"
    echo "  kb-ai feature run --title \"User Auth\" --input auth.txt"
    echo "  kb-ai feature run --title \"API\" --input api.txt --model llama3.1:8b"
    echo ""
}

main() {
    case "${1:-}" in
        setup)
            cmd_setup
            ;;
        init-kit)
            cmd_init_kit
            ;;
        feature)
            shift
            cmd_feature "$@"
            ;;
        --help|-h|help)
            show_help
            ;;
        --version|-v)
            echo "kb-ai v$VERSION"
            ;;
        "")
            show_help
            ;;
        *)
            log_error "Unknown command: $1"
            echo ""
            show_help
            exit 1
            ;;
    esac
}

main "$@"
