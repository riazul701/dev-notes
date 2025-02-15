# Commands/Usage

## Set Git Tools

* Set `delta` as pager <sup>{3}</sup>
```shell
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
```
* `git config --global core.editor "vim"` : Set vim as git editor <sup>{5}</sup>
* `git config --global diff.tool vimdiff` : Viewing all `git diffs` with vimdiff <sup>{1}</sup>
* `git config --global merge.tool vimdiff` : Set vimdiff as a git mergetool <sup>{2}</sup>

# Config-Git.md

## Git Config Path

* Git has three config location. Priority Local > User > System. <sup>{4}</sup>
  * Local Config File : `{{git-repo}}/.git/config`
  * User Config File : `~/.gitconfig`
  * System Config File : `/etc/gitconfig`

# Git Diff/Merge

## Commands

* `git difftool` : Check "difftool" is set properly.

## Git Diff/Merge Tool
  
* [3.2 Git Branching - Basic Branching and Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
  * opendiff
  * kdiff3
  * tkdiff
  * xxdiff
  * meld
  * tortoisemerge
  * gvimdiff
  * diffuse
  * diffmerge
  * ecmerge
  * p4merge
  * araxis
  * bc3
  * codecompare
  * vimdiff
  * [emerge](https://www.gnu.org/software/emacs/manual/html_node/emacs/Emerge.html)

* Shows tool from `git difftool --tool-help` command
  * araxis (graphical session)
  * bc (graphical session)
  * bc3 (graphical session)
  * bc4 (graphical session)
  * codecompare (graphical session)
  * deltawalker (graphical session)
  * diffmerge (graphical session)
  * diffuse (graphical session)
  * ecmerge (graphical session)
  * emerge
  * examdiff (graphical session)
  * guiffy (graphical session)
  * gvimdiff (graphical session)
  * kdiff3 (graphical session)
  * kompare (graphical session)
  * meld (graphical session)
  * nvimdiff
  * opendiff (graphical session)
  * p4merge (graphical session)
  * smerge (graphical session)
  * tkdiff (graphical session)
  * winmerge (graphical session)
  * xxdiff (graphical session)

## Set `delta` as Diff Tool

## Set `vimdiff` as Merge Tool

* [Viewing all `git diffs` with vimdiff](https://stackoverflow.com/questions/3713765/viewing-all-git-diffs-with-vimdiff)

## Set `nvimdiff` as Merge Tool

# References

* next-sl: {6}

## Commands From

* Set Git Tools
  * {3} [dandavison/delta GitHub](https://github.com/dandavison/delta)
  * {1} [Viewing all `git diffs` with vimdiff](https://stackoverflow.com/questions/3713765/viewing-all-git-diffs-with-vimdiff)
  * {2} [Use vimdiff as git mergetool](https://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/)
  * {5} [How do I make git use the editor of my choice for editing commit messages?](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages)

## Guides

* Git Config
  * {4} [System, global and local Git config files on Windows and Linux](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Where-system-global-and-local-Windows-Git-config-files-are-saved)
