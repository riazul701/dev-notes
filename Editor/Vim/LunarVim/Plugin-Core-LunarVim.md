# LunarVim Core Plugins

* [Core Plugins List](https://www.lunarvim.org/docs/features/core-plugins-list)

## General Keybinding

**General/Global**

* `<Esc>` or `<Ctrl + c>` : Exit insert mode / various window.
* `<q>` : Exit various window.
* `:close` : This command closes tab. Alternatively use, `<Space + b + e>` -> press character shown in tab header.

**Telescope Preview Window**

* `<C-d>` : Scroll down preview.
* `<C-u>` : Scroll up preview.

## Concept

* LSP (Language Server Protocol) on activates during `insert` mode.

# [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

**About**

* A modern plugin manager for Neovim

## PATH

* lazy.nvim Lockfile path: `/home/{{user-name}}/.config/lvim/lazy-lock.json`

* Installed plugins folder: `/home/{{user-name}}/.local/share/lunarvim/site/pack/lazy/opt/`

## General Commands

* Enter `:Lazy` command to launch lazy.nvim window.

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

## PATH

* "mason" language server: `/home/<user-name>/.local/share/lvim/mason/packages`

* Node.js packages path (using Node-Version-Manager): `/home/<user-name>/.npm-global/lib/node_modules/neovim/`

## LSP Completion (Language Server Protocol)

* `<C-Space>` : Launch auto-completion window, during `insert` mode.
* `<C-f>` : Scroll down inside auto-completion window.
* `<C-d>` : Scroll up inside auto-completion window.

## Keybindings

* (1) All
* (2) LSP
* (3) DAP
* (4) Linter
* (5) Formatter

## General Commands

* `:checkhealth mason` : For a full list of dependency.

* `:Mason` : Launch `mason` window. Press `<Tab>` key for auto-completion.

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
* `i` : Install package
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

**About**

* A file explorer tree for neovim written in lua

## Keybindings From `g?` and [GitHub](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)

* `<2-LeftMouse>` : Open
* `<2-RightMouse>` : CD
* `<C-]>` : CD
* `<C-E>` : Open: In Place
* `<C-K>` : Info [Press again to close window]
* `<C-R>` : Rename: Omit Filename
* `<C-T>` : Open: New Tab
* `<C-V>` : Open: Vertical Split
* `<C-X>` : Open: Horizontal Split
* `<BS>` : Close Directory
* `<CR>` : Open
* `<Tab>` : Open Preview
* `<` : Previous Sibling
* `.` : Run Command
* `-` : Up
* `>` : Next Sibling
* `B` : Toggle Filter: No Buffer [Only show opened files]
* `C` : CD
* `D` : Trash [Trash path: `/home/{{user-name}}/.local/share/Trash/files`]
  * Error: `[NvimTree] trash.cmd 'gio trash' is not an executable`
* `E` : Expand All
* `F` : Live Filter: Clear [`f` letter, `<Esc>` to quit]
* `H` : Toggle Filter: Dotfiles
* `I` : Toggle Filter: Git Ignore
* `J` : Last Sibling
* `K` : First Sibling
* `L` : Toggle Group Empty
* `M` : Toggle Filter: No Bookmark
* `O` : Open: No Window Picker
* `P` : Parent Directory
* `R` : Refresh
* `S` : Search
* `U` : Toggle Filter: Hidden
* `W` : Collapse
* `Y` : Copy Relative Path
* `a` : Create File or Directory
  * Currently, you can create a directory by adding a `/` to the end of a path. <sup>{1}</sup>
* `bd` : Delete Bookmarked
* `bmv` : Move Bookmarked
* `bt` : Trash Bookmarked
* `c` : Copy
* `]c` : Next Git
* `[c` : Prev Git
* `d` : Delete
* `[e` : Prev Diagnostic
* `]e` : Next Diagnostic
* `e` : Rename: Basename
* `f` : Live Filter: Start [Press `<Esc>` to close]
* `g?` : Help [Press `q` to close, `s` to sort]
* `ge` : Copy Basename
* `gtf` : Telescope Find File
* `gtg` : Telescope Live Grep
* `gy` : Copy Absolute Path
* `h` : Close Directory
* `l` : Open
* `m` : Toggle Bookmark
* `o` : Open
* `p` : Paste
* `q` : Close
* `r` : Rename
* `s` : Run System
* `u` : Rename: Full Path
* `v` : Open: Vertical Split [`Ctrl + wq` to quit a window]
* `x` : Cut
* `y` : Copy Name

## [Commands From Website/GitHub](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)
  
* `:NvimTreeOpen` : Opens the tree.

* `:NvimTreeClose` : Closes the tree.

* `:NvimTreeToggle` : Open or close the tree.

* `:NvimTreeFocus` : Open the tree if it is closed, and then focus on the tree.

* `:NvimTreeRefresh` : Refresh the tree.

* `:NvimTreeFindFile` : The command will change the cursor in the tree for the current bufname.
  * It will also open the leafs of the tree leading to the file in the buffer (if you opened a file with something else than the NvimTree, like `fzf` or `:split`)

* `:NvimTreeFindFileToggle` : close the tree or change the cursor in the tree for the current bufname, similar to combination of |:NvimTreeToggle| and |:NvimTreeFindFile|. Takes an optional path argument.

* `:NvimTreeClipboard` : Print clipboard content for both cut and copy

* `:NvimTreeResize` : Resize the NvimTree window to the given size. Example: `:NvimTreeResize 50` resizes the window to the width of 50. If the size starts with "+" or "-" it adds or removes the given value to the current window width.
  * Example `:NvimTreeResize -20` removes the value 20 from the current width. And `:NvimTreeResize +20` adds the value 20 to the current width.

* `:NvimTreeCollapse` : Collapses the nvim-tree recursively.

* `:NvimTreeCollapseKeepBuffers` : Collapses the nvim-tree recursively, but keep the directories open, which are used in an open buffer.

* `:NvimTreeHiTest` : Show nvim-tree highlight groups similar to `:so $VIMRUNTIME/syntax/hitest.vim`

## Specific Work

**[Creating a directory](https://github.com/nvim-tree/nvim-tree.lua/issues/3) <sup>{1}</sup>**

* Currently, you can create a directory by adding a `/` to the end of a path.
    
  * Also, you can create directories dynamically when creating a file (like `/foo/bar/baz/file.txt`).
    
  * I don't really like the way i do file handling, i might work on a refactoring someday to make it easier to work with. If you have any ideas for the ux feel free to submit them :)

## Tutorials
  
* [Keyboard Commands - 6.1 DEFAULT MAPPINGS](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt)
* [Neovim - NvimTree File Explorer Written In Lua](https://www.youtube.com/watch?v=SpexCBrZ1pQ)

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
  * `d` : Git Diff [Exit to opened file: Press `<Ctrl + wh>` to move left, `<Ctrl + wl>` to move right, select `HEAD` window, enter `:close` command to close git diff tab]
  * `g` : Lazygit
  * `j` : Next Hunk
  * `k` : Prev Hunk
  * `L` : Blame Line (full) [Press `<Ctrl + ww>` to switch windows between file and pop-up. Press `<q>` to close pop-up]
  * `l` : Blame
  * `o` : Open changed file
  * `p` : Previous Hunk [Enter `:close` command to close preview window]
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
  * `q` : Quickfix [Press `<q>` to close quickfix window]
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

## Add Project

**[How do you get Projects to work?](https://www.reddit.com/r/lunarvim/comments/14ecrxs/how_do_you_get_projects_to_work/)**

* Is your working directory a git repository? It should work out of the box, with default settings, but it only counts it as a project if it’s a git repository.

* Yes, I eventually figured it out when I found these lines in the core `project.lua` file:
```shell
detection_methods = { "pattern" },
patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
```

* `project.lua` file path: `/home/{{user-name}}/.local/share/lunarvim/lvim/lua/lvim/core/project.lua`

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

# References

* next-sl: {2}

## Commands From

* [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)

  * {1} [Creating a directory](https://github.com/nvim-tree/nvim-tree.lua/issues/3)
