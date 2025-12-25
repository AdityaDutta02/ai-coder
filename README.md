# 🤖 AI Coder - Production AI Development Toolkit

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg)
![Cost](https://img.shields.io/badge/cost-$0-brightgreen.svg)

**Build complex production applications with free, top-tier AI models**

Recreate the power of Cursor and Claude Code using 100% free models from OpenRouter

[Quick Start](#-quick-start) • [Features](#-features) • [Installation](#-installation) • [Documentation](#-documentation) • [Examples](#-usage-examples)

</div>

---

## 📖 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Quick Start](#-quick-start)
- [Installation](#-installation)
- [Usage](#-usage)
  - [New Projects](#new-projects)
  - [Existing Projects](#existing-projects)
  - [Development Workflow](#development-workflow)
- [System Architecture](#-system-architecture)
- [Configuration](#-configuration)
- [Usage Examples](#-usage-examples)
- [Cost Comparison](#-cost-comparison)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

**AI Coder** is a production-ready toolkit that democratizes AI-assisted software development by providing a complete, zero-cost setup using cutting-edge free models from OpenRouter. It eliminates the $20-25/month cost of premium AI coding tools while maintaining professional-grade code generation and development workflows.

### Why AI Coder?

- ✅ **100% Free** - No subscriptions, no hidden costs
- ✅ **Unlimited Usage** - No request limits or daily caps
- ✅ **Production-Ready** - Battle-tested prompts and workflows
- ✅ **Multi-Phase Development** - Automated planning, coding, testing, and optimization
- ✅ **Git Integration** - Automatic version control with smart commits
- ✅ **IDE Support** - Works with VS Code, Aider CLI, and more

### Powered by Top-Tier Free Models

| Phase | Model | Capabilities |
|-------|-------|--------------|
| **Planning** | MiMo-V2-Flash | Matches Claude Sonnet 4.5 performance |
| **Coding** | KAT-Coder-Pro | 73% SWE-bench score |
| **Testing** | Qwen3-Coder-480B | Advanced test generation |
| **Analysis** | MiMo-V2-Flash | Deep reasoning enabled |

---

## ⚡ Features

### 🎨 Multi-Phase Development Workflow

Inspired by Gemini Conductor, AI Coder breaks down complex features into manageable phases:

1. **Planning Phase** - Comprehensive architectural planning with requirements analysis
2. **Setup Phase** - Automatic project structure and dependency setup
3. **Implementation Phase** - Phase-by-phase feature development with auto-commits
4. **Testing Phase** - Comprehensive test suite generation
5. **Optimization Phase** - Code review, performance optimization, and documentation

### 🛠️ Development Modes

- **AI Conductor** (`ai-conductor`) - Multi-phase automated development for complex features
- **Interactive Development** (`ai-dev`) - Real-time chat with AI assistant
- **Planning** (`ai-plan`) - Generate comprehensive development plans
- **Coding** (`ai-code`) - Implement features following optimized prompts
- **Testing** (`ai-test`) - Write comprehensive test suites
- **Debugging** (`ai-debug`) - Systematic debugging with reasoning
- **Optimization** (`ai-optimize`) - Performance and code quality improvements

### 🚀 Project Management

- **New Projects** (`ai-new-project`) - Bootstrap new projects with complete planning
- **Existing Projects** (`ai-onboard`) - Analyze and prepare existing projects for AI development
- **Codebase Analysis** (`ai-analyze`) - Token-efficient analysis for large projects

### 💎 Advanced Capabilities

- Token-efficient codebase analysis for large projects
- Automatic Git version control with conventional commits
- Parallel tool execution for maximum efficiency
- Aider CLI integration for file-based AI development
- VS Code extension support (Kilo Code)
- Production-ready system prompts derived from Cursor

---

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- Git
- pip3 (Python package manager)
- OpenRouter API key ([Get free key](https://openrouter.ai/keys))

### One-Command Installation

**macOS/Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/AdityaDutta02/ai-coder/main/setup-unix.sh | bash
```

**Windows:**
```powershell
irm https://raw.githubusercontent.com/AdityaDutta02/ai-coder/main/setup-windows.ps1 | iex
```

The setup script will:
- ✅ Install Aider CLI tool
- ✅ Configure OpenRouter API integration
- ✅ Set up all system prompts
- ✅ Create development workflow scripts
- ✅ Configure Git automation
- ✅ Install VS Code extensions (optional)

### Verify Installation

```bash
# Check installation
ai-dev --version

# Test with a simple task
ai-dev "create a hello world script"
```

---

## 📦 Installation

### Detailed Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/AdityaDutta02/ai-coder.git
   cd ai-coder
   ```

2. **Run Setup Script**

   **For macOS/Linux:**
   ```bash
   chmod +x setup-unix.sh
   ./setup-unix.sh
   ```

   **For Windows:**
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process
   .\setup-windows.ps1
   ```

3. **Enter OpenRouter API Key**

   When prompted, paste your API key from [https://openrouter.ai/keys](https://openrouter.ai/keys)

4. **Restart Terminal**

   Close and reopen your terminal to activate the new PATH settings

### Manual Installation

See [AI_CODING_SETUP_COMPLETE_GUIDE.md](./AI_CODING_SETUP_COMPLETE_GUIDE.md) for detailed manual installation instructions.

---

## 💻 Usage

### New Projects

Create a new project with full AI-assisted planning:

```bash
# Simple new project
ai-new-project "TaskManager API"

# With full options
ai-new-project "TaskManager API" \
  --type "web-api" \
  --stack "python-fastapi" \
  --features "auth,database,testing"
```

This will:
1. Generate a comprehensive project plan
2. Create project structure
3. Set up Git repository
4. Initialize development environment
5. Open in VS Code with AI ready

### Existing Projects

Onboard an existing project for AI development:

```bash
# Navigate to your project
cd /path/to/existing-project

# Run onboarding wizard
ai-onboard
```

This analyzes your codebase and:
- Understands project structure
- Detects tech stack
- Identifies patterns and conventions
- Sets up AI configuration
- Prepares for AI-assisted development

### Development Workflow

#### Conductor Workflow (Recommended)

Automated multi-phase development for complex features:

```bash
ai-conductor "Build a real-time chat feature with WebSocket support"
```

The AI will automatically:
1. **Plan** - Analyze requirements and create architecture
2. **Setup** - Create file structure and dependencies
3. **Implement** - Build features phase by phase with auto-commits
4. **Test** - Write comprehensive test suite
5. **Optimize** - Review code quality and add documentation

#### Interactive Development

For exploratory work and rapid iteration:

```bash
# Start interactive session
ai-dev

# Now chat with the AI:
You: "analyze the current authentication system"
AI: [analyzes files, shows findings]

You: "add OAuth2 support"
AI: [creates plan, implements, tests]

# Exit with: exit or Ctrl+D
```

#### Phase-Specific Commands

Run individual phases as needed:

```bash
# Planning only
ai-plan "add payment processing with Stripe"

# Coding only
ai-code "implement user authentication"

# Testing only
ai-test "all API endpoints"

# Debug/Fix
ai-debug "login endpoint returns 500 error"

# Optimize
ai-optimize "improve database query performance"
```

---

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                   AI Coder Platform                      │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │   Planning   │  │    Coding    │  │   Testing    │  │
│  │ MiMo-V2-Flash│  │ KAT-Coder-Pro│  │Qwen3-Coder   │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │  Debugging   │  │Optimization  │  │  Analysis    │  │
│  │MiMo+Reasoning│  │ MiMo-V2-Flash│  │Qwen3-Coder   │  │
│  └──────────────┘  └──────────────┘  └──────────────┘  │
│                                                          │
├─────────────────────────────────────────────────────────┤
│                  OpenRouter API Layer                    │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────┐           ┌──────────────┐           │
│  │  Aider CLI   │           │  Kilo Code   │           │
│  │  Integration │           │  VS Code Ext │           │
│  └──────────────┘           └──────────────┘           │
│                                                          │
├─────────────────────────────────────────────────────────┤
│              Git Version Control Layer                   │
│      (Auto-commits, Conventional Commits)                │
└─────────────────────────────────────────────────────────┘
```

### Project Structure

```
~/.ai-coding-setup/
├── bin/                          # Executable workflow scripts
│   ├── ai-new-project           # Create new projects
│   ├── ai-onboard               # Onboard existing projects
│   ├── ai-conductor             # Multi-phase orchestrator
│   ├── ai-plan                  # Planning phase
│   ├── ai-code                  # Coding phase
│   ├── ai-test                  # Testing phase
│   ├── ai-debug                 # Debug with reasoning
│   ├── ai-dev                   # Interactive mode
│   └── ai-analyze               # Codebase analysis
│
├── config/                       # Configuration files
│   ├── aider.conf.yml           # Aider CLI config
│   ├── kilo-config.json         # VS Code settings
│   ├── models.yml               # Model configurations
│   └── prompts/                 # System prompts
│       ├── orchestrator.md      # Senior architect prompt
│       ├── coder.md             # Full-stack developer prompt
│       ├── debugger.md          # Expert debugger prompt
│       └── tester.md            # QA engineer prompt
│
└── templates/                    # Project templates
    ├── python-api/
    ├── react-app/
    ├── fullstack/
    └── cli-tool/
```

---

## ⚙️ Configuration

### Aider Configuration

The setup creates `~/.aider.conf.yml` with optimized settings:

```yaml
# Model routing
architect-model: openrouter/xiaomi/mimo-v2-flash:free
main-model: openrouter/kwaipilot/kat-coder-pro:free
editor-model: openrouter/kwaipilot/kat-coder-pro:free

# Context management
map-tokens: 4096
edit-format: diff
map-refresh: auto

# Git integration
auto-commits: true
dirty-commits: true
attribute-commits: true

# Performance
cache-prompts: true
stream: true
show-diffs: true
```

### VS Code Configuration (Kilo Code)

Automatically configures VS Code for optimal AI assistance:

```json
{
  "apiKeys": {
    "openrouter": "YOUR_KEY_HERE"
  },
  "modelConfigurations": {
    "coder": {
      "model": "kwaipilot/kat-coder-pro:free",
      "temperature": 0.2
    },
    "debugger": {
      "model": "xiaomi/mimo-v2-flash:free",
      "reasoning_enabled": true
    }
  }
}
```

---

## 📚 Usage Examples

### Example 1: Building a Complete SaaS Backend

```bash
# Create new project
ai-new-project "PricingAPI SaaS" --type web-api

# Start conductor workflow
ai-conductor

# AI automatically:
# 1. Sets up FastAPI project structure
# 2. Configures PostgreSQL with Alembic
# 3. Implements tenant isolation
# 4. Adds Stripe subscription management
# 5. Creates usage tracking system
# 6. Builds admin endpoints
# 7. Implements webhook handlers
# 8. Adds comprehensive tests
# 9. Creates Docker deployment
# 10. Generates API documentation

# Each phase auto-commits to Git ✅
```

### Example 2: Adding Feature to Existing App

```bash
cd ~/projects/my-app

# Onboard project
ai-onboard

# Add complex feature
ai-conductor "Add real-time collaborative editing with WebSocket"

# AI will:
# 1. Analyze existing architecture
# 2. Design WebSocket integration
# 3. Implement conflict resolution
# 4. Add presence indicators
# 5. Create client-side sync logic
# 6. Write comprehensive tests
# 7. Update documentation
```

### Example 3: Debugging Production Issue

```bash
ai-debug "users report 500 errors on checkout - happens intermittently"

# AI will:
# 1. Search logs for errors
# 2. Analyze checkout flow
# 3. Check database queries
# 4. Look for race conditions
# 5. Review recent changes
# 6. Identify root cause
# 7. Implement fix with retry logic
# 8. Add monitoring
# 9. Write regression test
```

### Example 4: Interactive Development

```bash
ai-dev

You: "create a REST API for a todo app with FastAPI"
AI: [Creates complete API with CRUD operations]

You: "add user authentication with JWT"
AI: [Implements auth system with login/register]

You: "write tests for all endpoints"
AI: [Generates comprehensive test suite with pytest]

You: "deploy with Docker"
AI: [Creates Dockerfile and docker-compose.yml]
```

---

## 💰 Cost Comparison

| Tool | Monthly Cost | Requests | Features |
|------|--------------|----------|----------|
| **AI Coder** | **$0** | **Unlimited** | Multi-phase dev, planning, testing, debugging |
| Cursor Pro | $20 | 500/month | AI coding, chat |
| GitHub Copilot | $10 | Limited | Code completion only |
| Claude Pro | $20 | 100 msgs/day | Chat, limited coding |
| Replit Agent | $25 | Limited | Agent-based development |

**Annual Savings: $120-300** 💰

---

## 🔧 Troubleshooting

### API Key Issues

```bash
# Verify your key
cat ~/.aider.conf.yml | grep openrouter-api-key

# Test the key
curl https://openrouter.ai/api/v1/auth/key \
  -H "Authorization: Bearer YOUR_KEY"
```

### Model Not Responding

```bash
# Check OpenRouter status
curl https://openrouter.ai/api/v1/models | grep mimo

# Try different model
ai-code --model "qwen/qwen3-coder:free" "test feature"
```

### Git Configuration

```bash
# Configure git if not set
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Initialize repo if missing
git init
```

### Aider Issues

```bash
# Refresh repository map
aider --map-refresh

# Manually add files to context
aider --file src/main.py --file src/utils.py
```

For more detailed troubleshooting, see [AI_CODING_SETUP_COMPLETE_GUIDE.md](./AI_CODING_SETUP_COMPLETE_GUIDE.md#troubleshooting).

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Ways to Contribute

- 🐛 Report bugs and issues
- 💡 Suggest new features or improvements
- 📝 Improve documentation
- 🔧 Submit pull requests
- 🎨 Share better prompts or workflows
- ⭐ Star the repository

### Development Setup

```bash
# Fork and clone the repository
git clone https://github.com/YOUR_USERNAME/ai-coder.git
cd ai-coder

# Create a feature branch
git checkout -b feature/your-feature-name

# Make your changes and test
./setup-unix.sh  # or setup-windows.ps1

# Commit with conventional commits
git commit -m "feat: add new feature"

# Push and create pull request
git push origin feature/your-feature-name
```

### Contribution Guidelines

- Follow existing code style and conventions
- Write clear commit messages using [Conventional Commits](https://www.conventionalcommits.org/)
- Add tests for new features
- Update documentation as needed
- Be respectful and constructive in discussions

---

## 📜 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Aditya Dutta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🙏 Acknowledgments

This project stands on the shoulders of giants:

- **[Cursor](https://cursor.com/)** - Inspiration for system prompts and development workflows
- **[Claude Code](https://claude.ai/)** - Advanced AI coding patterns and techniques
- **[Gemini Conductor](https://ai.google.dev/)** - Multi-phase development methodology
- **[Aider](https://aider.chat/)** - Excellent CLI tool for AI pair programming
- **[OpenRouter](https://openrouter.ai/)** - Unified API for accessing free AI models
- **Open Source Community** - For the amazing free models powering this toolkit

### Model Credits

- **MiMo-V2-Flash** by Xiaomi - Planning and architecture
- **KAT-Coder-Pro** by KwaiPilot - Code implementation
- **Qwen3-Coder-480B** by Alibaba - Testing and analysis

---

## 📞 Support & Community

- **Issues**: [GitHub Issues](https://github.com/AdityaDutta02/ai-coder/issues)
- **Discussions**: [GitHub Discussions](https://github.com/AdityaDutta02/ai-coder/discussions)
- **Documentation**: [Complete Guide](./AI_CODING_SETUP_COMPLETE_GUIDE.md)

---

## 🗺️ Roadmap

### Upcoming Features

- [ ] Support for more programming languages (Go, Rust, Java)
- [ ] Web UI for easier interaction
- [ ] Cloud deployment automation
- [ ] Team collaboration features
- [ ] Custom model fine-tuning support
- [ ] Integration with more IDEs (JetBrains, Neovim)
- [ ] Advanced debugging with trace analysis
- [ ] Performance profiling integration

### Version History

- **v1.0.0** - Initial release with core features
  - Multi-phase development workflow
  - Aider CLI integration
  - VS Code extension support
  - Production-ready system prompts

---

## 🌟 Star History

If you find this project helpful, please consider giving it a star! ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=AdityaDutta02/ai-coder&type=Date)](https://star-history.com/#AdityaDutta02/ai-coder&Date)

---

<div align="center">

**Built with ❤️ by developers, for developers**

**Ready to build? [Get Started Now](#-quick-start) 🚀**

[⬆ Back to Top](#-ai-coder---production-ai-development-toolkit)

</div>
