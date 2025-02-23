# Commands/Usage

## Using the finder

**Scroll Finder Window and Select Items <sup>{29}</sup>**

* `CTRL-K` / `CTRL-J` (or `CTRL-P` / `CTRL-N`) to move cursor up and down <sup>{29}</sup>

* Enter key to select the item, `CTRL-C` / `CTRL-G` / `ESC` to exit <sup>{29}</sup>

* On multi-select mode (`-m`), `TAB` and `Shift-TAB` to mark multiple items <sup>{29}</sup>

* Emacs style key bindings <sup>{29}</sup>

* Mouse: scroll, click, double-click; shift-click and shift-scroll on multi-select mode <sup>{29}</sup>

## Preview Window

**Scroll Preview Window <sup>{28}</sup>**

* `Shift+up` and `Shift+down` keybinding should be also added to README page of this in SCROLL preview window section. <sup>{28}</sup>

# fzf-cmd.md

## Notes

* Reload `~/.bashrc` after any modification : `source ~/.bashrc`

## [junegunn/fzf-git.sh](https://github.com/junegunn/fzf-git.sh) Issue

* Keybindings Issue
  * "Kitty" terminal works perfectly with `fzf-git` keybindings. <sup>{14}</sup>
  * "WezTerm" terminal does not work with `fzf-git` keybindings. Conflict happens with `CTRL-G` keybindings. <sup>{14}</sup>

* Installation Issue
  * If `fzf` is installed using Nix package manager, then this problem arises, which is related to environment variables.
    * `$FZF_DEFAULT_OPTS: height required: HEIGHT`
  * If `fzf` is installed using APT package manager, version is very old and does not support many command line attributes.
  * Solution: Install `fzf` from GitHub release page

# Fzf Install

