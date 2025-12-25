# 🤖 AI Coder - Free AI Coding Environment

> Build production apps using 100% free AI models - No subscriptions needed!

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Cost](https://img.shields.io/badge/cost-$0-brightgreen.svg)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg)

---

## 🎯 What Is This?

This toolkit sets up **free AI coding** on your computer. You get:
- ✅ **$0/month** - Completely free, no credit card needed
- ✅ **AI that writes code** - Like GitHub Copilot or Cursor, but free
- ✅ **Multiple AI models** - Choose the best model for each task
- ✅ **Works in terminal OR VS Code** - Pick your style

---

## 🚀 Super Quick Start (5 Minutes)

### Step 1: Get a Free API Key
1. Go to [OpenRouter.ai/keys](https://openrouter.ai/keys)
2. Sign up (free!)
3. Create a new API key
4. Copy it

### Step 2: Install
```bash
git clone https://github.com/AdityaDutta02/ai-coder.git
cd ai-coder
bash setup-unix.sh
```

### Step 3: Choose Your Workflow
After installation, pick ONE of these:

**Option A: Terminal Workflow** ⬅️ For developers who like command line
```bash
cd your-project
ai-dev
```

**Option B: VS Code Workflow** ⬅️ For visual editors (easier!)
1. Open VS Code
2. Install "Continue" extension
3. Add your API key
4. Start coding!

That's it! 🎉

---

## 🤔 How Does This Work? (Two Separate Workflows)

There are **TWO COMPLETELY DIFFERENT** ways to use this toolkit. Pick the one you like:

### Workflow 1️⃣: Terminal-Based (Using Aider CLI)

**What it is:**
- AI coding happens in your terminal
- You type commands like `ai-code "add a login page"`
- AI reads your files, makes changes, commits to git
- All from the command line

**How it works:**
```bash
# Go to your project
cd my-project

# Use AI to code
ai-dev                              # Interactive chat with AI
ai-code "add user authentication"   # Build a feature
ai-test "test the login system"     # Write tests
ai-debug "fix the signup bug"       # Debug issues
```

**When to use this:**
- ✅ You like working in the terminal
- ✅ You want automated git commits
- ✅ You're comfortable with command-line tools
- ✅ You want scripted/automated workflows

**Requirements:**
- Aider CLI installed (setup script tries to install it)
- Python 3.8-3.13 (not 3.14)

---

### Workflow 2️⃣: VS Code Extension-Based (Using Continue/Cline)

**What it is:**
- AI coding happens inside VS Code
- You use a sidebar chat interface
- AI can read and edit your files visually
- Point and click, no terminal needed

**How it works:**
1. Open VS Code
2. Click the Continue icon in sidebar
3. Chat with AI: "Add a login page"
4. AI suggests code changes
5. Accept or reject changes with one click

**When to use this:**
- ✅ You prefer visual editors
- ✅ You want to see changes before accepting them
- ✅ You like VS Code
- ✅ You want the easiest option
- ✅ For daily coding and quick edits

**Requirements:**
- VS Code installed
- "Continue" or "Cline" extension
- Your OpenRouter API key

**⚠️ Important Limitation:**
VS Code extensions are **generic AI chat** - they don't have the specialized multi-phase workflows (conductor, automated planning, etc.). For complex features, you'll want to use the terminal commands!

---

## 📊 Which Workflow Should I Choose?

| Feature | Terminal (Aider) | VS Code (Continue) |
|---------|------------------|-------------------|
| **Ease of Use** | ⭐⭐⭐ Harder | ⭐⭐⭐⭐⭐ Easier |
| **Visual Interface** | ❌ No | ✅ Yes |
| **Auto Git Commits** | ✅ Yes | ⚠️ Manual |
| **See Changes First** | ❌ No | ✅ Yes |
| **Specialized Workflows** | ✅ Yes (conductor, plan, debug) | ❌ No (manual chat only) |
| **Multi-Phase Automation** | ✅ Yes | ❌ No |
| **Daily Coding** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Complex Features** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Setup Complexity** | ⭐⭐⭐ Medium | ⭐⭐⭐⭐⭐ Easy |

### 🎯 Best Approach: Use BOTH!

**Primary (Daily Work):** VS Code + Continue
- Quick edits and features
- Visual feedback
- Easy to use

**Secondary (Complex Tasks):** Terminal Commands
- `ai-conductor` for multi-phase features
- `ai-plan` for detailed planning
- `ai-debug` for systematic debugging

This gives you the best of both worlds!

---

## 🚀 Understanding Specialized Workflows (Terminal Only!)

The terminal commands provide **powerful multi-phase automation** that VS Code extensions can't match:

### `ai-conductor` - The Power Tool 🎯

**What it does:** Automates entire feature development from planning to testing

**How it works:**
```bash
ai-conductor "Add user authentication"
```

**Automatic phases:**
1. **Planning** (MiMo-V2-Flash)
   - Creates PLAN.md with full architecture
   - Requirements analysis
   - Phase breakdown
   - Risk analysis

2. **Implementation** (KAT-Coder-Pro)
   - Builds feature phase by phase
   - Auto-commits after each phase
   - Follows the plan automatically

3. **Testing** (Qwen3-Coder - optional)
   - Generates comprehensive tests
   - Unit + integration tests
   - Edge cases and error handling

**This is like having a senior developer automate everything!**

### `ai-plan` - Strategic Planning 📋

```bash
ai-plan "Add payment integration"
```

Creates detailed development plan with:
- Requirements analysis
- Architecture design
- Step-by-step tasks
- Technical decisions
- Risk mitigation
- Saved to PLAN.md

### `ai-debug` - Systematic Debugging 🐛

```bash
ai-debug "Users can't login after signup"
```

Uses reasoning to:
1. Understand the problem
2. Gather information
3. Reproduce the issue
4. Analyze root cause
5. Develop solution
6. Verify fix

### `ai-test` - Comprehensive Testing 🧪

```bash
ai-test "Test the checkout flow"
```

Generates:
- Unit tests
- Integration tests
- Edge cases
- Error scenarios
- AAA pattern (Arrange, Act, Assert)

### How to Use These with VS Code

**Best Practice:** Combine both workflows!

```bash
# Terminal: Generate plan for complex feature
ai-plan "Add real-time chat"

# Review PLAN.md

# Terminal: Use conductor for automated implementation
ai-conductor "Implement the chat feature from PLAN.md"

# VS Code: Make small tweaks and adjustments
# Open Continue extension
# Chat: "Update the chat UI styling"

# Terminal: Generate tests
ai-test "Test the chat messaging"
```

---

## 🤔 What About Kilo Code?

**Kilo Code** was mentioned in the original setup but:
- ❌ It's outdated/less maintained
- ❌ Not as popular as Continue
- ❌ You don't need it

**Recommendation:** Ignore Kilo Code references, use Continue instead!

---

## 📖 Detailed Installation Guide

### Prerequisites
- macOS, Linux, or Windows
- Python 3.8-3.13 (not 3.14)
- Git installed
- VS Code (optional, for Workflow 2)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/AdityaDutta02/ai-coder.git
   cd ai-coder
   ```

2. **Run the setup script**

   **macOS/Linux:**
   ```bash
   bash setup-unix.sh
   ```

   **Windows:**
   ```powershell
   .\setup-windows.ps1
   ```

3. **Enter your API key when prompted**
   - Get it from [OpenRouter.ai/keys](https://openrouter.ai/keys)
   - Paste it when the script asks

4. **Restart your terminal**
   ```bash
   # Close and reopen terminal, or run:
   source ~/.zshrc
   ```

5. **Test it worked**
   ```bash
   ai-dev --help
   ```

   See help text? ✅ Success!

### What Gets Installed

The setup script installs:

✅ **Configuration Files**
- `~/.aider.conf.yml` - Your API key and settings
- `~/.ai-coding-setup/` - Scripts and prompts

✅ **Terminal Commands** (if Aider CLI installs)
- `ai-dev` - Interactive AI coding
- `ai-code` - Build features
- `ai-plan` - Generate plans
- `ai-test` - Write tests
- `ai-debug` - Fix bugs
- `ai-conductor` - Multi-phase development
- `ai-new-project` - Create new projects
- `ai-onboard` - Analyze existing projects

✅ **System Prompts**
- Optimized prompts for planning, coding, testing, debugging

---

## 🎮 How to Use (Step-by-Step Examples)

### Example 1: Using Terminal Workflow (Aider CLI)

```bash
# Step 1: Go to your project
cd my-todo-app

# Step 2: Start interactive AI session
ai-dev

# Step 3: Chat with AI
> Add a dark mode toggle to the app

# AI will:
# - Read your code
# - Make changes
# - Show you the diff
# - Commit to git

# Step 4: Exit when done
> exit
```

### Example 2: Using VS Code Workflow (Continue Extension)

1. **Open your project in VS Code**
   ```bash
   cd my-todo-app
   code .
   ```

2. **Click Continue icon** (in left sidebar)

3. **Type in chat:**
   ```
   Add a dark mode toggle to the app
   ```

4. **Review changes** in the diff view

5. **Click "Accept"** or "Reject"

### Example 3: Quick Feature Development

**Terminal:**
```bash
ai-code "Add a search bar to filter items"
```

**VS Code:**
Type in Continue chat: `Add a search bar to filter items`

### Example 4: Writing Tests

**Terminal:**
```bash
ai-test "Write tests for the login component"
```

**VS Code:**
Type in Continue chat: `Write tests for the login component`

---

## 🛠️ Available Commands (Terminal Workflow Only)

| Command | What It Does | Example |
|---------|--------------|---------|
| `ai-dev` | Interactive chat with AI | `ai-dev` |
| `ai-code` | Build a feature | `ai-code "add signup page"` |
| `ai-plan` | Generate development plan | `ai-plan "add payment system"` |
| `ai-test` | Write tests | `ai-test "test user auth"` |
| `ai-debug` | Fix bugs | `ai-debug "fix login error"` |
| `ai-conductor` | Multi-phase development | `ai-conductor "add chat feature"` |
| `ai-new-project` | Create new project | `ai-new-project "Todo App"` |
| `ai-onboard` | Analyze existing project | `ai-onboard` |

**Note:** These commands DON'T work with VS Code extensions - they're separate workflows!

---

## 🎨 What AI Models Are Used?

All models are **100% free** from OpenRouter:

| Task | Model | Why This One |
|------|-------|--------------|
| **Planning** | MiMo-V2-Flash | Best at architecture & planning |
| **Coding** | KAT-Coder-Pro | Best at writing code |
| **Testing** | Qwen3-Coder | Best at writing tests |
| **Debugging** | MiMo-V2-Flash | Best at problem-solving |

These are configured automatically in `~/.aider.conf.yml`

---

## ⚙️ Configuration

### Your API Key Location
```bash
~/.aider.conf.yml
```

### Change AI Models
Edit `~/.aider.conf.yml`:
```yaml
# Change these to any OpenRouter model
architect-model: openrouter/xiaomi/mimo-v2-flash:free
main-model: openrouter/kwaipilot/kat-coder-pro:free
editor-model: openrouter/kwaipilot/kat-coder-pro:free
```

### For VS Code Extensions
1. Open Continue settings
2. Add custom model:
   - Provider: OpenRouter
   - API Key: (your key from `~/.aider.conf.yml`)
   - Model: `kwaipilot/kat-coder-pro:free`

---

## 🗑️ Uninstallation

To remove everything:

```bash
cd ai-coder
bash uninstall.sh
```

This removes:
- All AI coding scripts
- Configuration files
- PATH modifications

This KEEPS:
- VS Code and extensions
- Python
- Your API key (backs it up)

---

## 🆘 Troubleshooting

### "command not found" when running ai-dev

**Fix 1:** Restart your terminal

**Fix 2:** Reload shell config
```bash
source ~/.zshrc
```

**Fix 3:** Add to PATH manually
```bash
export PATH="$HOME/.ai-coding-setup/bin:$PATH"
```

### Aider installation failed (Python 3.14 issue)

**Solution:** Use VS Code workflow instead!
1. Install "Continue" extension in VS Code
2. Much easier and works perfectly!

**Or:** Use Python 3.11-3.13
```bash
brew install python@3.13
```

### Which workflow should I use?

**If you're not sure:** Use VS Code + Continue extension!
- Easier to learn
- Visual interface
- No Python version issues

### AI is not responding or giving errors

1. **Check your API key**
   ```bash
   cat ~/.aider.conf.yml
   ```

2. **Verify API key is valid** at [OpenRouter.ai](https://openrouter.ai)

3. **Check you have credits** (free tier should have credits)

### VS Code extension can't find API key

The terminal commands (ai-dev, etc.) and VS Code extensions **don't share settings**.

**To use Continue:**
1. Open Continue extension settings
2. Add OpenRouter provider
3. Paste your API key manually
4. Select model: `kwaipilot/kat-coder-pro:free`

---

## 💡 Tips & Best Practices

### For Terminal Workflow (Aider)

✅ **DO:**
- Start in a git repository
- Commit your work before using AI
- Be specific in your requests
- Review changes before accepting

❌ **DON'T:**
- Use in non-git directories (will fail)
- Give vague instructions
- Skip reviewing AI's changes

### For VS Code Workflow (Continue)

✅ **DO:**
- Open your full project folder
- Give context about what you want
- Review diffs carefully
- Accept changes incrementally

❌ **DON'T:**
- Open single files (open the project)
- Accept all changes blindly
- Forget to save files

---

## 📚 More Documentation

- [Complete Installation Guide](INSTALL.md)
- [System Prompts](~/.ai-coding-setup/config/prompts/)
- [Aider Documentation](https://aider.chat/docs/)
- [Continue Extension Docs](https://continue.dev/docs)

---

## 🤝 Contributing

Found a bug? Have an idea?

1. Open an issue: [GitHub Issues](https://github.com/AdityaDutta02/ai-coder/issues)
2. Submit a PR
3. Share feedback!

---

## 📄 License

MIT License - Use it however you want!

---

## ⭐ Star This Repo!

If this helped you, give it a star! ⭐

---

**Built with ❤️ to make AI coding accessible to everyone**

**Questions?** Open an issue on GitHub!
