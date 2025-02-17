# Keybindings From Lazygit `?` Command

* Lazygit version `0.45.2`

## Set Git Tools

* Set `delta` as pager <sup>{7}</sup>
```shell
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
```

* `git config --global core.editor "vim"` : Set vim as git editor <sup>{11}</sup>
* `git config --global diff.tool vimdiff` : Viewing all `git diffs` with vimdiff <sup>{5}</sup>
* `git config --global merge.tool vimdiff` : Set vimdiff as a git mergetool <sup>{6}</sup>

## [1] Status (Local Keybind)

* `o` : Open config file
  * `bash -c "xdg-open "/home/{{user-name}}/.config/lazygit/config.yml" >/dev/null"`

* `e` : Edit config file
  * `bash -c "vim -- "/home/{{user-name}}/.config/lazygit/config.yml""`

* `u` : Check for update

* `<enter>` : Switch to recent repo

* `a` : Show/cycle all branch logs

## [2] Files (Local Keybind)

* `<c-o>` : Copy path to clipboard

* `<space>` : Stage
  * `git add -- file-1`
  * Undo : `git checkout {{branch-name}}`

* `<c-b>` : Filter files by status
  * Window Title : "Filtering"
  * `s` : Show only staged files
  * `u` : Show only unstaged files
  * `t` : Show only tracked files
  * `r` : Reset filter
  * Cancel

* `y` : Copy to clipboard
  * Window Title : "Copy to clipboard"
  * `n` : File name
  * `p` : Path
  * `s` : Diff of selected file
  * `a` : Diff of all files
  * Cancel

* `c` : Commit
  * Open Window
    * Commit summary : {{commit-summry}}
    * Commit description : {{commit-description}}
    * `<tab>` : Press, to toggle focus
    * `<c-o>` : Commit Menu
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
  * Note : Open editor
  * Cmd Section : Commit
  * `git commit`

* `<c-f>` : Find base commit for fixup

* `e` : Edit

* `o` : Open file

* `i` : Ignore or exclude file...
  * Window Title : "Ignore or exclude file"
  * `i` : Add to `.gitignore`
  * `e` : Add to `.git/info/exclude`

* `r` : Refresh files

* `s` : Stash
  * `git stash push -m "{{stash-message}}"`

* `S` : View stash options...
  * Window Title : "Stash options"
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

* `a` : Stage all / Unstage all <sup>{12}</sup>
  * `git add -A` : Stage all files
  * `git reset` : Unstage all files

* `<enter>` : Stage lines / Collapse directory
  
  * `<left>` : Go to previous hunk
  
  * `<right>` : Go to next hunk
  
  * `v` : Toggle range select
  
  * `a` : Select hunk
  
  * `<c-o>` : Copy selected text to clipboard

  * `<space>` : Stage
    * Cmd Section : Apply patch
    * Creating file {{patch-file-path}}
    * `git apply --cached {{patch-file-path}}`
    * Undo
      * Window Content : Are you sure you want to soft reset to {{commit-hash: HEAD~1}}
      * `git reset soft {{commit-hash: HEAD~1}}`
    * Redo
      * Window Content: Are you sure you want to hard reset to '{{commit-hash: HEAD~1}}'? An auto-stash will be performed if necessary.
      * `git stash push -m "Auto-stashing changes for {{commit-hash: HEAD~1}}"`
      * `git reset --hard {{commit-hash: HEAD~1}}`
      * `git stash pop stash@{0}`

  * `d` : Discard
    * Windows Message : [Discard change] Are you sure you want to discard this change (git reset) ? It is irreversible. To disable this dialogue set the config key of 'gui.skipDiscardChangeWarning' to true
    * Cmd Section : Apply patch
    * Creating file '{{patch-file-path}}'
    * `git apply --reverse "{{patch-file-path}}"`

  * `o` : Open file
  
  * `e` : Edit file
    * `bash -c "vim +{{line-number}} -- "{{file-path}}""`
  
  * `<esc>` : Return to files panel
  
  * `<tab>` : Switch view
  
  * `E` : Edit hunk
    * `git apply --cached {{patch-file-path}}`
  
  * `c` : Commit
    * Open Window
      * Commit summary : {{commit-summry}}
      * Commit description : {{commit-description}}
      * `<tab>` : Press, to toggle focus
      * `<c-o>` : Commit Menu
        * `e` : Open in editor
        * `c` : Add co-author
        * `p` : Paste commit message from clipboard
        * Cancel
    * `git commit -m "{{commit-message}}" -m "{{commit-description}}"`

  * `w` : Commit changes without pre-commit hook
  
  * `C` : Commit changes using git editor
    * Note : Open editor
    * Cmd Section : Commit
    * `git commit`

  * `<c-f>` : Find base commit for fixup
    * Find the commit that your current changes are building upon, for the sake of amending/fixing up the commit. This spares you from having to look through your branch's commits one-by-one to see which commit should be ammended/fixed up. [See docs](https://github.com/jesseduffield/lazygit/tree/master/docs/Fixup_Commits.md)
  
  * `/` : Search the current view by text

* `d` : Discard
  * Window Title : "Discard changes"
  * `x` : Discard all changes
    * `git checkout -- file-1`
    * OR "Deleting path file-1"
  * `u` : Discard unstaged changes
    * `git checkout -- file-1`
  * Cancel

* `g` : View upstream reset options...
  * Window Title : "Reset to @{upstream}"
  * `m` : Mixed reset `reset --mixed @{upstream}`
    * `git reset --mixed @{upstream}`
    * Undo : `git reset {{last-commit-hash}}`
  * `s` : Soft reset `reset --soft @{upstream}`
    * `git reset --soft @{upstream}`
    * Undo : `git reset {{last-commit-hash}}`
  * `h` : Hard reset `reset --hard @{upstream}`
    * `git reset hard @{upstream}`
    * Undo : `git reset {{last-commit-hash}}`
  * Cancel

* `D` : Reset
  * `x` : Nuke working tree `git reset --hard HEAD & git clean -fd`
    * `git reset --hard HEAD` && `git clean -fd`
  * `u` : Discard staged changes `git checkout -- .`
    * `git checkout -- .`
  * `c` : Discard untracked files `git clean -fd`
    * `git clean -fd`
  * `S` : Discard staged changes `stash staged and drop stash`
    * `git stash push --staged -m "[lazygit] tmp stash"` && `git stash drop`
  * `s` : Soft reset `git reset --soft HEAD`
    * `git reset --soft HEAD`
  * `m` : Mixed reset `git reset --mixed HEAD`
    * `git reset --mixed HEAD`
  * `h` : Hard reset `git reset --hard HEAD`
    * `git reset --hard HEAD`
  * Cancel

* " \` " : Toggle file tree view

* `<c-t>` : Open external diff tool (git difftool)

* `M` : Open external merge tool

* `f` : Fetch
  * `git fetch --all --no-write-fetch-head`

* `-` : Collapse all files

* `=` : Expand all files

* `/` : Search the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## [2] Worktrees (Local Keybind)

