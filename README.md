# Arch Linux Utilities

A collection of useful utilities and configurations for Arch Linux users.

## 📁 Contents

### Git Configuration
- **`.gitconfig`** - Comprehensive git aliases and configuration

### Package Management Scripts
- **`update`** - Update system packages (pacman and AUR)
- **`list`** - List and search packages
- **`remove`** - Remove packages safely
- **`clean`** - System cleanup utility

### System Information
- **`sysinfo`** - Comprehensive system information display

## 🚀 Quick Start

1. Clone or download this repository
2. Make scripts executable (if not already):
   ```bash
   chmod +x update list remove clean sysinfo
   ```
3. Use the git configuration:
   ```bash
   # Copy to your home directory
   cp .gitconfig ~/.gitconfig
   
   # Or include it in your existing config
   git config --global include.path /path/to/arch_utils/.gitconfig
   ```

## 📖 Usage Guide

### Package Management

#### Update System
```bash
# Update official packages
./update

# Update AUR packages only
./update --aur

# Force update without confirmation
./update --force
```

#### List Packages
```bash
# Search repository packages
./list firefox

# List installed packages
./list --installed

# List AUR packages
./list --aur

# List explicitly installed packages
./list --explicit

# Show detailed package information
./list --details firefox
```

#### Remove Packages
```bash
# Remove a package
./remove firefox

# Remove package and unused dependencies
./remove -r firefox

# Remove multiple packages
./remove firefox chromium

# Remove AUR package
./remove --aur some-aur-package

# Dry run (show what would be removed)
./remove --dry-run -r firefox
```

### System Maintenance

#### Clean System
```bash
# Clean package cache
./clean --cache

# Remove orphaned packages
./clean --orphans

# Perform all cleanup operations
./clean --all

# Dry run to see what would be cleaned
./clean --dry-run --all
```

#### System Information
```bash
# Show comprehensive system information
./sysinfo
```

## 🎯 Git Aliases

The `.gitconfig` file includes many useful aliases:

### Basic Shortcuts
- `git st` → `git status`
- `git co` → `git checkout`
- `git br` → `git branch`
- `git cm` → `git commit -m`

### Advanced Logging
- `git lg` → Pretty one-line log with graph
- `git ll` → Detailed log with colors and author info
- `git lga` → Log all branches with graph

### Useful Utilities
- `git aliases` → List all git aliases
- `git undo` → Undo last commit (soft reset)
- `git wipe` → Hard reset to HEAD
- `git clean-branches` → Remove merged branches
- `git ac "message"` → Add all and commit

## 🔧 Features

### Package Management
- **Safety First**: All scripts include confirmation prompts and dry-run options
- **AUR Support**: Integrated support for AUR packages using `paru`
- **Colored Output**: Easy-to-read colored terminal output
- **Error Handling**: Comprehensive error checking and user feedback

### System Information
- **Hardware Details**: CPU, GPU, memory, and disk information
- **Package Statistics**: Installed packages, available updates
- **Service Status**: Common system services status
- **Network Information**: Interface status and IP addresses
- **System Health**: Recent logs and temperature monitoring

### Git Configuration
- **Comprehensive Aliases**: 30+ useful git aliases
- **Pretty Logging**: Colorized and formatted log output
- **Workflow Helpers**: Quick commands for common git operations
- **Branch Management**: Tools for cleaning up merged branches

## 📋 Requirements

### Core Requirements
- Arch Linux (or Arch-based distribution)
- Bash shell
- `pacman` package manager

### Optional Dependencies
- **`paru`** - For AUR package management
  ```bash
  git clone https://aur.archlinux.org/paru.git
  cd paru && makepkg -si
  ```
- **`lm_sensors`** - For temperature monitoring
  ```bash
  sudo pacman -S lm_sensors
  ```

## 🛠️ Installation

### Method 1: Direct Usage
```bash
git clone <repository-url> arch_utils
cd arch_utils
chmod +x update list remove clean sysinfo
```

### Method 2: Add to PATH
```bash
# Add to your ~/.bashrc or ~/.zshrc
export PATH="$PATH:/path/to/arch_utils"

# Then use commands globally
update --aur
list --installed
sysinfo
```

### Method 3: Symlink to /usr/local/bin
```bash
sudo ln -s /path/to/arch_utils/update /usr/local/bin/
sudo ln -s /path/to/arch_utils/list /usr/local/bin/
sudo ln -s /path/to/arch_utils/remove /usr/local/bin/
sudo ln -s /path/to/arch_utils/clean /usr/local/bin/
sudo ln -s /path/to/arch_utils/sysinfo /usr/local/bin/
```

## 🔍 Examples

### Daily Maintenance Routine
```bash
# Check system status
./sysinfo

# Update all packages
./update

# Clean up system
./clean --all
```

### Package Management Workflow
```bash
# Search for a package
./list firefox

# Install it (use pacman directly)
sudo pacman -S firefox

# Later, remove it with dependencies
./remove -r firefox
```

### Git Workflow with Aliases
```bash
# Quick status and log
git st
git lg

# Add all and commit
git ac "Fix bug in update script"

# Push with force-with-lease
git psf
```

## 🤝 Contributing

Feel free to submit issues, feature requests, or pull requests to improve these utilities!

## 📄 License

This project is open source. Feel free to use, modify, and distribute as needed.

---

**Note**: These utilities are designed for Arch Linux. Some features may not work on other distributions. 