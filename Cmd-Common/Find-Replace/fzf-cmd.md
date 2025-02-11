# fzf-cmd.md

## Websites

* Fzf command-line fuzzy finder
  * [junegunn.github.io/fzf](https://junegunn.github.io/fzf/)
  * [junegunn/fzf GitHub](https://github.com/junegunn/fzf/)

* Shell
  * [lincheney/fzf-tab-completion GitHub => Tab completion using fzf](https://github.com/lincheney/fzf-tab-completion)
  * [kelleyma49/PSFzf GitHub => A PowerShell wrapper around the fuzzy finder fzf](https://github.com/kelleyma49/PSFzf)

* Tmux
  * [sainnhe/tmux-fzf GitHub](https://github.com/sainnhe/tmux-fzf)
  * [junegunn/tmux-fzf-url GitHub](https://github.com/junegunn/tmux-fzf-url)

* Fzf with Git
  * [wfxr/forgit GitHub => A utility tool powered by fzf for using git interactively](https://github.com/wfxr/forgit)
  * [junegunn/fzf-git.sh GitHub => bash and zsh key bindings for Git objects, powered by fzf](https://github.com/junegunn/fzf-git.sh)

* Vim/VSCode
  * [junegunn/fzf.vim GitHub](https://github.com/junegunn/fzf.vim)
  * [tomrijndorp/vscode-finditfaster GitHub => Find it, but faster! Fast file search for VS Code](https://github.com/tomrijndorp/vscode-finditfaster)

* Image Preview
  * [junegunn/fzf/bin/fzf-preview.sh](https://github.com/junegunn/fzf/blob/master/bin/fzf-preview.sh)

* Tutorials
  * [Ripgrep integration, a walkthrough](https://junegunn.github.io/fzf/tips/ripgrep-integration/)
  * [Tmux integration => FZF](https://junegunn.github.io/fzf/examples/tmux/)

## Notes

* Reload `~/.bashrc` after any modification : `source ~/.bashrc`

# Install

## Install Guide

* [Fzf Installation](https://junegunn.github.io/fzf/installation/)

## Debian

* `sudo apt install fzf` : Install Fzf
* Integrate Fzf with bash (~/.bashrc) : `eval "$(fzf --bash)"`
  * Reload `~/.bashrc` : `source ~/.bashrc`
* Integrate Fzf with zsh (~/.zshrc) : `source <(fzf --zsh)`
* Integrate Fzf with fish (~/.config/fish/config.fish) : `fzf --fish | source`

# [junegunn.github.io/fzf](https://junegunn.github.io/fzf/)

## [Getting Started](https://junegunn.github.io/fzf/getting-started/)

### Understanding fzf

* `ls | fzf | wc` : Word count of selected file
* `find * | fzf | md5sum` : Calculate `md5sum` of selected file
* `git ls-files | fzf | xargs git log` : Show `git log` associated with selected file
* `ps -ef | sed 1d | fzf | awk '{print $2}' | xargs kill` : Kill selected process

### Interactive git branch selector

* `git branch | fzf | cut -c 3- | xargs git checkout` : Select git branch
* `alias gcb='git branch | fzf | cut -c 3- | xargs git checkout'` : Set alias for git branch selection

### Real-time preview of the content

* `git branch | fzf --preview 'git show --color=always {-1}' | cut -c 3- | xargs git checkout` : Git branch selection with preview
* `git branch | fzf --preview 'git show --color=always {-1}' --bind 'enter:become(git checkout {-1})'` : Git branch selection with preview (Making it even better)
* `git branch | fzf --preview 'git show --color=always {-1}' --bind 'enter:become(git checkout {-1})' --height 40% --layout reverse` : Git branch selection with preview and height adjustment

## [Shell Integration](https://junegunn.github.io/fzf/shell-integration/)

### Setting up shell integration

* Integrate Fzf with bash (~/.bashrc) : `eval "$(fzf --bash)"`
  * Reload `~/.bashrc` : `source ~/.bashrc`
* Integrate Fzf with zsh (~/.zshrc) : `source <(fzf --zsh)`
* Integrate Fzf with fish (~/.config/fish/config.fish) : `fzf --fish | source`

### Key bindings

* [How to make xclip strip newline from the output piped to it?](https://stackoverflow.com/questions/16927974/how-to-make-xclip-strip-newline-from-the-output-piped-to-it) <sup>{1}</sup>
  * `echo "string" | xclip -selection clipboard`

**CTRL-R**

* Paste the selected command from history onto the command-line
  * If you want to see the commands in chronological order, press `CTRL-R` again which toggles sorting by relevance
  * Press `CTRL-/` to toggle line wrapping and see the whole command
  * Set `FZF_CTRL_R_OPTS` to pass additional options to fzf

* Note: `pbcopy` is clipboard for MacOS. Use `xclip` for LinuxOS <sup>{1}</sup>.

* `pbcopy` shell code
```shell
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
```

* `xclip` shell code
```shell
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
```

# References

* next-sl: {5}

## Guides

* Clipboard
  * {1} [How to make xclip strip newline from the output piped to it?](https://stackoverflow.com/questions/16927974/how-to-make-xclip-strip-newline-from-the-output-piped-to-it)

* Image
  * {2} [fuzzy wallpaper with fzf](https://dev.to/waylonwalker/fuzzy-wallpaper-with-fzf-56e3)

## YouTube Tutorials
  
* {3} [The Amazing Interactive Command Line Fuzzy Finder (fzf) BY DistroTube](https://www.youtube.com/watch?v=Ab6cWN9ZrXo)
* {4} [Using FZF to Preview Text Files on the Command Line and within Vim BY Nick Janetakis](https://www.youtube.com/watch?v=aLMepxvUj4s)
