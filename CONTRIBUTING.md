# 🤝 Contributing to Notes Extension

Thanks for your interest in contributing! This project is open to everyone.

---

## Ways to Contribute

### 1. Report Bugs
- Found an issue? Open a GitHub Issue
- Describe what happened and how to reproduce it
- Include your Firefox version

### 2. Suggest Features
- Have an idea? Open an Issue with the tag "enhancement"
- Describe what you'd like and why it would be useful

### 3. Submit Code

#### Simple Changes
1. Fork the repository (click "Fork" on GitHub)
2. Make your changes
3. Create a Pull Request
4. Describe what you changed and why

#### For Larger Changes
1. Open an Issue first to discuss your idea
2. Wait for feedback
3. Then submit your code

---

## Development Setup

### Get the Project Running

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/notes-extension.git
cd notes-extension

# Load in Firefox Developer Edition
# 1. Go to about:debugging
# 2. Load from manifest.json
```

### Making Changes

All code is in the `src/` folder:
- `popup.html` - The interface
- `popup.js` - How it works
- `popup.css` - How it looks
- `storage.js` - Saving data

### Testing Your Changes
1. Edit a file
2. Go to `about:debugging`
3. Click the reload icon next to Notes Extension
4. Test in Firefox

### Building the Package
```bash
./build.sh
# Creates dist/notes.xpi
```

---

## Code Style

- Keep it simple and readable
- Add comments for complex logic
- Use descriptive variable names
- Test your changes before submitting

---

## Pull Request Process

1. Fork and create your feature branch
2. Make your changes
3. Test thoroughly
4. Commit with clear messages
5. Push to your fork
6. Click "Create Pull Request"
7. Describe what you changed
8. Wait for review and feedback

---

## Questions?

- Check existing Issues first
- Open a new Discussion
- Comment on relevant Issues

---

**Thank you for helping make Notes Extension better!** 💝
