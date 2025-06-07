#!/bin/bash

# Git Shell Aliases
# Source this file in your ~/.bashrc or ~/.zshrc to get short git commands
# Usage: source git_aliases.sh

# Common workflow commands
alias gs='git status'                                  # Show status of working directory
alias gca='git add -A && git commit -m'                 # Add all changes (including new files) and commit with message
alias gco='git checkout'                               # Switch branches or restore files
alias gup='git push'                                   # Push commits to remote
alias gupf='git push --force-with-lease'               # Safe force push (won't overwrite others)
alias gdn='git pull'                                   # Pull changes from remote
alias gcm='git checkout main || git checkout master'   # Switch to main/master branch
alias gmm='git merge main || git merge master'         # Merge main/master into current branch
alias gl='git log --oneline --decorate --graph'        # Pretty commit history
alias gfa='git fetch --all'                            # Download all remote changes
alias gd='git diff'                                    # Show unstaged changes
alias gfp='git flip'                                   # Show last 10 branches you worked on

# Logging and history
alias gla='git log --oneline --decorate --graph --all' # History of all branches
alias gll='git log --pretty=format:"%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'  # Detailed colorized log
alias glla='git log --pretty=format:"%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all'  # Detailed log for all branches

# Viewing changes
alias gdc='git diff --cached'                          # Show staged changes (what's about to be committed)

# Temporary storage
alias gsl='git stash list'                             # List all stashes
alias gsa='git stash apply'                            # Apply latest stash
alias gss='git stash push -m'                          # Save current changes to stash
alias gsp='git stash pop'                              # Apply and remove latest stash

# Branch operations
alias gbd='git branch -d'                              # Delete branch (safe)

# Merging and rebasing
alias gmg='git merge --no-ff'                          # Merge with merge commit
alias grb='git rebase'                                 # Rebase current branch
alias grbi='git rebase -i'                             # Interactive rebase (edit history)
alias grbc='git rebase --continue'                     # Continue rebase after fixing conflicts
alias grba='git rebase --abort'                        # Cancel rebase

# Fixing mistakes
alias gamend='git commit --amend'                      # Fix last commit message
alias gundo='git reset --soft HEAD^'                   # Undo last commit (keep changes)
alias gwipe='git reset --hard HEAD'                    # Hard reset (LOSE all changes!)
alias gclean='git branch --merged | grep -v "\*\|master\|main\|develop" | xargs -n 1 git branch -d'  # Remove merged branches


