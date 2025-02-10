# Plugin-Tmux.md

## Websites

* {1} [tmux-plugins/tpm GitHub => Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
* [tmux-plugins/list => A list of tmux plugins](https://github.com/tmux-plugins/list)

* Fzf
  * [sainnhe/tmux-fzf GitHub](https://github.com/sainnhe/tmux-fzf)
  * [junegunn/tmux-fzf-url](https://github.com/junegunn/tmux-fzf-url)

* Tmux Plugins
  * [tmux-plugins/tmux-resurrect GitHub => Official](https://github.com/tmux-plugins/tmux-resurrect)
  * [tmux-plugins/tmux-continuum GitHub => Official](https://github.com/tmux-plugins/tmux-continuum)
  * [tmux-plugins/tmux-yank GitHub => Official](https://github.com/tmux-plugins/tmux-yank)
  * [tmux-plugins/tmux-sensible GitHub => Official](https://github.com/tmux-plugins/tmux-sensible)

* Tmux Git
  * [arl/gitmux GitHub](https://github.com/arl/gitmux)

# Tmux Plugin Manager (TPM)

## Instructions From

* {1} [tmux-plugins/tpm GitHub => Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
  * Installs and loads `tmux` plugins.
  * Tested and working on Linux, OSX, and Cygwin.
  * See list of plugins [here](https://github.com/tmux-plugins/list).

## Installation

* Requirements: `tmux` version 1.9 (or higher), `git`, `bash`.
* Clone TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
* Put this at the bottom of `~/.tmux.conf` (`$XDG_CONFIG_HOME/tmux/tmux.conf` works too):
```shell
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```
* Reload TMUX environment so TPM is sourced:
```shell
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```
* That's it!

## Installing plugins

* Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
* Press `prefix` + `I` (capital i, as in Install) to fetch the plugin.
* You're good to go! The plugin was cloned to `~/.tmux/plugins/` dir and sourced.

## Uninstalling plugins

* Remove (or comment out) plugin from the list.
* Press `prefix` + `alt` + `u` (lowercase u as in uninstall) to remove the plugin.
* All the plugins are installed to `~/.tmux/plugins/` so alternatively you can find plugin directory there and remove it.

## Key bindings

* `prefix` + `I`
  * Installs new plugins from GitHub or any other git repository
  * Refreshes TMUX environment

* `prefix` + `U`
  * updates plugin(s)

* `prefix` + `alt` + `u`
  * remove/uninstall plugins not on the plugin list

# [sainnhe/tmux-fzf GitHub](https://github.com/sainnhe/tmux-fzf)

## Websites

* {2} [hluk/CopyQ GitHub => Clipboard manager with advanced features](https://github.com/hluk/CopyQ/)
* {3} [psmisc/psmisc GitLab => This package contains miscellaneous utilities that use the proc file-system](https://gitlab.com/psmisc/psmisc)
* {4} [junegunn/fzf GitHub => A command-line fuzzy finder](https://github.com/junegunn/fzf/)

## Commands

## Usage

* Press `Esc` or `q` to quit from various situation
* To launch tmux-fzf, press `prefix` + `F` (Shift+F).

## Installation

* `apt show copyq` : CopyQ (optional), Access system clipboard, fallback to builtin tmux buffers if copyq is not executable. <sup>{2}</sup>
  * `sudo apt install copyq` : Install CopyQ
  * `copyq --version` : Check CopyQ version.

* `apt show psmisc` : `pstree` (optional) command, Display process tree <sup>{3}</sup>
  * `sudo apt install psmisc` : Install `psmisc` (`pstree` is one of many utilities)
  * `pstree --version` : Check `pstree` version

* `apt show fzf` : A command-line fuzzy finder <sup>{4}</sup>
  * `sudo apt install fzf` : Install Fzf
  * `fzf --version` : Check Fzf version

# References

* next-sl: {5}

## Tutorials

* {1} [tmux-plugins/tpm GitHub => Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

## [sainnhe/tmux-fzf GitHub](https://github.com/sainnhe/tmux-fzf)

* {2} [hluk/CopyQ GitHub => Clipboard manager with advanced features](https://github.com/hluk/CopyQ/)
* {3} [psmisc/psmisc GitLab => This package contains miscellaneous utilities that use the proc file-system](https://gitlab.com/psmisc/psmisc)
* {4} [junegunn/fzf GitHub => A command-line fuzzy finder](https://github.com/junegunn/fzf/)
