# AI Coder - Installation & Uninstallation Guide

## 🚀 Quick Start - Installation

### Step 1: Clone the Repository
```bash
git clone https://github.com/AdityaDutta02/ai-coder.git
cd ai-coder
```

### Step 2: Run the Setup Script
```bash
bash setup-unix.sh
```

### Step 3: Restart Your Terminal
Close and reopen your terminal, or run:
```bash
source ~/.zshrc
```

### Step 4: Test It Works
```bash
ai-dev --help
```

If you see help text = ✅ You're ready!

---

## 📋 What Gets Installed

✅ **AI Coding Scripts**
- `ai-dev` - Interactive coding session
- `ai-code` - Build features
- `ai-plan` - Generate development plans
- `ai-test` - Write tests
- `ai-debug` - Fix bugs
- `ai-conductor` - Multi-phase development
- `ai-new-project` - Create new projects
- `ai-onboard` - Onboard existing projects

✅ **Configuration Files**
- `~/.ai-coding-setup/` - Main directory
- `~/.aider.conf.yml` - Aider configuration with API key
- System prompts for orchestrator, coder, debugger, tester

✅ **Optional Components**
- Aider CLI tool (if Python compatible)
- PATH updates in shell config

---

## 🗑️ Complete Uninstallation

### To Remove Everything

Run the uninstall script:
```bash
bash uninstall.sh
```

### What Gets Removed

✓ All AI coding scripts and commands
✓ Configuration files and prompts
✓ Aider installation (pip/pipx)
✓ PATH modifications from shell config

### What DOESN'T Get Removed

✗ VS Code and extensions (manual removal)
✗ Python installations
✗ Your API key (backed up to `~/.aider.conf.yml.backup`)

### After Uninstalling

1. **Restart your terminal** - Removes commands from PATH
2. **Remove VS Code extensions (optional)**:
   - Open VS Code
   - Go to Extensions (Cmd+Shift+X)
   - Uninstall "Continue" or "Cline" if installed
3. **Delete backups when ready**:
   ```bash
   rm ~/.aider.conf.yml.backup
   rm ~/.zshrc.backup
   rm ~/.bashrc.backup
   ```

---

## 🔄 Reinstallation

To reinstall after uninstalling:

```bash
cd ai-coder
bash setup-unix.sh
```

Your backed-up API key will still be available at `~/.aider.conf.yml.backup`!

---

## 🆘 Troubleshooting

### "command not found" error

**Solution 1:** Restart your terminal

**Solution 2:** Reload your shell config
```bash
source ~/.zshrc
```

### Aider installation failed

Don't worry! Use VS Code extensions instead:
1. Install "Continue" extension in VS Code
2. Add your OpenRouter API key
3. Start coding!

### Want to remove everything manually

```bash
# Remove directories
rm -rf ~/.ai-coding-setup

# Remove config file (backup it first!)
cp ~/.aider.conf.yml ~/.aider.conf.yml.backup
rm ~/.aider.conf.yml

# Remove PATH entry from ~/.zshrc
# Open the file and delete lines between "# AI Coding Setup" and next empty line

# Uninstall aider
python3 -m pip uninstall -y aider-chat
pipx uninstall aider 2>/dev/null
```

---

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/AdityaDutta02/ai-coder/issues)
- **Documentation**: See `AI_CODING_SETUP_COMPLETE_GUIDE.md`

---

## ⚙️ System Requirements

- macOS or Linux (Windows: use `setup-windows.ps1`)
- Python 3.8-3.13 (not 3.14+)
- Git
- VS Code (optional, recommended)

---

**Happy Coding! 🚀**
