#!/bin/bash

# MkDocs Vimwiki Setup and Server Script
# Usage: ./setup_mkdocs.sh

set -e  # Exit on any error

VIMWIKI_DIR="$HOME/MEGA/vimwiki"
MKDOCS_CONFIG="$VIMWIKI_DIR/mkdocs.yml"
PID_FILE="$VIMWIKI_DIR/.mkdocs.pid"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

# Check if vimwiki directory exists
if [ ! -d "$VIMWIKI_DIR" ]; then
    print_error "Vimwiki directory not found at $VIMWIKI_DIR"
    print_status "Creating vimwiki directory..."
    mkdir -p "$VIMWIKI_DIR"
fi

cd "$VIMWIKI_DIR"

# Check if mkdocs is installed
if ! command -v mkdocs &> /dev/null; then
    print_status "MkDocs not found. Installing mkdocs and mkdocs-material..."
    
    # Try different installation methods for Arch Linux
    if command -v pacman &> /dev/null; then
        print_status "Detected Arch Linux. Trying pacman first..."
        if sudo pacman -S --noconfirm python-mkdocs python-mkdocs-material 2>/dev/null; then
            print_success "MkDocs installed via pacman!"
        else
            print_warning "Pacman installation failed. Trying pipx..."
            if command -v pipx &> /dev/null; then
                pipx install mkdocs
                pipx inject mkdocs mkdocs-material
                print_success "MkDocs installed via pipx!"
            else
                print_status "Installing pipx first..."
                sudo pacman -S --noconfirm python-pipx
                pipx install mkdocs
                pipx inject mkdocs mkdocs-material
                print_success "MkDocs installed via pipx!"
            fi
        fi
    elif command -v pipx &> /dev/null; then
        print_status "Using pipx to install MkDocs..."
        pipx install mkdocs
        pipx inject mkdocs mkdocs-material
        print_success "MkDocs installed via pipx!"
    else
        print_warning "Neither pacman nor pipx found. Creating virtual environment..."
        python -m venv ~/.local/share/mkdocs-venv
        ~/.local/share/mkdocs-venv/bin/pip install mkdocs mkdocs-material
        # Create symlinks to make commands available
        mkdir -p ~/.local/bin
        ln -sf ~/.local/share/mkdocs-venv/bin/mkdocs ~/.local/bin/mkdocs
        print_success "MkDocs installed in virtual environment!"
        print_status "Make sure ~/.local/bin is in your PATH"
    fi
fi

# Stop existing mkdocs server if running
if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE")
    if kill -0 "$OLD_PID" 2>/dev/null; then
        print_status "Stopping existing MkDocs server (PID: $OLD_PID)..."
        kill "$OLD_PID"
        rm -f "$PID_FILE"
        sleep 2
    fi
fi

# Create or update mkdocs.yml configuration
print_status "Creating/updating mkdocs.yml configuration..."
cat > "$MKDOCS_CONFIG" << 'EOF'
site_name: Vimwiki Documentation
site_description: Personal documentation and notes

theme:
  name: material
  palette:
    # Palette toggle for light mode
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    # Palette toggle for dark mode
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: indigo
      accent: indigo
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.top
    - search.highlight
    - search.share
    - toc.integrate

# Use docs subdirectory to avoid conflicts
docs_dir: docs
site_dir: site

plugins:
  - search

markdown_extensions:
  - toc:
      permalink: true
  - admonition
  - codehilite
  - pymdownx.superfences
  - pymdownx.tabbed
  - pymdownx.tilde
  - pymdownx.betterem:
      smart_enable: all
  - pymdownx.caret
  - pymdownx.mark
  - pymdownx.smartsymbols
  - pymdownx.inlinehilite
  - pymdownx.critic
  - pymdownx.details
  - pymdownx.magiclink
  - pymdownx.tasklist:
      custom_checkbox: true
EOF
print_success "Created/updated mkdocs.yml configuration!"

# Create docs directory and move/link markdown files
print_status "Setting up docs directory structure..."
mkdir -p docs

# Create sample index.md in docs directory if needed
if [ ! -f "docs/index.md" ] && [ $(find . -maxdepth 1 -name "*.md" -type f | wc -l) -eq 0 ]; then
    print_status "Creating sample index.md in docs directory..."
    cat > "docs/index.md" << 'EOF'
# Welcome to Vimwiki Documentation

