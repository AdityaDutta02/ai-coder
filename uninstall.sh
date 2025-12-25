#!/bin/bash

# AI Coding Setup - Uninstall Script
# Removes all components except VS Code

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

print_warning() {
    print_message "$YELLOW" "⚠ $1"
}

print_error() {
    print_message "$RED" "✗ $1"
}

# Confirmation
confirm_uninstall() {
    print_header "AI Coding Setup - Uninstaller"

    echo "This will remove:"
    echo "  • AI coding scripts and commands"
    echo "  • Configuration files and prompts"
    echo "  • Aider installation (if installed via pip)"
    echo "  • PATH modifications from shell config"
    echo ""
    echo "This will NOT remove:"
    echo "  • VS Code or its extensions"
    echo "  • Python installations"
    echo "  • Your OpenRouter API key file (backed up)"
    echo ""

    read -p "Are you sure you want to uninstall? (y/n): " CONFIRM

    if [ "$CONFIRM" != "y" ]; then
        echo "Uninstall cancelled."
        exit 0
    fi
}

# Backup API key
backup_api_key() {
    print_header "Backing Up API Key"

    if [ -f "$HOME/.aider.conf.yml" ]; then
        cp "$HOME/.aider.conf.yml" "$HOME/.aider.conf.yml.backup"
        print_success "API key backed up to ~/.aider.conf.yml.backup"
    else
        print_warning "No API key file found to backup"
    fi
}

# Remove installed packages
remove_packages() {
    print_header "Removing Installed Packages"

    # Try to uninstall aider-chat with pip
    if command -v python3 >/dev/null 2>&1; then
        if python3 -m pip show aider-chat >/dev/null 2>&1; then
            print_message "$YELLOW" "Uninstalling aider-chat..."
            python3 -m pip uninstall -y aider-chat 2>/dev/null || true
            print_success "aider-chat removed"
        fi

        if python3 -m pip show aider >/dev/null 2>&1; then
            print_message "$YELLOW" "Uninstalling aider..."
            python3 -m pip uninstall -y aider 2>/dev/null || true
            print_success "aider removed"
        fi
    fi

    # Try Python 3.13 specifically
    if command -v python3.13 >/dev/null 2>&1; then
        if python3.13 -m pip show aider-chat >/dev/null 2>&1; then
            print_message "$YELLOW" "Uninstalling aider-chat (Python 3.13)..."
            python3.13 -m pip uninstall -y aider-chat 2>/dev/null || true
            print_success "aider-chat removed from Python 3.13"
        fi
    fi

    # Remove pipx installations
    if command -v pipx >/dev/null 2>&1; then
        if pipx list | grep -q "aider"; then
            print_message "$YELLOW" "Uninstalling aider via pipx..."
            pipx uninstall aider 2>/dev/null || true
            print_success "aider removed from pipx"
        fi

        if pipx list | grep -q "aider-chat"; then
            print_message "$YELLOW" "Uninstalling aider-chat via pipx..."
            pipx uninstall aider-chat 2>/dev/null || true
            print_success "aider-chat removed from pipx"
        fi
    fi
}

# Remove directories
remove_directories() {
    print_header "Removing Directories and Files"

    # Remove main setup directory
    if [ -d "$HOME/.ai-coding-setup" ]; then
        rm -rf "$HOME/.ai-coding-setup"
        print_success "Removed ~/.ai-coding-setup"
    else
        print_warning "Directory ~/.ai-coding-setup not found"
    fi

    # Remove aider config (after backing up)
    if [ -f "$HOME/.aider.conf.yml" ]; then
        rm -f "$HOME/.aider.conf.yml"
        print_success "Removed ~/.aider.conf.yml (backup saved)"
    fi
}

# Clean up shell configuration
cleanup_shell_config() {
    print_header "Cleaning Up Shell Configuration"

    local shell_configs=("$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile")

    for config_file in "${shell_configs[@]}"; do
        if [ -f "$config_file" ]; then
            # Create backup
            cp "$config_file" "${config_file}.backup"

            # Remove AI Coding Setup section
            if grep -q "# AI Coding Setup" "$config_file"; then
                # Remove the section between "# AI Coding Setup" and the next empty line
                sed -i.bak '/# AI Coding Setup/,/^$/d' "$config_file"
                rm -f "${config_file}.bak"
                print_success "Cleaned up $config_file (backup at ${config_file}.backup)"
            fi
        fi
    done
}

# Print completion message
print_completion() {
    print_header "Uninstall Complete! ✓"

    cat << 'COMPLETIONEOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ WHAT WAS REMOVED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✓ All AI coding scripts (ai-dev, ai-code, etc.)
✓ Configuration files and system prompts
✓ Aider installation (pip/pipx)
✓ PATH modifications from shell config

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💾 BACKUPS CREATED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Your API key: ~/.aider.conf.yml.backup
Shell configs: ~/.zshrc.backup, ~/.bashrc.backup

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📝 WHAT YOU NEED TO DO NOW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STEP 1: Restart your terminal
   Close this window and open a new terminal
   (This removes the old commands from PATH)

STEP 2: Clean up VS Code extensions (optional)
   If you installed Continue or Cline:
   1. Open VS Code
   2. Go to Extensions (Cmd+Shift+X)
   3. Find "Continue" or "Cline"
   4. Click "Uninstall"

STEP 3: Remove backups (when ready)
   rm ~/.aider.conf.yml.backup
   rm ~/.zshrc.backup
   rm ~/.bashrc.backup

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔄 WANT TO REINSTALL LATER?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Just run the setup script again:
  bash setup-unix.sh

Your backed-up API key will still be available!

COMPLETIONEOF

    print_message "$GREEN" "Uninstall complete! Restart your terminal."
    echo ""
}

# Main uninstall flow
main() {
    confirm_uninstall
    backup_api_key
    remove_packages
    remove_directories
    cleanup_shell_config
    print_completion
}

# Run uninstaller
main
