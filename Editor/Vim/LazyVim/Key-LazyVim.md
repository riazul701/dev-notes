# Commands/Usage

# General Keymaps

## Common

* `<Esc>` OR `Ctrl + C` OR `q` : Press to exit from various situation.
  * Also can press `Down-Arrow`, `Up-Arrow` key.

* `y` : Popup yank/copy dialog menu for range selection.

* `d` : Popup cut/delete dialog menu for range selection.

* `v` : Popup visual selection dialog menu for range selection.

* `g` : Popup goto dialog menu.

* `[` : Goto previous entry => file, parameter, class, function, hunk, reference, buffer, diagnostic, error, warning, method, quickfix/trouble, todo-comment.

* `]` : Goto next entry => file, parameter, class, function, hunk, reference, buffer, diagnostic, error, warning, method, quickfix/trouble, todo-comment.

## Telescope

* `Ctrl + n` OR `Ctrl + j` OR `<Down-Arrow>` : Select next file.

* `Ctrl + p` OR `Ctrl + k` OR `<Up-Arrow>` : Select previous file.

* `Ctrl + f` : Telescope preview down scroll.

* `Ctrl + b` : Telescope preview up scroll.

## Suggestions/Auto-Completion

* `<Tab>` OR `Ctrl + n`: Select down text from auto-completion.

* `<Shift> + <Tab>` OR `Ctrl + p`: Select upper text from auto-completion.

## `y` yank/copy dialog menu

## `d` cut/delete dialog menu

## Built-In File Manager (Keybind-List Toggle: `?`)

* Note: `<M-w>` means `Alt + w`

* `q` : cancel

* `<Esc>` : cancel

* `l` : confirm

* `<CR>` : confirm

* `<2-LeftMouseClick` : confirm

* `<M-w>` : cycle_win

* `<C-S>` : edit_split

* `<C-V>` : edit_vsplit

* `a` : explorer_add
  * Add a new file or directory (directories end with a "/")

* `h` : explorer_close

* `Z` : explorer_close_all

* `c` : explorer_copy

* `d` : explorer_del
  * Move file/folder to recycle-bin
  * Select files/folders with `<Tab>` and `<S-Tab>` key

* `[d` : explorer_diagnostic_previous

* `]d` : explorer_diagnostic_next

* `]e` : explorer_error_next

* `[e` : explorer_error_previous

* `.` : explorer_focus

* `]g` : explorer_git_next

* `[g` : explorer_git_prev

* `m` : explorer_move
  * Select files first, then move
  * Select files/folders with `<Tab>` and `<S-Tab>` key

* `o` : explorer_open
  * Open with system default application

* `p` : explorer_paste
  * Error: The `+` register does not contain any files

* `r` : explorer_rename

* `<BS>` : explorer_up

* `u` : explorer_update

* `]w` : explorer_warn_next

* `[w` : explorer_warn_previous

* `y` : explorer_yank
  * Select files/folders with `<Tab>` and `<S-Tab>` key
  * Mark files/folders with vim's visual mode `v`, `V`

* `i` : focus_input

* `<M-d>` : inspect

* `<C-W>J` : layout_bottom

* `<C-W>H` : layout_left

* `<C-W>L` : layout_right

* `<C-W>K` : layout_top

* `G` : list_bottom

* `<Down>` : list_down

* `<C-J>` : list_down

* `j` : list_down

* `<C-N>` : list_down

* `zb` : list_scroll_bottom

* `zz` : list_scroll_center

* `<C-D>` : list_scroll_down

* `zt` : list_scroll_top

* `<C-U>` : list_scroll_up

* `gg` : list_top

* `<C-K>` : list_up

* `<C-P>` : list_up

* `<Up>` : list_up

* `k` : list_up

* `<S-CR>` : pick_win, jump
  * `<S-CR>` means `Shift + Enter` keybinding

* `<Space>/` : picker_grep

* `<C-F>` : preview_scroll_down

* `<C-B>` : preview_scroll_up

* `<C-G>` : print_path

* `<C-Q>` : qflist

* `<C-A>` : select_all

