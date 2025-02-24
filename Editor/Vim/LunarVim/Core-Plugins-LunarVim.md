# LunarVim Core Plugins

* [Core Plugins List](https://www.lunarvim.org/docs/features/core-plugins-list)

# [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

**About**

* A modern plugin manager for Neovim

## General Commands

* Enter `:Lazy ` command and press `<Tab>` key for auto-completion.

* Press `q` to close `lazy.nvim` window.

## Commands From `?` Keybinding

**Note: Commands got from `lazy.nvim` window's `?` Keybinding**

**Help**

* Use `<C-c>` to abort all running tasks.

* You can press `<CR>` on a plugin to show its details.

* Most properties can be hovered with `<K>` to open links, help files, readmes and git commits. When hovering with `<K>` on a plugin anywhere else, a diff will be opened if there are updates or the plugin was just updated. Otherwise the plugin webpage will open.

* Use `<d>` on a commit or plugin to open the diff view.

**Keyboard Shortcuts**

* Home `<H>` Go back to plugin list
* Install `<I>` Install missing plugins
* Update `<U>` Update plugins. This will also update the lockfile
* Sync `<S>` Run install, clean and update
* Clean `<X>` Clean plugins that are no longer needed
* Check `<C>` Check for updates and show the log (git fetch)
* Log `<L>` Show recent updates
* Restore `<R>` Updates all plugins to the state in the lockfile. For a single plugin: restore it to the state in the lockfile or to a given commit under the cursor
* Profile `<P>` Show detailed profiling
* Debug `<D>` Show debug information
* Help `<?>` Toggle this help page

**Keyboard Shortcuts for Plugins**

* Install `<i>` Install a plugins
* Update `<u>` Update a plugin. This will also update the lockfile
* Clean `<x>` Delete a plugin. WARNING: this will delete the plugin even if it should be installed!
* Check `<c>` Check for updates and show the log (git fetch)
* Log `<gl>` Show recent updates
* Restore `<r>` Restore a plugin to the state in the lockfile or to a given commit under the cursor
* Build `<gb>` Rebuild a plugin
* Custom key `<localleader>l` Open lazygit log
* Custom key `<localleader>t` Open terminal in plugin dir

## Commands From Website

**[Usage](https://lazy.folke.io/usage)**

| Command | Lua | Description |
|---------|-----|-------------|
| `:Lazy build {plugins}` | `require("lazy").build(opts)` | Rebuild a plugin |
| `:Lazy check [plugins]` | `require("lazy").check(opts?)` | Check for updates and show the log (git fetch) |
| `:Lazy clean [plugins]` | `require("lazy").clean(opts?)` | Clean plugins that are no longer needed |
| `:Lazy clear` | `require("lazy").clear()` | Clear finished tasks |
| `:Lazy debug` | `require("lazy").debug()` | Show debug information |
| `:Lazy health` | `require("lazy").health()` | Run `:checkhealth lazy` |
| `:Lazy help` | `require("lazy").help()` | Toggle this help page |
| `:Lazy home` | `require("lazy").home()` | Go back to plugin list |
| `:Lazy install [plugins]` | `require("lazy").install(opts?)` | Install missing plugins |
| `:Lazy load {plugins}` | `require("lazy").load(opts)` | Load a plugin that has not been loaded yet. Similar to `:packadd`. Like `:Lazy load foo.nvim`. Use `:Lazy! load` to skip cond checks. |
| `:Lazy log [plugins]` | `require("lazy").log(opts?)` | Show recent updates |
| `:Lazy profile` | `require("lazy").profile()` | Show detailed profiling |
| `:Lazy reload {plugins}` | `require("lazy").reload(opts)` | Reload a plugin (experimental!!) |
| `:Lazy restore [plugins]` | `require("lazy").restore(opts?)` | Updates all plugins to the state in the lockfile. For a single plugin: restore it to the state in the lockfile or to a given commit under the cursor |
| `:Lazy sync [plugins]` | `require("lazy").sync(opts?)` | Run install, clean and update |
| `:Lazy update [plugins]` | `require("lazy").update(opts?)` | Update plugins. This will also update the lockfile |

# [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

* About
  * Quickstart configurations for the Nvim LSP client

* Commands
  * Run `:checkhealth` lsp to see the status or to troubleshoot.

# [tamago324/nlsp-settings.nvim](https://github.com/tamago324/nlsp-settings.nvim)

* About
  * A plugin for setting Neovim LSP with JSON or YAML files

# [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim/)

* About
  * Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

# [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

* About
  * Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim

# [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

**About**

* Easily install and manage LSP servers, DAP servers, linters, and formatters

## Keybindings

* (1) All
* (2) LSP
* (3) DAP
* (4) Linter
* (5) Formatter

## General Commands

* `:checkhealth mason` : For a full list of dependency.

* `:mason` : Launch `mason` window. Press `<Tab>` key for auto-completion.

## Commands From `g?` Keybinding

* (change view by pressing its number)

* Mason log: `/home/{{user-name}}/.local/state/lvim/mason.log`

**Registries**
  
* Packages are sourced from the following registries:
  * require("mason-registry.index")
  * github.com/mason-org/mason-registry version: {{date}}-eager-hate

**Keyboard shortcuts**

* `g?` : Toggle help
* `<CR>` : Toggle package info
* `<CR>` : Toggle package installation log
* `<C-f>` : Apply language filter
* `i` : Install packge
* `X` : Uninstall package
* `u` : Update package
* `U` : Update all outdated packages
* `c` : Check for new package version
* `C` : Check for new versions (all packages)
* `<C-c>` : Cancel installation of package
* `q` : Close window
* `<Esc>` : Close window

**Problems installing packages**
  
* Make sure you meet the minimum requirements to install packges. For debugging, refer to:
  * `:help mason-debugging`
  * `:checkhealth mason`

**Problems with package functionality**

* Please refer to each package's own homepage for further assistance.

**How do I use installed packages?**

Mason only makes packages available for use. It does not automatically integrate these into Neovim. You have multiple different options for using any given package, and you are free to pick and choose as you see fit.

See `:help mason-how-to-use-packages` for a recommendation.

**Missing a package?**

Please consider contributing to mason.nvim:

* https://github.com/williamboman/mason.nvim/blob/main/CONTRIBUTING.md
* https://github.com/williamboman/mason.nvim/blob/main/doc/reference.md 

# [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

* About
  * A clean, dark Neovim theme

# [lunarvim/lunar.nvim](https://github.com/lunarvim/lunar.nvim)

* About
  * LunarVim Colorscheme

# [Tastyep/structlog.nvim](https://github.com/Tastyep/structlog.nvim)

* About
  * Structured Logging for nvim, using Lua

# [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)

# [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

* About
  * plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.

# [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

**About**

* Find, Filter, Preview, Pick. All lua, all the time.

## General Commands

* Make sure you call `:checkhealth telescope` after installing telescope to ensure everything is set up correctly.

* Enter `:Telescope ` command and press `<Tab>` key for auto-completion.

# [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

* About
  * FZF sorter for telescope written in c

# [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

* About
  * A completion plugin for neovim coded in Lua.

# [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

* About
  * Set of preconfigured snippets for different languages.

# [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)

* About
  * Snippet Engine for Neovim written in Lua.

# [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)

* About
  * nvim-cmp source for neovim builtin LSP client

# [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

* About
  * luasnip completion source for nvim-cmp

# [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)

* About
  * nvim-cmp source for buffer words

# [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)

* About
  * nvim-cmp source for paths

# [folke/neodev.nvim](https://github.com/folke/neodev.nvim)

* About
  * Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.

# [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

* About
  * autopairs for neovim written by lua

# [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

* About
  * Nvim Treesitter configurations and abstraction layer

# [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)

* About
  * Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.

# [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)

* About
  * A file explorer tree for neovim written in lua

* Tutorials
  * [Keyboard Commands - 6.1 DEFAULT MAPPINGS](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)
  * [Neovim - NvimTree File Explorer Written In Lua](https://www.youtube.com/watch?v=SpexCBrZ1pQ)

* [Creating a directory](https://github.com/nvim-tree/nvim-tree.lua/issues/3)
  * Currently, you can create a directory by adding a / to the end of a path.
    Also, you can create directories dynamically when creating a file (like /foo/bar/baz/file.txt).
    I don't really like the way i do file handling, i might work on a refactoring someday to make it easier to work with. If you have any ideas for the ux feel free to submit them :)

* Commands
  * NvimTree

# [tamago324/lir.nvim](https://github.com/tamago324/lir.nvim)

* About
  * Neovim file explorer

# [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

* About
  * Git integration for buffers

# [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

**About**

* Displays a popup with possible keybindings of the command you started typing.

## Keybindings

* Press `<space>` to launch `which-key.nvim` window

* Common

  * `<bs>` : go up one level
  * `<esc>` : close

* `/` : Comment toggle current line

* `;` : Dashboard

* `c` : Close buffer

* `e` : Explorer

* `f` : Find File

* `h` : No Highlight

* `q` : Quit

* `w` : Save

* `b` : +Buffers

  * `b` : Previous
  * `D` : Sort by directory
  * `e` : Pick which buffer to close
  * `f` : Find
  * `h` : Close all to the left
  * `j` : Jump
  * `l` : Close all to the right
  * `L` : Sort by language
  * `n` : Next
  * `W` : Save without formatting (noautocmd)

* `d` : +Debug

  * `b` : Step Back
  * `C` : Run To Cursor
  * `c` : Continue
  * `d` : Disconnect
  * `g` : Get Session
  * `i` : Step Into
  * `o` : Step Over
  * `p` : Pause
  * `q` : Quit
  * `r` : Toggle Repl
  * `s` : Start
  * `t` : Toggle Breakpoint
  * `U` : Toggle UI
  * `u` : Step Out

* `g` : +Git

  * `b` : Checkout branch
  * `C` : Checkout commit(for current file)
  * `c` : Checkout commit
  * `d` : Git Diff
  * `g` : Lazygit
  * `j` : Next Hunk
  * `k` : Prev Hunk
  * `L` : Blame Line (full)
  * `l` : Blame
  * `o` : Open changed file
  * `p` : Previous Hunk
  * `R` : Reset Buffer
  * `r` : Reset Hunk
  * `s` : Stage Hunk
  * `u` : Undo Stage Hunk

* `L` : +LunarVim

  * `c` : Edit config.lua
  * `d` : View LunarVim's docs
  * `f` : Find LunarVim's files
  * `g` : Grep LunarVim's files
  * `i` : Toggle LunarVim Info
  * `I` : View LunarVim's changelog
  * `k` : View LunarVim's keymappings
  * `r` : Reload LunarVim's configuration
  * `u` : Update LunarVim
  * `l` : +logs

    * `d` : view default log
    * `D` : Open the default logfile
    * `L` : Open the LSP logfile
    * `l` : view lsp log
    * `n` : view neovim log
    * `N` : Open the Neovim logfile

* `l` : +LSP

  * `a` : Code Action
  * `d` : Buffer Diagnostics
  * `e` : Telescope Quickfix
  * `f` : Format
  * `I` : Mason Info
  * `i` : Info
  * `j` : Next Diagnostic
  * `k` : Prev Diagnostic
  * `l` : CodeLens Action
  * `q` : Quickfix
  * `r` : Rename
  * `S` : Workspace Symbols
  * `s` : Document Symbols
  * `w` : Diagnostics

* `p` : +Plugins

  * `c` : Clean
  * `d` : Debug
  * `i` : Install
  * `l` : Log
  * `p` : Profile
  * `S` : Status
  * `s` : Sync
  * `u` : Update

* `s` : +Search

  * `b` : Checkout branch
  * `c` : Colorscheme
  * `C` : Commands
  * `f` : Find File
  * `h` : Find Help
  * `H` : Find highlight groups
  * `k` : Keymaps
  * `l` : Resume last search
  * `M` : Man Pages
  * `p` : Colorscheme with Preview
  * `r` : Open Recent File
  * `R` : Registers
  * `t` : Text

* `T` : +Treesitter

  * `i` : Info

## Commands
  
* Make sure to run `:checkhealth which-key` if something isn't working properly

# [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

* About
  * Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more

# [ahmedkhalf/project.nvim](https://github.com/ahmedkhalf/project.nvim)

* About
  * The superior project management solution for neovim

# [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

* About
  * lua fork of vim-web-devicons for neovim

# [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

* About
  * A blazing fast and easy to configure neovim statusline plugin written in pure lua

# [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic)

* About
  * winbar/statusline plugin that shows your current code context

# [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

* About
  * A snazzy bufferline for Neovim

# [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)

* About
  * Debug Adapter Protocol client implementation for Neovim (>= 0.5)

# [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

* About
  * A UI for nvim-dap which provides a good out of the box configuration

# [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

* About
  * a lua powered greeter like vim-startify / dashboard-nvim

# [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

* About
  * A neovim lua plugin to help easily manage multiple terminal windows

# [b0o/schemastore.nvim](https://github.com/b0o/schemastore.nvim)

* About
  * JSON schemas for Neovim

# [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)

* About
  * highlight word under the cursor using either LSP, Tree-sitter, or regex matching

# [lunarvim/onedarker.nvim](https://github.com/lunarvim/onedarker.nvim)

* About
  * Onedark inspired colorscheme written in lua.

# [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

* About
  * Indent guides for Neovim

# Not Mentioned In List

* Not Mentioned In [Core Plugins List](https://www.lunarvim.org/docs/features/core-plugins-list), But Present In `/home/<user-name>/.local/share/lunarvim/site/pack/lazy/opt` Directory.

## [LunarVim/bigfile.nvim](https://github.com/lunarvim/bigfile.nvim)

* About
  * This plugin automatically disables certain features if the opened file is big.