#!/bin/bash

# Package and sign the Notes Firefox Extension for distribution
# This creates a signed .xpi file ready for distribution via AMO

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}Notes Extension - Installation Guide${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

# Check if we're on the right path
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -f "$PROJECT_ROOT/manifest.json" ]; then
    echo -e "${RED}Error: manifest.json not found. Running from wrong directory.${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Found project root: $PROJECT_ROOT${NC}"
echo ""

# Check if build.sh exists and run it
if [ -f "$PROJECT_ROOT/build.sh" ]; then
    echo -e "${YELLOW}Building extension package...${NC}"
    bash "$PROJECT_ROOT/build.sh"
    echo ""
fi

# Check if .xpi exists
if [ -f "$PROJECT_ROOT/dist/notes.xpi" ]; then
    XPI_SIZE=$(ls -lh "$PROJECT_ROOT/dist/notes.xpi" | awk '{print $5}')
    echo -e "${GREEN}✓ Extension package ready: dist/notes.xpi (${XPI_SIZE})${NC}"
    echo ""
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}Installation Methods${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
    
    echo -e "${YELLOW}Method 1: Install from .xpi file (Recommended)${NC}"
    echo "1. Open Firefox browser"
    echo "2. Navigate to about:addons"
    echo "3. Click the settings gear icon (⚙️)"
    echo "4. Select 'Install Add-on From File...'"
    echo "5. Navigate to and select: dist/notes.xpi"
    echo "6. Click 'Add' when prompted"
    echo ""
    
    echo -e "${YELLOW}Method 2: Temporary Load (Development/Testing)${NC}"
    echo "1. Open Firefox browser"
    echo "2. Navigate to about:debugging"
    echo "3. Click 'This Firefox' in the left sidebar"
    echo "4. Click 'Load Temporary Add-on'"
    echo "5. Navigate to this project folder and select manifest.json"
    echo "6. The extension will be available until you restart Firefox"
    echo ""
    
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}Usage${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
    echo "1. Click the Notes icon in your Firefox toolbar"
    echo "2. The Notes popup will open (500x600px window)"
    echo ""
    echo -e "${YELLOW}Creating a Note:${NC}"
    echo "  • Click '+ New Note' button (floating button, bottom-right)"
    echo "  • Enter a title in the title field"
    echo "  • Type your note content"
    echo "  • Click 'Save' to save the note"
    echo ""
    echo -e "${YELLOW}Editing a Note:${NC}"
    echo "  • Click on any note in the list to open it"
    echo "  • Make your changes"
    echo "  • Click 'Save' to save the changes"
    echo "  • Click 'Back' to return to the notes list"
    echo ""
    echo -e "${YELLOW}Deleting a Note:${NC}"
    echo "  • Click the trash icon next to any note in the list"
    echo "  • Confirm the deletion when prompted"
    echo ""
    
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}Features${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
    echo "✨ Create multiple notes with titles and content"
    echo "📝 Edit notes anytime"
    echo "💾 All notes saved locally in Firefox storage"
    echo "🗑️  Delete notes with confirmation"
    echo "📅 Track creation and update dates"
    echo "🔍 See note previews in the list view"
    echo ""
    
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}Data Storage${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
    echo "• All notes are stored in Firefox's local storage"
    echo "• Data persists even after closing the browser"
    echo "• Data is stored locally on your computer (no cloud sync)"
    echo "• To clear all data: Clear Firefox's site data for the extension"
    echo ""
    
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}Troubleshooting${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
    echo -e "${YELLOW}Extension doesn't appear in toolbar:${NC}"
    echo "  1. Check Firefox console for errors (F12)"
    echo "  2. Ensure manifest.json is valid"
    echo "  3. Try reloading the extension from about:debugging"
    echo "  4. Restart Firefox completely"
    echo ""
    echo -e "${YELLOW}Notes not saving:${NC}"
    echo "  1. Check if Firefox storage is available"
    echo "  2. Check browser console for JavaScript errors"
    echo "  3. Try clearing browser cache and reloading"
    echo ""
    echo -e "${YELLOW}Notes disappeared:${NC}"
    echo "  1. Notes may have been cleared when clearing site data"
    echo "  2. Check if you can uninstall and reinstall the extension"
    echo ""
    
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}Additional Information${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
    echo "Firefox Version: Requires Firefox 55+ (Manifest V3)"
    echo "No external dependencies - pure JavaScript"
    echo "Icons: 128x128px PNG format"
    echo "Popup Size: 500px wide × 600px tall"
    echo ""
    echo -e "${GREEN}Extension is ready to install!${NC}"
    echo ""
    
else
    echo -e "${RED}Error: dist/notes.xpi not found${NC}"
    echo "Please run: ./build.sh"
    exit 1
fi
