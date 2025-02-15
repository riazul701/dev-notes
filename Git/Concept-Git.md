# Concept-Git.md

## Websites
  
* [Atlassian/Bitbucket Git Tutorials => Simple Explain Selected](https://www.atlassian.com/git/tutorials)
* [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)
* [GitHub Docs](https://docs.github.com/en)

# Syntax Concept

## [What's the Difference Between Head^ and Head~ in Git?](https://betterstack.com/community/questions/head-caret-head-tilde-notation/)

* In Git, `HEAD^` and `HEAD~` are used to refer to previous commits, but they have slightly different meanings and uses.

**`HEAD^` (Caret Notation)**

* Syntax: `HEAD^` or `HEAD^n` where `n` is an optional number.
* Meaning: Refers to the parent commit(s) of the `HEAD` commit.
* Usage:
  * `HEAD^` is shorthand for `HEAD^1`, which refers to the first parent of the current commit. In the case of a merge commit, it refers to the first parent (i.e., the commit that was on the branch before the merge).
  * `HEAD^2` refers to the second parent of a merge commit. Merge commits have more than one parent, so you can specify which parent you want to refer to.
* `git log HEAD^` : This will show the log of the commit immediately before the current commit.

**`HEAD~` (Tilde Notation)**

* Syntax: `HEAD~n` where `n` is a number.
* Meaning: Refers to the commit that is `n` commits before `HEAD` in the commit history.
* Usage:
  * `HEAD~1` refers to the commit directly before the current commit, which is equivalent to `HEAD^` or `HEAD^1`.
  * `HEAD~2` refers to the commit that is two commits before the current commit, and so on.
* `git log HEAD~2` : This will show the log of the commit that is two steps before the current commit.

**Examples**

* These commands show the first parent and the second parent (if it exists) of the current commit.
```shell
git show HEAD^
git show HEAD^2
```
* These commands show the commit one step back and three steps back from the current commit.
```shell
git show HEAD~1
git show HEAD~3
```

# Git Worktree

## [Git Worktree](https://www.geeksforgeeks.org/git-worktree/)

* Git’s Worktree is a powerful tool that allows you to check out multiple branches simultaneously in the same repository.

* It’s especially useful when you need to work on multiple features, bug fixes, or perform code reviews without having to switch branches or clone repositories constantly.

* A Git Worktree allows you to have multiple working directories in the same repository.
  * Each Worktree is an independent checkout of a branch that you can work on simultaneously without affecting other branches.
  
* This feature is particularly valuable when you need to:
  * Work on multiple branches simultaneously.
  * Test or experiment with changes without disrupting your main working directory.
  * Perform code reviews while still actively working on another feature.

# Git Checkout

## [Git checkout](https://www.atlassian.com/git/tutorials/using-branches/git-checkout)

* `git checkout` command operates upon three distinct entities: files, commits, and branches.

* In modern versions of Git, you can then checkout the remote branch like a local branch.
  * Older versions of Git require the creation of a new branch based on the remote.

* Detached HEADS
  * When you check out a commit, it switches into a `“detached HEAD”` state.
  * If you were to start developing a feature while in a detached `HEAD` state, there would be no branch allowing you to get back to it.
  * When you inevitably check out another branch (e.g., to merge your feature in), there would be no way to reference your feature.
  * However, if you’re just looking at an old commit, it doesn’t really matter if you’re in a detached `HEAD` state or not.

# Git Revert

## [Git revert](https://www.atlassian.com/git/tutorials/undoing-changes/git-revert)

* A revert operation will take the specified commit, inverse the changes from that commit, and create a new "revert commit".

* It doesn’t change the project history, which makes it a “safe” operation for commits that have already been published to a shared repository.

# Git Reset

## [Git reset](https://www.atlassian.com/git/tutorials/undoing-changes/git-reset)

* `git ls-files` command is essentially a debug utility for inspecting the state of the Staging Index tree.

* `--hard`
  * This is the most direct, DANGEROUS, and frequently used option.
  * Any previously pending changes to the Staging Index and the Working Directory gets reset to match the state of the Commit Tree.

* `--mixed`
  * This is the default operating mode.
  * The Staging Index is reset to the state of the specified commit.
  * Any changes that have been undone from the Staging Index are moved to the Working Directory.

* `--soft`
  * When the --soft argument is passed, the ref pointers are updated and the reset stops there.
  * The Staging Index and the Working Directory are left untouched.

* Orphaned commits
  * `Git reset` will never delete a commit, however, commits can become 'orphaned' which means there is no direct path from a ref to access them.
  * These orphaned commits can usually be found and restored using `git reflog`.
  * Git will permanently delete any orphaned commits after it runs the internal garbage collector.
  * By default, Git is configured to run the garbage collector every 30 days.

* Don't reset public history
  * Removing a commit that other team members have continued developing poses serious problems for collaboration.
  * If you need to fix a public commit, the `git revert` command was designed specifically for this purpose.

* Unstaging a file
  * `git reset` helps you keep your commits highly-focused by letting you unstage changes that aren’t related to the next commit.

* Removing local commits
  * New experiment, completely throw it away after committing a few snapshots.

# Resetting, checking out & reverting

## [Resetting, checking out & reverting](https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting)

* Revert is considered a safe operation for 'public undos' as it creates new history which can be shared remotely and doesn't overwrite history remote team members may be dependent on.

**Git reset vs revert vs checkout reference**

| Command | Scope | Common use cases |
|-----------|-----------|------------|
| `git reset` | Commit-level | Discard commits in a private branch or throw away uncommitted changes |
| `git reset` | File-level | Unstage a file |
| `git checkout` | Commit-level | Switch between branches or inspect old snapshots |
| `git checkout` | File-level | Discard changes in the working directory |
| `git revert` | Commit-level | Undo commits in a public branch |
| `git revert` | File-level | (N/A) |

**Reset a specific commit**

* `git checkout hotfix git reset HEAD~2` : The following command moves the hotfix branch backwards by two commits. The two commits that were on the end of hotfix are now dangling, or orphaned commits. This means they will be deleted the next time Git performs a garbage collection.

* In addition to moving the current branch, you can also get git reset to alter the staged snapshot and/or the working directory by passing it one of the following flags:
  * `--soft` – The staged snapshot and working directory are not altered in any way.
  * `--mixed` – The staged snapshot is updated to match the specified commit, but the working directory is not affected. This is the default option.
  * `--hard` – The staged snapshot and the working directory are both updated to match the specified commit.

**Checkout old commits**

* Git forces you to commit or [stash](https://www.atlassian.com/git/tutorials/saving-changes/git-stash) any changes in the working directory that will be lost during the checkout operation.

* `git checkout HEAD~2` : The following command will check out the grandparent of the current commit.
  * This is useful for quickly inspecting an old version of your project.
  * However, since there is no branch reference to the current HEAD, this puts you in a detached `HEAD` state.
  * This can be dangerous if you start adding new commits because there will be no way to get back to them after you switch to another branch.
  * For this reason, you should always create a new branch before adding commits to a detached `HEAD`.

* `git revert` should be used to undo changes on a public branch, and `git reset` should be reserved for undoing changes on a private branch.

**Git reset a specific file**

* The `--soft`, `--mixed`, and `--hard` flags do not have any effect on the file-level version of `git reset`, as the staged snapshot is always updated, and the working directory is never updated.

**Git checkout file**

* Checking out a file is similar to using `git reset` with a file path, except it updates the working directory instead of the stage.

# Git Clean

## [Git clean](https://www.atlassian.com/git/tutorials/undoing-changes/git-clean)

* `git clean` command operates on untracked files.

* Untracked files are files that have been created within your repo's working directory but have not yet been added to the repository's tracking index using the `git add` command.

* When finally executed `git clean` is not undo-able.

* When fully executed, `git clean` will make a hard filesystem deletion, similar to executing the command line `rm` utility.

* By default `git clean` will not operate recursively on directories

* The force option initiates the actual deletion of untracked files from the current directory.

* This will not remove untracked folders or files specified by `.gitignore`.
  * The `-x` option tells git clean to also include any ignored files.

# Git RM

## [Git RM](https://www.atlassian.com/git/tutorials/undoing-changes/git-rm)

* The primary function of git rm is to remove tracked files from the Git index.

* Executing `git rm` is not a permanent update. The command will update the staging index and the working directory. These changes will not be persisted until a new commit is created and the changes are added to the commit history.

* The `git rm` command operates on the current branch only.

* It is a convenience method that combines the effect of the default shell `rm` command with `git add`.
 

# Git Diff

## [Git diff](https://www.atlassian.com/git/tutorials/saving-changes/git-diff)

## Associated Article

* [How does "index f2e4113..d4b9bfc 100644" in git diff correspond to SHA1 ID in gitk?](https://stackoverflow.com/questions/19224476/how-does-index-f2e4113-d4b9bfc-100644-in-git-diff-correspond-to-sha1-id-in-gi)