* `n` : New worktree

  * Window Title : "Worktree"

  * Create worktree from ref
    * Steps
      * New worktree base ref : {{base-branch/tag/HEAD}}
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
      * New branch name (leave blank to checkout {{branch/tag/HEAD}})
      * Error : Preparing worktree (checking out 'main'). fatal 'main' is already checked out at '{{project-path}}'
    * Cmd Section : Add worktree
      * `git worktree add {{worktree-path}} {{base-branch/tag/HEAD}}`
      * Changing directory to {{worktree-path}}
  
  * Create worktree from ref (detached)
    * Steps
      * New worktree base ref : {{base-branch/tag/HEAD}}
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * Cmd Section : Add worktree
      * `git worktree add --detach {{worktree-path}} {{base-branch/tag/HEAD}}`
      * Changing directory to {{worktree-path}}
  
  * Cancel

* `<space>` : Switch

* `o` : Open in editor
  * Open in default `git core.editor`, like vim

* `d` : Remove
  * `git worktree remove {{worktree-path}}`

* `/` : Filter the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

* Notes
  * Error : You cannot remove the main worktree!

## [2] Submodules (Local Keybind)

* `<c-o>` : Copy submodule name to clipboard
  * Cmd Section : Copy to clipboard
  * Copying '{{submodule-name}}' to clipboard

* `<enter>` : Enter
  * Changing directory to {{submodule-path}}

* `d` : Remove
  * Window Title : Remove submodule
    * Window Content : Are you sure you want to remove submodule '{{submodule-name}}' and its corresponding directory? This is irreversible.
  * Cmd Section : Remove submodule
    * `git submodule deinit --force -- {{submodule-path}}`
    * `git rm --force -r {{submodule-path}}`

* `u` : Update
  * Cmd Section : Update submodule
  * `git submodule update --init -- {{submodule-path}}`

* `n` : New submoudule
  * Steps
    * New submodule URL
    * New submodule name
    * New submodule path
  * Cmd Section : Add submodule
  * `git submodule add --force --name {{submodule-name}} -- {{submodule-url}} {{submodule-path}}`

* `e` : Update submodule URL
  * Cmd Section : Update submodule URL
  * `git config --file .gitmodules submodule.{{submodule-name}}.url {{new-submodule-url}}`
  * `git submodule sync -- {{submodule-path}}`

* `i` : Initialize
  * Cmd Section : Initialize submodule
  * `git submodule init -- {{submodule-path}}`

* `b` : View bulk submodule options...
  * Window Title: Bulk submodule options
  * `i` : Bulk init submodules `git submodule init`
    * Cmd Section : Bulk initialize submodules
    * `git submodule init`
  * `u` : Bulk update submodules `git submodule update`
    * Cmd Section : Bulk update submodules
    * `git submodule update`
  * `d` : Bulk deinit submodules `git submodule deinit --all --force`
    * Cmd Section : Bulk deinitialise submodules
    * `git submodule deinit --all --force`
  * Cancel

* Easter egg

* `/` : Filter the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## [3] Local branches (Local Keybind)

* `<c-o>` : Copy branch name to clipboard
  * Cmd Section : Copy to clipboard
  * Copy '{{branch-name}}' to clipboard

* `i` : Show git-flow options...
  * Error : You need to install git-flow and enable it in this repo to use git-flow features

* `<space>` : Checkout
  * Cmd Section : Checkout branch [If branch has uncommitted changes]
    * `git checkout {{branch-name}}`
    * `git stash push -m "Auto stashing changes for {{branch-name}}"`
    * `git checkout {{branch-name}}`
    * `git stash pop stash@{0}`
  * Cmd Section : Checkout branch [If branch has NO uncommitted changes]
    * `git checkout {{branch-name}}`

* `n` : New branch
  * Window Title : New branch name (branch is off of '{{base-branch}}')
  * Cmd Section : Create branch
  * `git checkout -b {{branch-name}} refs/heads/{{base-branch}} --no-track`

* `o` : Create pull request
  * Error : Cannot open a pull request for a branch with no upstream
  * Cmd Section : Open pull request in browser
  * `bash -c "xdg-open "{{github-repo-url}}/compare/{{branch-name}}?expand=1" >/dev/null"`

* `O` : View pull request options...
  * Window Title : View create pull request options
  * main -> Default branch
    * Cmd Section : Open pull request in browser
    * `bash -c "xdg-open "{{github-repo-url}}/compare/{{branch-name}}?expand=1" >/dev/null"`
  * main -> Select branch
    * Show window for branch selection
    * Cmd Section : Open pull request in browser
    * `bash -c "xdg-open "{{github-repo-url}}/compare/{{target/remote-branch}}...{{local-branch}}?expand=1" >/dev/null"`
  * Cancel

* `<c-y>` : Copy pull request URL to clipboard
  * Cmd Section : Copy pull request URL
  * Copying '{{github-repo-url}}/compare/{{branch-name}}?expand=1' to clipboard

* `c` : Checkout by name
  * Show window for branch selection
  * Cmd Section : Checkout branch
  * `git checkout {{branch-name}}`

* `F` : Force checkout
  * Window Title : Force checkout branch
    * Window Content : Are you sure you want force checkout? You will lose all local changes
  * Cmd Section : Force checkout branch
  * `git checkout --force {{branch-name}}`

* `d` : Delete
  * Disabled : You cannot delete the checked out branch!
  * Window Title : Delete branch '{{branch-name}}'?
  * `c` : Delete local branch
    * Cmd Section : Delete local branch
    * `git branch -D {{local-branch}}`
  * `r` : Delete remote branch
    * Delete remote branch that corresponds to local branch
    * Window Title : Delete branch '{{branch-name}}'
      * Window Content : Are you sure you want to delete the remote branch '{{remote-branch-name}}' from '{{remote-name}}'?
      * GitHub access is required for deleting remote branch
  * `b` : Delete local and remote branch
    * Window Title : Delete local and remote branch
      * Window Content : Are you sure you want to delete both '{{branch-name}}' from your machine, and '{{branch-name}}' from '{{remote-name}}'?
      * GitHub access is required for deleting local and remote branch 
  * Cancel

