# Gemini-CLI.md

# Concept

> ChatGPT Question: 
> 
> How to login to Gemini-CLI, because previous google account login is deprecated

Considering your exact error:

> "This client is no longer supported for Gemini Code Assist for individuals. To continue using Gemini, please migrate to the Antigravity suite of products"

the easiest **free solution for a beginner** is **not to keep trying Google login inside Gemini CLI**. Your old free Google login method is blocked. Use a **free Gemini API key** instead.

Follow these steps:

## Step 1: Get a free Gemini API key

1. Open:

[Google AI Studio API Keys](https://aistudio.google.com/app/apikey?utm_source=chatgpt.com)

2. Sign in with your normal Gmail account.

3. Click:

```
Create API key
```

4. Copy the key.

It looks like:

```
AIzaSyxxxxxxxxxxxxxxxxxxxx
```

---

## Step 2: Install/update Gemini CLI

Open Terminal / PowerShell:

```bash
npm install -g @google/gemini-cli
```

Check:

```bash
gemini --version
```

---

## Step 3: Add your API key

### Windows PowerShell

Run:

```powershell
setx GEMINI_API_KEY "PASTE_YOUR_KEY_HERE"
```

Example:

```powershell
setx GEMINI_API_KEY "AIzaSy123456789"
```

Close PowerShell completely and open it again.

---

### Linux/macOS

Run:

```bash
export GEMINI_API_KEY="PASTE_YOUR_KEY_HERE"
```

For permanent setup:

```bash
echo 'export GEMINI_API_KEY="PASTE_YOUR_KEY_HERE"' >> ~/.bashrc
source ~/.bashrc
```

---

## Step 4: Start Gemini CLI

Run:

```bash
gemini
```

You should now get a Gemini prompt without the old login error.

Test:

```
Explain this folder structure
```

or:

```
Write a Python hello world program
```

---

## If it still asks for Google login

Clear the old login cache:

### Windows:

```powershell
Remove-Item -Recurse -Force $HOME\.gemini
```

### Linux/macOS:

```bash
rm -rf ~/.gemini
```

Then:

```bash
gemini
```

---

### Your situation in one sentence

Your Gmail account is fine; the **old free Gemini Code Assist login route used by Gemini CLI was retired for individual users**, so the beginner-friendly free workaround is:

**Google AI Studio → create free API key → set `GEMINI_API_KEY` → run Gemini CLI.**

This avoids the Antigravity migration message and gets you back to using Gemini CLI.

# References

## Websites

* [geminicli.com](https://geminicli.com/)
* [google-gemini/gemini-cli GitHub](https://github.com/google-gemini/gemini-cli)