* `<Tab>` : select_and_next

* `<S-Tab>` : select_and_prev  

* `<C-C>` : tcd
  * Same s `.` keybindig

* `<C-T>` : terminal
  * Enter command `exit` to close terminal

* `/` : toggle_focus

* `<M-f>` : toggle_follow

* `?` : toggle_help_list

* `<M-h>` : toggle_hidden
  * Supports only linux (not windows) hidden file/folder, where name starts with `.` character

* `H` : toggle_hidden
  * Supports only linux (not windows) hidden file/folder, where name starts with `.` character                            

* `I` : toggle_ignored                                                   

* `<M-i>` : toggle_ignored

* `<M-m>` : toggle_maximize

* `<M-p>` : toggle_preview
  * In preview, press `Ctrl + f` to down scroll and `Ctrl + b` to up scroll.

* `P` : toggle_preview
  * In preview, press `Ctrl + f` to down scroll and `Ctrl + b` to up scroll.

# [Keymaps Official](https://www.lazyvim.org/keymaps)

## General

* `j` (n,x) : Down

* `<Down>` (n,x) : Down

* `k` (n,x) : Up

* `<Up>` (n,x) : Up

* `<C-h>` (n) : Go to Left Window

* `<C-j>` (n) : Go to Lower Window

* `<C-k>` (n) : Go to Upper Window

* `<C-l>` (n) : Go to Right Window

* `<C-Up>` (n) : Increase Window Height

* `<C-Down>` (n) : Decrease Window Height

* `<C-Left>` (n) : Decrease Window Width

* `<C-Right>` (n) : Increase Window Width

* `<A-j>` (n,i,v) : Move Down

* `<A-k>` (n,i,v) : Move Up

* `<S-h>` (n) : Prev Buffer

* `<S-l>` (n) : Next Buffer

* `[b` (n) : Prev Buffer

* `]b` (n) : Next Buffer

* `<leader>bb` (n) : Switch to Other Buffer

* "<leader>`" (n) : Switch to Other Buffer

* `<leader>bd` (n) : Delete Buffer

* `<leader>bo` (n) : Delete Other Buffers

* `<leader>bi` (n) : Delete Invisible Buffers

* `<leader>bD` (n) : Delete Buffer and Window

* `<esc>` (i,n,s) : Escape and Clear hlsearch

* `<leader>ur` (n) : Redraw / Clear hlsearch / Diff Update

* `n` (n,x,o) : Next Search Result

* `N` (n,x,o) : Prev Search Result

* `<C-s>` (i,x,n,s) : Save File

* `<leader>K` (n) : Keywordprg

* `gco` (n) : Add Comment Below

* `gcO` (n) : Add Comment Above

* `<leader>l` (n) : Lazy

* `<leader>fn` (n) : New File

* `<leader>xl` (n) : Location List

* `<leader>xq` (n) : Quickfix List

* `[q` (n) : Previous Quickfix

* `]q` (n) : Next Quickfix

* `<leader>cf` (n,x) : Format

* `<leader>cd` (n) : Line Diagnostics
  * Press `q` to quit

* `]d` (n) : Next Diagnostic

* `[d` (n) : Prev Diagnostic

* `]e` (n) : Next Error

* `[e` (n) : Prev Error

* `]w` (n) : Next Warning

* `[w` (n) : Prev Warning

* `<leader>uf` (n) : Toggle Auto Format (Global)
  * Enable/Disable auto format all opened buffers/files on save.

* `<leader>uF` (n) : Toggle Auto Format (Buffer)
  * Enable/Disable auto format current opened buffer/file on save.

* `<leader>us` (n) : Toggle Spelling

* `<leader>uw` (n) : Toggle Wrap

* `<leader>uL` (n) : Toggle Relative Number

* `<leader>ud` (n) : Toggle Diagnostics
  * Enable/Disable Linter

* `<leader>ul` (n) : Toggle Line Numbers

* `<leader>uc` (n) : Toggle Conceal Level

* `<leader>uA` (n) : Toggle Tabline

* `<leader>uT` (n) : Toggle Treesitter Highlight

