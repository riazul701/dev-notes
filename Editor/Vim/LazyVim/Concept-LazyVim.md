# Concept-LazyVim.md

# Concept

> ChatGPT Question: 
> 
> why lazyvim says to install this https://github.com/LazyVim/starter
> their repo is https://github.com/LazyVim/LazyVim

Good question — this confuses almost everyone the first time.

***### Short answer***

LazyVim is the **actual Neovim “distribution” (the real config system)**, while
LazyVim starter is just a **bootstrap template that installs and loads LazyVim for you**.

They are designed to work together, not compete.

---

***## How the architecture actually works***

Think of it like this:

* **LazyVim (repo)** = the engine / framework
* **starter (repo)** = the ready-made “project folder” that runs that engine

So when you install:

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

you are NOT installing LazyVim directly as your config.

Instead you are installing a **Neovim configuration skeleton** that contains:

* `init.lua`
* plugin loader (`lazy.nvim` setup)
* import statements that load LazyVim

Then inside that starter config, it does something like:

```lua
{ "LazyVim/LazyVim", import = "lazyvim.plugins" }
```

So LazyVim gets pulled in as a plugin.

---

***## Why they separated it into two repos***

***### 1. LazyVim repo = reusable framework***

The main repo:
[https://github.com/LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)

is designed as:

* a **plugin/spec collection**
* not a full “user config you edit directly”

It’s meant to be imported by others.

---

***### 2. starter repo = user entry point***

The starter:
[https://github.com/LazyVim/starter](https://github.com/LazyVim/starter)

is intentionally separate because it provides:

* folder structure (`config/`, `plugins/`)
* bootstrap logic (`init.lua`)
* safe defaults for beginners
* upgrade-friendly setup

So you can:

* clone it
* modify it freely
* delete `.git` and make it your own config

---

***## Why not just use LazyVim directly?***

If LazyVim repo was used directly as your config:

* updates would overwrite your setup easily
* no clear place for personal config files
* harder onboarding structure
* no clean “user override layer”

So the starter acts as a **clean boundary between:**

> “upstream framework” vs “your personal config”

---

***## Mental model (important)***

You can think of it like:

| Part        | Role                            |
| ----------- | ------------------------------- |
| LazyVim     | Android OS core                 |
| starter     | phone manufacturer setup wizard |
| your config | your personal settings & apps   |

---

***## What you should actually do (Windows install)***

You did it correctly if you used:

```powershell
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
```

Because:

* LazyVim gets installed automatically inside it
* you only maintain `nvim/` folder
* LazyVim updates independently

---

***## Bottom line***

* **LazyVim repo is not meant to be cloned as your config**
* **starter repo is the official supported entry point**
* starter *loads LazyVim internally*

---

If you want, I can also show:

* how LazyVim actually loads plugins step-by-step
* or how to customize it safely without breaking updates on Windows

==================================================================================

> ChatGPT Question: 
> 
> but I use raw neovim's "nvim" command often, which is taken by lazyvim

That’s actually expected behavior, but there’s a key misunderstanding here:

LazyVim is **not a separate command that replaces `nvim`**.
It’s just a **configuration that runs when you launch Neovim**.

So when you run:

```bash
nvim
```

you are still running **Neovim**, but it loads whatever config is installed in:

```
%LOCALAPPDATA%\nvim   (Windows)
```

If LazyVim is installed there, then `nvim` will *look like* “LazyVim Neovim”.

---

***## Why it feels like LazyVim “took over” `nvim`***

Because Neovim automatically loads:

* `init.lua` or `init.vim` from your config directory

So if you installed LazyVim via the starter:

```
C:\Users\<you>\AppData\Local\nvim
```

then every time you run:

```bash
nvim
```

you are launching:

> Neovim + LazyVim config

---

***## Important point***

There is **no separate LazyVim executable**.

So nothing is actually “replacing” `nvim`.

---

***## If you want BOTH vanilla Neovim and LazyVim***

You have 3 clean options:

---

***## Option 1 (simplest): Use two config folders***

Keep:

***### LazyVim:***

```
%LOCALAPPDATA%\nvim
```

***### Vanilla Neovim:***

Run with a custom config:

```powershell
nvim -u NONE
```

or:

```powershell
nvim --clean
```

This launches pure Neovim with no config.

---

***## Option 2: Switch configs using env variable***

You can create shortcuts:

***### LazyVim:***

```powershell
$env:NVIM_APPNAME="nvim-lazyvim"
nvim
```

***### Vanilla:***

```powershell
$env:NVIM_APPNAME="nvim-vanilla"
nvim
```

Then you keep configs in:

```
%LOCALAPPDATA%\nvim-lazyvim
%LOCALAPPDATA%\nvim-vanilla
```

This is the **cleanest professional setup**.

---

***## Option 3: Backup LazyVim config (quick reset)***

If you already installed LazyVim and want to go back:

```powershell
Rename-Item $env:LOCALAPPDATA\nvim nvim-lazyvim
```

Then:

```powershell
nvim --clean
```

or reinstall vanilla config later.

---

***## Why LazyVim behaves like this***

Because Neovim is designed to be:

> “a core editor + user-defined Lua config”

So distributions like LazyVim, AstroNvim, NvChad all work by:

* installing into config directory
* being loaded automatically on `nvim`

---

***## Bottom line***

* `nvim` is still just Neovim
* LazyVim is just what Neovim loads at startup
* nothing is actually replacing your command

---

If you want, I can show you a **proper dual-setup workflow (LazyVim + minimal Neovim + VSCode-like fallback)** on Windows — that’s what most power users end up doing.

==================================================================================

> ChatGPT Question: 
> 
> Lunarvim needs Have git, make, pip, python, npm, node, cargo and ripgrep installed on your system.
> But lazyvim does not metion any of this.

Good observation — the difference comes from how the two distributions are designed and what they *assume* versus what they *document explicitly*.

***### Why LunarVim lists all those dependencies***

LunarVim is a more “self-contained IDE-like setup” that tries to guarantee features work out of the box (LSP servers, formatters, plugins, telescope extensions, etc.).

So it explicitly requires tools like:

* `git` → plugin management and fetching sources
* `make` → building native plugins (like Treesitter parsers)
* `python` / `pip` → Python LSP tools, formatting, plugins
* `node` / `npm` → JavaScript/TypeScript LSPs and tooling
* `cargo` → Rust tools and some compiled extensions
* `ripgrep` → fast file searching (used heavily by Telescope)

LunarVim basically assumes: *“you want a full dev environment, so we require everything needed for full functionality.”*

---

***### Why LazyVim doesn’t list them explicitly***

LazyVim takes a different approach:

* It is more **modular and lazy-loaded**
* It assumes a **modern developer system already has basic tooling**
* It focuses on **Neovim plugin configuration, not system bootstrapping**

So instead of saying “install X, Y, Z”, LazyVim typically:

* Relies on plugins that *optionally use* system tools
* Lets you install missing tools only when needed
* Depends heavily on:

  * LSP servers via `mason.nvim`
  * Treesitter auto-install
  * Optional external tools detected at runtime

In other words:
👉 LunarVim = “install everything upfront”
👉 LazyVim = “install what you actually use”

---

***### Important nuance***

Even though LazyVim doesn’t list them, many of the same tools are still **practically required for full experience**, especially:

* `git` (essential)
* `ripgrep` (searching)
* `node` / `npm` (JS/TS LSPs)
* `python` (Python tooling)
* `cargo` + `make` (Treesitter / compiled plugins)

LazyVim just doesn’t force them as hard requirements in documentation.

---

***### Simple way to think about it***

* If you install nothing except Neovim:

  * LazyVim → partially works, installs tools on demand
  * LunarVim → may break or disable features until dependencies exist

---

***### Bottom line***

LazyVim is more “Linux-like”: assume tools exist, adapt if not.
LunarVim is more “installer-driven IDE”: ensure everything is present first.

---

If you want, I can give you a **minimal dependency checklist for LazyVim that actually avoids runtime surprises on a fresh system** (especially useful on Windows/WSL/Linux setups).

==================================================================================

> ChatGPT Question: 
> 
> how I will know, which programs are required by lazyvim, as these are not mentioned in lazyvim's documentation

You’re right to notice the gap — and this is actually a common confusion with LazyVim.

The key idea is:

> LazyVim does **not maintain a fixed “required OS dependency list” in docs**, because it treats most tools as **feature-dependent, not hard requirements**.

But you *can still figure out exactly what you need*. Here’s how.

---

***## 1. The real source of requirements: `:checkhealth`***

Run this inside Neovim:

```
:checkhealth
```

and also:

```
:LazyHealth
```

This is the **official way LazyVim tells you what is missing on your system**.

It checks:

* `git`
* `rg` (ripgrep)
* `fd`
* `node`
* `python`
* `cargo`
* compilers
* clipboard tools
* etc.

So instead of a static list, LazyVim uses **runtime detection**.

---

***## 2. Read LazyVim “Extras” (this is where dependencies actually live)***

LazyVim is modular. Requirements depend on what you enable:

Examples:

* JavaScript extra → needs `node`, `npm`
* Rust extra → needs `cargo`
* Python extra → needs `python`, `pip`
* Telescope → uses `ripgrep`, `fd`

So dependencies are documented here instead:
👉 [https://www.lazyvim.org/extras](https://www.lazyvim.org/extras)

Each feature explicitly lists its tooling requirements.

---

***## 3. Mason only covers LSP tools, not system tools***

mason.nvim installs things like:

* language servers (`pyright`, `tsserver`)
* formatters (`prettier`, `black`)
* debuggers (`codelldb`)

But it does NOT install:

* git
* node
* cargo
* python
* system compilers

So you must separate:

***### System dependencies (you install)***

* git
* ripgrep (`rg`)
* fd
* node/npm
* python/pip
* cargo
* make / gcc

***### Neovim tools (LazyVim/Mason installs)***

* LSP servers
* formatters
* linters

---

***## 4. Why LazyVim avoids listing them explicitly***

Because:

* Not everyone uses all languages
* Dependencies change based on enabled extras
* It supports multiple OS setups (Linux/Windows/macOS)
* It avoids becoming outdated documentation

So instead of a fixed list, it uses:

> “install what your enabled features require”

---

***## 5. Practical way to know what YOU need***

If you want a reliable method:

***### Step 1***

Install LazyVim fresh

***### Step 2***

Run:

```
:checkhealth
```

***### Step 3***

Install only what is marked as WARNING

***### Step 4***

Enable extras → re-run health check

---

***## 6. Simple mental model***

Think of it like this:

* LazyVim = “IDE config”
* System tools = “your OS environment”
* mason.nvim = “language server installer inside Neovim”

LazyVim assumes the OS is already a dev environment.

---

***## Bottom line***

There is no single official “required programs list” because LazyVim is **feature-driven**, not **dependency-driven**.

The closest thing to a correct answer is:

> run `:checkhealth` + enable your extras + install what becomes missing

---

If you want, I can give you a **minimal “must install once” package list for a fresh Linux/WSL setup** so LazyVim works perfectly without repeated troubleshooting.
