
# 🧠 AI Terminal Debugger

An AI-powered CLI tool that helps you **debug terminal errors in real-time**.  
Just run your command through `ai-terminal`, and it will:  
✅ Capture the command, exit code, and output  
✅ Send it to an AI (OpenAI GPT-4o or Ollama)  
✅ Suggest step-by-step fixes  
✅ Ask for your confirmation to auto-execute suggested commands  

---

## 🚀 Features

- 🪄 AI-generated explanations for terminal errors  
- 📋 Step-by-step fix suggestions  
- ⚙️ Auto-execute safe commands with your confirmation  
- 🎨 Readable, color-coded terminal output  
- 🧭 Works with OpenAI API or local Ollama fallback  
- 📓 Session logging

---

## 📦 Installation

### 1️⃣ Clone the repository

```bash
git clone https://github.com/yourusername/ai-terminal.git
cd ai-terminal
```

### 2️⃣ Install dependencies (macOS)

This tool requires:

- [`jq`](https://stedolan.github.io/jq/) (for JSON parsing)
- [`coreutils`](https://formulae.brew.sh/formula/coreutils) (for `realpath` on macOS)

Install both using Homebrew:

```bash
brew install jq coreutils
```

### 3️⃣ Run the installer

```bash
bash install.sh
```

### 4️⃣ Set up your OpenAI API key

Get your API key from [OpenAI](https://platform.openai.com/api-keys) and either:

- Add it to your `~/.zshrc` or `~/.bashrc`:

```bash
export OPENAI_API_KEY=sk-...
```

Or store it in your **macOS Keychain**:

```bash
security add-generic-password -a "$USER" -s "OpenAI_API_Key" -w "sk-..."
```

Alternatively, install [Ollama](https://ollama.com) for local model support.  
If no OpenAI API key is found, the tool will try using Ollama.

---

## 🖥️ Usage

Run any terminal command through `ai-terminal`:

```bash
ai-terminal <your-command>
```

Example:

```bash
ai-terminal ls /nonexistent
```

---

## 🎨 Sample Output

```bash
💡 AI Suggestion:
Likely Cause
  The directory /nonexistent does not exist.

Step-by-Step Fix Suggestions
1. Verify the path
  - Ensure the directory name is correct.

2. Create the directory (if needed)
  ⚙️ Command: mkdir /nonexistent

3. Check the directory
  ⚙️ Command: ls /nonexistent
```

---

## 🛡️ Security

✅ AI-suggested commands are **not auto-executed**—you must confirm.  
✅ The tool avoids suggesting dangerous commands like `rm -rf`.  
✅ Future: Add a `safe_run.sh` module for extra protection.

---

## 🤝 Contributing

PRs welcome! 🎉  
Please open an issue to discuss any major changes before submitting a pull request.

---

## 📄 License

[MIT](LICENSE)

---

## 🌟 Credits

Made with ❤️.
