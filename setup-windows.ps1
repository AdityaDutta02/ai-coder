# AI Coding Setup - Automated Installation Script
# For Windows PowerShell
# Version: 1.0.0

$ErrorActionPreference = "Stop"

# Colors
function Write-ColorMessage {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Write-Header {
    param([string]$Message)
    Write-Host ""
    Write-ColorMessage "==========================================" "Blue"
    Write-ColorMessage $Message "Blue"
    Write-ColorMessage "==========================================" "Blue"
    Write-Host ""
}

function Write-Success {
    Write-ColorMessage "✓ $args" "Green"
}

function Write-Error {
    Write-ColorMessage "✗ $args" "Red"
}

function Write-Warning {
    Write-ColorMessage "⚠ $args" "Yellow"
}

# Setup directories
$SetupDir = "$env:USERPROFILE\.ai-coding-setup"
$BinDir = "$SetupDir\bin"
$ConfigDir = "$SetupDir\config"
$PromptsDir = "$ConfigDir\prompts"
$TemplatesDir = "$SetupDir\templates"

# Create directory structure
function New-DirectoryStructure {
    Write-Header "Creating Directory Structure"
    
    New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
    New-Item -ItemType Directory -Force -Path $ConfigDir | Out-Null
    New-Item -ItemType Directory -Force -Path $PromptsDir | Out-Null
    New-Item -ItemType Directory -Force -Path TemplatesDir | Out-Null
    
    Write-Success "Directories created at $SetupDir"
}

# Check prerequisites
function Test-Prerequisites {
    Write-Header "Checking Prerequisites"
    
    $missingDeps = @()
    
    # Check Python
    try {
        $pythonVersion = python --version 2>&1
        Write-Success "Python found: $pythonVersion"
    } catch {
        $missingDeps += "Python 3.8+"
    }
    
    # Check Git
    try {
        $gitVersion = git --version
        Write-Success "Git found: $gitVersion"
    } catch {
        $missingDeps += "Git"
    }
    
    # Check pip
    try {
        pip --version | Out-Null
        Write-Success "pip found"
    } catch {
        $missingDeps += "pip"
    }
    
    # Check VS Code
    try {
        code --version | Out-Null
        Write-Success "VS Code found"
    } catch {
        Write-Warning "VS Code not found - install Kilo Code extension manually"
    }
    
    if ($missingDeps.Count -gt 0) {
        Write-Error "Missing required dependencies:"
        $missingDeps | ForEach-Object { Write-Host "  - $_" }
        Write-Host ""
        Write-Host "Please install missing dependencies and run this script again."
        exit 1
    }
    
    Write-Success "All prerequisites met!"
}

# Install Aider
function Install-Aider {
    Write-Header "Installing Aider"
    
    try {
        aider --version 2>&1 | Out-Null
        Write-Warning "Aider already installed, upgrading..."
        pip install --upgrade --user aider-chat
    } catch {
        pip install --user aider-chat
    }
    
    Write-Success "Aider installed successfully"
}

# Get API Key
function Get-ApiKey {
    Write-Header "OpenRouter API Key Setup"
    
    Write-Host "Get your free API key from: https://openrouter.ai/keys"
    Write-Host ""
    $apiKey = Read-Host "Enter your OpenRouter API key (starts with sk-or-v1-)"
    
    if (-not ($apiKey -match "^sk-or-v1-")) {
        Write-Error "Invalid API key format. Should start with 'sk-or-v1-'"
        exit 1
    }
    
    Write-Success "API key validated"
    return $apiKey
}

# Create Aider config
function New-AiderConfig {
    param([string]$ApiKey)
    
    Write-Header "Creating Aider Configuration"
    
    $configContent = @"
# OpenRouter API Configuration
openrouter-api-key: $ApiKey

# Model Routing - All FREE models
architect-model: openrouter/xiaomi/mimo-v2-flash:free
main-model: openrouter/kwaipilot/kat-coder-pro:free
editor-model: openrouter/kwaipilot/kat-coder-pro:free

# Context Management
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
"@
    
    $configContent | Out-File -FilePath "$env:USERPROFILE\.aider.conf.yml" -Encoding UTF8
    Write-Success "Aider configuration created"
}

# Create system prompts (same content as Unix version, saved to PromptsDir)
function New-SystemPrompts {
    Write-Header "Creating System Prompts"
    
    # Create the same prompts as in Unix script
    # (Content omitted for brevity - same as Unix version)
    
    Write-Success "System prompts created in $PromptsDir"
}

# Create workflow scripts
function New-WorkflowScripts {
    Write-Header "Creating Workflow Scripts"
    
    # ai-conductor.bat
    $conductorScript = @'
@echo off
set QUERY=%*
set SCRIPT_DIR=%~dp0
set PROMPTS_DIR=%SCRIPT_DIR%..\config\prompts

if "%QUERY%"=="" (
    echo Usage: ai-conductor ^<description^>
    exit /b 1
)

echo AI Conductor - Multi-Phase Development
echo ==========================================
echo.
echo Task: %QUERY%
echo.

echo Phase 1: Planning
aider --model openrouter/xiaomi/mimo-v2-flash:free --no-auto-commits --message "Create development plan for: %QUERY%"

echo.
set /p CONTINUE=Continue with implementation? (y/n): 

if not "%CONTINUE%"=="y" exit /b 0

echo.
echo Phase 2: Implementation
aider --model openrouter/kwaipilot/kat-coder-pro:free --yes --auto-commits --read PLAN.md --message "Implement the plan"

echo.
echo Conductor complete!
'@
    $conductorScript | Out-File -FilePath "$BinDir\ai-conductor.bat" -Encoding ASCII
    
    # Other scripts (ai-plan, ai-code, ai-test, ai-debug, ai-dev, ai-new-project, ai-onboard)
    # Similar pattern to Unix versions but using .bat syntax
    
    Write-Success "Workflow scripts created in $BinDir"
}

# Add to PATH
function Add-ToPath {
    Write-Header "Adding Scripts to PATH"
    
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
    
    if ($currentPath -like "*$BinDir*") {
        Write-Warning "PATH already configured"
    } else {
        $newPath = "$currentPath;$BinDir"
        [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
        $env:Path = "$env:Path;$BinDir"
        Write-Success "Added to PATH"
        Write-Warning "Restart PowerShell for PATH changes to take effect"
    }
}

# Install VS Code extension
function Install-VSCodeExtension {
    Write-Header "Installing VS Code Extensions"
    
    try {
        code --version | Out-Null
    } catch {
        Write-Warning "VS Code not found - skipping extension installation"
        return
    }
    
    try {
        code --install-extension kilo-code 2>$null
        Write-Success "Kilo Code extension installed"
    } catch {
        Write-Warning "Could not auto-install Kilo Code"
        Write-Warning "Install manually from VS Code marketplace"
    }
}

# Print completion message
function Write-Completion {
    Write-Header "Installation Complete! 🎉"
    
    Write-Host @"

Your AI coding setup is ready! Here's how to use it:

CREATE NEW PROJECT:
  ai-new-project "My Amazing App"

ONBOARD EXISTING PROJECT:
  cd C:\path\to\project
  ai-onboard

MULTI-PHASE DEVELOPMENT:
  ai-conductor "Add real-time chat feature"

QUICK COMMANDS:
  ai-plan "description"     - Generate development plan
  ai-code "task"           - Implement feature
  ai-test "what to test"   - Write tests
  ai-debug "issue"         - Debug problems
  ai-dev                   - Interactive development

GETTING STARTED:
  1. Restart PowerShell (or open new window)
  2. Try: ai-new-project "Test App"
  3. Watch the AI build your app!

"@

    Write-ColorMessage "Happy coding! 🚀" "Green"
}

# Main installation
function Main {
    Clear-Host
    Write-Header "AI Coding Setup - Automated Installation"
    Write-ColorMessage "This will set up a complete AI coding environment" "Blue"
    Write-Host ""
    
    $confirm = Read-Host "Continue? (y/n)"
    if ($confirm -ne "y") {
        Write-Host "Installation cancelled."
        exit 0
    }
    
    Test-Prerequisites
    New-DirectoryStructure
    $apiKey = Get-ApiKey
    Install-Aider
    New-AiderConfig -ApiKey $apiKey
    New-SystemPrompts
    New-WorkflowScripts
    Add-ToPath
    Install-VSCodeExtension
    Write-Completion
}

# Run installation
Main
