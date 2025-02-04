# Tmux.md

## Websites

* [Tmux GitHub](https://github.com/tmux/tmux)
* [tmux-plugins GitHub => Official tmux plugins](https://github.com/tmux-plugins)
* [tmux-plugins/tpm GitHub => Official](https://github.com/tmux-plugins/tpm)
* [Tmuxinator GitHub](https://github.com/tmuxinator/tmuxinator)
* [Tmux Cheat Sheet & Quick Reference](https://tmuxcheatsheet.com/)
* [rothgar/awesome-tmux GitHub](https://github.com/rothgar/awesome-tmux)

* Fzf
  * [sainnhe/tmux-fzf GitHub](https://github.com/sainnhe/tmux-fzf)
  * [junegunn/tmux-fzf-url](https://github.com/junegunn/tmux-fzf-url)

* Configuration
  * [gpakosz/.tmux GitHub => Oh my tmux! My self-contained, pretty & versatile tmux configuration](https://github.com/gpakosz/.tmux)
  * [Tmux Config File BY Learn Linux TV {YouTube}](https://pastebin.com/CDEVZTSC) <sup>{2}</sup>

* Vim/Neovim
  * [christoomey/vim-tmux-navigator GitHub](https://github.com/christoomey/vim-tmux-navigator)

* Theme
  * [janoamaral/tokyo-night-tmux GitHub](https://github.com/janoamaral/tokyo-night-tmux)
  * [fabioluciano/tmux-tokyo-night GitHub](https://github.com/fabioluciano/tmux-tokyo-night)

* Tmux Plugins
  * [tmux-plugins/tmux-resurrect GitHub => Official](https://github.com/tmux-plugins/tmux-resurrect)
  * [tmux-plugins/tmux-continuum GitHub => Official](https://github.com/tmux-plugins/tmux-continuum)
  * [tmux-plugins/tmux-yank GitHub => Official](https://github.com/tmux-plugins/tmux-yank)
  
* Tutorials
  * [Tmux integration => FZF](https://junegunn.github.io/fzf/examples/tmux/)

* Collection

## Notes

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

* ["tmux set -g mouse-mode on" not scrolling](https://stackoverflow.com/questions/11832199/tmux-set-g-mouse-mode-on-not-scrolling)
  * Add in `.tmux.conf` file: `set -g mouse on`

* [How to Reload a Tmux Config File](https://linuxhint.com/how-to-reload-tmux-config-file/)
  * From Outside of Tmux-Session: `tmux source-file ~/.tmux.conf`
  * From Inside of Tmux-Session: Press "Prefix + :" and type command `source-file ~/.tmux.conf` [Prefix => `Ctrl+b` OR `Ctrl+a`]

## Tmux-Neovim Issue

* [True Color (24-bit) and italics with alacritty + tmux + vim (neovim)](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)
  * `echo 'set -g default-terminal "tmux-256color"' >> ~/.tmux.conf`
  * `echo 'set -sg terminal-overrides ",*:RGB"' >> ~/.tmux.conf`
  * Open file "~/.config/nvim/init.lua"(NeoVim) OR "~\AppData\Local\lvim"(LunarVim)
    * Add config line: `vim.o.termguicolors = true`
  * Reload Tmux and Neovim configuration

## Nerd Font Config

* Error: Locale does not support UTF-8. Unicode characters may not display correctly.

**SCRIPT-WAY**

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

**INTERACTIVE-WAY**

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

# References

* next-sl: {12}

* Tutorials
  * {1} [How to Use tmux on Linux (and Why It’s Better Than Screen)](https://www.howtogeek.com/671422/how-to-use-tmux-on-linux-and-why-its-better-than-screen/)

* Guides (Tmux)

  * Tmux Config
    * {6} [Remap the ctrl+b tmux prefix to ctrl+a](https://koenwoortman.com/tmux-remap-ctrl-b-to-ctrl-a/)

  * Tmux-Neovim Issue
    * {7} [True Color (24-bit) and italics with alacritty + tmux + vim (neovim)](https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6)
    * {8} [neovim background is broken if in tmux #6869](https://github.com/alacritty/alacritty/issues/6869)
    * {9} [neovim does not work inside tmux #3150](https://github.com/msys2/MSYS2-packages/issues/3150)

  * Others
    * {10} [PING: COMMAND NOT FOUND. HOW TO INSTALL PING ON CENTOS / UBUNTU](https://globedrill.com/ping-command-not-found-how-to-install-ping-on-ubuntu-and-centos-server/)
    * {11} [git-hello-world GitHub](https://github.com/gchowdhury/git-hello-world)

* YouTube Tutorials
  * {2} [Getting Started with tmux BY Learn Linux TV {PlayList}](https://www.youtube.com/playlist?list=PLT98CRl2KxKGiyV1u6wHDV8VwcQdzfuKe)
  * {3} [Save and Restore Tmux Sessions across Reboots with Tmux Resurrect BY Nick Janetakis](https://www.youtube.com/watch?v=sMbuGf2g7gc)
  * {4} [Tmux has forever changed the way I write code BY Dreams of Code](https://www.youtube.com/watch?v=DzNmUNvnB04)
  * {5} [How I Use Tmux With Neovim For An Awesome Dev Workflow On My Mac BY Josean Martinez](https://www.youtube.com/watch?v=U-omALWIBos)
