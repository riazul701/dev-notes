# Commands/Usage

* `delta /somewhere/a.txt /somewhere/else/b.txt` : Delta can also be used as a shorthand for diffing two files, even if they are not in a git repo: the following two commands do the same thing:. <sup>{4}</sup>
  * `git diff /somewhere/a.txt /somewhere/else/b.txt` <sup>{4}</sup>
* `delta <(sort file1) <(sort file2)` : You can also use [process substitution](https://en.wikipedia.org/wiki/Process_substitution) shell syntax with delta, e.g. <sup>{4}</sup>
* `diff -u a.txt b.txt | delta` : In addition to git output, delta handles standard unified diff format, e.g. <sup>{4}</sup>
* `delta --show-themes` : To browse themes, use, or browse the list of theme <sup>{4}</sup>
* `delta --diff-highlight` : Activate the [diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight) emulation mode. <sup>{4}</sup>
* `delta --diff-so-fancy` : Activate the [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) emulation mode. <sup>{4}</sup>
* `delta --diff-so-fancy --show-config` : You may want to know which delta configuration values the emulation mode has selected, so that you can adjust them. To do that, use e.g. <sup>{4}</sup>
* `delta --show-colors` : Use this  to get a demo of the available colors, as background colors to see how they look with syntax highlighting <sup>{4}</sup>
* Use the `navigate` feature to activate navigation keybindings. In this mode, pressing `n` will jump forward to the next file in the diff, and `N` will jump backwards. <sup>{4}</sup>
* `delta --list-languages` AND `delta --list-syntax-themes` : To list the supported languages and color themes, use <sup>{4}</sup>
* `delta --show-syntax-themes` : To see a demo of the color themes, use <sup>{4}</sup>

## Commands From

* {4} [dandavison.github.io/delta](https://dandavison.github.io/delta/)

# delta.md

## Websites

* {4} [dandavison.github.io/delta](https://dandavison.github.io/delta/)
* [dandavison/delta GitHub](https://github.com/dandavison/delta)
* ["less" for Windows](https://github.com/jftuga/less-Windows) <sup>{1}</sup>
* [so-fancy/diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
* Tutorials
  * [dandavison.github.io/delta](https://dandavison.github.io/delta/)

## Notes

* delta's default pager is "less" `--pager <CMD>` <sup>{2}</sup>

# Configuration

## Tmux

* [Using Delta with tmux](https://dandavison.github.io/delta/tips-and-tricks/using-delta-with-tmux.html)
  * If you're using tmux, it's worth checking that 24 bit color is working correctly.
  * For example, run a color test script like [this one](https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh), or one of the others listed [here](https://gist.github.com/XVilka/8346728).
  * If you do not see smooth color gradients, see the discussion at [tmux#696](https://github.com/tmux/tmux/issues/696).
  * The short version is you need something like this in your `~/.tmux.conf`:
    * `set -ga terminal-overrides ",*-256color:Tc"`
  * and you may then need to quit tmux completely for it to take effect.
  * If colors look wrong, then see the page on [truecolor/24-bit](https://dandavison.github.io/delta/tips-and-tricks/24-bit-color-truecolor.html) color to ensure that this is working correctly.

## VSCode

* [Using Delta with VSCode](https://dandavison.github.io/delta/tips-and-tricks/using-delta-with-vscode.html)
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

* [Generating completion files for various shells](https://dandavison.github.io/delta/tips-and-tricks/shell-completion.html)
  * Delta can generate completion files for various shells. Use the `--generate-completion` subcommand to print the completion script to stdout:
    * `delta --generate-completion <SHELL>`
  * should be replaced with the lowercase name of the shell for which the script is to be generated. Currently bash, elvish, fish, powershell and zsh are supported.
  * The completion files in `etc/completion` were also generated with this function and may not be up-to-date.

# References

* next-sl: {4}

* Tutorials
  * {4} [dandavison.github.io/delta](https://dandavison.github.io/delta/)

* Guides
  * {1} [Using Delta on Windows](https://dandavison.github.io/delta/tips-and-tricks/using-delta-on-windows.html)
  * {2} [Full --help output](https://dandavison.github.io/delta/full---help-output.html)
  * {3} [directory diff #232](https://github.com/dandavison/delta/issues/232)
