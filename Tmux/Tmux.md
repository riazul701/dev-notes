# Tmux terminal multiplexer

## Websites
* [Tmux GitHub](https://github.com/tmux/tmux)
* [Tmux Cheat Sheet & Quick Reference](https://tmuxcheatsheet.com/)
* [Tmux Config File BY Learn Linux TV {YouTube}](https://pastebin.com/CDEVZTSC)

## Notes

## Tutorials
* [How to Use tmux on Linux (and Why It’s Better Than Screen)](https://www.howtogeek.com/671422/how-to-use-tmux-on-linux-and-why-its-better-than-screen/)
* YouTube
  * [Getting Started with tmux BY Learn Linux TV {PlayList}](https://www.youtube.com/playlist?list=PLT98CRl2KxKGiyV1u6wHDV8VwcQdzfuKe)
  * [Save and Restore Tmux Sessions across Reboots with Tmux Resurrect BY Nick Janetakis](https://www.youtube.com/watch?v=sMbuGf2g7gc)
  * [Tmux has forever changed the way I write code BY Dreams of Code](https://www.youtube.com/watch?v=DzNmUNvnB04)

## Guides (Tmux)
* Tmux Config
  * [Remap the ctrl+b tmux prefix to ctrl+a](https://koenwoortman.com/tmux-remap-ctrl-b-to-ctrl-a/)

# Installation

## Windows Installation

* "Tmux" in Git-Bash
  * NOTE: Tmux does not natively supported in Windows-OS. Therefore Git-Bash OR Cygwin is required.
  * [Install Tmux on Git for Windows](https://dev.to/timothydjones/install-tmux-on-git-for-windows-1cf2)
    * Download "tmux-x.y.z-p-x86_64.pkg.tar.zst" and "libevent-x.y.z-p-x86_64.pkg.tar.zst" from [MSYS2 REPO x86_64](http://repo.msys2.org/msys/x86_64/)
    * Download and install [PeaZip](https://github.com/peazip/PeaZip) to extrac ".tar.zst" file.
    * Extract "tmux-x.y.z-p-x86_64.pkg.tar.zst" and copy "tmux.exe" file to "C:\ProgramData\scoop\apps\git\current\usr\bin" folder.
    * Extract "libevent-x.y.z-p-x86_64.pkg.tar.zst" file and copy ".py" and ".dll" files to "C:\ProgramData\scoop\apps\git\current\usr\bin" folder. Mainly ["msys-event-2-1-6.dll"](https://stackoverflow.com/questions/5473384/terminal-multiplexer-for-microsoft-windows-installers-for-gnu-screen-or-tmux)
    * Open Git-Bash and execute command "tmux --help"
    * Alternatively open [Windows-PowerShell](https://github.com/PowerShell/PowerShell) and enter command "bash" to enter into Bash-Shell. Then execute command "tmux --help"
  
* Error and Solution
  * Git-Bash: winpty nvim ["nvim" command does not work in Git-Bash, because mintty does not support prompt]
  * [tmux fails to start in local session #5132](https://github.com/microsoft/terminal/issues/5132)
    * script.exe actually comes with util-linux package (msys2)
    * Download "util-linux-x.y.z-x86_64.pkg.tar.zst" from [MSYS2 REPO x86_64](http://repo.msys2.org/msys/x86_64/).
	  * Extract and copy "script.exe" file to "C:\ProgramData\scoop\apps\git\current\usr\bin" folder.
	  * Open Git-Bash and enter command "script --help"
	  * Open Windows-Terminal/Windows-PowerShell and enter command "bash" -> "script -c tmux /dev/null" -> script -c "tmux ls" -> "winpty nvim"
  * [Make a Bash alias that takes a parameter?](https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter)
    * Create Tmux alias for "util-linux(package)->script": `echo 'function tmux() { script -c "tmux $1 $2 $3 $4"; }' >> ~/.bashrc` [Note: Here '$@' (all arguments) syntax does not work. Instead use '$1' (first argument), '$2' (second argument), '$3' (third argument), '$4' (fourth argument)]
    * For the aliases to take effect immediately: `source ~/.bashrc`

* Related Guides ==> "rsync" in Git-Bash
  * [Add rsync to Windows git bash](https://prasaz.medium.com/add-rsync-to-windows-git-bash-f42736bae1b3)
  * [How to use rsync on Git Bash](https://shchae7.medium.com/how-to-use-rsync-on-git-bash-6c6bba6a03ca)
  * [radleta/how-to-win-rsync-from-cmd.md](https://gist.github.com/radleta/0b337a2b14f761951cf2aab0578512b9)
  * [How to Add rsync to Git Bash for Windows 10](https://gist.github.com/hisplan/ee54e48f17b92c6609ac16f83073dde6)
  
# Configuration

## Instructions (Configuration)
* MUST USE UNIX LINE ENDINGS FOR "~/.tmux.conf" FILE. NOT WINDOWS LINE ENDINGS. FOR WINDOWS LINE ENDINGS, SHOWS "bad key: C-a" ERROR.
* For Git-Bash(Windows-OS) enter into Bash first: `bash`
* Create file ".tmux.conf": `touch ~/.tmux.conf`
* [Remap the ctrl+b tmux prefix to ctrl+a](https://koenwoortman.com/tmux-remap-ctrl-b-to-ctrl-a/)
  * Change prefix key from "Ctrl+b" to "Ctrl+a": `echo 'set-option -g prefix C-a' >> ~/.tmux.conf` 
  * If Tmux shows "bad-key" error, then just use this line. This error occurs because of Windows-Line-Endings. Use Unix-Line-Endings.
* [How to Reload a Tmux Config File](https://linuxhint.com/how-to-reload-tmux-config-file/)
  * From Outside of Tmux-Session: `tmux source-file ~/.tmux.conf`
  * From Inside of Tmux-Session: Press "Prefix + :" and type command `source-file ~/.tmux.conf`

## Tmux-Neovim Issue
  * [True Color (24-bit) and italics with alacritty + tmux + vim (neovim)](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)
  * `echo 'set -g default-terminal "tmux-256color"' >> ~/.tmux.conf`
  * `echo 'set -sg terminal-overrides ",*:RGB"' >> ~/.tmux.conf`
  * Open file "~/.config/nvim/init.lua"(NeoVim) OR "~\AppData\Local\lvim"(LunarVim)
    * Add config line: `vim.o.termguicolors = true`
  * Reload Tmux and Neovim configuration

## Nerd Font Config
* Error: Locale does not support UTF-8. Unicode characters may not display correctly.

* SCRIPT-WAY
* [How to install/change locale on Debian?](https://serverfault.com/questions/54591/how-to-install-change-locale-on-debian)
  * Shows all installed locales: `locale -a`
  * Install locales package: `apt-get install -y locales`
  * Uncomment en_US.UTF-8 for inclusion in generation: `sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen`
  * Generate locale: `locale-gen`
  * Export env vars
    * `echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc`
    * `echo "export LANG=en_US.UTF-8" >> ~/.bashrc`
    * `echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc`
  * For the env vars to take effect immediately: `source ~/.bashrc`

* INTERACTIVE-WAY
* [apt-get warning: No support for locale: en_US.utf8](https://askubuntu.com/questions/99651/apt-get-warning-no-support-for-locale-en-us-utf8)
* [How-to fix "Warning: No support for locale: en_US.utf"](https://gist.github.com/vordan/d8f2b1f5c39352b9ff40c61cc617da6d)
  * `apt install locales`
  * `dpkg-reconfigure locales`
  * `update-locale LANG=en_US.UTF-8`
* [UTF-8 character not showing properly in tmux](https://askubuntu.com/questions/410048/utf-8-character-not-showing-properly-in-tmux)
  * CONTINUE --
  * But we can also set the below to the profile rc (e.g. .zshrc or bashrc) file
    * `export LC_ALL=en_IN.UTF-8`
    * `export LANG=en_IN.UTF-8`
    * With this option set, no need to use the -u flag (`tmux -u`).
    * This works only if pasted above: `source ~/.bashrc`
    * TEMPORARY WAY -- With command argument
    * Starting tmux with u flag solves this issue: `tmux -u`
    * Created an alias of tmux in my zshrc: `alias tmux='tmux -u'`

### Guides (Configuration)
* Nerd Font
  * [UTF-8 character not showing properly in tmux](https://askubuntu.com/questions/410048/utf-8-character-not-showing-properly-in-tmux)
  * [Tmux doesn't render some symbols properly](https://askubuntu.com/questions/1038351/tmux-doesnt-render-some-symbols-properly)

* Tmux-Neovim Issue
  * [True Color (24-bit) and italics with alacritty + tmux + vim (neovim)](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)
  * [neovim background is broken if in tmux #6869](https://github.com/alacritty/alacritty/issues/6869)
  * [neovim does not work inside tmux #3150](https://github.com/msys2/MSYS2-packages/issues/3150)

## Nested Tmux Session

### Instructions (Nested-Tmux)
* There are two sessions. One is "Host-OS": `tmux new -s host` and another is "Docker": `tmux new -s docker`. 
* Inside "Docker" session:
  * [Remap the ctrl+b tmux prefix to ctrl+a](https://koenwoortman.com/tmux-remap-ctrl-b-to-ctrl-a/) -> `touch ~/.tmux.conf` -> `set-option -g prefix C-a`
  * Create session - "Code": `tmux new -s code` and "Database": `tmux new -s database`
* Use "Ctrl+b" tmux-prefix for "Host-OS" session. And use "Ctrl+a" tmux-prefix for "Docker" session. 

### Guides (Nested-Tmux)
* [Using Tmux Remotely Within a Local Tmux Session](https://simplyian.com/2014/03/29/using-tmux-remotely-within-a-local-tmux-session/)
* [How to send commands when opening a tmux session inside another tmux session?](https://stackoverflow.com/questions/8518815/how-to-send-commands-when-opening-a-tmux-session-inside-another-tmux-session)

# Usage

## Commands: [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)

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

# Tmux Plugin Manager (TPM)

## Websites
* [Tmux Plugin Manager GitHub](https://github.com/tmux-plugins/tpm)

## Installation
* Requirements: tmux version 1.9 (or higher), git, bash
* Clone TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
* Put this at the bottom of ~/.tmux.conf ($XDG_CONFIG_HOME/tmux/tmux.conf works too):
  * `# List of plugins`
  *  `set -g @plugin 'tmux-plugins/tpm'`
  * `# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)`
  * `run '~/.tmux/plugins/tpm/tpm'`
* Reload TMUX environment so TPM is sourced:
  * `# type this in terminal if tmux is already running`
  * `tmux source ~/.tmux.conf`

## Installing Plugin
* Add new plugin to ~/.tmux.conf with set -g @plugin '...'
* Press prefix + I (capital i, as in Install) to fetch the plugin.
* The plugin was cloned to ~/.tmux/plugins/ dir and sourced.

## Uninstalling plugins
* Remove (or comment out) plugin from the list.
* Press prefix + alt + u (lowercase u as in uninstall) to remove the plugin.
* All the plugins are installed to ~/.tmux/plugins/ so alternatively we can find plugin directory there and remove it.

# References

* Tmux-Neovim Issue
  * [True Color (24-bit) and italics with alacritty + tmux + vim (neovim)](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)
  * [neovim background is broken if in tmux #6869](https://github.com/alacritty/alacritty/issues/6869)
  * [neovim does not work inside tmux #3150](https://github.com/msys2/MSYS2-packages/issues/3150)

* Others
  * [PING: COMMAND NOT FOUND. HOW TO INSTALL PING ON CENTOS / UBUNTU](https://globedrill.com/ping-command-not-found-how-to-install-ping-on-ubuntu-and-centos-server/)
  * [git-hello-world GitHub](https://github.com/gchowdhury/git-hello-world)
