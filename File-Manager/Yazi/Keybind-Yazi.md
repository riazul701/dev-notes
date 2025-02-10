# Keybindings

## PATH

* Linux Trash Path: `~/.local/share/Trash`

# [Yazi Quick Start](https://yazi-rs.github.io/docs/quick-start) <sup>{1}</sup>

## General

* Press `Esc` to escape from various situation.
* Press `q` to quit, `F1` or `~` to open the help menu.

## From Help Menu: `F1` or `~`

* `w` : `tasks_show`, Show task manager
* `ms` : `linemode size`, Linemode: size
* `mp` : `linemode permissions`, Linemode: permissions
* `mb` : `linemode btime`, Linemode: btime
* `mm` : `linemode mtime`, Linemode: mtime
* `mo` : `linemode owner`, Linemode: owner
* `mn` : `linemode none`, Linemode: none

## Navigation

* `k` OR `↑` : Move the cursor up
* `j` OR `↓` : Move the cursor down
* `l` OR `→` : Enter hovered directory
* `h` OR `←` : Leave the current directory and into its parent
* `K` : Seek up 5 units in the preview
* `J` : Seek down 5 units in the preview
* `g ⇒ g` : Move cursor to the top
* `g ⇒ h` : Go home
* `g ⇒ c` : Goto ~/.config
* `g ⇒ d` : Goto ~/Downloads
* `g ⇒ <Space>` : Jump interactively
* `G` : Move cursor to the bottom
* `z` : Jump to a directory using zoxide
* `Z` : Jump to a directory or reveal a file using fzf

## Selection

* `Space` : Toggle selection of hovered file/directory
* `v` : Enter visual mode (selection mode)
* `V` : Enter visual mode (unset mode)
* `Ctrl + a` : Select all files
* `Ctrl + r` : Inverse selection of all files
* `Esc` : Cancel selection

## File operations

* `o` : Open selected files
* `O` : Open selected files interactively
* `Enter` : Open selected files
* `Shift + Enter` : Open selected files interactively (some terminals don't support it yet)
* `Tab` : Show the file information
* `y` : Yank selected files (copy)
* `x` : Yank selected files (cut)
* `p` : Paste yanked files
* `P` : Paste yanked files (overwrite if the destination exists)
* `Y` OR `X` : Cancel the yank status
* `d` : Trash selected files
* `D` : Permanently delete selected files
* `a` : Create a file (ends with / for directories)
* `r` : Rename selected file(s)
* `.` : Toggle the visibility of hidden files
* `;` : Run a shell command
* `:` : Run a shell command (block until finishes)
* `-` : Symlink the absolute path of yanked files
* `_` : Symlink the relative path of yanked files
* `Ctrl + -` : Hardlink yanked files

## Copy paths

* `c ⇒ c` : Copy the file path
* `c ⇒ d` : Copy the directory path
* `c ⇒ f` : Copy the filename
* `c ⇒ n` : Copy the filename without extension

## Filter files

* `f` : Filter files

## Find files

* `/` : Find next file
* `?` : Find previous file
* `n` : Go to the next found
* `N` : Go to the previous found

## Search files

* `s` : Search files by name using [fd](https://github.com/sharkdp/fd)
* `S` : Search files by content using [ripgrep](https://github.com/BurntSushi/ripgrep)
* `Ctrl + s` : Cancel the ongoing search

## Sorting

* `, ⇒ m` : Sort by modified time
* `, ⇒ M` : Sort by modified time (reverse)
* `, ⇒ b` : Sort by birth time
* `, ⇒ B` : Sort by birth time (reverse)
* `, ⇒ e` : Sort by file extension
* `, ⇒ E` : Sort by file extension (reverse)
* `, ⇒ a` : Sort alphabetically
* `, ⇒ A` : Sort alphabetically (reverse)
* `, ⇒ n` : Sort naturally
* `, ⇒ N` : Sort naturally (reverse)
* `, ⇒ s` : Sort by size
* `, ⇒ S` : Sort by size (reverse)
* `, ⇒ r` : Sort randomly

## Multi-tab

* `t` : Create a new tab with CWD
* `1, 2, ..., 9	` : Switch to the N-th tab
* `[` : Switch to the previous tab
* `]` : Switch to the next tab
* `{` : Swap current tab with previous tab
* `}` : Swap current tab with next tab
* `Ctrl + c` : Close the current tab

## Commands From

* [Yazi Quick Start](https://yazi-rs.github.io/docs/quick-start) <sup>{1}</sup>

# Keybind-Yazi.md

## Websites

# References

* next-sl: {2}

## Keybindings

* {1} [Yazi Quick Start](https://yazi-rs.github.io/docs/quick-start)
