#!/bin/bash

# AI Coding Setup - Automated Installation Script
# For Mac/Linux systems
# Version: 1.0.0

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Setup directories
SETUP_DIR="$HOME/.ai-coding-setup"
BIN_DIR="$SETUP_DIR/bin"
CONFIG_DIR="$SETUP_DIR/config"
PROMPTS_DIR="$CONFIG_DIR/prompts"
TEMPLATES_DIR="$SETUP_DIR/templates"

# Print colored message
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

print_header() {
    echo ""
    print_message "$BLUE" "=========================================="
    print_message "$BLUE" "$1"
    print_message "$BLUE" "=========================================="
    echo ""
}

print_success() {
    print_message "$GREEN" "✓ $1"
}

print_error() {
    print_message "$RED" "✗ $1"
}

print_warning() {
    print_message "$YELLOW" "⚠ $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Create directory structure
create_directories() {
    print_header "Creating Directory Structure"
    
    mkdir -p "$BIN_DIR"
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$PROMPTS_DIR"
    mkdir -p "$TEMPLATES_DIR"
    
    print_success "Directories created at $SETUP_DIR"
}

# Check prerequisites
check_prerequisites() {
    print_header "Checking Prerequisites"
    
    local missing_deps=()
    
    # Check Python
    if command_exists python3; then
        PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
        print_success "Python $PYTHON_VERSION found"
    else
        missing_deps+=("Python 3.8+")
    fi
    
    # Check Git
    if command_exists git; then
        GIT_VERSION=$(git --version | cut -d' ' -f3)
        print_success "Git $GIT_VERSION found"
    else
        missing_deps+=("Git")
    fi
    
    # Check pip
    if command_exists pip3; then
        print_success "pip3 found"
    else
        missing_deps+=("pip3")
    fi
    
    # Check if VS Code is installed
    if command_exists code; then
        print_success "VS Code found"
    else
        print_warning "VS Code not found - you'll need to install Kilo Code extension manually"
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_error "Missing required dependencies:"
        for dep in "${missing_deps[@]}"; do
            echo "  - $dep"
        done
        echo ""
        echo "Please install missing dependencies and run this script again."
        exit 1
    fi
    
    print_success "All prerequisites met!"
}

# Install Aider
install_aider() {
    print_header "Installing Aider"

    # First, upgrade pip, setuptools, and wheel to avoid build issues
    print_message "$YELLOW" "Upgrading pip, setuptools, and wheel..."
    pip3 install --upgrade --user pip setuptools wheel

    if command_exists aider; then
        print_warning "Aider already installed, upgrading..."
        pip3 install --upgrade --user aider-chat
    else
        pip3 install --user aider-chat
    fi

    print_success "Aider installed successfully"
}

# Get OpenRouter API Key
get_api_key() {
    print_header "OpenRouter API Key Setup"
    
    echo "Get your free API key from: https://openrouter.ai/keys"
    echo ""
    read -p "Enter your OpenRouter API key (starts with sk-or-v1-): " API_KEY
    
    if [[ ! $API_KEY =~ ^sk-or-v1- ]]; then
        print_error "Invalid API key format. Should start with 'sk-or-v1-'"
        exit 1
    fi
    
    print_success "API key validated"
}

# Create Aider configuration
create_aider_config() {
    print_header "Creating Aider Configuration"
    
    cat > "$HOME/.aider.conf.yml" << EOF
# OpenRouter API Configuration
openrouter-api-key: $API_KEY

# Model Routing - All FREE models
architect-model: openrouter/xiaomi/mimo-v2-flash:free
main-model: openrouter/kwaipilot/kat-coder-pro:free
editor-model: openrouter/kwaipilot/kat-coder-pro:free

# Context Management (optimized for large codebases)
map-tokens: 4096
edit-format: diff
map-refresh: auto

# Git Integration
auto-commits: true
dirty-commits: true
attribute-commits: true
commit-prompt: |
  Write a clear, concise commit message following conventional commits:
  
  <type>(<scope>): <subject>
  
  Types: feat, fix, docs, style, refactor, test, chore

# Performance
cache-prompts: true
stream: true
show-diffs: true

# Quality Checks
lint: true
auto-test: false
test-cmd: pytest -v

# Cost Control
max-chat-history-tokens: 8000
EOF
    
    print_success "Aider configuration created at ~/.aider.conf.yml"
}

# Create system prompts
create_system_prompts() {
    print_header "Creating System Prompts"
    
    # Orchestrator prompt
    cat > "$PROMPTS_DIR/orchestrator.md" << 'EOF'
You are an expert software architect and project orchestrator. Your role is to break down complex projects into clear, actionable phases.

## Core Responsibilities:
1. Analyze requirements deeply - understand true needs beyond surface description
2. Design comprehensive architecture - consider scalability, maintainability, security
3. Break down into clear phases - each phase independently testable
4. Create step-by-step execution plan

## Output Format:
# PROJECT: [name]

## REQUIREMENTS ANALYSIS
[Deep understanding of actual requirements]

## ARCHITECTURE OVERVIEW
[System design with component relationships]

## DEVELOPMENT PHASES

### Phase 1: [Phase Name] (Complexity: simple|medium|complex)
**Objective**: [What this phase achieves]
**Tasks**:
1. [Specific actionable task]
2. [Specific actionable task]
**Success Criteria**: [How to validate completion]
**Dependencies**: [What must be done first]
**Estimated Effort**: [timeframe]

[Repeat for each phase...]

## TECHNICAL DECISIONS
[Key technology choices with rationale]

## POTENTIAL RISKS
[What could go wrong and mitigation strategies]

## TESTING STRATEGY
[How to validate each phase and overall system]

Think like a senior architect building production systems. Consider:
- Separation of concerns
- Error handling at every layer  
- Security implications
- Performance requirements
- Future maintainability
- Testing coverage
EOF
    
    # Coder prompt
    cat > "$PROMPTS_DIR/coder.md" << 'EOF'
You are a powerful agentic AI coding assistant. You pair program with developers to solve coding tasks.

## CRITICAL AGENT BEHAVIORS:
- You are an AGENT - continue working until the task is FULLY resolved
- Only stop when you are CERTAIN the problem is complete
- Gather information using tools, don't ask unnecessary questions
- Read files before editing (if content not seen in last 5 messages)
- Use tools in PARALLEL for maximum efficiency

## CODE QUALITY REQUIREMENTS:
- Generate code that runs IMMEDIATELY - include ALL imports and dependencies
- For new projects: create dependency management file (requirements.txt, package.json, etc.)
- For web apps: create BEAUTIFUL, modern UI with best UX practices
- NEVER generate long hashes, binary data, or non-textual code
- Add comprehensive error handling for edge cases
- Include docstrings and clear comments explaining complex logic
- Optimize for performance where appropriate

## EDITING PROTOCOL:
- Use diff-based edits, NOT full file rewrites
- Include sufficient unchanged code context to avoid ambiguity
- Use language-appropriate comments for omitted sections: // ... existing code ...
- NEVER omit code without "existing code" comment markers
- Specify target_file parameter first in all tool calls

## FILE MANAGEMENT:
- Create dependency files with SPECIFIC versions (not ranges)
- Include helpful README for new projects
- Organize code with clear, logical structure
- Follow project conventions if they exist

## COMMUNICATION STYLE:
- Use ### headings for organization (NEVER # - too overwhelming)
- Use **bold** for critical information
- Format code symbols with `backticks`
- Bullet points with '- ' and bold pseudo-headings
- Only wrap code snippets in fences, not entire messages

## INLINE LINE NUMBERS:
When you see format "LINE_NUMBER→LINE_CONTENT", treat LINE_NUMBER→ as metadata, NOT actual code.

Remember: Your effectiveness is measured by completing tasks fully without requiring user intervention.
EOF
    
    # Debugger prompt
    cat > "$PROMPTS_DIR/debugger.md" << 'EOF'
You are an expert debugger and code analyst with deep reasoning capabilities.

## SYSTEMATIC DEBUGGING PROCESS:

### 1. UNDERSTAND THE PROBLEM
- What is expected behavior?
- What is actual behavior?
- When does it occur? (always/sometimes/specific conditions)
- Can it be reproduced consistently?

### 2. GATHER INFORMATION (Use tools in parallel!)
- Read relevant source files
- Examine error logs and stack traces
- Review recent git commits
- Check related code paths
- Analyze test failures

### 3. REPRODUCE
- Identify minimal steps to trigger bug
- Verify consistency
- Document reproduction steps

### 4. ANALYZE ROOT CAUSE
- Trace execution flow step-by-step
- Check assumptions and invariants
- Look for edge cases not handled
- Consider:
  * Race conditions
  * Timing issues
  * State management problems
  * Type coercion issues
  * Null/undefined handling
  * Off-by-one errors

### 5. DEVELOP SOLUTION
- Fix ROOT CAUSE, not symptoms
- Consider side effects of fix
- Ensure fix doesn't break other functionality
- Make minimal necessary changes

### 6. VERIFY FIX
- Test the specific bug scenario
- Run full test suite
- Add regression test to prevent recurrence
- Validate in multiple environments if relevant

## DEEP REASONING MODE:
- Think step-by-step through execution
- Question all assumptions
- Consider multiple hypotheses
- Look for patterns in errors
- Use reasoning to trace complex flows

## NEVER:
- Jump to conclusions without investigation
- Fix symptoms instead of root cause
- Break existing functionality
- Skip comprehensive testing
- Assume code works a certain way without verification

Remember: Great debugging is methodical detective work, not guesswork.
EOF
    
    # Tester prompt
    cat > "$PROMPTS_DIR/tester.md" << 'EOF'
You are an expert test engineer creating comprehensive, maintainable test suites.

## TESTING PHILOSOPHY:
- Tests document expected behavior
- Each test must be independent and isolated
- Tests should be clear, readable, maintainable
- Aim for high coverage focusing on critical paths
- Tests should fail for the right reasons

## TEST STRUCTURE (AAA Pattern):
```
def test_feature_scenario():
    """Clear description of what's being tested"""
    # ARRANGE: Set up test data and prerequisites
    [setup code]
    
    # ACT: Execute the code being tested
    [execution]
    
    # ASSERT: Verify the results
    assert [condition], "Clear failure message"
```

## COMPREHENSIVE COVERAGE:
1. **Unit Tests**: Individual functions/methods in isolation
   - Test single responsibility
   - Mock external dependencies
   - Fast execution (<100ms)

2. **Integration Tests**: Component interactions
   - Test actual integrations
   - Use test database/services
   - Verify data flows

3. **Edge Cases**: Boundary conditions
   - Empty inputs
   - Null/undefined values
   - Maximum values
   - Minimum values
   - Invalid data types

4. **Error Handling**: Exception paths
   - Invalid inputs
   - Network failures
   - Permission errors
   - Concurrent access

5. **Performance** (when relevant):
   - Load testing critical paths
   - Memory usage
   - Query optimization

## BEST PRACTICES:
- Descriptive names: `test_user_login_with_valid_credentials_succeeds`
- One logical assertion per test (or closely related)
- Use fixtures for common setup (pytest) or beforeEach (Jest)
- Mock external dependencies (APIs, databases, file systems)
- Test both success AND failure paths
- Include docstrings explaining test purpose
- Avoid test interdependence

## FRAMEWORK PATTERNS:

### Python (pytest):
```python
import pytest

@pytest.fixture
def sample_user():
    return {"name": "Test User", "email": "test@example.com"}

def test_user_creation_with_valid_data_succeeds(sample_user):
    """Verify user creation with all required fields"""
    # Arrange
    user_service = UserService()
    
    # Act
    result = user_service.create_user(sample_user)
    
    # Assert
    assert result.success is True
    assert result.user.email == sample_user["email"]

@pytest.mark.parametrize("invalid_email", [
    "",
    "notanemail",
    "@example.com",
    "user@",
])
def test_user_creation_with_invalid_email_fails(invalid_email):
    """Verify proper validation of email format"""
    # Arrange
    user_data = {"name": "Test", "email": invalid_email}
    user_service = UserService()
    
    # Act & Assert
    with pytest.raises(ValidationError) as exc_info:
        user_service.create_user(user_data)
    assert "email" in str(exc_info.value).lower()
```

### JavaScript (Jest/Vitest):
```javascript
describe('UserService', () => {
  describe('createUser', () => {
    it('successfully creates user with valid data', async () => {
      // Arrange
      const userData = { name: 'Test User', email: 'test@example.com' };
      const userService = new UserService();
      
      // Act
      const result = await userService.createUser(userData);
      
      // Assert
      expect(result.success).toBe(true);
      expect(result.user.email).toBe(userData.email);
    });
    
    it('fails with invalid email format', async () => {
      // Arrange
      const userData = { name: 'Test', email: 'invalid' };
      const userService = new UserService();
      
      // Act & Assert
      await expect(userService.createUser(userData))
        .rejects.toThrow(/email/i);
    });
  });
});
```

## OUTPUT ORGANIZATION:
- Group related tests with describe/context blocks
- Order tests from simple to complex
- Put happy path tests first
- Clear section comments for test categories

Remember: Good tests catch bugs. GREAT tests help developers understand the system and prevent regressions.
EOF
    
    print_success "System prompts created in $PROMPTS_DIR"
}

# Create workflow scripts
create_workflow_scripts() {
    print_header "Creating Workflow Scripts"
    
    # ai-conductor script
    cat > "$BIN_DIR/ai-conductor" << 'EOF'
#!/bin/bash
# AI Conductor - Multi-phase development workflow

QUERY="$*"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

if [ -z "$QUERY" ]; then
    echo "Usage: ai-conductor <description of feature to build>"
    echo "Example: ai-conductor 'Add real-time chat with WebSocket support'"
    exit 1
fi

echo "🎯 AI Conductor - Multi-Phase Development"
echo "=========================================="
echo ""
echo "Task: $QUERY"
echo ""

# Phase 1: Planning
echo "📋 Phase 1: Planning & Architecture"
echo "Using: MiMo-V2-Flash"
echo ""

aider \
  --model openrouter/xiaomi/mimo-v2-flash:free \
  --no-auto-commits \
  --read "$PROMPTS_DIR/orchestrator.md" \
  --message "Create a comprehensive development plan for: $QUERY

Output should be saved to PLAN.md with complete:
- Requirements analysis
- Architecture design
- Development phases
- Technical decisions
- Risk analysis
- Testing strategy"

if [ ! -f "PLAN.md" ]; then
    echo "❌ Planning failed - PLAN.md not created"
    exit 1
fi

echo ""
echo "✅ Planning complete! Review PLAN.md"
echo ""
read -p "Continue with implementation? (y/n): " CONTINUE

if [ "$CONTINUE" != "y" ]; then
    echo "Stopped. Edit PLAN.md and run: ai-code 'implement the plan'"
    exit 0
fi

# Phase 2: Implementation
echo ""
echo "💻 Phase 2: Implementation"
echo "Using: KAT-Coder-Pro"
echo ""

aider \
  --model openrouter/kwaipilot/kat-coder-pro:free \
  --yes \
  --auto-commits \
  --read PLAN.md \
  --read "$PROMPTS_DIR/coder.md" \
  --message "Implement the development plan in PLAN.md phase by phase. After completing each phase, commit with a descriptive message. Continue until all phases are complete."

echo ""
echo "✅ Implementation complete!"
echo ""

# Phase 3: Testing
read -p "Generate comprehensive tests? (y/n): " TEST

if [ "$TEST" = "y" ]; then
    echo ""
    echo "🧪 Phase 3: Testing"
    echo "Using: Qwen3-Coder-480B"
    echo ""
    
    aider \
      --model openrouter/qwen/qwen3-coder:free \
      --yes \
      --auto-commits \
      --read "$PROMPTS_DIR/tester.md" \
      --message "Create comprehensive tests for all implemented features. Cover:
- Unit tests
- Integration tests
- Edge cases
- Error handling"
    
    echo ""
    echo "✅ Tests created!"
fi

echo ""
echo "🎉 Conductor workflow complete!"
echo ""
echo "Summary:"
echo "- Plan: PLAN.md"
echo "- Implementation: Complete with git commits"
echo "- Tests: Complete (if generated)"
echo ""
echo "Next steps:"
echo "- Review git log for changes"
echo "- Run tests: pytest (Python) or npm test (JavaScript)"
echo "- Debug if needed: ai-debug '<issue>'"
EOF
    chmod +x "$BIN_DIR/ai-conductor"
    
    # ai-plan script
    cat > "$BIN_DIR/ai-plan" << 'EOF'
#!/bin/bash
QUERY="$*"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

if [ -z "$QUERY" ]; then
    echo "Usage: ai-plan <what to build>"
    exit 1
fi

echo "📋 Creating development plan..."
aider \
  --model openrouter/xiaomi/mimo-v2-flash:free \
  --no-auto-commits \
  --read "$PROMPTS_DIR/orchestrator.md" \
  --message "$QUERY"
EOF
    chmod +x "$BIN_DIR/ai-plan"
    
    # ai-code script
    cat > "$BIN_DIR/ai-code" << 'EOF'
#!/bin/bash
QUERY="$*"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

if [ -z "$QUERY" ]; then
    echo "Usage: ai-code <what to implement>"
    exit 1
fi

echo "💻 Coding phase..."
aider \
  --model openrouter/kwaipilot/kat-coder-pro:free \
  --yes \
  --auto-commits \
  --read "$PROMPTS_DIR/coder.md" \
  --message "$QUERY"
EOF
    chmod +x "$BIN_DIR/ai-code"
    
    # ai-debug script
    cat > "$BIN_DIR/ai-debug" << 'EOF'
#!/bin/bash
QUERY="$*"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

if [ -z "$QUERY" ]; then
    echo "Usage: ai-debug <description of bug>"
    exit 1
fi

echo "🐛 Debug mode (with reasoning enabled)..."
aider \
  --model openrouter/xiaomi/mimo-v2-flash:free \
  --yes \
  --auto-commits \
  --read "$PROMPTS_DIR/debugger.md" \
  --message "$QUERY"
EOF
    chmod +x "$BIN_DIR/ai-debug"
    
    # ai-test script  
    cat > "$BIN_DIR/ai-test" << 'EOF'
#!/bin/bash
QUERY="$*"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

if [ -z "$QUERY" ]; then
    echo "Usage: ai-test <what to test>"
    exit 1
fi

echo "🧪 Testing phase..."
aider \
  --model openrouter/qwen/qwen3-coder:free \
  --yes \
  --auto-commits \
  --read "$PROMPTS_DIR/tester.md" \
  --message "$QUERY"
EOF
    chmod +x "$BIN_DIR/ai-test"
    
    # ai-dev (interactive)
    cat > "$BIN_DIR/ai-dev" << 'EOF'
#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

echo "🤖 Interactive development mode"
echo "Using: KAT-Coder-Pro (free)"
echo "Type 'exit' to quit"
echo ""

aider \
  --model openrouter/kwaipilot/kat-coder-pro:free \
  --yes \
  --auto-commits \
  --read "$PROMPTS_DIR/coder.md"
EOF
    chmod +x "$BIN_DIR/ai-dev"
    
    # ai-new-project script
    cat > "$BIN_DIR/ai-new-project" << 'EOF'
#!/bin/bash
PROJECT_NAME="$1"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: ai-new-project <project-name>"
    echo "Example: ai-new-project 'TaskManager API'"
    exit 1
fi

# Convert to directory name
DIR_NAME=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

echo "🚀 Creating new project: $PROJECT_NAME"
echo "Directory: $DIR_NAME"
echo ""

# Create project directory
mkdir -p "$DIR_NAME"
cd "$DIR_NAME"

# Initialize git
git init
git config user.name "${GIT_NAME:-AI Developer}"
git config user.email "${GIT_EMAIL:-ai@example.com}"

# Create initial README
cat > README.md << READMEEOF
# $PROJECT_NAME

Created with AI Conductor

## Getting Started

See PLAN.md for development roadmap.
READMEEOF

git add README.md
git commit -m "chore: initialize project"

echo "✅ Project structure created"
echo ""
echo "📋 Generating development plan..."
echo ""

# Generate plan
aider \
  --model openrouter/xiaomi/mimo-v2-flash:free \
  --no-auto-commits \
  --read "$PROMPTS_DIR/orchestrator.md" \
  --message "Create a comprehensive development plan for: $PROJECT_NAME

Include:
- Requirements analysis
- Architecture design  
- Development phases
- Technical stack recommendations
- Testing strategy

Save to PLAN.md"

if [ -f "PLAN.md" ]; then
    git add PLAN.md
    git commit -m "docs: add development plan"
    echo ""
    echo "✅ Project created successfully!"
    echo ""
    echo "Next steps:"
    echo "  cd $DIR_NAME"
    echo "  ai-conductor  # Start multi-phase development"
    echo ""
    echo "Or develop interactively:"
    echo "  ai-dev  # Interactive coding session"
else
    echo "⚠️  Plan generation incomplete"
fi
EOF
    chmod +x "$BIN_DIR/ai-new-project"
    
    # ai-onboard script
    cat > "$BIN_DIR/ai-onboard" << 'EOF'
#!/bin/bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROMPTS_DIR="$(dirname "$SCRIPT_DIR")/config/prompts"

echo "🔍 Onboarding existing project..."
echo ""

# Check if in git repo
if [ ! -d ".git" ]; then
    echo "⚠️  Not a git repository. Initialize git? (y/n)"
    read -p "> " INIT_GIT
    if [ "$INIT_GIT" = "y" ]; then
        git init
        echo "✅ Git initialized"
    fi
fi

# Create .ai directory
mkdir -p .ai

echo "Analyzing codebase (token-efficient)..."

# Analyze project
aider \
  --model openrouter/xiaomi/mimo-v2-flash:free \
  --no-auto-commits \
  --message "Analyze this codebase and create:

1. .ai/CODEBASE_SUMMARY.md - Overview of project structure, main components, and architecture
2. .ai/TECH_STACK.md - Technologies, frameworks, and key dependencies used
3. .ai/CONVENTIONS.md - Code style, naming conventions, patterns observed

Keep analysis concise and actionable."

if [ -f ".ai/CODEBASE_SUMMARY.md" ]; then
    echo ""
    echo "✅ Project onboarded successfully!"
    echo ""
    echo "Analysis saved to .ai/ directory"
    echo ""
    echo "Next steps:"
    echo "  ai-dev  # Start interactive development"
    echo "  ai-conductor '<feature>'  # Build new feature"
else
    echo "⚠️  Onboarding incomplete"
fi
EOF
    chmod +x "$BIN_DIR/ai-onboard"
    
    print_success "Workflow scripts created in $BIN_DIR"
}

# Add to PATH
add_to_path() {
    print_header "Adding Scripts to PATH"
    
    local shell_config=""
    
    # Detect shell
    if [ -n "$BASH_VERSION" ]; then
        shell_config="$HOME/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        shell_config="$HOME/.zshrc"
    else
        shell_config="$HOME/.profile"
    fi
    
    # Check if already in PATH
    if grep -q "ai-coding-setup/bin" "$shell_config" 2>/dev/null; then
        print_warning "PATH already configured in $shell_config"
    else
        echo "" >> "$shell_config"
        echo "# AI Coding Setup" >> "$shell_config"
        echo "export PATH=\"\$HOME/.ai-coding-setup/bin:\$PATH\"" >> "$shell_config"
        print_success "Added to PATH in $shell_config"
        print_warning "Run: source $shell_config (or restart terminal)"
    fi
    
    # Temporarily add to current session
    export PATH="$BIN_DIR:$PATH"
}

# Install VS Code extension
install_vscode_extension() {
    print_header "Installing VS Code Extensions"
    
    if ! command_exists code; then
        print_warning "VS Code not found - skipping extension installation"
        print_warning "Install manually: search for 'Kilo Code' in VS Code extensions"
        return
    fi
    
    # Try to install Kilo Code
    if code --install-extension kilo-code 2>/dev/null; then
        print_success "Kilo Code extension installed"
    else
        print_warning "Could not auto-install Kilo Code"
        print_warning "Install manually from: https://marketplace.visualstudio.com/items?itemName=kilo-code"
    fi
    
    # Create VS Code settings
    local vscode_settings="$HOME/.config/Code/User/settings.json"
    mkdir -p "$(dirname "$vscode_settings")"
    
    # Check if file exists
    if [ ! -f "$vscode_settings" ]; then
        cat > "$vscode_settings" << VSCODEEOF
{
  "kiloCode.apiKey": "$API_KEY",
  "kiloCode.provider": "openrouter"
}
VSCODEEOF
        print_success "VS Code settings configured"
    else
        print_warning "VS Code settings exist - configure Kilo Code manually"
        print_warning "Add OpenRouter key to Kilo Code settings"
    fi
}

# Print completion message
print_completion() {
    print_header "Installation Complete! 🎉"
    
    cat << 'COMPLETIONEOF'

Your AI coding setup is ready! Here's how to use it:

📝 CREATE NEW PROJECT:
  ai-new-project "My Amazing App"

🔄 ONBOARD EXISTING PROJECT:
  cd /path/to/project
  ai-onboard

🎯 MULTI-PHASE DEVELOPMENT (Recommended):
  ai-conductor "Add real-time chat feature"

💻 QUICK COMMANDS:
  ai-plan "description"     - Generate development plan
  ai-code "task"           - Implement feature
  ai-test "what to test"   - Write tests
  ai-debug "issue"         - Debug problems
  ai-dev                   - Interactive development

📚 DOCUMENTATION:
  Full guide: ~/.ai-coding-setup/AI_CODING_SETUP_COMPLETE_GUIDE.md

🚀 GETTING STARTED:
  1. Try: ai-new-project "Test App"
  2. Follow the prompts
  3. Watch the AI build your app!

Need help? Check the troubleshooting section in the guide.

COMPLETIONEOF

    print_message "$GREEN" "Happy coding! 🚀"
    echo ""
}

# Main installation flow
main() {
    clear
    print_header "AI Coding Setup - Automated Installation"
    print_message "$BLUE" "This will set up a complete AI coding environment with:"
    echo "  • Free AI models (OpenRouter)"
    echo "  • Aider CLI tool"
    echo "  • Kilo Code VS Code extension"
    echo "  • Automated workflows"
    echo "  • Production-ready system prompts"
    echo ""
    read -p "Continue? (y/n): " CONFIRM
    
    if [ "$CONFIRM" != "y" ]; then
        echo "Installation cancelled."
        exit 0
    fi
    
    check_prerequisites
    create_directories
    get_api_key
    install_aider
    create_aider_config
    create_system_prompts
    create_workflow_scripts
    add_to_path
    install_vscode_extension
    print_completion
}

# Run main installation
main