This is your personal documentation site generated from your vimwiki markdown files.

## Getting Started

- Edit your markdown files in Neovim with vimwiki
- Changes will automatically reload in your browser
- Use `Ctrl+C` in the terminal to stop the server

## Features

- **Live Reload**: Changes appear instantly
- **Search**: Use the search box to find content
- **Navigation**: Sidebar shows your file structure
- **Dark/Light Mode**: Toggle with the icon in the header

## Note about File Organization

Your markdown files should be in the `docs/` subdirectory for MkDocs to process them properly.
You can either:
- Move your existing `.md` files to the `docs/` directory
- Create symbolic links from `docs/` to your existing files
- Edit your vimwiki configuration to use `~/vimwiki/docs/` as the path

Happy documenting! 📝
EOF
    print_success "Created sample index.md in docs directory"
else
    # Check if there are existing markdown files in the root
    if [ $(find . -maxdepth 1 -name "*.md" -type f | wc -l) -gt 0 ]; then
        print_status "Found existing markdown files in root directory"
        print_status "Creating symbolic links in docs directory..."
        
        # Create symlinks for all markdown files
        for file in *.md; do
            if [ -f "$file" ] && [ ! -e "docs/$file" ]; then
                ln -s "../$file" "docs/$file"
                print_status "Linked: $file"
            fi
        done
        print_success "Created symbolic links for existing markdown files"
    fi
fi

# Start mkdocs server in background
print_status "Starting MkDocs development server..."

# First, let's test if mkdocs can build the site
print_status "Testing mkdocs build..."
if ! mkdocs build --quiet 2>/tmp/mkdocs_build_error.log; then
    print_error "MkDocs build failed. Error log:"
    cat /tmp/mkdocs_build_error.log
    print_status "Trying to fix common issues..."
    
    # Check if there are any problematic markdown files
    print_status "Checking for problematic files..."
    find . -name "*.md" -exec echo "Found: {}" \;
    
    exit 1
fi

# Check if port 8000 is already in use
if ss -tuln | grep -q ":8000 "; then
    print_warning "Port 8000 is already in use. Trying port 8001..."
    PORT=8001
else
    PORT=8000
fi

# Start server with error logging
LOG_FILE="/tmp/mkdocs_server.log"
print_status "Starting server on port $PORT..."
mkdocs serve --dev-addr=127.0.0.1:$PORT > "$LOG_FILE" 2>&1 &
SERVER_PID=$!

# Save PID for later cleanup
echo $SERVER_PID > "$PID_FILE"

# Wait a moment for server to start
sleep 5

# Check if server is running
if kill -0 $SERVER_PID 2>/dev/null; then
    print_success "MkDocs server started successfully (PID: $SERVER_PID)"
    print_status "Documentation available at: http://127.0.0.1:$PORT"
    
    # Open browser
    print_status "Opening browser..."
    if command -v xdg-open &> /dev/null; then
        xdg-open "http://127.0.0.1:$PORT" &
    elif command -v firefox &> /dev/null; then
        firefox "http://127.0.0.1:$PORT" &
    elif command -v chromium &> /dev/null; then
        chromium "http://127.0.0.1:$PORT" &
    else
        print_warning "Could not detect browser. Please open http://127.0.0.1:$PORT manually"
    fi
    
    print_success "Setup complete!"
    echo ""
    print_status "Tips:"
    echo "  • Edit your markdown files in Neovim - changes will auto-reload"
    echo "  • Press Ctrl+C here to stop the server"
    echo "  • Run this script again to restart the server"
    echo ""
    
    # Keep script running and wait for Ctrl+C
    trap 'print_status "Shutting down MkDocs server..."; kill $SERVER_PID 2>/dev/null; rm -f "$PID_FILE"; print_success "Server stopped. Goodbye!"; exit 0' INT
    
    print_status "Server running... Press Ctrl+C to stop"
    wait $SERVER_PID
else
    print_error "Failed to start MkDocs server"
    print_status "Server log output:"
    cat "$LOG_FILE"
    print_status "Debugging information:"
    echo "  • Current directory: $(pwd)"
    echo "  • mkdocs version: $(mkdocs --version 2>/dev/null || echo 'Not found')"
    echo "  • Python version: $(python --version 2>/dev/null || echo 'Not found')"
    echo "  • Files in directory:"
    ls -la
    rm -f "$PID_FILE"
    exit 1
fi
