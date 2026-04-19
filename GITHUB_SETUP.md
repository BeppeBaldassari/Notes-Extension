# 🚀 Publishing to GitHub

This guide will help you create a GitHub repository and push your Notes Extension project online.

---

## Step 1: Create a GitHub Account (if you don't have one)

1. Go to [github.com](https://github.com)
2. Click "Sign up"
3. Follow the prompts to create your account
4. Verify your email address

---

## Step 2: Create a New Repository

1. Log in to GitHub
2. Click the **+** icon in the top right → **New repository**
3. Fill in the details:
   - **Repository name:** `notes-extension` (or any name you prefer)
   - **Description:** `A simple, private note-taking extension for Firefox`
   - **Public/Private:** Choose **Public** (so others can use it)
   - **Initialize repository:** Leave unchecked (we'll do it locally)
4. Click **Create repository**

---

## Step 3: Set Up Git on Your Computer

### On Mac/Linux:
```bash
# Install Git if not already installed
git --version

# If not installed, install via Homebrew:
brew install git
```

### On Windows:
Download and install [Git for Windows](https://git-scm.com/download/win)

---

## Step 4: Initialize Your Local Repository

Open Terminal/Command Prompt and run:

```bash
# Navigate to your project
cd /Users/beppe/Desktop/Notes-Extension

# Initialize git
git init

# Add all files
git add .

# Create your first commit
git commit -m "Initial commit: Add Notes extension"

# Add your GitHub repository as the remote
git remote add origin https://github.com/YOUR_USERNAME/notes-extension.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Replace `YOUR_USERNAME` with your actual GitHub username!**

---

## Step 5: Verify on GitHub

1. Go to your GitHub repository URL: `https://github.com/YOUR_USERNAME/notes-extension`
2. You should see all your files there
3. The README.md will display automatically

---

## 📝 Making Updates Later

After you make changes on your computer:

```bash
# Check what changed
git status

# Add your changes
git add .

# Commit with a message
git commit -m "Describe what you changed"

# Push to GitHub
git push
```

---

## 🎉 Done!

Your project is now on GitHub! You can:
- Share the link with others
- Get feedback through Issues
- Accept Pull Requests from contributors
- Track changes over time

---

## 💡 Useful GitHub Features

### Add a Release
1. Go to your repository
2. Click "Releases" (on the right side)
3. Click "Create a new release"
4. Tag version: `v1.0.4`
5. Upload `dist/notes.xpi` as an attachment
6. Write release notes
7. Click "Publish release"

### Enable Issues
1. Go to Settings → Features
2. Check "Issues" box
3. People can now report bugs and suggest features

---

## Need Help?

- GitHub Docs: https://docs.github.com
- Git Commands Cheat Sheet: https://git-scm.com/book
- Ask on GitHub Discussions if you get stuck

---

**Happy sharing!** 🚀