* `r` : Rebase
  * Window Title : Rebase '{{checked-out-branch}}' [Rebase checked-out branch into highlighted branch]
  * `s` : Simple rebase onto '{{highlighted-branch}}'
    * Cmd Section : Rebase branch
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{highlighted-branch}}`
  * `i` : Interactive rebase onto '{{highlighted-branch}}'
    * Note : Begin an interactive rebase with a break at the start, so you can update the TODO commits before continuing
    * `m` : View rebase options
      * Window Title : Rebase options
      * `c` : continue
      * `a` : abort
        * Cmd Section : Merge/Rebase: abort
        * `git rebase --abort`
      * `s` : skip
        * Cmd Section : Merge/Rebase: skip
        * `git rebase --skip`
      * Cancel
    * Cmd Section : Rebase branch
    * Beginning interactive rebase at '{{highlighted-branch}}'
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{highlighted-branch}}`
  * `b` : Rebase onto base branch '{{remote-name}}/{{remote-branch}}'
    * Note : Rebase the checked out branch onto its base branch (i.e. the closest {{highlighted-branch}} branch)
    * Cmd Section : Rebase branch
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges refs/remotes/origin/{{highlighted-local-branch}}`
  * Cancel

* `M` : Merge...
  * Window Title : Merge
  * `m` : Regular merge
    * Cmd Section : Merge
    * `git merge --no-edit {{highlighted-branch}}`
  * `s` : Squash merge and leave uncommitted
    * Note : Squash merge '{{highlighted-branch}}' into the working tree
    * Cmd Section : Squash merge
    * `git merge --no-edit --squash --ff {{highlighted-branch}}`
  * `S` : Squash merge and commit
    * Note : Squash merge '{{highlighted-branch}}' into '{{checked-out-branch}}' as a single commit
    * Cmd Section : Squash merge
      * `git merge --no-edit --squash --ff {{highlighted-branch}}`
      * `git commit -m "Squash merge {{highlighted-branch}} into {{checked-out-branch}}"`
  * Cancel

* `f` : Fast-forward
  * Cmd Section : Fast forward branch
  * `git pull --no-edit --ff-only  {{remote-name}} refs/heads/{{local/remote-branch}}`

* `T` : New tag
  * Open window
    * Tag name : {{tag-name}}
    * Tag description : {{tag-description}}
  * Cmd Section : Create annotated tag
  * `git tag {{tag-name}} refs/heads/{{branch-name}} -m "{{tag-description}}"`

* `s` : Sort order
  * Window Title : Sort order
  * `r` : () Recency (based of `reflog`)
  * `a` : () Alphabetical `--sort=refname`
  * `d` : () Date `--sort=-committerdate`
  * Cancel

* `g` : Reset
  * Window Title : Reset to {{branch-name}}
  * `m` : Mixed reset `reset --mixed {{branch-name}}`
    * Cmd Section : Reset
    * `git reset --mixed {{branch-name}}`
  * `s` : Soft reset `reset --soft {{branch-name}}`
    * Cmd Section : Reset
    * `git reset --soft {{branch-name}}`
  * `h` : Hard reset `reset --hard {{branch-name}}`
    * Cmd Section : Reset
    * `git reset --hard {{branch-name}}`
  * Cancel

* `R` : Rename branch

* `u` : View upstream options...

  * Window Title : Upstream options

  * View divergence from upstream

  * `b` : View divergence from base branch ({{remote-name}}/{{remote-branch}})

  * `u` : Unset upstream of selected branch
    * `git branch --unset-upstream {{branch-name}}`

  * `s` : Set upstream of selected branch
    * Window Title : Enter upstream as '<remote> <branchname>'
    * `git branch --set-upstream-to={{remote-name}}/{{remote-branch}}` {{local-branch}}

  * `g` : Reset checked-out branch onto {{remote-name}}/{{remote-branch}}
    * Note : View options for resetting the checkout-out branch onto {{remote-name}}/{{remote-branch}}. Note: this will not reset the selected branch onto the upstream, it will reset the checked-out branch onto the upstream.
    
    * Window Title : Reset to {{remote-name}}/{{remote/branch}}
    
    * `m` : Mixed reset `reset --mixed {{remote-name}}/{{remote/branch}}`
      * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as unstaged changes.
      * `git reset --mixed {{remote-name}}/{{remote/branch}}`
    
    * `s` : Soft reset `reset --soft {{remote-name}}/{{remote/branch}}`
      * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as staged changes.
      * `git reset --soft {{remote-name}}/{{remote/branch}}`
    
    * `h` : Hard reset `reset --hard {{remote-name}}/{{remote/branch}}`
      * Note : Reset HEAD to the chosen commit, and discard all changes between the current and chosen commit, as well as all current modificatons in the working tree.
      * `git reset --hard {{remote-name}}/{{remote/branch}}`
  
  * `r` : Rebase checked-out branch onto {{remote-name}}/{{remote-branch}}
    * Note : View options for rebasing the checked-out branch onto {{remote-name}}/{{remote-branch}}. Note: this will not rebase the selected branch onto the upstream, it will rebase the checked-out branch onto the upstream.

    * Window Title : Rebase '{{local-branch}}'

    * `s` : Simple rebase onto '{{remote-name}}/{{remote-branch}}'
      * Cmd Section : Rebase branch
      * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{remote-name}}/{{remote-branch}}`

    * `i` : Interactive rebase onto '{{remote-name}}/{{remote-branch}}'
      * Note : Begin an interactive rebase with a break at the start, so you can update the TODO commits before continuing.
      * Cmd Section : Rebase branch
      * Beginning interactive rebase at '{{remote-name}}/{{remote-branch}}'
      * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{remote-name}}/{{remote-branch}}`
      * `m` : View rebase options
        * Window Title : Rebase options
        * `c` : continue
          * Cmd Section : Merge/Rebase: continue
          * `git rebase --continue`
        * `a` : abort
          * Cmd Section : Merge/Rebase: abort
          * `git rebase --abort`
        * `s` : skip
          * Cmd Section : Merge/Rebase: skip
          * `git rebase --skip`
        * Cancel

    * `b` : Rebase onto base branch ({{remote-name}}/{{remote-branch}})
      * Note : Rebase the checked out branch onto its base branch (i.e. the closest {{local-branch}} branch)
      * Cmd Section : Rebase branch
      * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges refs/remotes/{{remote-name}}/{{remote-branch}}`

    * Cancel
  
  * Cancel

* `<c-t>` : Open external diff tool (git difftool)
  * `git difftool --no-prompt --dir-diff {{local-branch}} -- .`

* `<enter>` : View commits

* `w` : View worktree options...

  * Window Title : Worktree

  * Create worktree from {{local-branch}}
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
      * New branch name : {{local-branch}}
    * Cmd Section : Add worktree
      * `git worktree add -b {{branch-name}} {{worktree-path}} {{base-branch}}`
      * Changing directory to {{worktree-path}}

  * Create worktree from {{local-branch}} (detached)
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * Cmd Section : Add worktree
      * `git worktree add --detach {{worktree-path}} {{base-branch}}`
      * Changing directory to {{worktree-path}}

  * Cancel

* `/` : Filter the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## [3] Remotes (Local Keybind)

* `<enter>` : View branches

* `n` : New remote
  * Steps
    * New remote name : {{remote-name}}
    * New remote url : {{remote-url}}
  * Cmd Section : Add remote
    * `git remote add {{remote-name}} {{remote-url}}`
    * `git fetch --no-write-fetch-head {{remote-name}}`

* `d` : Remove
  * Cmd Section : Remove remote
  * `git remote remove {{remote-name}}`

* `e` : Edit
  * Steps
    * Enter updated remote name for {{existing-remote-name}} : {{remote-name}}
    * Enter updated remote url for {{existing-remote-name}} : {{remote-url}}
  * Cmd Section : Update remote
  * `git remote set-url {{remote-name}} {{remote-url}}`

* `f` : Fetch
  * `git fetch --no-write-fetch-head {{remote-name}}`

* `/` : Filter the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## [3] Tags (Local Keybind)

* `<space>` : Checkout
  * Cmd Section : Checkout tag
  * `git checkout refs/tags/{{tag-name}}`

