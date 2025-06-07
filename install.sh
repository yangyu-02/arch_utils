#!/bin/bash

# Arch Utils Installation Script
# This script helps you install and configure the Arch Linux utilities

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${CYAN}=== $1 ===${NC}"
}

# Check if running on Arch Linux
check_arch_linux() {
    if ! command -v pacman &> /dev/null; then
        print_error "This script is designed for Arch Linux systems with pacman"
        exit 1
    fi
    
    print_success "Arch Linux detected"
}

# Make scripts executable
make_executable() {
    print_status "Making scripts executable..."
    chmod +x update list remove clean sysinfo
    print_success "Scripts are now executable"
}

# Install git configuration
install_git_config() {
    print_header "Git Configuration Setup"
    
    if [[ -f ~/.gitconfig ]]; then
        print_warning "Existing ~/.gitconfig found"
        read -p "Do you want to backup and replace it? [y/N] " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            cp ~/.gitconfig ~/.gitconfig.backup
            print_status "Backed up existing config to ~/.gitconfig.backup"
            cp .gitconfig ~/.gitconfig
            print_success "Git configuration installed"
        else
            print_status "You can manually merge the configuration later"
            print_status "Or include it with: git config --global include.path $(pwd)/.gitconfig"
        fi
    else
        cp .gitconfig ~/.gitconfig
        print_success "Git configuration installed"
    fi
}

# Add to PATH
add_to_path() {
    print_header "PATH Configuration"
    
    local current_dir=$(pwd)
    local shell_rc=""
    
    # Detect shell
    if [[ $SHELL == *"zsh"* ]]; then
        shell_rc="$HOME/.zshrc"
    elif [[ $SHELL == *"bash"* ]]; then
        shell_rc="$HOME/.bashrc"
    else
        print_warning "Unknown shell: $SHELL"
        print_status "You may need to manually add $current_dir to your PATH"
        return
    fi
    
    # Check if already in PATH
    if grep -q "$current_dir" "$shell_rc" 2>/dev/null; then
        print_warning "Directory already appears to be in PATH configuration"
        return
    fi
    
    read -p "Do you want to add $(pwd) to your PATH in $shell_rc? [y/N] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "" >> "$shell_rc"
        echo "# Arch Utils" >> "$shell_rc"
        echo "export PATH=\"\$PATH:$current_dir\"" >> "$shell_rc"
        print_success "Added to PATH in $shell_rc"
        print_status "Restart your shell or run: source $shell_rc"
    fi
}

# Create symlinks
create_symlinks() {
    print_header "System-wide Installation"
    
    read -p "Do you want to create system-wide symlinks in /usr/local/bin? [y/N] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        local current_dir=$(pwd)
        local scripts=("update" "list" "remove" "clean" "sysinfo")
        
        for script in "${scripts[@]}"; do
            if [[ -L "/usr/local/bin/$script" ]]; then
                print_warning "Symlink /usr/local/bin/$script already exists"
                continue
            fi
            
            sudo ln -s "$current_dir/$script" "/usr/local/bin/"
            print_success "Created symlink for $script"
        done
        
        print_success "System-wide installation completed"
        print_status "You can now use the commands globally (e.g., 'update', 'sysinfo')"
    fi
}

# Check dependencies
check_dependencies() {
    print_header "Dependency Check"
    
    # Check for paru
    if command -v paru &> /dev/null; then
        print_success "paru is installed (AUR support available)"
    else
        print_warning "paru is not installed (AUR features will be limited)"
        read -p "Do you want to install paru? [y/N] " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_status "Installing paru..."
            cd /tmp
            git clone https://aur.archlinux.org/paru.git
            cd paru
            makepkg -si --noconfirm
            cd - > /dev/null
            print_success "paru installed successfully"
        fi
    fi
    
    # Check for lm_sensors
    if command -v sensors &> /dev/null; then
        print_success "lm_sensors is installed (temperature monitoring available)"
    else
        print_warning "lm_sensors is not installed (temperature monitoring unavailable)"
        read -p "Do you want to install lm_sensors? [y/N] " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo pacman -S --noconfirm lm_sensors
            print_success "lm_sensors installed successfully"
        fi
    fi
}

# Test installation
test_installation() {
    print_header "Testing Installation"
    
    local scripts=("update" "list" "remove" "clean" "sysinfo")
    
    for script in "${scripts[@]}"; do
        if ./"$script" --help &> /dev/null; then
            print_success "$script is working correctly"
        else
            print_error "$script failed help test"
        fi
    done
}

# Main installation function
main() {
    echo -e "${CYAN}"
    echo "     _             _       _   _ _   _ _     "
    echo "    / \   _ __ ___| |__   | | | | |_(_) |___ "
    echo "   / _ \ | '__/ __| '_ \  | | | | __| | / __|"
    echo "  / ___ \| | | (__| | | | | |_| | |_| | \__ \\"
    echo " /_/   \_\_|  \___|_| |_|  \___/ \__|_|_|___/"
    echo -e "${NC}"
    echo ""
    echo "Welcome to the Arch Linux Utilities installer!"
    echo ""
    
    check_arch_linux
    make_executable
    
    echo ""
    install_git_config
    
    echo ""
    add_to_path
    
    echo ""
    create_symlinks
    
    echo ""
    check_dependencies
    
    echo ""
    test_installation
    
    echo ""
    print_success "Installation completed!"
    echo ""
    print_status "Available commands:"
    echo "  update  - Update system packages"
    echo "  list    - List and search packages"
    echo "  remove  - Remove packages safely"
    echo "  clean   - System cleanup utility"
    echo "  sysinfo - System information display"
    echo ""
    print_status "Run any command with --help for usage information"
    print_status "Check README.md for detailed documentation"
}

# Run main function
main "$@" 