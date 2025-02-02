# Commands

## Configuration Commands

* [How to Reload a Tmux Config File](https://linuxhint.com/how-to-reload-tmux-config-file/)
  * From Outside of Tmux-Session: `tmux source-file ~/.tmux.conf`
  * From Inside of Tmux-Session: Press "Prefix + :" and type command `source-file ~/.tmux.conf`

## Commands From [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)

### Sessions

* Start a new session
  * `tmux`
  * `tmux new`
  * `tmux new-session`
  * `:new`
* Start a new session with the name mysession
  * `tmux new -s mysession`
  * `:new -s mysession`
* kill/delete session mysession
  * `tmux kill-ses -t mysession`
  * `tmux kill-session -t mysession`
* kill/delete all sessions but the current
  * `tmux kill-session -a`
* kill/delete all sessions but mysession
  * `tmux kill-session -a -t mysession`
* Rename session
  * Ctrl + b -> $
* Detach from session
  * Ctrl + b -> d
* Detach others on the session (Maximize window by detach other clients)
  * `:attach -d` 
* Show all sessions
  * `tmux ls`
  * `tmux list-sessions`
  * Ctrl + b -> s
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
* Session and Window Preview
  * Ctrl + b -> w
* Move to previous session
  * Ctrl + b -> (
* Move to next session
  * Ctrl + b -> )

### Windows

* start a new session with the name mysession and window mywindow
  * `tmux new -s mysession -n mywindow`
* Create window
  * Ctrl + b -> c
* Rename current window
  * Ctrl + b -> ,
* Close current window
  * Ctrl + b -> &
* List windows
  * Ctrl + b -> w
* Previous window
  * Ctrl + b -> p
* Next window
  * Ctrl + b -> n
* Switch/select window by number
  * Ctrl + b -> 0...9
* Toggle last active window
  * Ctrl + b -> l
* Reorder window, swap window number 2(src) and 1(dst)
  * `:swap-window -s 2 -t 1`
* Move current window to the left by one position
  * `:swap-window -t -1`

### Panes

* Toggle last active pane
  * Ctrl + b -> ;
* Split pane with horizontal layout
  * Ctrl + b -> %
* Split pane with vertical layout
  * Ctrl + b -> "
* Move the current pane left
  * Ctrl + b -> {
* Move the current pane right
  * Ctrl + b -> }
* Switch to pane to the direction
  * Ctrl + b -> Up-Arrow
  * Ctrl + b -> Down-Arrow
  * Ctrl + b -> Right-Arrow
  * Ctrl + b -> Left-Arrow
* Toggle synchronize-panes(send command to all panes)
  * `: setw synchronize-panes`
* Toggle between pane layouts
  * Ctrl + b -> Spacebar
* Switch to next pane
  * Ctrl + b -> o
* Show pane numbers
  * Ctrl + b -> q
* Switch/select pane by number
  * Ctrl + b -> q -> 0...9
* Toggle pane zoom
  * Ctrl + b -> z
* Convert pane into a window
  * Ctrl + b -> !
* Resize current pane height(holding second key is optional)
  * Ctrl + b -> Up-Arrow
  * Ctrl + b -> Ctrl + Up-Arrow
  * Ctrl + b -> Down-Arrow
  * Ctrl + b -> Ctrl + Down-Arrow
* Resize current pane width(holding second key is optional)
  * Ctrl + b -> Right-Arrow
  * Ctrl + b -> Ctrl + Right-Arrow
  * Ctrl + b -> Left-Arrow
  * Ctrl + b -> Ctrl + Left-Arrow
* Close current pane
  * Ctrl + b -> x

### Copy Mode

* use vi keys in buffer
  * `:setw -g mode-keys vi`
* Enter copy mode
  * Ctrl + b -> [
* Enter copy mode and scroll one page up
  * Ctrl + b -> PgUp
* Quit mode
  * q
* Go to top line
  * g
* Go to bottom line
  * G
* Scroll up
  * Up-Arrow
* Scroll down
  * Down-Arrow
* Move cursor left
  * h
* Move cursor down
  * j
* Move cursor up
  * k
* Move cursor right
  * l
* Move cursor forward one word at a time
  * w
* Move cursor backward one word at a time
  * b
* Search forward
  * /
* Search backward
  * ?
* Next keyword occurance
  * n
* Previous keyword occurance
  * N
* Start selection
  * Spacebar
* Clear selection
  * Esc
* Copy selection
  * Enter
* Paste contents of buffer_0
  * Ctrl + b -> ]
* display buffer_0 contents
  * `:show-buffer`
* copy entire visible contents of pane to a buffer
  * `:capture-pane`
* Show all buffers
  * `:list-buffers`
* Show all buffers and paste selected
  * `:choose-buffer`
* Save buffer contents to buf.txt
  * `:save-buffer buf.txt`
* delete buffer_1
  * `:delete-buffer -b 1`

### Misc

* Enter command mode
  * Ctrl + b -> :
* Set OPTION for all sessions
  * `:set -g OPTION`
* Set OPTION for all windows
  * `:setw -g OPTION`
* Enable mouse mode
  * `:set mouse on`

### Help

* List key bindings(shortcuts)
  * `tmux list-keys`
  * `:list-keys`
  * Ctrl + b -> ?
* Show every session, window, pane, etc...
  * `tmux info`