* [Fzf Installation](https://junegunn.github.io/fzf/installation/) <sup>{20}</sup>

## SparkyLinux (Debian)

* Install `fzf` from GitHub release page
  * Download `fzf-{{version}}-linux_amd64.tar.gz` from Fzf GitHub release page, extract it.
  * `sudo chmod a+x fzf` : Make `fzf` executable
  * `sudo mv fzf /usr/local/bin/` : Move `fzf` to executable path
* `nix-env -iA nixpkgs.fzf` : Install fzf latest version
* `sudo apt install fzf` : Install fzf old version
* Integrate Fzf with bash (~/.bashrc) : `eval "$(fzf --bash)"`
  * Reload `~/.bashrc` : `source ~/.bashrc`
* Integrate Fzf with zsh (~/.zshrc) : `source <(fzf --zsh)`
* Integrate Fzf with fish (~/.config/fish/config.fish) : `fzf --fish | source`

### Install Dependency

**`git` command <sup>{25}</sup>**

* `nix-env -iA nixpkgs.git` : Install `git` latest version
* `sudo apt install git` : Install `git` old version

**`bat` command <sup>{21}</sup>**

* `nix-env -iA nixpkgs.bat` : Install `bat` latest version

* Using `apt`, install old version of `bat` command
  * `apt show bat` : In this package the executable and its manpage have been renamed from ‘bat’ to ‘batcat’ because of a file name clash with another Debian package.
  * `sudo apt install bat` : Install `bat` command <sup>{21}</sup>
  * `batcat --version` : Check `bat` version
  * `which batcat` : Check `batcat` installed path
  * `echo $PATH` : Check executable files path
  * `sudo ln -s /usr/bin/batcat /usr/local/bin/bat` : Create shortcut of `batcat` to `bat` command <sup>{22}</sup>
    * `bat --version` : Check `bat` command

**`ripgrep` command <sup>{26} {27}</sup>**

* `sudo apt install ripgrep` : Install `ripgrep` old version <sup>{26}</sup>
* `rg --version` : Check `ripgrep` version <sup>{26}</sup>

**`delta` command <sup>{23}</sup>**

* `nix-env -iA nixpkgs.delta` : Install `delta` latest version
* `sudo apt install delta` : Install `delta` old version

**`zoxide` command**

* `sudo apt install zoxide` : Install `zoxide` old version
* Add this to the end of your config file (usually ~/.bashrc): `eval "$(zoxide init bash)"` <sup>{24}</sup>

## Shell Completion & Keybindings

* Shell Integration Guides
  * [CTRL+R executes reverse-i-search #1812](https://github.com/junegunn/fzf/issues/1812) <sup>{5}</sup>
  * [fzf: ctlr-r not triggering history search on command line](https://unix.stackexchange.com/questions/665689/fzf-ctlr-r-not-triggering-history-search-on-command-line) <sup>{6}</sup>

### Instructions

* Instructions from <sup>{5} {6}</sup>
* `fzf --version` : Check Fzf version
* Go to [junegunn/fzf GitHub](https://github.com/junegunn/fzf)
* Choose git tag according to Fzf version.
* Download file `completion.bash` and `key-bindings.bash`. Place then inside `~/.config/fzf` directory
  * `https://github.com/junegunn/fzf/blob/{{git-tag/fzf-version}}/shell/completion.bash`
  * `https://github.com/junegunn/fzf/blob/{{git-tag/fzf-version}}/shell/key-bindings.bash`
* Open `~/.bashrc` and add code
```bash
source /home/{{user-name}}/.config/fzf/key-bindings.bash
source /home/{{user-name}}/.config/fzf/completion.bash
```
* Reload `~/.bashrc` : `source ~/.bashrc`

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

**Disable Keybinding**

* You can disable `CTRL-T` or `ALT-C` binding by setting `FZF_CTRL_T_COMMAND` or `FZF_ALT_C_COMMAND` to an empty string when sourcing the script.
* For example, to disable `ALT-C` binding:
  * bash: `FZF_ALT_C_COMMAND= eval "$(fzf --bash)"`
  * zsh: `FZF_ALT_C_COMMAND= source <(fzf --zsh)`
  * fish: `fzf --fish | FZF_ALT_C_COMMAND= source`
* Setting the variables after sourcing the script will have no effect.

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

**CTRL-T**

* Paste the selected files and directories onto the command-line
  * The list is generated using `--walker file,dir,follow,hidden option`
    * You can override the behavior by setting `FZF_CTRL_T_COMMAND` to a custom command that generates the desired list
    * Or you can set `--walker*` options in `FZF_CTRL_T_OPTS`
  * Set `FZF_CTRL_T_OPTS` to pass additional options to fzf

```shell
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
```
  * Can be disabled by setting `FZF_CTRL_T_COMMAND` to an empty string when sourcing the script

**ALT-C**

* cd into the selected directory
  * The list is generated using `--walker dir,follow,hidden` option
  * Set `FZF_ALT_C_COMMAND` to override the default command
    * Or you can set `--walker-*` options in `FZF_ALT_C_OPTS`
  * Set `FZF_ALT_C_OPTS` to pass additional options to fzf

```shell
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
```
  * Can be disabled by setting `FZF_ALT_C_COMMAND` to an empty string when sourcing the script

**Fzf Old Version - Issue**

* `fzf v0.38.0 (debian)` shows `unknown option: --walker-skip`
  * Remove line : `--walker-skip .git,node_modules,target`
* `fzf` latest version does not have this issue.

### Key bindings for Git objects

* [fzf-git.sh](https://github.com/junegunn/fzf-git.sh) project provides a bunch of key bindings for completing Git objects.

## [Ripgrep integration, a walkthrough](https://junegunn.github.io/fzf/tips/ripgrep-integration/)

### 6. Bind `enter` to `become` action

* With the new binding, when you press enter, fzf will open the file (`{1}`) in vim and move the cursor to the line (`{2}`).

### 7. Add another execute binding

* Sometimes you may want to open the file in the editor and come back to fzf to continue searching. Let’s add an `execute` binding for that.

* Now you can press `ctrl-o` to open the file in vim without leaving fzf.

### 8. Handle multiple selections

* So far, we’ve been dealing with a single selection. Let’s add `--multi` option so you can select multiple lines with `TAB` and `SHIFT-TAB`.

* It builds the quickfix list for the selected items and open it only when the user has selected any items using `TAB` or `SHIFT-TAB`.

* We added three more bindings for convenience; `alt-a` and `alt-d`, to select and deselect all items, and `ctrl-/` to toggle the preview window.

### Wrap-up

* Let’s define it as a function so we can pass the initial query as an argument.

```shell
# ripgrep->fzf->vim [QUERY]
rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            vim {1} +{2}     # No selection. Open the current line in Vim.
          else
            vim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)
```

* Reload `~/.bashrc` : `source ~/.bashrc`

# References

* next-sl: {30}

## Websites

* Fzf command-line fuzzy finder
  * {7} [junegunn.github.io/fzf](https://junegunn.github.io/fzf/)
  * {8} [junegunn/fzf GitHub](https://github.com/junegunn/fzf/)

* Associated Packages
  * {25} [git-scm.com => Git website](https://git-scm.com/)
  * {21} [sharkdp/bat GitHub => A cat(1) clone with wings](https://github.com/sharkdp/bat)
  * {26} [BurntSushi/ripgrep GitHub](https://github.com/BurntSushi/ripgrep)
  * {27} [phiresky/ripgrep-all GitHub => rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc.](https://github.com/phiresky/ripgrep-all)
  * {23} [dandavison/delta GitHub => A syntax-highlighting pager for git, diff, grep, and blame output](https://github.com/dandavison/delta)
  * {24} [ajeetdsouza/zoxide GitHub => A smarter cd command](https://github.com/ajeetdsouza/zoxide)

* Shell
  * {9} [lincheney/fzf-tab-completion GitHub => Tab completion using fzf](https://github.com/lincheney/fzf-tab-completion)
  * {10} [kelleyma49/PSFzf GitHub => A PowerShell wrapper around the fuzzy finder fzf](https://github.com/kelleyma49/PSFzf)

* Tmux
  * {11} [sainnhe/tmux-fzf GitHub](https://github.com/sainnhe/tmux-fzf)
  * {12} [junegunn/tmux-fzf-url GitHub](https://github.com/junegunn/tmux-fzf-url)

* Fzf with Git
  * {13} [wfxr/forgit GitHub => A utility tool powered by fzf for using git interactively](https://github.com/wfxr/forgit)
  * {14} [junegunn/fzf-git.sh GitHub => bash and zsh key bindings for Git objects, powered by fzf](https://github.com/junegunn/fzf-git.sh)

* Vim/VSCode
  * {15} [junegunn/fzf.vim GitHub](https://github.com/junegunn/fzf.vim)
  * {16} [tomrijndorp/vscode-finditfaster GitHub => Find it, but faster! Fast file search for VS Code](https://github.com/tomrijndorp/vscode-finditfaster)

* Image Preview
  * {17} [junegunn/fzf/bin/fzf-preview.sh](https://github.com/junegunn/fzf/blob/master/bin/fzf-preview.sh)

## Commands From

* {28} [Keyboard bindings for scrolling preview window? #358](https://github.com/junegunn/fzf.vim/issues/358)
* {29} [Using the finder](https://github.com/junegunn/fzf?tab=readme-ov-file#using-the-finder)

## Tutorials

* General  
  * {18} [Ripgrep integration, a walkthrough](https://junegunn.github.io/fzf/tips/ripgrep-integration/)
  * {19} [Tmux integration => FZF](https://junegunn.github.io/fzf/examples/tmux/)

* Installation
  * {20} [Fzf Installation](https://junegunn.github.io/fzf/installation/)

## Guides

* General
  * {22} [How to create file shortcuts? [duplicate]](https://askubuntu.com/questions/1268188/how-to-create-file-shortcuts)

* Shell Integration 
  * {5} [CTRL+R executes reverse-i-search #1812](https://github.com/junegunn/fzf/issues/1812)
  * {6} [fzf: ctlr-r not triggering history search on command line](https://unix.stackexchange.com/questions/665689/fzf-ctlr-r-not-triggering-history-search-on-command-line)

* Clipboard
  * {1} [How to make xclip strip newline from the output piped to it?](https://stackoverflow.com/questions/16927974/how-to-make-xclip-strip-newline-from-the-output-piped-to-it)

* Image
  * {2} [fuzzy wallpaper with fzf](https://dev.to/waylonwalker/fuzzy-wallpaper-with-fzf-56e3)

## YouTube Tutorials
  
* {3} [The Amazing Interactive Command Line Fuzzy Finder (fzf) BY DistroTube](https://www.youtube.com/watch?v=Ab6cWN9ZrXo)
* {4} [Using FZF to Preview Text Files on the Command Line and within Vim BY Nick Janetakis](https://www.youtube.com/watch?v=aLMepxvUj4s)
