<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

## Firefox Notes Extension Project

This is a Firefox WebExtension for note-taking. Users can create, edit, save, and manage multiple notes that are stored locally on their PC using browser storage APIs.

### Key Features
- Create new notes
- Edit existing notes
- Save notes to local storage
- Open and manage multiple notes
- Delete notes
- Simple, intuitive UI

### Project Structure
- `manifest.json` - Extension manifest (Firefox WebExtension format)
- `src/popup.html` - UI for the note editor
- `src/popup.js` - Logic for note management
- `src/popup.css` - Styling for the note editor
- `src/storage.js` - Storage utility functions
- `dist/` - Build output directory
- `README.md` - Documentation

### Development Guidelines
- Uses Firefox WebExtension APIs
- All notes stored in browser.storage.local
- No external dependencies
- Pure JavaScript, HTML, CSS
