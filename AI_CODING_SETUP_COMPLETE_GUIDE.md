# 🚀 Production AI Coding Setup - Complete Guide
### Build Complex Production Apps with Free AI Models

---

## 📖 Table of Contents
1. [Quick Start](#quick-start)
2. [One-Command Installation](#one-command-installation)
3. [New Project Setup](#new-project-setup)
4. [Existing Project Setup](#existing-project-setup)
5. [Development Workflow with Planning](#development-workflow-with-planning)
6. [System Prompts (Cursor-Optimized)](#system-prompts)
7. [Troubleshooting](#troubleshooting)

---

## 🎯 Quick Start

This setup recreates the power of Claude Code and Cursor using **100% free models** from OpenRouter:
- **Planning**: MiMo-V2-Flash (matches Claude Sonnet 4.5)
- **Coding**: KAT-Coder-Pro (73% SWE-bench score)
- **Testing/Debug**: MiMo-V2-Flash with reasoning
- **Repository Analysis**: Qwen3-Coder-480B

### Features:
✅ Automated project planning like Gemini Conductor  
✅ Multi-phase development workflow  
✅ Automatic Git version control  
✅ Production-ready code generation  
✅ Cost: $0 (completely free!)

---

## 🛠️ One-Command Installation

### Step 1: Download and Run Setup Script

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/YOUR_REPO/setup-windows.ps1 | iex
```

**Mac/Linux (Bash):**
```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_REPO/setup-unix.sh | bash
```

### Step 2: Enter Your OpenRouter API Key

When prompted, paste your API key from https://openrouter.ai/keys

**That's it! The setup script will:**
- ✅ Install VS Code extensions (Kilo Code)
- ✅ Install Aider CLI tool
- ✅ Configure all system prompts
- ✅ Create development workflow scripts
- ✅ Set up Git automation
- ✅ Configure free AI models

---

## 📝 New Project Setup

### Automated New Project Creation

```bash
# Run the new project wizard
ai-new-project "TaskManager API"

# Or with full options:
ai-new-project "TaskManager API" \
  --type "web-api" \
  --stack "python-fastapi" \
  --features "auth,database,testing"
```

### What This Does:

1. **Creates project structure**
2. **Generates comprehensive project plan** (like Gemini Conductor)
3. **Sets up Git repository**
4. **Creates initial files and boilerplate**
5. **Initializes development environment**
6. **Opens in VS Code with AI ready**

### Manual New Project Setup

```bash
# 1. Create project folder
mkdir my-production-app
cd my-production-app

# 2. Initialize Git
git init

# 3. Generate comprehensive plan
ai-plan "Create a production-ready task management API with:
- User authentication (JWT)
- PostgreSQL database
- RESTful endpoints
- Docker deployment
- Comprehensive testing
- CI/CD pipeline"

# 4. Review the plan (opens in VS Code)
# The AI will create:
# - PLAN.md (comprehensive development plan)
# - ARCHITECTURE.md (system architecture)
# - TODO.md (implementation checklist)

# 5. Start development
ai-dev
# This enters interactive development mode following the plan
```

---

## 🔄 Existing Project Setup

### Automated Existing Project Onboarding

```bash
# Navigate to your project
cd /path/to/existing-project

# Run the onboarding wizard
ai-onboard

# What this does:
# ✅ Analyzes your codebase (token-efficient)
# ✅ Understands project structure
# ✅ Detects tech stack
# ✅ Identifies patterns and conventions
# ✅ Creates .ai-config.yml
# ✅ Sets up Git hooks
# ✅ Ready for AI development
```

### Manual Existing Project Setup

```bash
# 1. Navigate to project
cd /path/to/existing-project

# 2. Analyze codebase (minimal tokens)
ai-analyze

# Creates:
# - .ai/CODEBASE_SUMMARY.md
# - .ai/TECH_STACK.md  
# - .ai/CONVENTIONS.md

# 3. Start working
ai-dev "add CSV export feature to user reports"
```

---

## 🎨 Development Workflow with Planning

### The Conductor Workflow (Automated Multi-Phase Development)

This workflow mimics Gemini Conductor - creates a step-by-step plan, then executes it phase by phase.

```bash
# Start the conductor workflow
ai-conductor "Build a real-time chat feature with WebSocket support"

# What happens:
# Phase 1: PLANNING (MiMo-V2-Flash)
#   - Analyzes requirements
#   - Creates architecture
#   - Breaks down into tasks
#   - Estimates complexity
#   - Creates development phases

# Phase 2: SETUP (KAT-Coder-Pro)
#   - Creates file structure
#   - Adds dependencies
#   - Sets up boilerplate
#   - Configures environment

# Phase 3: IMPLEMENTATION (KAT-Coder-Pro)
#   - Implements features phase-by-phase
#   - Auto-commits each milestone
#   - Runs tests after each phase
#   - Validates code quality

# Phase 4: TESTING (Qwen3-Coder-480B)
#   - Writes comprehensive tests
#   - Runs test suite
#   - Fixes failing tests

# Phase 5: OPTIMIZATION (MiMo with reasoning)
#   - Reviews code quality
#   - Optimizes performance
#   - Adds documentation
#   - Final validation
```

### Individual Phase Commands

```bash
# Planning only
ai-plan "feature description"

# Coding only (follows existing plan)
ai-code "implement user authentication"

# Testing only
ai-test "all API endpoints"

# Debug/Fix
ai-debug "login endpoint returns 500 error"

# Optimize
ai-optimize "improve database query performance"
```

### Interactive Development Mode

```bash
# Start interactive session (recommended)
ai-dev

# Now you can chat with the AI:
You: "analyze the current authentication system"
AI: [analyzes files, shows findings]

You: "add OAuth2 support"  
AI: [creates plan, implements, tests]

You: "write tests for the new OAuth flow"
AI: [writes comprehensive tests]

# Exit with: exit or Ctrl+D
```

---

## 🧠 System Prompts (Cursor-Optimized)

These prompts are derived from actual Cursor system prompts for maximum effectiveness.

### Orchestrator Prompt (Used by ai-conductor)

```markdown
You are an expert software architect and project orchestrator. Your role is to:

1. ANALYZE the request deeply - understand true requirements beyond surface description
2. DESIGN a comprehensive architecture - consider scalability, maintainability, security
3. BREAK DOWN into clear phases - each phase should be independently testable
4. CREATE a step-by-step plan with:
   - Clear objectives for each phase
   - Estimated complexity (simple/medium/complex)
   - Dependencies between phases
   - Success criteria for each phase
   - Potential challenges and mitigations

Output Format:
# PROJECT: [name]

## REQUIREMENTS ANALYSIS
[Deep understanding of what's actually needed]

## ARCHITECTURE
[System design with component relationships]

## DEVELOPMENT PHASES

### Phase 1: [name] (Complexity: [simple/medium/complex])
**Objective**: [what this achieves]
**Tasks**:
1. [specific task]
2. [specific task]
**Success Criteria**: [how to validate]
**Estimated Time**: [timeframe]

[Continue for each phase...]

## TECHNICAL DECISIONS
[Key technology choices and rationale]

## RISKS & MITIGATIONS
[What could go wrong and how to handle it]

Remember: Think like a senior architect planning a production system. Consider:
- Separation of concerns
- Error handling and edge cases
- Testing strategy
- Security implications
- Performance requirements
- Future extensibility
```

### Coder Prompt (Used by ai-code)

```markdown
You are a powerful agentic AI coding assistant. You are pair programming with a developer to solve coding tasks.

CRITICAL BEHAVIORS:
- You are an AGENT - keep working until the problem is FULLY resolved
- Only stop when you are CERTAIN the task is complete
- Bias towards action - gather information with tools, don't ask unnecessary questions
- Read files before editing them (if you haven't seen content in last 5 messages)
- Use tools in PARALLEL whenever possible for maximum efficiency

CODE QUALITY REQUIREMENTS:
- Generate code that can run IMMEDIATELY - include ALL necessary imports, dependencies
- If creating from scratch: create dependency management file (requirements.txt, package.json)
- If building a web app: give it a BEAUTIFUL, modern UI with best UX practices
- NEVER generate long hashes, binary data, or non-textual code
- Add comprehensive error handling and edge case management
- Include docstrings and clear comments
- Optimize for performance where appropriate

EDITING PROTOCOL:
- Use diff-based edits (not full file rewrites)
- Include sufficient context around changes to avoid ambiguity
- Use language-appropriate comments for unchanged sections (// ... existing code ...)
- NEVER omit code without indicating with "existing code" comment
- Specify target_file first in function calls

FILE MANAGEMENT:
- Create dependency files with specific versions
- Include helpful README if creating new project
- Organize code logically with clear structure

COMMUNICATION:
- Use ### headings for organization (NEVER use # as it's overwhelming)
- Use **bold** for critical information
- Format file/class/function names with `backticks`
- Use bullet points with '- ' and bold pseudo-headings
- Only wrap code snippets in markdown fences, not entire messages

When you receive inline line numbers (format: LINE_NUMBER→LINE_CONTENT), treat LINE_NUMBER→ as metadata, NOT actual code.
```

### Debug Prompt (Used by ai-debug)

```markdown
You are an expert debugger and code analyst. Your approach is methodical and thorough.

DEBUGGING PROCESS:
1. UNDERSTAND the problem completely
   - What is the expected behavior?
   - What is the actual behavior?  
   - When does it occur? (always/sometimes/specific conditions)

2. GATHER INFORMATION
   - Read relevant files
   - Check error logs/stack traces
   - Review recent changes (git history)
   - Examine related code paths

3. REPRODUCE the issue
   - Identify minimal steps to trigger bug
   - Verify it's consistent

4. ANALYZE root cause
   - Trace execution flow
   - Check assumptions and invariants
   - Look for edge cases
   - Consider race conditions, timing issues

5. DEVELOP solution
   - Fix the root cause (not just symptoms)
   - Consider side effects
   - Ensure fix doesn't break other functionality

6. VERIFY fix
   - Test the specific bug scenario
   - Run existing test suite
   - Add new test to prevent regression

ENABLE DEEP REASONING:
- Think step-by-step through code execution
- Question assumptions
- Consider multiple hypotheses
- Look for patterns in the codebase

NEVER:
- Jump to conclusions without investigation
- Fix symptoms instead of root cause
- Break existing functionality
- Skip testing the fix
```

### Test Engineer Prompt (Used by ai-test)

```markdown
You are an expert test engineer focused on comprehensive, maintainable test suites.

TESTING PHILOSOPHY:
- Tests are documentation of expected behavior
- Each test should be independent and isolated
- Tests should be clear, readable, and maintainable
- Aim for high coverage but focus on critical paths

TEST STRUCTURE (AAA Pattern):
1. ARRANGE: Set up test data and prerequisites
2. ACT: Execute the code being tested
3. ASSERT: Verify the results

COMPREHENSIVE COVERAGE:
- **Unit Tests**: Individual functions/methods in isolation
- **Integration Tests**: Component interactions
- **Edge Cases**: Boundary conditions, null values, empty inputs
- **Error Cases**: Invalid inputs, exception handling
- **Performance**: Critical paths under load (when relevant)

BEST PRACTICES:
- Use descriptive test names: `test_user_login_with_valid_credentials`
- One assertion per test (or closely related assertions)
- Use fixtures for common setup
- Mock external dependencies
- Test both success and failure paths
- Include docstrings explaining what's being tested

FRAMEWORKS:
- Python: pytest with fixtures and parametrize
- JavaScript: Jest/Vitest with describe/it blocks  
- Use appropriate assertions for clarity

OUTPUT FORMAT:
Create tests with clear organization:
```python
def test_feature_name_scenario():
    """
    Test that [feature] correctly handles [scenario]
    
    Given: [initial state]
    When: [action taken]
    Then: [expected result]
    """
    # Arrange
    [setup code]
    
    # Act
    [execute code]
    
    # Assert
    assert [condition], "[failure message]"
```

Remember: Good tests catch bugs, great tests help developers understand the system.
```

---

## 📁 Project Structure Created by Setup

```
~/ai-coding-setup/
├── bin/
│   ├── ai-new-project       # Create new project with AI
│   ├── ai-onboard           # Onboard existing project
│   ├── ai-conductor         # Multi-phase development
│   ├── ai-plan              # Planning phase
│   ├── ai-code              # Coding phase
│   ├── ai-test              # Testing phase
│   ├── ai-debug             # Debug phase
│   ├── ai-dev               # Interactive development
│   └── ai-analyze           # Analyze codebase
├── config/
│   ├── aider.conf.yml       # Aider configuration
│   ├── kilo-config.json     # Kilo Code configuration
│   ├── prompts/
│   │   ├── orchestrator.md  # Planning prompt
│   │   ├── coder.md         # Coding prompt
│   │   ├── debugger.md      # Debug prompt
│   │   └── tester.md        # Testing prompt
│   └── models.yml           # Model configurations
└── templates/
    ├── python-api/
    ├── react-app/
    ├── fullstack/
    └── cli-tool/

~/.aider.conf.yml            # Global Aider config
~/.config/Code/User/         # VS Code settings
    └── settings.json        # Kilo Code config
```

---

## 🔧 Configuration Files

### ~/.aider.conf.yml (Auto-generated by setup)

```yaml
# OpenRouter API Configuration
openrouter-api-key: YOUR_KEY_HERE

# Model Routing
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
  
  [optional body]
  
  Types: feat, fix, docs, style, refactor, test, chore
  
  Example: feat(auth): add OAuth2 Google provider

# Performance
cache-prompts: true
stream: true
show-diffs: true

# Quality Checks
lint: true
auto-test: false  # Run tests manually
test-cmd: pytest -v

# Cost Control
max-chat-history-tokens: 8000

# Prompts
system-prompt-file: ~/.ai-coding-setup/config/prompts/coder.md
```

### Kilo Code Configuration (Auto-generated)

```json
{
  "apiKeys": {
    "openrouter": "YOUR_KEY_HERE"
  },
  "modelConfigurations": {
    "orchestrator": {
      "provider": "openrouter",
      "model": "xiaomi/mimo-v2-flash:free",
      "contextLength": 256000,
      "temperature": 0.7,
      "systemPromptFile": "~/.ai-coding-setup/config/prompts/orchestrator.md"
    },
    "architect": {
      "provider": "openrouter",
      "model": "xiaomi/mimo-v2-flash:free",
      "contextLength": 256000,
      "temperature": 0.5,
      "systemPromptFile": "~/.ai-coding-setup/config/prompts/orchestrator.md"
    },
    "coder": {
      "provider": "openrouter",
      "model": "kwaipilot/kat-coder-pro:free",
      "contextLength": 128000,
      "temperature": 0.2,
      "systemPromptFile": "~/.ai-coding-setup/config/prompts/coder.md"
    },
    "debugger": {
      "provider": "openrouter",
      "model": "xiaomi/mimo-v2-flash:free",
      "contextLength": 256000,
      "temperature": 0.1,
      "systemPromptFile": "~/.ai-coding-setup/config/prompts/debugger.md",
      "completionOptions": {
        "reasoning_enabled": true
      }
    },
    "tester": {
      "provider": "openrouter",
      "model": "qwen/qwen3-coder:free",
      "contextLength": 128000,
      "temperature": 0.3,
      "systemPromptFile": "~/.ai-coding-setup/config/prompts/tester.md"
    }
  },
  "defaultModel": "coder",
  "autoSave": true,
  "gitAutoCommit": true,
  "contextWindow": "smart",
  "features": {
    "parallelToolCalls": true,
    "autoTest": false,
    "lintOnSave": true
  }
}
```

---

## 🎯 Real-World Usage Examples

### Example 1: Building a Complete SaaS Backend

```bash
# Create new project with full planning
ai-new-project "PricingAPI SaaS" --type web-api

# AI generates comprehensive plan covering:
# - Multi-tenant architecture
# - Stripe integration
# - Usage tracking and billing
# - Admin dashboard API
# - Webhook handlers
# - Database schema
# - Authentication/Authorization
# - Rate limiting
# - Testing strategy
# - Deployment configuration

# Start conductor workflow
ai-conductor

# Watch as AI:
# 1. Sets up FastAPI project structure
# 2. Configures PostgreSQL with Alembic migrations
# 3. Implements tenant isolation
# 4. Adds Stripe subscription management
# 5. Creates usage tracking system
# 6. Builds admin endpoints
# 7. Implements webhook handlers
# 8. Adds comprehensive tests
# 9. Creates Docker deployment
# 10. Generates API documentation

# Each phase auto-commits to Git
# You can review, approve, or modify at each step
```

### Example 2: Adding Feature to Existing App

```bash
# Navigate to existing project
cd ~/projects/my-app

# Onboard the project
ai-onboard

# Add a complex feature
ai-conductor "Add real-time collaborative editing with WebSocket support and conflict resolution"

# AI will:
# 1. Analyze existing architecture
# 2. Design WebSocket integration
# 3. Implement operational transformation for conflict resolution
# 4. Add presence indicators
# 5. Create client-side sync logic
# 6. Write comprehensive tests
# 7. Update documentation
```

### Example 3: Debugging Production Issue

```bash
# Quick debug mode
ai-debug "users report 500 errors on checkout - happens intermittently"

# AI will:
# 1. Search logs for 500 errors
# 2. Analyze checkout flow
# 3. Check database queries
# 4. Look for race conditions
# 5. Review recent changes
# 6. Identify root cause (e.g., inventory check timeout)
# 7. Implement fix with retry logic
# 8. Add monitoring/alerting
# 9. Write regression test
```

---

## 🚀 Troubleshooting

### "API key not working"
```bash
# Verify your key
cat ~/.aider.conf.yml | grep openrouter-api-key

# Test the key
curl https://openrouter.ai/api/v1/auth/key \
  -H "Authorization: Bearer YOUR_KEY"

# Re-run setup if needed
ai-setup --reset
```

### "Models not responding"
```bash
# Check OpenRouter status
curl https://openrouter.ai/api/v1/models | grep mimo

# Try different model
ai-code --model "qwen/qwen3-coder:free" "test feature"
```

### "Git errors"
```bash
# Configure git if not set
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Initialize repo if missing
git init
```

### "Aider can't find files"
```bash
# Refresh repository map
aider --map-refresh

# Or manually add files to context
aider --file src/main.py --file src/utils.py
```

### "VS Code extension not working"
```bash
# Reinstall Kilo Code
code --uninstall-extension kilo-code
code --install-extension kilo-code

# Check logs
code --log-level trace
```

---

## 📊 Cost Comparison

| Tool | Monthly Cost | What You Get |
|------|--------------|--------------|
| **This Setup** | **$0** | Unlimited usage of top-tier free models |
| Cursor Pro | $20 | 500 requests/month |
| GitHub Copilot | $10 | Code completion only |
| Claude Pro | $20 | 100 messages/day |
| Replit Agent | $25 | Limited agent time |

---

## 🎓 Learning Resources

- **Cursor Documentation**: [cursor.com/docs](https://cursor.com/docs)
- **Aider Documentation**: [aider.chat/docs](https://aider.chat/docs)
- **OpenRouter Docs**: [openrouter.ai/docs](https://openrouter.ai/docs)
- **Prompt Engineering**: [anthropic.com/prompt-library](https://anthropic.com/prompt-library)

---

## 🤝 Contributing

Found a better prompt? Model? Workflow? Share it!

- GitHub: [YOUR_REPO]
- Discord: [YOUR_DISCORD]

---

## 📜 License

MIT License - Use freely for personal and commercial projects

---

## 🙏 Credits

- System prompts inspired by Cursor, Anthropic Claude Code
- Model recommendations from OpenRouter community
- Workflow design inspired by Gemini Conductor

---

**Ready to build? Run the setup script and start coding! 🚀**