* `n` : New tag
  * Open Window
    * Tag name : {{tag-name}}
    * Tag description : {{tag-description}}
    * `<tab>` : Press, to toggle focus
    * `<c-o>` : to open menu
      * Window Title : Commit Menu
      * `e` : Open in editor
        * Note : Disabled: This command doesn't support switching to the editor
      * `c` : Add co-author
      * `p` : Paste commit messge from clipboard
      * Cancel
  * Cmd Section : Create annotated tag
  * `git tag {{tag-name}} -m "{{tag-description}}"`

* `d` : Delete

* `P` : Push tag
  * Open Window
    * Remote to push tag '{{local-tag}}' to : {{remote-name}}
    * Suggestions (press `<tab>` to focus)
    * `<tab>` : Press, to toggle focus
  * Cmd Section : Push tag
  * `git push {{remote-name}} tag {{local-tag}}`

* `g` : Reset...

  * Window Title : Reset to {{tag-name}}

  * `m` : Mixed reset `reset --mixed {{tag-name}}`
    * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as unstaged changes.
    * Cmd Section : Reset
    * `git reset --mixed {{tag-name}}`

  * `s` : Soft reset `reset --soft {{tag-name}}`
    * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as staged changes.
    * Cmd Section : Reset
    * `git reset --soft {{tag-name}}`

  * `h` : Hard reset `reset --hard {{tag-name}}`
    * Note : Reset HEAD to the chosen commit, and discard all changes between the current and chosen commit, as well as all current modifications in the working tree.
    * Cmd Section : Reset
    * `git reset --hard {{tag-name}}`

  * Cancel

* `<c-t>` : Open external diff tool (git difftool)
  * `git difftool --no-prompt --dir-diff {{tag-name}} -- .`

* `<enter>` : View commits

* `w` : View worktree options...

  * Window Title : Worktree

  * Create worktree from {{tag-name}}
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
      * New branch name : {{local-branch}}
    * Cmd Section : Add worktree
      * `git worktree add -b {{branch-name}} {{worktree-path}} {{tag-name}}`
      * Changing directory to {{worktree-path}}
  
  * Create worktree from {{tag-name}} (detached)
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * Cmd Section : Add worktree
      * `git worktree add --detach {{worktree-path}} {{tag-name}}`
      * Changing directory to {{worktree-path}}

  * Cancel

* `/` : Filter the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## [4] Commits (Local Keybind)

* `<c-o>` : Copy commit hash to clipboard
  * Cmd Section : Copy to clipboard
  * Copying '{{commit-has}}' to clipboard

* `<c-r>` : Reset copied (cherry-picked) commits selection

* `b` : View bisect options...

  * Window Title : Bisect

  * `b` : Mark {{commit-hash}} as bad (start bisect)

    * `b` : View bisect options

      * Window Title : Bisect

      * `b` : Mark current commit ({{current-commit-hash}}) as bad
        * Cmd Section : Bisect mark
        * `git bisect bad {{current-commit-hash}}`

      * `g` : Mark current commit ({{current-commit-hash}}) as good
        * Cmd Section : Bisect mark
        * `git bisect good {{current-commit-hash}}`

      * `s` : Skip current commit ({{current-commit-hash}})
        * Cmd Section : Bisect skip
        * `git bisect skip {{current-commit-hash}}`

      * `r` : Reset bisect
        * Window Title : Reset 'git bisect'
          * Window Content : Are you sure you want to reset 'git bisect'?
        * Cmd Section : Reset bisect
        * `git bisect reset`

      * Cancel

    * Cmd Section : Start bisect
    * `git bisect start`

  * `g` : Mark {{commit-hash}} as good (start bisect)
    * `b` : View bisect options
    * Cmd Section : Start bisect
    * `git bisect start`

  * `t` : Choose bisect terms
    * Open Window
      * Term for old/good commit : {{commit-old-term}}
      * Term for new/bad commit : {{commit-new-term}}
    * `b` : View bisect options
    * Cmd Section : Start bisect
    * `git bisect start --term-old={{commit-old-term}} --term-new={{commit-new-term}}`

  * Cancel

* `s` : Squash
  * Window Title : Squash
    * Window Content : Are you sure you want to squash the selected commit(s) into the commit below?
  * Cmd Section : Squash commit down
    * Changing TODO actions:
      * {{selected-commit-hash}}:squash
      * {{selected-commit-hash}}:squash
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-of-selection}}`

* `f` : Fixup
  * Window Title : Fixup
    * Window Content : Are you sure you want to 'fixup' the selected commit(s) into the commit below?
  * Cmd Section : Fixup commit
    * Changing TOD actions:
      * {{selected-commit-hash}}:fixup
      * {{selected-commit-hash}}:fixup
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-of-selection}}`

* `r` : Reword
  * Open Window
    * Reword commit : {{commit-summary}}
    * Commit description : {{commit-description}}
    * `<tab>` : Press, to toggle focus
    * `<c-o>` : Commit Menu
      * `e` : Open in editor
      * `c` : Add co-author
      * `p` : Paste commit message from clipboard
      * Cancel
  * `git commit --allow-empty --amend --only -m "{{commit-summary}}" -m "{{commit-description}}"`

* `R` : Reword with editor
  * Window Title : Reword in editor
    * Window Content : Are you sure you want to reword this commit in your editor?
  * Cmd Section : Reword commit
  * `git commit --allow-empty --amend --only`

* `d` : Drop
  * Window Title : Drop commit
    * Window Content : Are you sure you want to drop the selected commit(s)?
  * Cmd Section : Drop commit
    * Changing TODO actions:
      * {{selected-commit-has}}:drop
      * {{selected-commit-has}}:drop
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-of-selection}}`

* `e` : Edit (start interactive rebase)
  * `m` : View rebase options
    * Window Title : Rebase options
    * `c` : continue
      * Cmd Section : Merge/Rebase: continue
      * `git rebase --continue`
    * `a` : abort
      * Cmd Section : Merge/Rebase: abort
      * `git rebase --abort`
    * `s` : skip
      * Cmd Section : Merge/Rebase: skip
      * `git rebase --skip`
    * Cancel
  * Cmd Section : 
    * Changing TODO actions:
      * {{selected-commit-hash}}:edit
      * {{selected-commit-hash}}:edit
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-of-selection}}`

