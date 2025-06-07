# Arch Linux Utilities

Package management scripts and git utilities for Arch Linux.

## Installation

```bash
git clone <repository-url> arch_utils
cd arch_utils
./install.sh
```

Or manually:
```bash
# Make scripts executable
chmod +x update list remove clean sysinfo git_aliases.sh

# Add to PATH
echo 'export PATH="$PATH:'$(pwd)'"' >> ~/.bashrc
echo 'source "'$(pwd)'/git_aliases.sh"' >> ~/.bashrc
source ~/.bashrc

# Install git config
cp .gitconfig ~/.gitconfig
```

## Usage

### Package Management
```bash
update              # Update official packages
update --aur        # Update AUR packages
list                # List packages you explicitly installed (default)
list firefox        # Search for packages containing "firefox"
list --aur          # List installed AUR packages
list --aur firefox  # Search AUR for "firefox"
list --installed    # List all packages (including dependencies)
remove firefox      # Remove package
remove -r firefox   # Remove with dependencies
clean --all         # Clean system (cache + orphans)
sysinfo             # Show system information
```

### Git Commands
```bash
# Common workflow
gs                  # git status - check what's changed
gca "fix bug"       # git commit -am - add all and commit
gco branch-name     # git checkout - switch branches
gup                 # git push - push to remote
gdn                 # git pull - pull from remote
gcm                 # git checkout main/master - switch to main branch
gl                  # git log --graph - pretty commit history
gd                  # git diff - see unstaged changes

# Temporary storage
gss "message"       # git stash save - temporarily store changes
gsl                 # git stash list - see all stashes
gsa                 # git stash apply - restore latest stash

# Fixing mistakes
gundo               # undo last commit (keeps changes)
gwipe               # hard reset to HEAD (loses changes!)
gfp                 # show last 10 branches you worked on
```

All commands support `--help` for detailed options. 