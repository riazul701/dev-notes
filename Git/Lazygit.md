# Keybindings From Lazygit `?` Command

* Lazygit version `0.45.2`

## [1] Status (Local)

* `o` : Open config file
* `e` : Edit config file
* `u` : Check for update
* `<enter>` : Switch to recent repo
* `a` : Show/cycle all branch logs

## [2] Files (Local)

* `<c-o>` : Copy path to clipboard
* `<space>` : Stage
  * `git add -- file-1`
* `<c-b>` : Filter files by status
  * "Filtering"
  * `s` : Show only staged files
  * `u` : Show only unstaged files
  * `t` : Show only tracked files
  * `r` : Reset filter
  * Cancel
* `y` : Copy to clipboard
  * "Copy to clipboard"
  * `n` : File name
  * `p` : Path
  * `s` : Diff of selected file
  * `a` : Diff of all files
  * Cancel
* `c` : Commit
  * `<c-o>` : Commit menu
      * `e` : Open in editor
      * `c` : Add co-author
      * `p` : Paste commit message from clipboard
      * Cancel
  * `git commit -m "{{commit-message}}" -m "{{commit-description}}"`
* `w` : Commit changes without pre-commit hook
  * `git commit -m "{{commit-message}}"`
* `A` : Amend last commit
  * `git commit --amend --no-edit --allow-empty`
* `C` : Commit changes using git editor
  * `git commit` : Without message, open editor
* `<c-f>` : Find base commit for fixup
* `e` : Edit
* `o` : Open file
* `i` : Ignore or exclude file...
  * "Ignore or exclude file"
  * `i` : Add to `.gitignore`
  * `e` : Add to `.git/info/exclude`
* `r` : Refresh files
* `s` : Stash
  * `git stash push -m "{{stash-message}}"`
* `S` : View stash options...
  * "Stash options"
  * `a` : Stash all changes
    * `git stash push -m "{{stash-message}}"`
  * `i` : Stash all changes and keep index
    * `git stash push --keep-index -m "{{stash-message}}"`
  * `U` : Stash all changes including untracked files
    * `git stash push --include-untracked -m "{{stash-message}}"`
  * `s` : Stash staged changes
    * `git stash push --staged -m "{{stash-message}}"`
  * `u` : Stash unstaged changes
    * `git stash push -m "{{stash-message}}"`
  * Cancel
* `a` : Stage all
  * `git add -A`
* `<enter>` : Stage lines / Collapse directory
* `d` : Discard
* `g` : View upstream reset options...
* `D` : Reset
* " ` " : Toggle file tree view
* `<c-t>` : Open external diff tool (git difftool)
* `M` : Open external merge tool
* `f` : Fetch
* `-` : Collapse all files
* `=` : Expand all files
* `/` : Search the current view by text

### [2] Files -> `<enter>` : Stage lines / Collapse directory (Local)

* `<left>` : Go to previous hunk
* `<right>` : Go to next hunk
* `v` : Toggle range select
* `a` : Select hunk
* `<c-o>` : Copy selected text to clipboard
* `<space>` : Stage
* `d` : Discard
* `o` : Open file
* `e` : Edit file
* `<esc>` : Return to files panel
* `<tab>` : Switch view
* `E` : Edit hunk
* `c` : Commit
* `w` : Commit changes without pre-commit hook
* `C` : Commit changes using git editor
* `<c-f>` : Find base commit for fixup
  * Find the commit that your current changes are building upon, for the sake of amending/fixing up the commit. This spares you from having to look through your branch's commits one-by-one to see which commit should be ammended/fixed up. [See docs](https://github.com/jesseduffield/lazygit/tree/master/docs/Fixup_Commits.md)
* `/` : Search the current view by text

## [2] Worktrees (Local)

* `n` : New worktree
* `<space>` : Switch
* `o` : Open in editor
* `d` : Remove
* `/` : Filter the current view by text

## [2] Files - Submodules (Local)

* `<c-o>` : Copy submodule name to clipboard
* `<enter>` : Enter
* `d` : Remove
* `u` : Update
* `n` : New submoudule
* `e` : Update submodule URL
* `i` : Initialize
* `b` : View bulk submodule options...
* Easter egg
* `/` : Filter the current view by text

## [3] Local branches (Local)

* `<c-o>` : Copy branch name to clipboard
* `i` : Show git-flow options...
* `<space>` : Checkout
* `n` : New branch
* `o` : Create pull request
* `O` : View pull request options...
* `<c-y>` : Copy pull request URL to clipboard
* `c` : Checkout by name
* `F` : Force checkout
* `d` : Delete
* `r` : Rebase
* `M` : Merge...
* `f` : Fast-forward
* `T` : New tag
* `s` : Sort order
* `g` : Reset
* `R` : Rename branch
* `u` : View upstream options...
* `<c-t>` : Open external diff tool (git difftool)
* `<enter>` : View commits
* `w` : View worktree options...
* `/` : Filter the current view by text