* `<leader>ub` (n) : Toggle Dark Background

* `<leader>uD` (n) : Toggle Dimming

* `<leader>ua` (n) : Toggle Animations

* `<leader>ug` (n) : Toggle Indent Guides

* `<leader>uS` (n) : Toggle Smooth Scroll

* `<leader>dpp` (n) : Toggle Profiler

* `<leader>dph` (n) : Toggle Profiler Highlights

* `<leader>uh` (n) : Toggle Inlay Hints

* `<leader>gL` (n) : Git Log (cwd)

* `<leader>gb` (n) : Git Blame Line

* `<leader>gf` (n) : Git Current File History

* `<leader>gl` (n) : Git Log

* `<leader>gB` (n,x) : Git Browse (open)

* `<leader>gY` (n,x) : Git Browse (copy)

* `<leader>qq` (n) : Quit All

* `<leader>ui` (n) : Inspect Pos

* `<leader>uI` (n) : Inspect Tree

* `<leader>L` (n) : LazyVim Changelog

* `<leader>fT` (n) : Terminal (cwd)

* `<leader>ft` (n) : Terminal (Root Dir)

* `<c-/>` (n,t) : Terminal (Root Dir)

* `<c-_>` (n,t) : which_key_ignore

* `<leader>-` (n) : Split Window Below

* `<leader>|` (n) : Split Window Right

* `<leader>wd` (n) : Delete Window

* `<leader>wm` (n) : Toggle Zoom Mode

* `<leader>uZ` (n) : Toggle Zoom Mode

* `<leader>uz` (n) : Toggle Zen Mode

* `<leader><tab>l` (n) : Last Tab

* `<leader><tab>o` (n) : Close Other Tabs

* `<leader><tab>f` (n) : First Tab

* `<leader><tab><tab>` (n) : New Tab

* `<leader><tab>]` (n) : Next Tab

* `<leader><tab>d` (n) : Close Tab

* `<leader><tab>[` (n) : Previous Tab

## LSP

* `<leader>cl` (n) : Lsp Info

* `d` (n,n) : Goto Definition

* `gr` (n,n) : References  

* `gI` (n,n) : Goto Implementation 

* `gy` (n,n) : Goto T[y]pe Definition

* `gD` (n) : Goto Declaration

* `K` (n) : Hover

* `gK` (n) : Signature Help

* `<c-k>` (i) : Signature Help

* `<leader>ca` (n,x) : Code Action

* `<leader>cc` (n,x) : Run Codelens

* `<leader>cC` (n) : Refresh & Display Codelens

* `<leader>cR` (n) : Rename File

* `<leader>cr` (n) : Rename

* `<leader>cA` (n) : Source Action

* `]]` (n) : Next Reference

* `[[` (n) : Prev Reference

* `<a-n>` (n) : Next Reference

* `<a-p>` (n) : Prev Reference

* `<leader>co` (n) : Organize Imports

* `<leader>ss` (n) : LSP Symbols

* `<leader>sS` (n) : LSP Workspace Symbols

* `gai C[a]lls` (n) : Incoming

* `gao C[a]lls` (n) : Outgoing

## [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

* `<leader>bj` (n) : Pick Buffer
  * Type displayed alphabet to pick buffer, that is shown on tab bar

* `<leader>bl` (n) : Delete Buffers to the Left

* `<leader>bp` (n) : Toggle Pin

* `<leader>bP` (n) : Delete Non-Pinned Buffers

* `<leader>br` (n) : Delete Buffers to the Right

* `[b` (n) : Prev Buffer

* `[B` (n) : Move buffer prev

* `]b` (n) : Next Buffer

* `]B` (n) : Move buffer next

* `<S-h>` (n) : Prev Buffer

* `<S-l>` (n) : Next Buffer

## [conform.nvim](https://github.com/stevearc/conform.nvim)

* `<leader>cF` (n,x) : Format Injected Langs

## [flash.nvim](https://github.com/folke/flash.nvim)

* `<c-s>` (c) : Toggle Flash Search
  * Integrate flash.nvim with your regular search using `/` or `?`.

