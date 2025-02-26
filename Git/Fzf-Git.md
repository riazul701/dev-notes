# Commands/Usage

## List of bindings <sup>{1}</sup>

* `CTRL-GCTRL-F` : for Files
* `CTRL-GCTRL-B` : for Branches
* `CTRL-GCTRL-T` : for Tags
* `CTRL-GCTRL-R` : for Remotes
* `CTRL-GCTRL-H` : for commit Hashes
* `CTRL-GCTRL-S` : for Stashes
* `CTRL-GCTRL-L` : for reflogs
* `CTRL-GCTRL-W` : for Worktrees
* `CTRL-GCTRL-E` : for Each ref (git for-each-ref)

## Inside fzf <sup>{1}</sup>

* `TAB` or `SHIFT-TAB` : to select multiple objects
* `CTRL-/` : to change preview window layout
* `CTRL-O` : to open the object in the web browser (in GitHub URL scheme)

## Warnings <sup>{1}</sup>

* `CTRL-GCTRL-B` will not work if `CTRL-B` is used as the tmux prefix
* `CTRL-GCTRL-S` will not work if flow control is enabled, `CTRL-S` will freeze the terminal instead
* To workaround the problems, you can use `CTRL-G{key}` instead of `CTRL-GCTRL-{KEY}`.
* If zsh's `KEYTIMEOUT` is too small (e.g. 1), you may not be able to hit two keys in time.

# Fzf-Git.md

## Websites

* [junegunn/fzf-git.sh => bash and zsh key bindings for Git objects, powered by fzf](https://github.com/junegunn/fzf-git.sh)

* Related Programs
  * [gennaro-tedesco/gh-f GitHub](https://github.com/gennaro-tedesco/gh-f)

## Notes

* Reload `~/.bashrc` after any modification : `source ~/.bashrc`

## [junegunn/fzf-git.sh](https://github.com/junegunn/fzf-git.sh) Issue

**Keybindings Issue**

* "Kitty" terminal works perfectly with `fzf-git` keybindings.
* "WezTerm" terminal does not work with `fzf-git` keybindings. Conflict happens with `CTRL-G` keybindings.

## WezTerm Fzf-Git Settings

* [CopyMode MoveToScrollbackBottom](https://wezterm.org/config/lua/keyassignment/CopyMode/MoveToScrollbackBottom.html)
* [CopyMode MoveToScrollbackTop](https://wezterm.org/config/lua/keyassignment/CopyMode/MoveToScrollbackTop.html)

# Configuration

## Warnings <sup>{1}</sup>

* You may have issues with these bindings in the following cases:
  * CTRL-GCTRL-B will not work if CTRL-B is used as the tmux prefix
  * CTRL-GCTRL-S will not work if flow control is enabled, CTRL-S will freeze the terminal instead
    * (stty -ixon will disable it)
    * Add `stty -ixon` to `~/.bashrc` file
    * Reload `~/.bashrc` : `source ~/.bashrc`
  * To workaround the problems, you can use CTRL-G{key} instead of CTRL-GCTRL-{KEY}.

* If zsh's KEYTIMEOUT is too small (e.g. 1), you may not be able to hit two keys in time.

## `CTRL-GCTRL-S` will not work if flow control is enabled, freeze the terminal <sup>{1}</sup>

**[Ctrl-g Ctrl-s keybinding does not work if flow control is active #4
Closed](https://github.com/junegunn/fzf-git.sh/issues/4)**

* This is expected, but since that is the default keybinding to open `_fzf_git_stashes`, it'll likely cause a bad user experience since the screen freeze if flow control is active, until the user hits `Ctrl-q`.

* Maybe consider a different keybinding or tell people to disable flow control in the README?

**[Is there a safe way to disable Control+S in bash?](https://www.reddit.com/r/bash/comments/uz8x55/is_there_a_safe_way_to_disable_controls_in_bash/?rdt=57727)**

* About once a month, I manage to hit Control+s by accident. It usually takes me a couple aggravating seconds to realize why my terminal is frozen, before I hit Control+Q to undo the mistake.

* Is there a safe way to disable Control+S in Bash?

* Solved: Added 2 lines to `.bashrc` file.

```shell
stty -ixon  
bind -r "\C-s"
```

* Place above code at the beginning of `.bashrc` file, before `source fzf-git.sh` line.
  * This code release `<Ctrl+s>` keybinding, for use with `fzf-git`

## WezTerm Keybindings Config

**Keybinding Problem**

* [Copy Mode](https://wezterm.org/copymode.html)
  * `Ctrl + G` : Exit copy mode. Release this keybinding for use with Fzf-Git

**WezTerm Config File**

* [DisableDefaultAssignment](https://wezterm.org/config/lua/keyassignment/DisableDefaultAssignment.html)

```shell
local wezterm = require 'wezterm'
local config = {}

--config.color_scheme = 'Tokyo Night'
config.color_scheme = 'Catppuccin Mocha'
--config.color_scheme = 'Dracula'
--config.color_scheme = 'Catppuccin Macchiato'
--config.color_scheme = 'Catppuccin Frappe'
--config.color_scheme = 'Catppuccin Latte'

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'G',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'F',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'B',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'T',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'R',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'H',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'S',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'L',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'W',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'E',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

return config
```

# Error and Solution

## Error: `FZF_DEFAULT_OPTS: height required`

**Error Message**

```shell
$FZF_DEFAULT_OPTS: height required: HEIGHT
```

**Solution**

* If `fzf` is installed using Nix package manager, then this problem arises, which is related to environment variables.
* If `fzf` is installed using APT package manager, version is very old and does not support many command line attributes.
* Solution: Install `fzf` from GitHub release page
  * Download `fzf-{{version}}-linux_amd64.tar.gz` from Fzf GitHub release page, extract it.
  * `sudo chmod a+x fzf` : Make `fzf` executable
  * `sudo mv fzf /usr/local/bin/` : Move `fzf` to executable path

# References

* next-sl: {2}

## Commands From

* {1} [junegunn/fzf-git.sh](https://github.com/junegunn/fzf-git.sh)
