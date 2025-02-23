# Commands/Usage

* Note: --multi is passed to fzf so you can select multiple files with `Tab` and `Shift+tab` <sup>{1}</sup>

* `find '{{file-search-text}}' | sad '{{Pattern}}' '{{Replace}}'` : Starts Fzf with diff preview window. Get file list from `find` command. <sup>{1}</sup>

* `find '{{file-search-text}}' | sad --commit '{{Pattern}}' '{{Replace}}'` : Write changes to files without starting Fzf with diff preview window. Get file list from `find` command. <sup>{1}</sup>

* `find . | sad '{{Pattern}}' '{{Replace}}'` : Starts Fzf with diff preview window. Get all files from `find` command. <sup>{1}</sup>

* `sad '{{Pattern}}' '{{Replace}}'` : Shows Error `Error: ArgumentError("/dev/stdin connected to tty")`

# sad-cmd.md

## Notes

# Error and Solution

## Fzf `enter` Does Not Execute Replace

**[Releases v0.4.32](https://github.com/ms-jpq/sad/releases/tag/v0.4.32)**

* It looks like in the newer versions of `fzf` the command that was used to "execute and exit" no longer works.

  * A quick fix is to simply migrate to `fzf`'s new `become` command, which almost does the same thing.

  * This is a breaking change for holder versions of `fzf` however, and users using `fzf` shipped with ubuntu 22 and below should stick with old version for now

# References

* next-sl: {2}

## Websites

* {1} [ms-jpq/sad GitHub => CLI search and replace | Space Age seD](https://github.com/ms-jpq/sad)