* `i` : Start interactive rebase
  * `m` : View rebase options
    * Window Title : Rebase options
    * `c` : continue
      * Cmd Section : Merge/Rebase: continue
      * `git rebase --continue`
    * `a` : abort
      * Cmd Section : Merge/Rebase: abort
      * `git rebase --abort`
    * `s` : skip
      * Cmd Section : Merge/Rebase: skip
      * `git rebase --skip`
    * Cancel
  * Cmd Section : Edit commit
    * Beginning interactive rebase at '{{main-branch-HEAD~1-commit-hash}}'
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{main-branch-HEAD~1-commit-hash}}`
  * Error : Cannot start interactive rebase: the HEAD commit is a merge commit or is present on the main branch, so there is no appropriate base commit to start the rebase from. You can start an interactive rebase from a specific commit by selecting the commit and pressing `e`.

* `p` : Pick
  * Cmd Section : Pull
  * `git pull --no-edit`

* `F` : Create fixup commit

  * Window Title : Create fixup commit

  * `f` : fixup! commit
    * Note : Lets you fixup another commit and keep the original commit's message.
    * Cmd Section : Create fixup commit
    * `git commit --fixup={{base-commit-hash}}`

  * `a` : amend! commit with changes
    * Note : Lets you fixup another commit and also change its commit message.
    * Open Window
      * Create "amend!" commit : {{commit-summary}}
      * Commit description : {{commit-description}}
      * `<tab>` : Press, to toggle focus
      * `<c-o>` : Commit Menu
        * `e` : Open in editor
          * Disabled: This command doesn't support switching to the editor
        * `c` : Add co-author
        * `p` : Paste commit message from clipboard
        * Cancel
    * Cmd Section : Create fixup commit
    * `git commit -m "{{commit-summary}}" -m "{{commit-description}}"`

  * `r` : amend! commit without changes (pure reword)
    * Note : Lets you change the commit message of another commit without changing its content.
    * Open Window
      * Create "amend!" commit : {{commit-summary}}
      * Commit description : {{commit-description}}
      * `<tab>` : Press, to toggle focus
      * `<c-o>` : Commit Menu
        * `e` : Open in editor
          * Disabled: This command doesn't support switching to the editor
        * `c` : Add co-author
        * `p` : Paste commit message from clipboard
        * Cancel
    * Cmd Section : Create fixup commit
    * `git commit -m "{{commit-summary}}" -m "{{commit-description}}"`

  * Cancel

* `S` : Apply fixup commits...
  * Window Title : Apply fixup commits
  * `b` : In current branch
    * Note : Squash all 'fixup!' commits in the current branch (autosquash).
    * Cmd Section : Squash all above fixup commits
    * `git rebase --interactive --rebase-merges --autostash --autosquash {{most-below-commit-only-on-this-branch}}`
  * `a` : Above the selected commit
    * Note : Squash all 'fixup!' commits above the selected commit (autosquash).
    * Cmd Section : Squash all above fixup commits
    * `git rebase --interactive --rebase-merges --autostash --autosquash {{selected-commit-hash}}^`
  * Cancel

* `<c-j>` : Move commit down one
  * Cmd Section : Move commit down
  * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-hash}}`

* `<c-k>` : Move commit up one
  * Cmd Section : Move commit up
  * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-hash}}`

* `V` : Paste (cherry pick)
  * Window Title : Cherry-pick
    * Window Content : Are you sure you want to cherry-pick the 1 copied commit(s) onto this branch?
  * Cmd Section : (Cherry-pick) paste commits
    * Cherry-picking commits
      * '{{commit-hash}} {{commit-summary}}'
      * '{{commit-hash}} {{commit-summary}}'
    * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges HEAD`

* `B` : Mark as base commit for rebase

* `A` : Amend
  * Window Title : Amend commit
    * Window Content : Are you sure you want to amend this commit with your staged files?
  * Cmd Section : Amend commit
  * `git commit --amend --no-edit --allow-empty`

* `a` : Amend commit attribute...
  * Window Title : Amend commit attribute
  * `a` : Reset author
    * Note : Reset the commit's author to the currently configured user. This will also renew the author timestamp
    * Cmd Section : Reset commit author
    * `git commit --allow-empty --only --on-edit --amend --reset-author`
  * `A` : Set author
    * Note : Set the author based on a prompt
    * Open Window
      * Set author (must look like 'Name <Email>') : {{Name <Email>}}
      * Suggestions : List of {{Name <Email>}}
      * `<tab>` : Press, to toggle focus
    * Cmd Section : Set commit author
    * `git commit --allow-empty --only --no-edit --amend "--author={{Name}} <{{Email}}>"`
  * `c` : Add co-author
    * Note : Add co-author using the Github/Gitlab metadata Co-authored-by
    * Open Window
      * Add co-author (must look like 'Name <Email>') : {{Name <Email>}}
      * Suggestions : List of {{Name <Email>}}
      * `<tab>` : Press, to toggle focus
    * Cmd Section : Add commit co-author
    * `git commit --allow-empty --amend --only -m "{{commit-summary}} Co-authored-by: {{Name}} <{{Email}}>"`
  * Cancel

* `t` : Revert
  * Window Title : Revert commit
    * Window Content : Are you sure you want to revert {{selected-commit-hash}}?
  * Cmd Section : Revert commit
  * `git revert {{selected-commit-hash}}`

* `T` : Tag commit
  * Open Window
    * Tag name : {{tag-name}}
    * Tag description : {{tag-description}}
    * `<tab>` : Press, to toggle focus
    * `<c-o>` : Commit Menu
      * `e` : Open in editor
        * Disabled: This command doesn't support switching to the editor
      * `c` : Add co-author
      * `p` : Paste commit message from clipboard
      * Cancel
  * Cmd Section : Create annotated tag
  * `git tag {{tag-name}} {{selected-commit-hash}} -m "{{tag-description}}"`
  * Note : Tag name doesn't support space in name
    * Error : fatal: '{{tag-name-with-space}}' is not a valid tag name.

* `<c-l>` : View log options...
  * Window Title : Commit Log Options
  * Toggle show whole git graph (pass the `--all` flag to `git log`)
  * Show git graph...
    * Window Title : Commit Log Options
    * () always
    * () never
    * () when maximised
    * Cancel
  * Commit sort order...
    * Window Title : Commit Log Options
    * () topological (topo-order)
    * () date-order
    * () author-date-order
    * () default
    * Cancel
  * Cancel

* `<space>` : Checkout
  * Window Title : Checkout branch or commit
  * `1` : Checkout branch '{{branch-name}}'
    * Disabled: No branches found at selected commit.
    * Cmd Section : Checkout branch
    * `git checkout {{branch-name}}`
  * `d` : Checkout commit {{selected-commit-hash}} as detached head
    * Cmd Section : Checkout commit
    * `git checkout {{selected-commit-hash}}`
  * Cancel

* `y` : Copy commit attribute to cipboard...
  * Window Title : Copy to clipboard
  * Commit hash
    * Cmd Section : Copy full commit hash to clipboard
      * Copying '{{selected-commit-hash}}' to clipboard
  * `s` : Commit subject
    * Cmd Section : Copy commit subject to clipboard
      * Copying '{{commit-summary}}' to clipboard
  * `m` : Commit message
    * Cmd Section : Copy commit message to clipboard
      * Copying '{{commit-summary}} {{commit-description}}' to clipboard
  * `u` : Commit URL
    * Cmd Section : Copy commit URL to clipboard
      * Copying '{{commit-url}}' to clipboard
  * `d` : Commit diff
    * Cmd Section : Copy commit diff to clipboard
      * Copying '{{commit-diff}}' to clipboard
  * `a` : Commit author
    * Cmd Section : Copy commit author to clipboard
      * Copying '{{Name <Email>}}' to clipboard
  * Cancel

* `o` : Open commit in browser
  * Cmd Section : Open commit in browser
  * `bash -c "xdg-open "{{github-repo-url}}/commit/{{commit-hash}}" >/dev/null"`

