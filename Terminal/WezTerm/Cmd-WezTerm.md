# Commands

## General Command

* `printenv` : In Linux, list all environment variables <sup>{1}</sup>
* `echo $WEZTERM_PANE` : Print current pane ID
* `wezterm cli list` : Show all window, tab, pane information with ID.

## wezterm start

* `wezterm start` : Start new window.
* `wezterm start --new-tab` : Start new tab on existing window.
* `wezterm start --new-tab --cwd '/home'` : Start new tab on existing window with working directory "/home".
* `wezterm start --workspace {{workspace-name}}` : Start new window on workspace "{{workspace-name}}".

## wezterm show-keys

* `wezterm show-keys` : Show keyboard shortcuts.
* `wezterm show-keys --lua` : Show keyboard shortcuts in Lua language format.
* `wezterm show-keys --lua --key-table {{key_tables}}` : In lua mode, show only the named key table, {{key_tables}} : "search_mode", "copy_mode" etc.

## wezterm set-working-directory

## wezterm serial

## wezterm ls-fonts

* `wezterm ls-fonts` : Display information about fonts, which are used in wezterm.
* `wezterm ls-fonts --list-system` : Whether to list all fonts available to the system
* `wezterm ls-fonts --text {{TEXT}}` : Explain which fonts are used to render the supplied text string

## wezterm imgcat

* `wezterm imgcat {{FILE-NAME}}` : Output an image to the terminal
* `wezterm imgcat --width {{WIDTH}} {{FILE-NAME}}` : Specify the display width; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal width
* `wezterm imgcat --height {{HEIGHT}} {{FILE-NAME}}` : Specify the display height; defaults to "auto" which automatically selects an appropriate size.  You may also use an integer value `N` to specify the number of cells, or `Npx` to specify the number of pixels, or `N%` to size relative to the terminal height

## wezterm cli

### wezterm cli activate-pane-direction

* `wezterm cli activate-pane-direction {{Up | Down | Left | Right | Next | Prev}}` : Activate an adjacent pane in the specified direction

### wezterm cli activate-pane

* `wezterm cli activate-pane` : Activates the current pane
* `wezterm cli activate-pane --pane-id {{PANE_ID}}` : Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE

### wezterm cli activate-tab

* `wezterm cli activate-tab --tab-id {{TAB_ID}}` : Specify the target tab by its id

### wezterm cli adjust-pane-size

* `wezterm cli adjust-pane-size {{Up | Down | Left | Right}}` : Specify the direction to resize in
* `wezterm cli adjust-pane-size --pane-id {{PANE_ID}} {{Up | Down | Left | Right}}` : Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE
* `wezterm cli adjust-pane-size --amount {{AMOUNT}} {{Up | Down | Left | Right}}` : Specify the number of cells to resize by, defaults to 1
* `wezterm cli adjust-pane-size --pane-id {{PANE_ID}} --amount {{AMOUNT}} {{Up | Down | Left | Right}}` : Specify the number of cells to resize by, defaults to 1

### wezterm cli get-pane-direction

* `wezterm cli get-pane-direction {{Up | Down | Left | Right | Next | Prev}}` : Determine the adjacent pane in the specified direction.

### wezterm cli get-text

* `wezterm cli get-text > /tmp/myscreen.txt` : Will capture the main (non-scrollback) portion of the current pane to `/tmp/myscreen.txt`.
* `wezterm cli get-text --escapes > /tmp/myscreen-with-colors.txt` : By default, just the raw text is captured without any color or styling escape sequences. You may pass `--escapes` to include those.
* `wezterm cli get-text --start-line {{(+|-) START_LINE}} > /tmp/myscreen.txt` : The starting line number. 0 is the first line of terminal screen. Negative numbers proceed backwards into the scrollback. The default value is unspecified is 0, the first line of the terminal screen

### wezterm cli kill-pane

* `wezterm cli kill-pane` : Kill a pane
* `wezterm cli kill-pane --pane-id {{PANE_ID}}` : Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE

### wezterm cli list-clients

* `wezterm cli list-clients` : Lists the set of connected clients and some additional information about them.
* `wezterm cli list-clients  --format {{table | json}}` : Controls the output format. "table" and "json" are possible formats [default: table]

### wezterm cli list

* `wezterm cli list` : Lists the set of windows, tabs and panes that are being managed.
* `wezterm cli list --format {{table | json}}` : Controls the output format. "table" and "json" are possible formats [default: table]

### wezterm cli move-pane-to-new-tab