## [3] Remotes (Local)

* `<enter>` : View branches
* `n` : New remote
* `d` : Remove
* `e` : Edit
* `f` : Fetch
* `/` : Filter the current view by text

## [3] Tags (Local)

* `<space>` : Checkout
* `n` : New tag
* `d` : Delete
* `P` : Push tag
* `g` : Reset...
* `<c-t>` : Open external diff tool (git difftool)
* `<enter>` : View commits
* `w` : View worktree options...
* `/` : Filter the current view by text

## [4] Commits (Local)

* `<c-o>` : Copy commit hash to clipboard
* `<c-r>` : Reset copied (cherry-picked) commits selection
* `b` : View bisect options...
* `s` : Squash
* `f` : Fixup
* `r` : Reword
* `R` : Reword with editor
* `d` : Drop
* `e` : Edit (start interactive rebase)
* `i` : Start interactive rebase
* `p` : Pick
* `F` : Create fixup commit
* `S` : Apply fixup commits...
* `<c-j>` : Move commit down one
* `<c-k>` : Move commit up one
* `V` : Paste (cherry pick)
* `B` : Mark as base commit for rebase
* `A` : Amend
* `a` : Amend commit attribute...
* `t` : Revert
* `T` : Tag commit
* `<c-l>` : View log options...
* `<space>` : Checkout
* `y` : Copy commit attribute to cipboard...
* `o` : Open commit in browser
* `n` : Create new branch off of commit
* `g` : Reset...
* `C` : Copy (cherry-pick)
* `<c-t>` : Open external diff tool (git difftool)
* `<enter>` : View files
* `w` : View worktree options...
* `/` : Search the current view by text

## [4] Reflow (Local)

* `<c-o>` : Copy commit has to clipboard
* `<space>` : Checkout
* `y` : Copy commit attribute to clipboard...
* `o` : Open commit in browser
* `n` : Create new branch off of commit
* `g` : Reset...
* `C` : Copy (cherry-pick)
* `<c-r>` : Reset copied (cherry-picked) commits selection
* `<c-t>` : Open external diff tool (git difftool)
* `<enter>` : View commits
* `w` : View worktree options...
* `/` : Filter the current view by text

## [5] Stash (Local)

* `<space>` : Apply
* `g` : Pop
* `d` : Drop
* `n` : New branch
* `r` : Rename stash
* `<enter>` : View files
* `w` : View worktree options...
* `/` : Filter the current view by text

## Global

* `<c-r>` : Switch to recent repo
* `<pgup>` : Scroll up main window
* `pgdown` : Scroll down main window
* `@` : View command log options...
* `P` : Push
* `p` : Pull
* `)` : Increase rename similarity threshold
* `(` : Decrease rename similarity threshold
* `}` : Increase diff context size
* `{` : Decrease diff context size
* `:` : Execute shell command...
* `<c-p>` : View custom patch options...
* `m` : View merge/rebase options...
* `R` : Refresh
* `+` : Next screen mode (normal/half/fullscreen)
* `_` : Prev screen mode
* `?` : Open keybindings menu
* `<c-s>` : View filter options...
* `W` : View diffing options
* `q` : Quit
* `<esc>` : Cancel
* `<c-w>` : Toggle whitespace
* `z` : Undo
* `<c-z>` : Redo
* `]` : Next tab
* `[` : Previous tab

## Navigation

* `,` : Previous page
* `.` : Next page
* `<` : Scroll to top
* `>` : Scroll to bottom
* `v` : Toggle range select
* `<s-down>` : Range select down
* `<s-up>` : Range select up
* `/` : Search the current view by text

# Commands

* `winpty lazygit` : Open Lazygit in Git-Bash <sup>{4}</sup>

# Lazygit.md

## Websites

* [dandavison/delta GitHub](https://github.com/dandavison/delta)

## Notes

* Lazygit "diff" uses [dandavison/delta GitHub](https://github.com/dandavison/delta) <sup>{3}</sup>

# References

* next-sl: {5}

## Guides

* {4} [LG just hangs on Git Bash Window (Windows) #235](https://github.com/jesseduffield/lazygit/issues/235)
* {3} [Related projects => Using delta](https://dandavison.github.io/delta/related-projects.html)

## YouTube Tutorials
  
* {1} [15 Lazygit Features In Under 15 Minutes BY Jesse Duffield](https://www.youtube.com/watch?v=CPLdltN7wgE)
* {2} [Lazygit Now Has Mouse Support! BY Jesse Duffield](https://www.youtube.com/watch?v=F7TCWUO9vt4)
* {3} [Lazygit - The Best Way To Use Git On The Terminal & Neovim BY Josean Martinez](https://www.youtube.com/watch?v=Ihg37znaiBo)
