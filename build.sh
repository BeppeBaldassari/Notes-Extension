#!/bin/bash

# Build script for Notes Firefox Extension
# This script packages the extension as a .xpi file

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Building Notes Firefox Extension...${NC}"

# Create dist directory
mkdir -p dist

# Clean previous build
rm -f dist/notes.xpi

# Create temporary directory for packaging
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Copy extension files to temp directory
echo "Copying extension files..."
cp manifest.json "$TEMP_DIR/"
cp -r src "$TEMP_DIR/"

# Create .xpi file (which is just a zip file)
echo "Creating .xpi package..."
cd "$TEMP_DIR"
zip -r -q "$OLDPWD/dist/notes.xpi" .
cd "$OLDPWD"

echo -e "${GREEN}✓ Build complete!${NC}"
echo -e "${GREEN}✓ Package created: dist/notes.xpi${NC}"
echo ""
echo "Installation instructions:"
echo "1. Open Firefox and navigate to about:addons"
echo "2. Click the settings icon (⚙️) and select 'Install Add-on From File...'"
echo "3. Select dist/notes.xpi"
echo ""
echo "Or for development/testing:"
echo "1. Go to about:debugging"
echo "2. Click 'This Firefox'"
echo "3. Click 'Load Temporary Add-on'"
echo "4. Select manifest.json from the project root"