* `wezterm cli move-pane-to-new-tab` : Move a pane into a new tab
* `wezterm cli move-pane-to-new-tab --pane-id {{PANE_ID}}` : Specify the pane that should be moved. The default is to use the current pane based on the environment variable WEZTERM_PANE
* `wezterm cli move-pane-to-new-tab --new-window` : Create tab in a new window, rather than the window currently containing the pane
* `wezterm cli move-pane-to-new-tab --window-id {{WINDOW_ID}}` : Specify the window into which the new tab will be created. If omitted, the window associated with the current pane is used
* `wezterm cli move-pane-to-new-tab --new-window --workspace {{WORKSPACE}}` : If creating a new window, override the default workspace name with the provided name. The default name is "default"

### wezterm cli rename-workspace

* `wezterm cli rename-workspace {{NEW_WORKSPACE}}` : Rename current workspace
* `wezterm cli rename-workspace --workspace {{WORKSPACE}} {{NEW_WORKSPACE}}` : Specify the workspace to rename
* `wezterm cli rename-workspace --pane-id {{PANE_ID}}` : Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE. The pane is used to figure out which workspace should be renamed.

### wezterm cli send-text

* `wezterm cli send-text "hello there"` : Will cause `hello there` to be sent to the input in the current pane.
* `echo hello there | wezterm cli send-text` : You can also pipe text in via stdin to be sent to the input in the current pane.
* `wezterm cli send-text --pane-id {{PANE_ID}} "hello there"` : Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE
* `wezterm cli send-text --no-paste "hello there"` : Send the text directly, rather than as a bracketed paste

### wezterm cli set-tab-title

* `wezterm cli set-tab-title {{TITLE}}` : Change the title of a tab
* `wezterm cli set-tab-title --tab-id {{TAB_ID}} {{TITLE}}` : Specify the target tab by its id
* `wezterm cli set-tab-title --pane-id {{PANE_ID}} {{TITLE}}` : Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE. The pane is used to figure out which tab should be renamed.

### wezterm cli set-window-title

* `wezterm cli set-window-title {{TITLE}}` : Change the title of a window
* `wezterm cli set-window-title --window-id {{WINDOW_ID}} {{TITLE}}` : Specify the target window by its id
* `wezterm cli set-window-title --pane-id {{PANE_ID}} {{TITLE}}` : Specify the current pane. The default is to use the current pane based on the environment variable WEZTERM_PANE. The pane is used to figure out which window should be renamed.

### wezterm cli spawn

* `wezterm cli spawn` : When run with no arguments, it will spawn a new tab running the default program; this example spawns a new pane with id 1 running that default program (most likely: your shell).
* `wezterm cli spawn -- top` : This example launches `top` in a new tab.
* `wezterm cli spawn -- bash -l` : This example explicitly runs bash as a login shell.
* `wezterm cli spawn --cwd {{CWD}}` : Specify the current working directory for the initially spawned program
* `wezterm cli spawn --new-window --workspace {{WORKSPACE}} -- bash -l` : When creating a new window, override the default workspace name with the provided name. The default name is "default". Requires `--new-window`

### wezterm cli split-pane

* `wezterm cli split-pane` : This splits the pane and creates a new one at the bottom running the default command.
* `wezterm cli split-pane -- bash -l` : This example launches bash as a login shell in a new pane at the bottom.
* `wezterm cli split-pane --left --percent 30` : This example creates a split to the left, occupying 30% of the available space.
* `wezterm cli split-pane --pane-id {{PANE_ID}}` : Specify the pane that should be split. The default is to use the current pane based on the environment variable WEZTERM_PANE
* `wezterm cli split-pane --cwd {{CWD}}` : Specify the current working directory for the initially spawned program
* `wezterm cli split-pane --move-pane-id {{MOVE_PANE_ID}}` : Instead of spawning a new command, move the specified pane into the newly created split

### wezterm cli zoom-pane

* `wezterm cli zoom-pane` : Zooms the pane if it wasn't already zoomed
* `wezterm cli zoom-pane --pane-id {{PANE_ID}}` : Specify the target pane. The default is to use the current pane based on the environment variable WEZTERM_PANE
* `wezterm cli zoom-pane --zoom` : Zooms the pane if it wasn't already zoomed
* `wezterm cli zoom-pane --unzoom` : Unzooms the pane if it was zoomed
* `wezterm cli zoom-pane --toggle` : Toggles the zoom state of the pane

# References

* next-sl: {2}

## Guides

* {1} [Linux List All Environment Variables Command](https://www.cyberciti.biz/faq/linux-list-all-environment-variables-env-command/)
