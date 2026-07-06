# Commands

## Configuration Commands

* [How to Reload a Tmux Config File](https://linuxhint.com/how-to-reload-tmux-config-file/)
  * From Outside of Tmux-Session: `tmux source-file ~/.tmux.conf`
  * From Inside of Tmux-Session: Press "Prefix + :" and type command `source-file ~/.tmux.conf`

# Commands From [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)

* First press `Ctrl + b` prefix and type command like `:new` (creates new session).

## Sessions

* Start a new session
  * `tmux`
  * `tmux new`
  * `tmux new-session`
  * `:new` : First press `Ctrl + b` prefix and type this command.

* Start a new session with the name mysession
  * `tmux new -s mysession`
  * `:new -s mysession`

* kill/delete session mysession
  * `tmux kill-ses -t mysession`
  * `tmux kill-session -t mysession`

* `tmux kill-session -a` : kill/delete all sessions but the current

* `tmux kill-session -a -t mysession` : kill/delete all sessions but mysession

* `Ctrl + b -> $` : Rename session

* Detach from session
  * `Ctrl + b -> d`

* `:attach -d` : Detach others on the session (Maximize window by detach other clients)

* Show all sessions
  * `tmux ls`
  * `tmux list-sessions`
  * `Ctrl + b -> s` [Press `Esc` or `q` to cancel]

* Attach to last session
  * `tmux a`
  * `tmux at`
  * `tmux attach`
  * `tmux attach-session`

* Attach to a session with the name mysession
  * `tmux a -t mysession`
  * `tmux at -t mysession`
  * `tmux attach -t mysession`
  * `tmux attach-session -t mysession`

* `Ctrl + b -> w` : Session and Window Preview

* `Ctrl + b -> (` : Move to previous session

* `Ctrl + b -> )` : Move to next session

## Windows

* `tmux new -s mysession -n mywindow` : start a new session with the name mysession and window mywindow

* `Ctrl + b -> c` : Create window

* `Ctrl + b -> ,` : Rename current window

* `Ctrl + b -> &` : Close current window

* `Ctrl + b -> w` : List windows

* `Ctrl + b -> p` : Previous window

* `Ctrl + b -> n` : Next window

* `Ctrl + b -> 0...9` : Switch/select window by number

* `Ctrl + b -> l` : Toggle last active window

* `:swap-window -s 2 -t 1` : Reorder window, swap window number 2(src) and 1(dst)

* `:swap-window -t -1` : Move current window to the left by one position

## Panes

* `Ctrl + b -> ;` : Toggle last active pane

* `Ctrl + b -> %` : Split pane with horizontal layout

* `Ctrl + b -> "` : Split pane with vertical layout

* `Ctrl + b -> {` : Move the current pane left

* `Ctrl + b -> }` : Move the current pane right

* Switch to pane to the direction
  * `Ctrl + b -> Up-Arrow`
  * `Ctrl + b -> Down-Arrow`
  * `Ctrl + b -> Right-Arrow`
  * `Ctrl + b -> Left-Arrow`

* `:setw synchronize-panes` : Toggle synchronize-panes(send command to all panes)
  * [Turn Off: `setw synchronize-panes off`] <sup>{1}</sup>

* `Ctrl + b -> Spacebar` : Toggle between pane layouts 

* `Ctrl + b -> o` : Switch to next pane

* `Ctrl + b -> q` : Show pane numbers

* `Ctrl + b -> q -> 0...9` : Switch/select pane by number

* `Ctrl + b -> z` : Toggle pane zoom

* `Ctrl + b -> !` : Convert pane into a window

* Resize current pane height(holding second key is optional)
  * `Ctrl + b -> Up-Arrow`
  * `Ctrl + b -> Ctrl + Up-Arrow`
  * `Ctrl + b -> Down-Arrow`
  * `Ctrl + b -> Ctrl + Down-Arrow`

* Resize current pane width(holding second key is optional)
  * `Ctrl + b -> Right-Arrow`
  * `Ctrl + b -> Ctrl + Right-Arrow`
  * `Ctrl + b -> Left-Arrow`
  * `Ctrl + b -> Ctrl + Left-Arrow`

* `Ctrl + b -> x` : Close current pane

## Copy Mode

* `:setw -g mode-keys vi` : use vi keys in buffer

* `Ctrl + b -> [` : Enter copy mode
  * [Press `q` to quit copy mode]

* `Ctrl + b -> PgUp` : Enter copy mode and scroll one page up

* `q` : Quit mode

* `g` : Go to top line

* `G` : Go to bottom line

* `Up-Arrow` : Scroll up

* `Down-Arrow` : Scroll down

* `h` : Move cursor left

* `j` : Move cursor down

* `k` : Move cursor up

* `l` : Move cursor right

* `w` : Move cursor forward one word at a time

* `b` : Move cursor backward one word at a time

* `/` : Search forward

* `?` : Search backward

* `n` : Next keyword occurance

* `N` : Previous keyword occurance

* `Spacebar` : Start selection

* `Esc` : Clear selection

* `Enter` : Copy selection

* `Ctrl + b -> ]` : Paste contents of buffer_0

* `:show-buffer` : display buffer_0 contents
  * [Press `q` to quit]

* `:capture-pane` : copy entire visible contents of pane to a buffer

* `:list-buffers` : Show all buffers
  * [Press `q` to quit]

* `:choose-buffer` : Show all buffers and paste selected
  * [To test enter into `vim` -> `insert` mode]

* `:save-buffer buf.txt` : Save buffer contents to buf.txt [Direcotry: `~/buf.txt`]

* `:delete-buffer -b 1` : delete buffer_1
  * [Check buffer name from `:list-buffers` => "buffer0", "buffer1"]

## Misc

* `Ctrl + b -> :` : Enter command mode

* `:set -g OPTION` : Set OPTION for all sessions

* `:setw -g OPTION` : Set OPTION for all windows

* `:set mouse on` : Enable mouse mode

## Help

* List key bindings(shortcuts)
  * `tmux list-keys`
  * `:list-keys`
  * `Ctrl + b -> ?`

* `tmux info` : Show every session, window, pane, etc...

# Keybindings from `Ctrl + b -> ?`

## Meaning
  
* `C` means `Ctrl` key

* `M` means `Alt` key

* `S` means `Shift` key

* "client" means "session"

## Sessions

* `C-b s` : Choose a session from a list

* `C-b (` : Switch to previous client ["client" means "session"]

* `C-b )` : Switch to next client

* `C-b C-z` : Suspend the current client [Use command `fg` to unsuspend from terminal]

* `C-b $` : Rename current session

* `C-b D` : Choose a client from a list

* `C-b L` : Switch to the last client

* `C-b d` : Detach the current client

* `C-b r` : Redraw the current client

## Windows

* `C-b c` : Create a new window

* `C-b ,` : Rename current window

* `C-b &` : Kill current window

* `C-b w` : Choose a window from a list

* `C-b p` : Select the previous pane

* `C-b n` : Select the next window

* `C-b 0` : Select window 0

* `C-b 1` : Select window 1

* `C-b 2` : Select window 2

* `C-b 3` : Select window 3

* `C-b 4` : Select window 4

* `C-b 5` : Select window 5

* `C-b 6` : Select window 6

* `C-b 7` : Select window 7

* `C-b 8` : Select window 8

* `C-b 9` : Select window 9

* `C-b l` : Select the previously current window

* `C-b '` : Prompt for window index to select

* `C-b .` : Move the current window

* `C-b i` : Display window information

* `C-b M-n` : Select the next window with an alert

* `C-b M-p` : Select the previous window with an alert

* `C-b S-Up` : Move the visible part of the window up [`S` means `Shift` key]

* `C-b S-Down` : Move the visible part of the window down

* `C-b S-Left` : Move the visible part of the window left

* `C-b S-Right` : Move the visible part of the window right

## Panes

* `C-b ;` : Move to the previously active pane

* `C-b %` : Split window horizontally

* `C-b "` : Split window vertically

* `C-b {` : Swap the active pane with the pane above

* `C-b }` : Swap the active pane with the pane below

* `C-b Up` : Select the pane above the active pane

* `C-b Down` : Select the pane below the active pane

* `C-b Left` : Select the pane to the left of the active pane

* `C-b Right` : Select the pane to the right of the active pane

* `C-b Space` : Select next layout

* `C-b o` : Select the next pane

* `C-b q` : Display pane numbers

* `C-b z` : Zoom the active pane [Press `C-b z` to Unzoom]

* `C-b !` : Break pane to a new window

* `C-b C-Up` : Resize the pane up [`C` means `Ctrl` key]

* `C-b C-Down` : Resize the pane down

* `C-b C-Left` : Resize the pane left

* `C-b C-Right` : Resize the pane right

* `C-b M-Up` : Resize the pane up by 5

* `C-b M-Down` : Resize the pane down by 5

* `C-b M-Left` : Resize the pane left by 5

* `C-b M-Right` : Resize the pane right by 5

* `C-b x` : Kill the active pane

* `C-b C-o` : Rotate through the panes

* `C-b E` : Spread panes out evenly

* `C-b M` : Clear the marked pane

* `C-b f` : Search for a pane

* `C-b M-o` : Rotate through the panes in reverse

* `C-b m` : Toggle the marked pane

## Copy Mode

* `C-b [` : Enter copy mode [Press `q` to quit copy mode]

* `C-b ]` : Paste the most recent paste buffer

* `C-b PPage` : Enter copy mode and scroll up

## Misc

* `C-b C-b` : Send the prefix key
* `C-b #` : List all paste buffers [Press `q` to quit]
* `C-b -` : Delete the most recent paste buffer
* `C-b /` : Describe key binding [Write `$` shows: Rename current session]
* `C-b :` : Prompt for a command
* `C-b =` : Choose a paste buffer from a list
* `C-b ?` : List key bindings
* `C-b t` : Show a clock [Press `q` to quit]
* `C-b ~` : Show messages [Press `q` to quit]
* `C-b DC` : Reset so the visible part of the window follows the cursor
* `C-b M-1` : Set the even-horizontal layout [`M` means `Alt` key]
* `C-b M-2` : Set the even-vertical layout
* `C-b M-3` : Set the main-horizontal layout
* `C-b M-4` : Set the main-vertical layout
* `C-b M-5` : Select the tiled layout

# References

* next-sl: {2}

## Guides

* Commands
  * {1} [How to send a command to all panes in tmux?](https://stackoverflow.com/questions/16325449/how-to-send-a-command-to-all-panes-in-tmux)
