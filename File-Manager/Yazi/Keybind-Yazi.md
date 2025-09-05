# Keybindings

## PATH

* Linux Trash Path: `~/.local/share/Trash`

# [Yazi Quick Start](https://yazi-rs.github.io/docs/quick-start) <sup>{1}</sup>

## General

* Press `<Esc>` to escape from various situation.
* Press `q` to quit, `<F1>` or `~` to open the help menu.

## Navigation

* `k` OR `↑` : Move the cursor up
* `j` OR `↓` : Move the cursor down
* `l` OR `→` : Enter hovered directory
* `h` OR `←` : Leave the current directory and into its parent
* `K` : Seek up 5 units in the preview [Also backward video frame]
* `J` : Seek down 5 units in the preview [Also forward video frame]
* `g ⇒ g` : Move cursor to the top
* `g ⇒ h` : Go home
* `g ⇒ c` : Goto ~/.config
* `g ⇒ d` : Goto ~/Downloads
* `g ⇒ <Space>` : Jump interactively [Press `<Tab>` key to fill from auto-completion]
* `G` : Move cursor to the bottom
* `z` : Jump to a directory using zoxide
* `Z` : Jump to a directory or reveal a file using fzf

## Selection

* `Space` : Toggle selection of hovered file/directory
* `v` : Enter visual mode (selection mode) [Press `<Esc>` to escape]
* `V` : Enter visual mode (unset mode) [Press `<Esc>` to escape]
* `Ctrl + a` : Select all files
* `Ctrl + r` : Inverse selection of all files
* `Esc` : Cancel selection

## File operations

