# Fzf-Git.md

## Websites

* [junegunn/fzf-git.sh => bash and zsh key bindings for Git objects, powered by fzf](https://github.com/junegunn/fzf-git.sh)
* [wfxr/forgit => A utility tool powered by fzf for using git interactively](https://github.com/wfxr/forgit)
* [gennaro-tedesco/gh-f GitHub](https://github.com/gennaro-tedesco/gh-f)

# [junegunn/fzf-git.sh](https://github.com/junegunn/fzf-git.sh)

## Notes

* "Kitty" terminal works perfectly with `fzf-git` keybindings.
* "WezTerm" terminal does not work with `fzf-git` keybindings. Conflict happens with `CTRL-G` keybindings.

## Warnings

* You may have issues with these bindings in the following cases:
  * CTRL-GCTRL-B will not work if CTRL-B is used as the tmux prefix
  * CTRL-GCTRL-S will not work if flow control is enabled, CTRL-S will freeze the terminal instead
    * (stty -ixon will disable it)
    * Add `stty -ixon` to `~/.bashrc` file
    * Reload `~/.bashrc` : `source ~/.bashrc`
  * To workaround the problems, you can use CTRL-G{key} instead of CTRL-GCTRL-{KEY}.

* If zsh's KEYTIMEOUT is too small (e.g. 1), you may not be able to hit two keys in time.

## Error and Solution

### FZF_DEFAULT_OPTS: height required

**Error Message**

> $FZF_DEFAULT_OPTS: height required: HEIGHT

**Solution**

* If `fzf` is installed using Nix package manager, then this problem arises, which is related to environment variables.
* If `fzf` is installed using APT package manager, version is very old and does not support many command line attributes.
* Solution: Install `fzf` from GitHub release page
  * Download `fzf-{{version}}-linux_amd64.tar.gz` from Fzf GitHub release page, extract it.
  * `sudo chmod a+x fzf` : Make `fzf` executable
  * `sudo mv fzf /usr/local/bin/` : Move `fzf` to executable path
