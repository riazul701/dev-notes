# Commands/Usage

# [sei40kr/wez-tmux GitHub](https://github.com/sei40kr/wez-tmux)

## Leader Key Basics

* `leader + leader` : Send the leader key itself

* `leader + [` : Enter copy mode for text selection

## Workspace Management (tmux Sessions)

## Tab Operations (tmux Windows)

* `leader + c` : Create new tab in current domain

* `leader + &` : Close current tab (with confirmation)

* `leader + p` : Switch to previous tab

* `leader + n` : Switch to next tab

* `leader + 1-9` : Switch to specific tab by index

## Pane Management

### Splitting & Navigation

* `leader + %` : Split pane horizontally

* `leader + "` : Split pane vertically

* `leader + {` : Rotate panes counter-clockwise

* `leader + }` : Rotate panes clockwise

* `leader + arrow` : Navigate to pane in direction

### Resizing & Operations

* `leader + z` : Zoom/unzoom current pane

* `leader + ctrl + arrow` : Resize pane in direction (5 cells)

* `leader + x` : Close current pane

## Copy Mode (Advanced Text Selection)

### Navigation

* `h/j/k/l` : Basic directional movement

* `w/b` : Word-based navigation

* `^` : Start of line content

* `g` : Top of scrollback

* `G` : Bottom of scrollback

### Scrolling & Paging

* `ctrl + u` : Scroll page up

* `ctrl + d` : Scroll page down

### Search & Selection

* `Ctrl + n` : Open entire terminal buffer into Neovim

* `Space` : Start selection

* `h` : Select leftward

* `j` : Select downward

* `k` : Select upward

* `l` : Select rightward

* `Enter` OR `y` : Copy selection and exit

* `Escape` OR `q` : Clear selection or exit

# Key-Tmux-WinTerm.md