* `o` : Open selected files
* `O` : Open selected files interactively [`exif` tool]
* `Enter` : Open selected files
* `Shift + Enter` : Open selected files interactively (some terminals don't support it yet)
* `Tab` : Show the file information
* `y` : Yank selected files (copy)
* `x` : Yank selected files (cut)
* `p` : Paste yanked files [`p` option add file, with number added in name]
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

# From Help Menu: `F1` or `~`

* `(+)` means, it is new command from above list.

* `<Esc>` => `escape` : Exit visual mode, clear selection, or cancel search
* `<C-[>` => `escape` : Exit visual mode, clear selection, or cancel search
* `q` => `quit` : Quit the process
* `Q` => `quit --no-cwd-file` : Quit without outputting cwd-file
* `<C-c>` => `close` : Close the current tab, or quit if it's last
* `<C-z>` => `suspend` : Suspend the process
* `k` => `arrow prev` : Previous file
* `j` => `arrow next` : Next file
* `<Up>` => `arrow prev` : Previous file
* `<Down>` => `arrow next` : Next file
* `<C-u>` => `arrow -50%` : Move cursor up half page
* `<C-d>` => `arrow 50%` : Move cursor down half page
* `<C-b>` => `arrow -100%` : Move cursor up one page
* `<C-f>` => `arrow 100%` : Move cursor down one page
* `<S-PageUp>` => `arrow -50%` : Move cursor up half page
* `<S-PageDown>` => `arrow 50%` : Move cursor down half page
* `<PageUp>` => `arrow -100%` : Move cursor up one page
* `<PageDown>` => `arrow 100%` : Move cursor down one page
* `gg` => `arrow top` : Go to top
* `G` => `arrow bot` : Go to bottom
* `h` => `leave` : Back to the parent directory
* `l` => `enter` : Enter the child directory
* `<Left>` => `leave` : Back to the parent directory
* `<Right>` => `enter` : Enter the child directory
* `H` => `back` : Back to previous directory
* `L` => `forward` : Forward to next directory
* `<Space>` => `toggle; arrow next` : Toggle the current selection state
* `<C-a>` => `toggle_all --state=on` : Select all files
* `<C-r>` => `toggle_all` : Invert selection of all files
* `v` => `visual_mode` : Enter visual mode (selection mode)
* `V` => `visual_mode --unset` : Enter visual mode (unset mode)
* `K` => `seek -5` : Seek up 5 units in the preview
* `J` => `seek 5` : Seek down 5 units in the preview
* `<Tab>` => `spot` : Spot hovered file
* `o` => `open` : Open selected files
* `O` => `open --interactive` : Open selected files interactively
* `<Enter>` => `open` : Open selected files
* `<S-Enter>` => `open --interactive` : Open selected files interactively
* `y` => `yank` : Yank selected files (copy)
* `x` => `yank --cut` : Yank selected files (cut)
* `p` => `paste` : Paste yanked files
* `P` => `paste --force` : Paste yanked files (overwrite if the destination exists)
* `-` => `link` : Symlink the absolute path of yanked files
* `_` => `link --relative` : Symlink the relative path of yanked files
* `<C-->` => `hardlink` : Hardlink yanked files
* `Y` => `unyank` : Cancel the yank status
* `X` => `unyank` : Cancel the yank status
* `d` => `remove` : Trash selected files
* `D` => `remove --permanently` : Permanently delete selected files
* `a` => `create` : Create a file (ends with / for directories)
* `r` => `rename --cursor=before_ext` : Rename selected file(s)
* `;` => `shell --interactive` : Run a shell command
* `:` => `shell --interactive --block` : Run a shell command (block until finishes)
* `.` => `hidden toggle` : Toggle the visibility of hidden files
* `s` => `search --via=fd` : Search files by name via fd
* `S` => `Search --via=rg` : Search files by content via ripgrep
* `<C-s>` => `escape --search` : Cancel the ongoing search
* `z` => `plugin fzf` : Jump to file/directory via fzf
* `Z` => `plugin zoxide` : Jump to a directory via zoxide
* `ms` => `linemode size` : Linemode: size
* `mp` => `linemode permissions` : Linemode: permissions
* `mb` => `linemode btime` : Linemode: btime
* `mm` => `linemode mtime` : Linemode: mtime
* `mo` => `linemode owner` : Linemode: owner
* `mn` => `linemode none` : Linemode: none
* `cc` => `copy path` : Copy the file path
* `cd` => `copy dirname` : Copy the directory path
* `cf` => `copy filename` : Copy the filename
* `cn` => `copy name_without_ext` : Copy the filename without extension
* `f` => `filter --smart` : Filter files
* `/` => `find --smart` : Find next file
* `?` => `find --smart --previous` : Find previous file
* `n` => `find_arrow` : Next found
* `N` => `find_arrow --previous` : Previous found
* `,m` => `sort --reverse=no mtime; linemode mtime` : Sort by modified time
* `,M` => `sort mtime --reverse; linemode mtime` : Sort by modified time (reverse)
* `,b` => `sort --reverse=no btime; linemode btime` : Sort by birth time
* `,B` => `sort btime --reverse; linemode btime` : Sort by birth time (reverse)
* `,e` => `sort --reverse=no extension` : Sort by extension
* `,E` => `sort extension --reverse` : Sort by extension (reverse)
* `,a` => `sort alphabetical --reverse=no` : Sort alphabetically
* `,A` => `sort --reverse alphabetical` : Sort alphabetically (reverse)
* `,n` => `sort natural --reverse=no` : Sort naturally
* `,N` => `sort natural --reverse` : Sort naturally (reverse)
* `,s` => `sort --reverse=no size; linemode size` : Sort by size
* `,S` => `sort size --reverse; linemode size` : Sort by size (reverse)
* `,r` => `sort --reverse=no random` : Sort randomly
* `gh` => `cd ~` : Go home
* `gc` => `cd ~/.config` : Go ~/.config
* `gd` => `cd ~/Downloads` : Go ~/Downloads
* `g<Space>` => `cd --interactive` : Jump interactively
* `gf` => `follow` : Follow hovered symlink [Press `TAB` key for auto-completion]
* `t` => `tab_create --current` : Create a new tab with CWD
* `1` => `tab_switch 0` : Switch to first tab
* `2` => `tab_switch 1` : Switch to second tab
* `3` => `tab_switch 2` : Switch to third tab
* `4` => `tab_switch 3` : Switch to fourth tab
* `5` => `tab_switch 4` : Switch to fifth tab
* `6` => `tab_switch 5` : Switch to sixth tab
* `7` => `tab_switch 6` : Switch to seventh tab
* `8` => `tab_switch 7` : Switch to eighth tab
* `9` => `tab_switch 8` : Switch to ninth tab
* `[` => `tab_switch -1 --relative` : Switch to previous tab
* `]` => `tab_switch --relative 1` : Switch to next tab
* `{` => `tab_swap -1` : Swap current tab with previous tab
* `}` => `tab_swap 1` : Swap current tab with next tab

* `w` => `show` : Show task manager
  * If you realize that you've used `unzip` on the wrong files, and you need to cancel it, you can easily do that by pressing `x` in Yazi's task manager.

* `~` => `help` : Open help
* `<F1>` => `help` : Open help

# Keybind-Yazi.md

## ChatGPT: "linux terminal resume suspended process"

* To resume a suspended process in a Linux terminal, you can use the `fg` or `bg` command, depending on how you want to resume it.

* To resume the process in the foreground, use the `fg` command followed by the job number. If you don't specify a job number, it will resume the most recent suspended process.

* To resume the process in the background, use the `bg` command followed by the job number.

* If you have a suspended job, first check it using the `jobs` command. This will list all jobs with their job numbers (e.g., `[1]+ 1234`).

## Websites

# References

* next-sl: {2}

## Keybindings

* {1} [Yazi Quick Start](https://yazi-rs.github.io/docs/quick-start)
