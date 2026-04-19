# 📤 Push to GitHub (Copy & Paste)

This is the easiest way to get your project on GitHub in 5 minutes.

---

## Step 1: Create Repository on GitHub.com

1. Go to https://github.com/new
2. **Repository name:** `notes-extension`
3. **Description:** `A simple, private note-taking extension for Firefox`
4. **Public or Private:** Select **Public**
5. **Initialize:** Leave all checkboxes unchecked
6. Click **"Create repository"**

---

## Step 2: Copy Your Username

After clicking "Create repository", you'll see commands. Look for:
```
https://github.com/YOUR_USERNAME/notes-extension.git
```

Remember that **YOUR_USERNAME** for the next step.

---

## Step 3: Run These Commands

Open Terminal (Mac/Linux) or Command Prompt (Windows) and copy-paste each line:

```bash
cd /Users/beppe/Desktop/Notes-Extension
```

```bash
git init
```

```bash
git add .
```

```bash
git commit -m "Initial commit: Add Notes extension"
```

Replace `YOUR_USERNAME` with your actual GitHub username, then:

```bash
git remote add origin https://github.com/YOUR_USERNAME/notes-extension.git
```

```bash
git branch -M main
```

```bash
git push -u origin main
```

If asked for login, use your GitHub username and password (or personal access token).

---

## Step 4: Done! 🎉

Go to https://github.com/YOUR_USERNAME/notes-extension

You should see all your files there!

---

## 📌 Useful Commands Later

**After making changes:**
```bash
git add .
git commit -m "Describe your changes"
git push
```

**See what changed:**
```bash
git status
```

**See history:**
```bash
git log
```

---

That's it! Your project is now on GitHub. 🚀