* `n` : Create new branch off of commit
  * Open Window
    * New branch name (branch is off of '{{selected-commit-summary}}') : {{branch-name}}
  * Cmd Section : Create branch
  * `git checkout -b {{branch-name}} {{selected-commit-hash}} --no-track`

* `g` : Reset...
  * Window Title : Reset to {{selected-commit-hash}}
  * `m` : Mixed reset `reset --mixed {{selected-commit-hash}}`
    * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as unstaged changes.
    * Cmd Section : Reset
    * `git reset --mixed {{selected-commit-hash}}`
  * `s` : Soft reset `reset --soft {{selected-commit-hash}}`
    * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as staged changes.
    * Cmd Section : Reset
    * `git reset --soft {{selected-commit-hash}}`
  * `h` : Hard reset `reset --hard {{selected-commit-hash}}`
    * Note : Reset HEAD to the chosen commit, and discard all changes between the current and chosen commit, as well as all current modifications in the working tree.
    * Cmd Section : Reset
    * `git reset --hard {{selected-commit-hash}}`
  * Cancel

* `C` : Copy (cherry-pick)

* `<c-t>` : Open external diff tool (git difftool)
  * `git difftool --no-prompt --dir-diff {{selected-commit-hash}}^ {{selected-commit-hash}} -- .`