* `r` (o) : Remote Flash

* `R` (o,x) : Treesitter Search

* `s` (n,o,x) : Flash
  * Jump to target location by typing

* `S` (n,o,x) : Flash Treesitter
  * Visual mode text selection, according coding blocks, using Treesitter

* `<c-space>` (n,o,x) : Treesitter Incremental Selection
  * If this keybinding does not work, modify like `<c-r>`, according to this file `https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua`

### Additional Keybindings

* Enhanced `f`, `t`, `F`, `T` motions
  * After typing `f{char}` or `F{char}`, you can repeat the motion with `f` or go to the previous match with `F` to undo a jump.
  * Similarly, after typing `t{char}` or `T{char}`, you can repeat the motion with `t` or go to the previous match with `T`.
  * You can also go to the next match with `;` or previous match with `,`
  * Any highlights clear automatically when moving, changing buffers, or pressing `<esc>`.

* `yR` : Copy to selection using Treesitter.
  * combination of Treesitter and Search modes
  * do something like `yR`
  * you can now start typing a search pattern.
  * arround your matches, all the surrounding Treesitter nodes will be labeled.
  * select a label to perform the operator on the new selection

* `yr` : Copy to selection.
  * select a label to set the cursor position
  * perform any motion, like `iw` or even start flash Treesitter with `S`
  * the yank will be performed on the new selection
  * you'll be back in the original window / position

## [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)

* `<leader>sr` (n,x) : Search and Replace

### Additional Keybindings

**Dependencies Install**

* `scoop install main/ripgrep --global`

* `scoop install main/ast-grep --global`

**Problem And Solution**

* In `lazy.nvim` plugin manager, check `grug-far.nvim` plugin is loaded or not. If it is loaded then, press it's leader key `\` inside search result buffer/pane, shows which-key's popup menu with possible options.

* Most of the time, `lazy.nvim` plugin manager does not load `grug-far.nvim` plugin instantly.

* If required, restart `grug-far.nvim` plugin interface, by pressing `\c` (close) and `<leader>sr` (Open: Search and Replace, vim-mode: n, x).

**Notes**

* Keybindings only work, when cursor in search field, not in search result text.

* Cookbook Commands
  * Write `grug-far.nvim` cookbook commands only in vim's command mode, means when typing `:` character. Example `:lua require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })`

* Vim Modes
  * Press `<Esc>` OR `Ctrl + C` to go back to normal mode.
  * Press `i`, to activate vim's insert mode.

* Result Buffer
  * Use `Up-Arrow` and `Down-Arrow` key for up/down navigation.

**Actions:**
   
* Help `g?` : Open up help window.
   
* Replace `\r` : Perform replace. Note that compared to 'Sync All', replace can also handle multiline replacements.

* Sync All `\s` : Sync all result lines text (potentially manually modified) back to their originating files. You can refine the effect by manually deleting lines to exclude them.

* Sync Line `\l` : Sync current result line text (potentially manually modified) back to its originating file.

* Sync Next `\n` : Sync change at current line and move cursor to next match
   
* Sync Prev `\p` : Sync change at current line and move cursor to prev match
   
* Sync File `\v` : Sync changes within current file
   
* History Open `\t` : Open history window. The history window allows you to select and edit historical searches/replacements.

* History Add `\a` : Add current search/replace as a history entry.
   
* Refresh `\f` : Re-trigger search. This can be useful in situations where files have been changed externally for example.
   
*  Goto `<enter>` : When cursor is placed on a result file path, go to that file. When it's placed over a result line, go to the file/line/column of the match. If a `<count>` is entered beforehand, go to the location corresponding to `<count>` result line.
   
* Open `\o` : Same as 'Goto', but cursor stays in grug-far buffer. This can allow a quicker thumb-through result locations. Alternatively, you can use the '--context `<num>`' flag to see match contexts. If a `<count>` is entered beforehand, open the location corresponding to `<count>` result line.
   
* Open Next `<down>` : Move cursor to next result line relative to current line and trigger 'Open' action
   
