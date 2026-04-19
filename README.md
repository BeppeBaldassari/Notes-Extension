# 📝 Notes Extension for Firefox

A simple, beautiful note-taking extension for Firefox. Keep your thoughts and ideas safe in your browser, instantly accessible whenever you need them.

**No sign-ups. No cloud servers. Just your notes, stored locally on your computer.**

---

## ⚡ Quick Download

👉 **[Download Notes.xpi](dist/Notes.xpi?raw=true)** ← Click to install immediately!

Or just drag `Notes.xpi` into Firefox. Done! 🎉

---

## ✨ What This Does

- 📌 **Quick Notes**: Jot down ideas in seconds
- 💾 **Saves Automatically**: Your notes are safe, even if you close Firefox
- 🔒 **Private**: Everything stays on your computer (no tracking, no servers)
- ⚡ **Fast**: No loading screens, no delays
- 🎯 **Simple**: One click to create, edit, or delete notes
- 📅 **Organized**: See dates and previews of all your notes

---

## 🚀 How to Install

### The Super Easy Way ✨

1. **Download** `Notes.xpi` from this page (see button above)
2. **Drag it** into your Firefox window
3. **Click "Add"** when Firefox asks
4. **Done!** 🎉

### Step-by-Step (With Pictures)

1. Open Firefox
2. Click the **Download** button above
3. You'll get a file called `Notes.xpi`
4. Open Firefox and drag that file into the window
5. Firefox will ask "Add Notes?" - Click **"Add"**
6. The Notes icon appears in your toolbar!

### For Developers (Testing Version)

If you want to test the bleeding-edge development version:

1. Clone this project: `git clone <repo-url>`
2. Open Firefox → `about:debugging`
3. Click "Load Temporary Add-on"
4. Select `manifest.json` from this folder
5. Test until you close Firefox (then reload to test again)

---

## 📖 How to Use

### Create a Note
1. Click the Notes icon in your toolbar
2. Click the **+ New Note** button (bottom right)
3. Type a title
4. Write your content
5. Click **Save**

### Edit a Note
1. Click any note in the list
2. Make changes to the title or content
3. Click **Save**
4. Click **Back** to return to your notes

### Delete a Note
1. Click the trash icon (🗑️) next to any note
2. Confirm when asked
3. Note is removed

---

## ❓ FAQ

**Q: Where are my notes saved?**
A: On your computer, in Firefox's local storage. They're never sent anywhere.

**Q: What if I clear Firefox cache?**
A: Your notes are safe—they're separate from cache. Only clearing "Local Storage" would remove them.

**Q: Can I sync notes between computers?**
A: Not yet. This keeps everything simple and private. Each Firefox installation has its own notes.

**Q: Is it safe?**
A: Yes! It's open-source code you can review, no permissions beyond local storage, and no internet requests.

**Q: Can I export my notes?**
A: You can copy text from the extension, but direct export isn't built in. This could be added in future updates.

---

## 🔧 For Developers

### Building from Source

```bash
# Build the .xpi file
./build.sh

# The packaged extension will be in dist/notes.xpi
```

### Project Files

- `manifest.json` - Extension configuration
- `src/popup.html` - The UI
- `src/popup.js` - The logic
- `src/popup.css` - The styling
- `src/storage.js` - Data management
- `dist/notes.xpi` - The packaged extension

### Tech Stack

- Plain JavaScript (no frameworks)
- Firefox WebExtensions API
- Browser Storage API
- HTML + CSS

---

## 💭 Ideas for Future Updates

- Search through notes
- Organize notes by tags or folders
- Dark mode
- Keyboard shortcuts
- Export to text file
- Note sharing between devices (with sync service)

---

## 📄 License

This project is open source and free to use. See LICENSE for details.

## 🤝 Contributing

Found a bug? Have an idea? Feel free to open an issue or submit a pull request!

---

**Happy note-taking! 📝**

### Notes disappeared
- This typically happens if Firefox cleared site data
- Install the extension again to start fresh

## 📋 Requirements

- **Firefox**: Version 55 or later (uses Manifest V3)
- **No Dependencies**: Pure JavaScript, HTML, and CSS
- **Permissions**: Only requires `storage` permission

## 🛠️ Building from Source

The project includes a build script to package the extension as a `.xpi` file:

```bash
./build.sh
```

This creates `dist/notes.xpi` which can be distributed and installed on any Firefox browser.

## 📝 Technical Details

- **Manifest Version**: 3 (MV3)
- **Extensions Format**: .xpi (Firefox extension package)
- **UI Size**: 500px wide × 600px tall popup
- **Icon**: 128x128px PNG
- **No External Libraries**: Vanilla JavaScript
- **Storage API**: `browser.storage.local`

## 📄 License

This project is provided as-is for personal use.

## 🔗 Resources

- [Firefox WebExtension Documentation](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions)
- [WebExtension Manifest V3](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json)
- [Storage API](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/storage)


## How It Works

- **Local Storage**: Uses Firefox's `browser.storage.local` API to persist notes
- **No Permissions Required**: Only requires the `storage` permission
- **No Data Sync**: All data stays on your computer
- **No External Dependencies**: Built with pure JavaScript, HTML, and CSS

## Technical Details

- **Manifest Version**: 3 (Firefox WebExtension format)
- **Storage API**: Uses `browser.storage.local` for persistent storage
- **UI**: HTML popup interface with responsive CSS
- **Data Format**: Notes stored as JSON objects with timestamps

## Note Data Structure

Each note contains:
- `id`: Unique identifier (timestamp-based)
- `title`: Note title
- `content`: Note content
- `createdAt`: ISO timestamp of creation
- `updatedAt`: ISO timestamp of last modification

## Browser Compatibility

- Firefox 90+

## Future Enhancements

- [ ] Search functionality
- [ ] Tags and categories
- [ ] Dark mode toggle
- [ ] Export notes as Markdown or PDF
- [ ] Sync with cloud storage
- [ ] Rich text editor
- [ ] Note categories/folders

## License

MIT

## Support

For issues or feature requests, please create an issue in the repository.
