# Commands/Usage

* Use the `navigate` feature to activate navigation keybindings. In this mode, pressing `n` will jump forward to the next file in the diff, and `N` will jump backwards. <sup>{1}</sup>

* `delta /somewhere/a.txt /somewhere/else/b.txt` : Delta can also be used as a shorthand for diffing two files, even if they are not in a git repo: the following two commands do the same thing:. <sup>{1}</sup>
  * `git diff /somewhere/a.txt /somewhere/else/b.txt` <sup>{1}</sup>

* `delta -n a.txt b.txt` OR `delta --line-numbers a.txt b.txt` : Show line numbers in diff view

* `delta -s a.txt b.txt` OR `delta --side-by-side a.txt b.txt` : Show diff side by side

* `delta <(sort file1) <(sort file2)` : You can also use [process substitution](https://en.wikipedia.org/wiki/Process_substitution) shell syntax with delta, e.g. <sup>{1}</sup>

* `diff -u a.txt b.txt | delta` : In addition to git output, delta handles standard unified diff format, e.g. <sup>{1}</sup>

* `delta --show-themes` : To browse themes, use, or browse the list of theme <sup>{1}</sup>

* `delta --diff-highlight` : Activate the [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight) emulation mode. <sup>{1}</sup>

* `delta --diff-so-fancy` : Activate the [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) emulation mode. <sup>{1}</sup>

* `delta --diff-so-fancy --show-config` : You may want to know which delta configuration values the emulation mode has selected, so that you can adjust them. To do that, use e.g. <sup>{1}</sup>

* `delta --show-colors` : Use this to get a demo of the available colors, as background colors to see how they look with syntax highlighting <sup>{1}</sup>

* `delta --list-languages` AND `delta --list-syntax-themes` : To list the supported languages and color themes, use <sup>{1}</sup>

* `delta --show-syntax-themes` : To see a demo of the color themes, use <sup>{1}</sup>

## Commands From

* {1} [dandavison.github.io/delta](https://dandavison.github.io/delta/)

# delta.md

## Notes

* delta's default pager is "less" `--pager <CMD>` <sup>{3}</sup>

# Configuration

## Delta with Git

**[dandavison/delta GitHub](https://github.com/dandavison/delta) <sup>{5}</sup>**

* [Install it](https://dandavison.github.io/delta/installation.html) (the package is called "git-delta" in most package managers, but the executable is just `delta`) and add this to your `~/.gitconfig`:

* With [Git 2.35, you also have](https://stackoverflow.com/a/70387424/6309) zdiff3 ("zealous diff3"). <sup>{8}</sup>

```shell
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true  # use n and N to move between diff sections
    dark = true      # or light = true, or omit for auto-detection

[merge]
    conflictstyle = zdiff3
```

* Or run:

```shell
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
```

## Tmux

**[Using Delta with tmux](https://dandavison.github.io/delta/tips-and-tricks/using-delta-with-tmux.html)**

* If you're using tmux, it's worth checking that 24 bit color is working correctly.
* For example, run a color test script like [this one](https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh), or one of the others listed [here](https://gist.github.com/XVilka/8346728).
* If you do not see smooth color gradients, see the discussion at [tmux#696](https://github.com/tmux/tmux/issues/696).
* The short version is you need something like this in your `~/.tmux.conf`:
  * `set -ga terminal-overrides ",*-256color:Tc"`
* and you may then need to quit tmux completely for it to take effect.
* If colors look wrong, then see the page on [truecolor/24-bit](https://dandavison.github.io/delta/tips-and-tricks/24-bit-color-truecolor.html) color to ensure that this is working correctly.

## VSCode

**[Using Delta with VSCode](https://dandavison.github.io/delta/tips-and-tricks/using-delta-with-vscode.html)**
  
* All Delta features work correctly in VSCode's terminal emulator (please open an issue if that's not true).
* To format file links for opening in VSCode from other terminal emulators, use the [VSCode URL handler](https://code.visualstudio.com/docs/editor/command-line#_opening-vs-code-with-urls):
  
```shell
[delta]
   hyperlinks = true
   hyperlinks-file-link-format = "vscode://file/{path}:{line}"
```
* (To use VSCode Insiders, change that to `vscode-insiders://file/{path}:{line}`).
* See [hyperlinks](https://dandavison.github.io/delta/hyperlinks.html).

## Shell Completion

**[Generating completion files for various shells](https://dandavison.github.io/delta/tips-and-tricks/shell-completion.html)**
  
* Delta can generate completion files for various shells. Use the `--generate-completion` subcommand to print the completion script to stdout:
  * `delta --generate-completion <SHELL>`
* should be replaced with the lowercase name of the shell for which the script is to be generated. Currently bash, elvish, fish, powershell and zsh are supported.
* The completion files in `etc/completion` were also generated with this function and may not be up-to-date.

# References

* next-sl: {9}

## Websites

* {1} [dandavison.github.io/delta](https://dandavison.github.io/delta/)
* {5} [dandavison/delta GitHub](https://github.com/dandavison/delta)
* {6} ["less" for Windows](https://github.com/jftuga/less-Windows) <sup>{1}</sup>
* {7} [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)

## Tutorials

* {1} [dandavison.github.io/delta](https://dandavison.github.io/delta/)
* {8} [Should diff3 be default conflictstyle on git?](https://stackoverflow.com/questions/27417656/should-diff3-be-default-conflictstyle-on-git)

## Guides

* General
  * {2} [Using Delta on Windows](https://dandavison.github.io/delta/tips-and-tricks/using-delta-on-windows.html)
  * {3} [Full --help output](https://dandavison.github.io/delta/full---help-output.html)
  * {4} [directory diff #232](https://github.com/dandavison/delta/issues/232)