* Open Prev `<up>` : Move cursor to previous result line relative to current line and trigger 'Open' action
   
* Apply Next `\j` : Apply change at current line, remove it from buffer and move cursor to `/` open next change
   
* Apply Prev `\k` : Apply change at current line, remove it from buffer and move cursor to `/` open prev change
   
* Quickfix `\q` : Send result lines to the quickfix list. Deleting result lines will cause them not to be included. 
   
* Abort `\b` : Abort current operation. Can be useful if you've ended up doing too large of a search or if you've changed your mind about a replacement midway.

* Close `\c` : Close grug-far buffer/window. This is the same as `:bd` except that it will also ask you to confirm if there is a replace/sync in progress, as those would be aborted.

* Swap Engine `\e` : Swap search engine with the next one.
   
* Toggle Show Search Command `\w` : Toggle showing search command. Can be useful for debugging purposes.
   
* Preview `\i` : Preview location in floating window.
   
* Swap Replacement Interpreter `\x` : Swap replacement interpreter with the next one. For example, with the "lua" interpreter, you can use lua to generate your replacement for each match.

* Next Input `<tab>` : Goto next input. Cycles back.

* Prev Input `<s-tab>` : Goto prev input. Cycles back.

## [noice.nvim](https://github.com/folke/noice.nvim)

* `<c-b>` (n,i,s) : Scroll Backward

* `<c-f>` (n,i,s) : Scroll Forward

* `<leader>sn` (n) : +noice

* `<leader>sna` (n) : Noice All
  * Press `q` to quit

* `<leader>snd` (n) : Dismiss All

* `<leader>snh` (n) : Noice History
  * Press `q` to quit

* `<leader>snl` (n) : Noice Last Message
  * Press `q` to quit

* `<leader>snt` (n) : Noice Picker (Telescope/FzfLua)

* `<S-Enter>` (c) : Redirect Cmdline

## [persistence.nvim](https://github.com/folke/persistence.nvim)

* `<leader>qd` (n) : Don't Save Current Session

* `<leader>ql` (n) : Restore Last Session

* `<leader>qs` (n) : Restore Session

* `<leader>qS` (n) : Select Session

## [snacks.nvim](https://github.com/folke/snacks.nvim)

* `<leader><space>` (n) : Find Files (Root Dir)

* `<leader>,` (n) : Buffers

* `<leader>.` (n) : Toggle Scratch Buffer
  * Every project folder has differenct scratch buffer files, stored in user's `$HOME` folder's sub-folder.

* `<leader>/` (n) : Grep (Root Dir)

* `<leader>:` (n) : Command History

* `<leader>dps` (n) : Profiler Scratch Buffer

* `<leader>e` (n) : Explorer Snacks (root dir)

* `<leader>E` (n) : Explorer Snacks (cwd)

* `<leader>fb` (n) : Buffers
  * Shows all open files

* `<leader>fB` (n) : Buffers (all)
  * Shows all open files and scratch files

* `<leader>fc` (n) : Find Config File

* `<leader>fe` (n) : Explorer Snacks (root dir)

* `<leader>fE` (n) : Explorer Snacks (cwd)

* `<leader>ff` (n) : Find Files (Root Dir)

* `<leader>fF` (n) : Find Files (cwd)

* `<leader>fg` (n) : Find Files (git-files)

* `<leader>fp` (n) : Projects

* `<leader>fr` (n) : Recent

* `<leader>fR` (n) : Recent (cwd)

* `<leader>gd` : Git Diff (hunks)
  * Dependent on - currently opened project `<leader>fp` (n)

* `<leader>gD` (n) : Git Diff (origin)

* `<leader>gi` (n) : GitHub Issues (open)
  * `gh issue list --limit 50 --json` : Shows output from this command.

* `<leader>gI` (n) : GitHub Issues (all)
  * `gh issue list --limit 50 --search {{search-text}} --state all --json` : Shows output from this command

* `<leader>gp` (n) : GitHub Pull Requests (open)
  * `gh pr list --limit 50 --search {{search-text}} --json` : Shows output from this command