* `<enter>` : View files

  * `<c-o>` : Copy path to clipboard
    * Cmd Section : Copy to clipboard
      * Copying '{{file-name}}' to clipboard

  * `c` : Checkout
    * Cmd Section : Checkout file
    * `git checkout {{selected-commit-hash}} -- {{file-name}}`

  * `d` : Remove
    * Window Title : Discard file changes
    * Window Content : 
    > Are you sure you want to remove changes to the selected file(s) from this commit?
    > 
    > This action will start a rebase, reverting these file changes. Be aware that if subsequent commits depend on these changes, you may need to resolve conflicts. Note: This will also reset any active custom patches.
    * Cmd Section : 
      * Changing TODO actions:
        * {{parent-of-current-commit-hash}}:edit
      * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{current-commit-hash}}`
      * `git cat-file -e HEAD^:file-1`
      * `git checkout HEAD^ -- file-1`
      * `git commit --amend --no-edit --allow-empty`
      * `git rebase --continue`

  * `o` : Open file
    * Cmd Section : Open file
      * `bash -c "xdg-open "{{file-path}}" >/dev/null"`
    * Error : xdg-open: file 'file-1' does not exist

  * `e` : Edit
    * `bash -c "vim -- "{{file-path}}""`

  * `<c-t>` : Open external diff tool (git difftool)
    * `git difftool --no-prompt {{current-commit-hash}}^ {{current-commit-hash}} -- file-1`

  * `<space>` : Toggle file included in patch

    * `<c-p>` : View custom patch options

      * Window Title : Patch options

      * `c` : Reset patch
        * Note : Clear the current patch.

      * `a` : Apply patch
        * Note : Apply the current patch to the working tree.
        * Error : file-1: does not exist in index
        * Cmd Section : Apply patch
          * Creating file '{{patch-file-path}}'
          * `git apply --3way --index "{{patch-file-path}}"`

      * `r` : Apply patch in reverse
        * Note : Apply the current patch in reverse to the working tree.
        * Error : file-1: does not exist in index
        * Cmd Section : Apply patch in reverse
          * Creating file '{{patch-file-path}}'
          * `git apply --3way --index --reverse "{{patch-file-path}}"`

      * `d` : Remove patch from original commit ({{current-commit-hash}})
        * Note : Remove the current patch from its commit. This is achieved by starting an interactive rebase at the commit, applying the patch in reverse, and then continuing the rebase. If later commits depend on the patch, you may need to resolve conflicts.
        * Error : 
        > Created autostash: {{hash}}
        > {{date-and-time}} Some todos not found in git-rebase-todo
        > error: There was a problem with the editor
        > '"/nix/store/{{nix-hash}}-lazygit-0.45.2/bin/lazygit"'.
        > Applied autostash.
        * Cmd Section : Remove patch from commit
          * Changing TODO actions:
            * {{current-commit-hash}}:edit
          * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-hash}}`

      * `i` : Move patch out into index
        * Note : Move the patch out of its commit and into the index. This is achieved by starting an interactive rebase at the commit, applying the patch in reverse, continuing the rebase to completion, and then applying the patch to the index. If later commits depend on the patch, you may need to resolve conflicts.


      * `n` : Move patch into new commit
        * Note : Move the patch out of its commit and into a new commit sitting on top of the original commit. This is achieved by starting an interactive rebase at the original commit, applying the patch in reverse, then applying the patch to the index and committing it as a new commit, before continuing the rebase to completion. If later commits depend on the patch, you may need to resolve conflicts.
        * Open Window
          * Commit summary : {{commit-summary}}
          * Commit description : {{commit-description}}
          * `<tab>` : Press, to toggle focus
          * `<c-o>` : Commit Menu
            * `e` : Open in editor
              * Disabled: This command doesn't support switching to the editor
            * `c` : Add co-author
            * `p` : Paste commit message from clipboard
            * Cancel
        * Error : 
        > Created autostash: {{hash}}
        > {{date-and-time}} Some todos not found in git-rebase-todo
        > error: There was a problem with the editor
        > '"/nix/store/{{nix-hash}}-lazygit-0.45.2/bin/lazygit"'.
        > Applied autostash.
        * Cmd Section : Move patch into new commit
          * Changing TODO actions:
            * {{current-commit-hash}}:edit
          * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-hash}}`

      * `y` : Copy path to clipboard

      * Cancel

  * `a` : Toggle all files
    * `<c-p>` : View custom patch options

  * `<enter>` : Enter file / Toggle directory collapsed

  * " \` " : Toggle file tree view

  * `-` : Collapse all files
  
  * `=` : Expand all files
  
  * `/` : Search the current view by text
    * `n` : Next match
    * `N` : Previous match
    * `<esc>` : Exit search mode

* `w` : View worktree options...
  
  * Window Title : Worktree

  * Create worktree from {{selected-commit-hash}}
  * Steps
    * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * New branch name : {{branch-name}}
  * Cmd Section : Add worktree
      * `git worktree add -b {{branch-name}} {{worktree-path}} {{selected-commit-hash}}`
      * Changing directory to {{worktree-path}}

  * Create worktree from {{selected-commit-hash}} (detached)
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * Cmd Section : Add worktree
      * `git worktree add --detach {{worktree-path}} {{selected-commit-hash}}`
      * Changing directory to {{worktree-path}}

  * Cancel

* `/` : Search the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## [4] Reflog (Local Keybind)

* `<c-o>` : Copy commit hash to clipboard
  * Cmd Section : Copy to clipboard
    * Copying '{{selected-commit-hash}}' to clipboard

* `<space>` : Checkout
  * Window Title : Checkout branc or commit
  * `1` : Checkout branch
    * Disabled: No branches found at selected commit.
    * Cmd Section : Checkout branch
    * `git checkout {{branch-name}}`
  * `d` : Checkout commit {{selected-commit-hash}} as detached head
    * Cmd Section : Checkout commit
    * `git checkout {{selected-commit-hash}}`
  * Cancel

* `y` : Copy commit attribute to clipboard...
  * Window Title : Copy to clipboard
  * Commit hash
    * Cmd Section : Copy full commit hash to clipboard
      * Copying '{{selected-commit-hash}}' to clipboard
  * `s` : Commit subject
    * Cmd Section : Copy commit subject to clipboard
      * Copying '{{commit-summary}}' to clipboard
  * `m` : Commit message
    * Cmd Section : Copy commit message to clipboard
      * Copying '{{commit-summary}} {{commit-description}}' to clipboard
  * `u` : Commit URL
    * Cmd Section : Copy commit URL to clipboard
      * Copying '{{commit-url}}' to clipboard
  * `d` : Commit diff
    * Cmd Section : Copy commit diff to clipboard
      * Copying '{{commit-diff}}' to clipboard
  * `a` : Commit author
    * Cmd Section : Copy commit author to clipboard
      * Copying '{{Name <Email>}}' to clipboard
  * Cancel

* `o` : Open commit in browser
  * Cmd Section : Open commit in browser
  * `bash -c "xdg-open "{{github-repo-url}}/commit/{{commit-hash}}" >/dev/null"`

* `n` : Create new branch off of commit
  * Open Window
    * New branch name (branch is off of '{{selected-commit-summary}}') : {{branch-name}}
  * Cmd Section : Create branch
  * `git checkout -b {{branch-name}} {{selected-commit-hash}} --no-track`

* `g` : Reset...
  * Window Title : Reset to {{selected-commit-hash}}
  * `m` : Mixed reset `reset --mixed {{selected-commit-hash}}`
    * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as unstaged changes.
    * Cmd Section : Reset
    * `git reset --mixed {{selected-commit-hash}}`
  * `s` : Soft reset `reset --soft {{selected-commit-hash}}`
    * Note : Reset HEAD to the chosen commit, and keep the changes between the current and chosen commit as staged changes.
    * Cmd Section : Reset
    * `git reset --soft {{selected-commit-hash}}`
  * `h` : Hard reset `reset --hard {{selected-commit-hash}}`
    * Note : Reset HEAD to the chosen commit, and discard all changes between the current and chosen commit, as well as all current modifications in the working tree.
    * Cmd Section : Reset
    * `git reset --hard {{selected-commit-hash}}`
  * Cancel

* `C` : Copy (cherry-pick)

* `<c-r>` : Reset copied (cherry-picked) commits selection

* `<c-t>` : Open external diff tool (git difftool)
  * `git difftool --no-prompt --dir-diff {{selected-commit-hash}}^ {{selected-commit-hash}} -- .`

* `<enter>` : View commits

* `w` : View worktree options...
  
  * Window Title : Worktree

  * Create worktree from {{selected-commit-hash}}
  * Steps
    * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * New branch name : {{branch-name}}
  * Cmd Section : Add worktree
      * `git worktree add -b {{branch-name}} {{worktree-path}} {{selected-commit-hash}}`
      * Changing directory to {{worktree-path}}

  * Create worktree from {{selected-commit-hash}} (detached)
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * Cmd Section : Add worktree
      * `git worktree add --detach {{worktree-path}} {{selected-commit-hash}}`
      * Changing directory to {{worktree-path}}

  * Cancel

* `/` : Filter the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## [5] Stash (Local Keybind)

* `<space>` : Apply
  * Window Title : Stash apply
    * Window Content : Are you sure you want to apply this stash entry?
  * Cmd Section : Stash
    * `git stash apply stash@{0}`
  * Error : 
  > Auto-merging file-1
  > CONFLICT (content): Merge conflict in file-1
  > HEAD detached at {{commit-hash}}
  > Unmerged paths:
  >   (use "git restore --staged <file>..." to unstage)
  >   (use "git add <file>..." to mark resolution)
  >    both modified: file-1
  > 
  > no changes added to commit (use "git add" and/or "git commit -a")

* `g` : Pop
  * Window Title : Stash pop
    * Window Content : Are you sure you want to pop this stash entry?
  * Cmd Section : Stash
  * `git stash pop stash@{<index>}`

* `d` : Drop
  * Window Title : Stash drop
    * Window Content : Are you sure you want to drop this stash entry?
  * Cmd Section : Stash
  * `git stash drop stash@{<index>}`

* `n` : New branch
  * Open Window
    * New branch name (branch is off of 'stash@{<index>}: {{stash-message}}') : {{branch-name}}
  * Cmd Section : Create branch
  * `git checkout -b {{branch-name}} stash@{<index>} --no-track`

* `r` : Rename stash
  * Open Window
    * Rename stash: stash@{<index>} : {{stash-message}}
  * Cmd Section : Rename stash
    * `git stash drop stash@{<index>}`
    * `git stash store -m "{{stash-message}}"`
    * {{Hash}}

* `<enter>` : View files

  * `<c-o>` : Copy path to clipboard
    * Cmd Section : Copy to clipboard
      * Copying '{{file-name}}' to clipboard

  * `c` : Checkout
    * Cmd Section : Checkout file
    * `git checkout {{selected-commit-hash}} -- {{file-name}}`

  * `d` : Remove
    * Window Title : Discard file changes
    * Window Content : 
    > Are you sure you want to remove changes to the selected file(s) from this commit?
    > 
    > This action will start a rebase, reverting these file changes. Be aware that if subsequent commits depend on these changes, you may need to resolve conflicts. Note: This will also reset any active custom patches.
    * Cmd Section : 
      * Changing TODO actions:
        * {{parent-of-current-commit-hash}}:edit
      * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{current-commit-hash}}`
      * `git cat-file -e HEAD^:file-1`
      * `git checkout HEAD^ -- file-1`
      * `git commit --amend --no-edit --allow-empty`
      * `git rebase --continue`

  * `o` : Open file
    * Cmd Section : Open file
      * `bash -c "xdg-open "{{file-path}}" >/dev/null"`
    * Error : xdg-open: file 'file-1' does not exist

  * `e` : Edit
    * `bash -c "vim -- "{{file-path}}""`

  * `<c-t>` : Open external diff tool (git difftool)
    * `git difftool --no-prompt {{current-commit-hash}}^ {{current-commit-hash}} -- file-1`

  * `<space>` : Toggle file included in patch

    * `<c-p>` : View custom patch options

      * Window Title : Patch options

      * `c` : Reset patch
        * Note : Clear the current patch.

      * `a` : Apply patch
        * Note : Apply the current patch to the working tree.
        * Error : file-1: does not exist in index
        * Cmd Section : Apply patch
          * Creating file '{{patch-file-path}}'
          * `git apply --3way --index "{{patch-file-path}}"`

      * `r` : Apply patch in reverse
        * Note : Apply the current patch in reverse to the working tree.
        * Error : file-1: does not exist in index
        * Cmd Section : Apply patch in reverse
          * Creating file '{{patch-file-path}}'
          * `git apply --3way --index --reverse "{{patch-file-path}}"`

      * `d` : Remove patch from original commit ({{current-commit-hash}})
        * Note : Remove the current patch from its commit. This is achieved by starting an interactive rebase at the commit, applying the patch in reverse, and then continuing the rebase. If later commits depend on the patch, you may need to resolve conflicts.
        * Error : 
        > Created autostash: {{hash}}
        > {{date-and-time}} Some todos not found in git-rebase-todo
        > error: There was a problem with the editor
        > '"/nix/store/{{nix-hash}}-lazygit-0.45.2/bin/lazygit"'.
        > Applied autostash.
        * Cmd Section : Remove patch from commit
          * Changing TODO actions:
            * {{current-commit-hash}}:edit
          * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-hash}}`

      * `i` : Move patch out into index
        * Note : Move the patch out of its commit and into the index. This is achieved by starting an interactive rebase at the commit, applying the patch in reverse, continuing the rebase to completion, and then applying the patch to the index. If later commits depend on the patch, you may need to resolve conflicts.


      * `n` : Move patch into new commit
        * Note : Move the patch out of its commit and into a new commit sitting on top of the original commit. This is achieved by starting an interactive rebase at the original commit, applying the patch in reverse, then applying the patch to the index and committing it as a new commit, before continuing the rebase to completion. If later commits depend on the patch, you may need to resolve conflicts.
        * Open Window
          * Commit summary : {{commit-summary}}
          * Commit description : {{commit-description}}
          * `<tab>` : Press, to toggle focus
          * `<c-o>` : Commit Menu
            * `e` : Open in editor
              * Disabled: This command doesn't support switching to the editor
            * `c` : Add co-author
            * `p` : Paste commit message from clipboard
            * Cancel
        * Error : 
        > Created autostash: {{hash}}
        > {{date-and-time}} Some todos not found in git-rebase-todo
        > error: There was a problem with the editor
        > '"/nix/store/{{nix-hash}}-lazygit-0.45.2/bin/lazygit"'.
        > Applied autostash.
        * Cmd Section : Move patch into new commit
          * Changing TODO actions:
            * {{current-commit-hash}}:edit
          * `git rebase --interactive --autostash --keep-empty --no-autosquash --rebase-merges {{below-commit-hash}}`

      * `y` : Copy path to clipboard

      * Cancel

  * `a` : Toggle all files
    * `<c-p>` : View custom patch options

  * `<enter>` : Enter file / Toggle directory collapsed

  * " \` " : Toggle file tree view

  * `-` : Collapse all files
  
  * `=` : Expand all files
  
  * `/` : Search the current view by text
    * `n` : Next match
    * `N` : Previous match
    * `<esc>` : Exit search mode

* `w` : View worktree options...

  * Window Title : Worktree

  * Create worktree from stash@{<index>}
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
      * New branch name : {{branch-name}}
    * Cmd Section : Add worktree
      * `git worktree add -b {{branch-name}} {{worktree-path}} stash@{<index>}`
      * Changing directory to {{worktree-path}}

  * Create worktree from stash@{<index>} (detached)
    * Steps
      * New worktree path : {{worktree-path}} [Directory will be created, if not exists]
    * Cmd Section : Add worktree
      * `git worktree add --detach {{worktree-path}} stash@{<index>}`
      * Changing directory to {{worktree-path}}

  * Cancel

* `/` : Filter the current view by text
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

## Global Keybind

* `<c-r>` : Switch to recent repo
* `<pgup>` : Scroll up main window
* `pgdown` : Scroll down main window
* `@` : View command log options...
* `P` : Push
* `p` : Pull
  * `git pull --no-edit`
* `)` : Increase rename similarity threshold
* `(` : Decrease rename similarity threshold
* `}` : Increase diff context size
* `{` : Decrease diff context size
* `:` : Execute shell command...
* `<c-p>` : View custom patch options...
  * Error : No patch created yet. To start building a patch, use `space` on a commit file or `enter` to add specific lines
* `m` : View merge/rebase options...
* `R` : Refresh
* `+` : Next screen mode (normal/half/fullscreen)
* `_` : Prev screen mode
* `?` : Open keybindings menu
* `<c-s>` : View filter options...
  * Window Title : "Filtering"
  * Filter by {{file-path}}
  * Enter path to filter by
  * Enter author to filter by
  * Cancel
* `W` : View diffing options
  * `git diff --stat -p {{branch/tag}} -- {{file-path}}`
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
  * `n` : Next match
  * `N` : Previous match
  * `<esc>` : Exit search mode

# Keybindings Collection

* Zoom/Fullscreen Unstaged Changes
  * As for zooming only the unstaged changes, you can't, but you can press `enter` on a selected file to enter the `diff pane`. <sup>{8}</sup>
  * `<tab> Switch to other panel (staged/unstaged changes)` : If you're talking about switching between the staged and unstaged changes, there is a keybinding in the help menu as well.<sup>{10}</sup>

# Commands

* `winpty lazygit` : Open Lazygit in Git-Bash <sup>{4}</sup>

# Lazygit.md

## Notes

* Lazygit "diff" uses [dandavison/delta GitHub](https://github.com/dandavison/delta) <sup>{3}</sup>

# References

* next-sl: {13}

## Websites

* [jesseduffield/lazygit GitHub](https://github.com/jesseduffield/lazygit)
* [dandavison/delta GitHub](https://github.com/dandavison/delta)

## Config

* [Lazygit Config](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md) <sup>{12}</sup>

## Tutorials

* {12} [lazygit deep dive => a productive terminal git UI](https://oliverguenther.de/2021/04/lazygit-an-introduction-series/)

## Commands From

* Keybindings
  * {8} [Jump to specific window and maximize it~ #1998](https://github.com/jesseduffield/lazygit/discussions/1998)
  * {10} [How to Move to Unstaged Changes Panel #3103](https://github.com/jesseduffield/lazygit/discussions/3103)

* Set Git Tools
  * {7} [dandavison/delta GitHub](https://github.com/dandavison/delta)
  * {5} [Viewing all `git diffs` with vimdiff](https://stackoverflow.com/questions/3713765/viewing-all-git-diffs-with-vimdiff)
  * {6} [Use vimdiff as git mergetool](https://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/)
  * {11} [How do I make git use the editor of my choice for editing commit messages?](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages)

## Guides

* General
  * {4} [LG just hangs on Git Bash Window (Windows) #235](https://github.com/jesseduffield/lazygit/issues/235)
  * {3} [Related projects => Using delta](https://dandavison.github.io/delta/related-projects.html)

## Error and Solution

* Installation
  * {9} [No git diff displayed in lazygit menu #4224](https://github.com/jesseduffield/lazygit/discussions/4224)

## YouTube Tutorials
  
* {1} [15 Lazygit Features In Under 15 Minutes BY Jesse Duffield](https://www.youtube.com/watch?v=CPLdltN7wgE)
* {2} [Lazygit Now Has Mouse Support! BY Jesse Duffield](https://www.youtube.com/watch?v=F7TCWUO9vt4)
* {3} [Lazygit - The Best Way To Use Git On The Terminal & Neovim BY Josean Martinez](https://www.youtube.com/watch?v=Ihg37znaiBo)