* `<leader>gP` : GitHub Pull Requests (all)
  * `gh pr list --limit 50 --search {{search-text}} --state all --json` : Shows output for this command

* `<leader>gs` (n) : Git Status

* `<leader>gS` (n) : Git Stash

* `<leader>n` (n) : Notification History

* `<leader>S` (n) : Select Scratch Buffer

* `<leader>s"` (n) : Registers

* `<leader>s/` (n) : Search History

* `<leader>sa` (n) : Autocmds

* `<leader>sb` (n) : Buffer Lines

* `<leader>sB` (n) : Grep Open Buffers

* `<leader>sc` (n) : Command History

* `<leader>sC` (n) : Commands

* `<leader>sd` (n) : Diagnostics
  * Shows diagnostics for all open files

* `<leader>sD` (n) : Buffer Diagnostics
  * Shows diagnostics for only current file

* `<leader>sg` (n) : Grep (Root Dir)

* `<leader>sG` (n) : Grep (cwd)

* `<leader>sh` (n) : Help Pages
  * Press `q` to quit

* `<leader>sH` (n) : Highlights

* `<leader>si` (n) : Icons

* `<leader>sj` (n) : Jumps
  * Among open buffer files

* `<leader>sk` (n) : Keymaps

* `<leader>sl` (n) : Location List

* `<leader>sm` (n) : Marks

* `<leader>sM` (n) : Man Pages

* `<leader>sp` (n) : Search for Plugin Spec

* `<leader>sq` (n) : Quickfix List

* `<leader>sR` (n) : Resume

* `<leader>su` (n) : Undotree

* `<leader>sw` (n,x) : Visual selection or word (Root Dir)

* `<leader>sW` (n,x) : Visual selection or word (cwd)

* `<leader>uC` (n) : Colorschemes

* `<leader>un` (n) : Dismiss All Notifications

## [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

* `<leader>st` (n) : Todo

* `<leader>sT` (n) : Todo/Fix/Fixme

* `<leader>xt` (n) : Todo (Trouble)

* `<leader>xT` (n) : Todo/Fix/Fixme (Trouble)

* `[t` (n) : Previous Todo Comment
  * Works inside

* `]t` (n) : Next Todo Comment

### Additional Keybindings

* Writing rules (add space before and after of text): ` TODO: `, ` PERF: `, ` HACK: `, ` NOTE: `, ` FIX: `, ` WARNING: `

## [trouble.nvim](https://github.com/folke/trouble.nvim)

* `<leader>cs` (n) : Symbols (Trouble)
  * Press `q` to quit, when trouble.nvim window is in focus

* `<leader>cS` (n) : LSP references/definitions/... (Trouble)

* `<leader>xL` (n) : Location List (Trouble)

* `<leader>xQ` (n) : Quickfix List (Trouble)

* `<leader>xx` (n) : Diagnostics (Trouble)

* `<leader>xX` (n) : Buffer Diagnostics (Trouble)

* `[q` (n) : Previous Trouble/Quickfix Item

* `]q` (n) : Next Trouble/Quickfix Item

## [which-key.nvim](https://github.com/folke/which-key.nvim)

* `<c-w><space>` (n) : Window Hydra Mode (which-key)

* `<leader>?` (n) : Buffer Keymaps (which-key)

### Additional Keybindings

* When which-key.nvim popup is open
  
  * `<Esc>` : Close

  * `<Backspace>` : Back

  * `Ctrl + d` : Scroll down

  * `Ctrl + U` : Scroll up

# Keybind-LazyVim.md

## Notes

* Vim Modes
  * Normal mode (`n`), Insert mode (`i`), Visual mode (`v`), Visual mode only (`x`), Select mode (`s`), Operator-pending mode (`o`), Command-line mode (`c`), Terminal mode (`t`)

* `:checkhealth mason` : Shows LSP, DAP, Linter, Formatter Dependencies.

# References

## Tutorials

* [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)
  * [Neovim Multiline Search and Replace with grug-far.nvim | ast-grep and waaaaaay more](https://linkarzu.com/posts/neovim/grug-far/)
