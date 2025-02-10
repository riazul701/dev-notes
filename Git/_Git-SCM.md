# Commands/Usage

## Git-Credential-Manager (GCM)

* Shows installation path: `which git-credential-manager`
* Shows version: `git-credential-manager --version`
* Shows help: `git-credential-manager --help`

## Best Practices

### Tense of Git Commit Message

* [Use past tense in git commit messages BY Philomatics](https://www.youtube.com/watch?v=SQNb-NxZBPQ)
  * @LukinoAndCo: Present tense for commits. Past tense for release notes.
  * [Should I use past or present tense in git commit messages?](https://stackoverflow.com/questions/3580013/should-i-use-past-or-present-tense-in-git-commit-messages/8059167#8059167)
  * [git.kernel.org => imperative-mood](https://git.kernel.org/pub/scm/git/git.git/tree/Documentation/SubmittingPatches?h=v2.36.1#n181)
  * [[imperative-mood]]
  > Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
  > instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
  > to do frotz", as if you are giving orders to the codebase to change
  > its behavior.  Try to make sure your explanation can be understood
  > without external resources. Instead of giving a URL to a mailing list
  > archive, summarize the relevant points of the discussion.

# Contents of Git-SCM

## Websites

* [Git Official Site](https://git-scm.com/)
* [Git SCM to Windows => Official](https://gitforwindows.org/)
* [MSYS2](https://www.msys2.org/)
* [git-ecosystem/git-credential-manager](https://github.com/git-ecosystem/git-credential-manager)
* [Git GUI Clients](https://git-scm.com/downloads/guis)

* GitIgnore/GitAttributes
  * [github/gitignore GitHub](https://github.com/github/gitignore)
  * [gitattributes/gitattributes GitHub](https://github.com/gitattributes/gitattributes)

* Fzf with Git
  * [wfxr/forgit GitHub => A utility tool powered by fzf for using git interactively](https://github.com/wfxr/forgit)
  * [junegunn/fzf-git.sh GitHub => bash and zsh key bindings for Git objects, powered by fzf](https://github.com/junegunn/fzf-git.sh)

* GitHub
  * [GitHub Pages => Websites for you and your projects](https://pages.github.com/)

* Git Diff/Merge Tool
  * [dandavison.github.io/delta](https://dandavison.github.io/delta/) || [dandavison/delta GitHub](https://github.com/dandavison/delta)
  * [Vim documentation: diff](https://vimdoc.sourceforge.net/htmldoc/diff.html)

* Extension/Addon
  * [newren/git-filter-repo GitHub](https://github.com/newren/git-filter-repo)

* Tutorials
  * [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)
  * [GitHub Docs](https://docs.github.com/en)
  * [Bitbucket Docs](https://support.atlassian.com/bitbucket-cloud/resources/)
  * [Backlog Git Tutorial](https://nulab.com/learn/software-development/git-tutorial/)
  * [git-rebase.io](https://git-rebase.io/)

* Collection
  * [o2sh/onefetch GitHub => Command-line Git information tool](https://github.com/o2sh/onefetch)
  * [orhun/git-cliff GitHub => Changelog Generator](https://github.com/orhun/git-cliff)
  * [git-ftp/git-ftp GitHub](https://github.com/git-ftp/git-ftp)
  * [gitjournal.io](https://gitjournal.io/) || [GitJournal/GitJournal](https://github.com/GitJournal/GitJournal)
  * [sobolevn/git-secret GitHub](https://github.com/sobolevn/git-secret)
  * [hbons/SparkleShare GitHub](https://github.com/hbons/SparkleShare)
  * [erikbern/git-of-theseus GitHub](https://github.com/erikbern/git-of-theseus)

## Notes

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

# Settings/Works

## Cross Platform Line Ending

### Commands/Instructions - EOL

* {3} [Resolving Git line ending issues in containers (resulting in many modified files)](https://code.visualstudio.com/docs/devcontainers/tips-and-tricks#_resolving-git-line-ending-issues-in-containers-resulting-in-many-modified-files)
* {4} [Configuring Git to handle line endings](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings)

* Git AutoCRLF Settings: `git config core.autocrlf true` [Project Specific] <sup>{6} {7}</sup>
* Set AutoCRLF to Operating System "Native": `git config --global --unset core.autocrlf` <sup>{8}</sup>
* Typically adding or modifying a .gitattributes file in your repository is the most reliable way to solve this problem. <sup>{3} {4}</sup>
```shellscript
# * text=auto eol=crlf
* text=auto eol=lf
*.{cmd,[cC][mM][dD]} text eol=crlf
*.{bat,[bB][aA][tT]} text eol=crlf
```

### Refreshing a repository after changing line endings

* {4} [Configuring Git to handle line endings](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings)
* [Refreshing a repository after changing line endings](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings?platform=windows#refreshing-a-repository-after-changing-line-endings)

* After you set the `core.autocrlf` option or commit a `.gitattributes` file, Git automatically changes line endings to match your new configuration. You may find that Git reports changes to files that you have not modified.

To ensure that all the line endings in your repository match your new configuration, back up your files with Git, then remove and restore all of the files to normalize the line endings.

1. Before adding or committing any changes, verify that Git has applied the configuration correctly. For example, Git automatically determines whether files in a repository are text or binary files. To avoid corruption of binary files in your repository, we recommend that you explicitly mark files as binary in `.gitattributes`. For more information, see [gitattributes - Defining attributes per path](https://www.git-scm.com/docs/gitattributes#_marking_files_as_binary) in the Git documentation.

2. To avoid losing any local changes to files in the repository, add and commit any outstanding changes by running the following commands.
```shellscript
git add . -u
git commit -m "Saving files before refreshing line endings"
```

3. To update all files on the current branch to reflect the new configuration, run the following commands.
```shellscript
git rm -rf --cached .
git reset --hard HEAD
```

4. To display the rewritten, normalized files, run the following command.
```shellscript
git status
```

5. Optionally, to commit any outstanding changes in your repository, run the following command.
```shellscript
git commit -m "Normalize all the line endings"
```

### EOL Programs <sup>{14}</sup>

* file - Show line endings
* dos2unix - Convert Windows(crlf) line endings to Unix/Linux(lf)
* unix2dos - Convert Unix/Linux(lf) line endings to Windows(crlf)

## GitIgnore

* [How do I make Git forget about a file that was tracked, but is now in .gitignore?](https://stackoverflow.com/questions/1274057/how-do-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore)

* WARNING: While this will not remove the physical file from your local machine, it will remove the files from other developers' machines on their next `git pull`.
* `.gitignore` will prevent untracked files from being added (without an `add -f`) to the set of files tracked by Git. However, Git will continue to track any files that are already being tracked.
* To stop tracking a file, we must remove it from the index: `git rm --cached <file>`
* To remove a folder and all files in the folder recursively: `git rm -r --cached <folder>`
* The removal of the file from the head revision will happen on the next commit.

# Problem and Solution

* Error: fatal: detected dubious ownership in repository at... To add an exception for this directory, call:...
  * Solution:
  * [How to correct `git` reporting `detected dubious ownership in repository` without adding `safe.directory` when using WSL?](https://stackoverflow.com/questions/73485958/how-to-correct-git-reporting-detected-dubious-ownership-in-repository-withou)
  * [git submodule update failed with 'fatal: detected dubious ownership in repository at'](https://stackoverflow.com/questions/72978485/git-submodule-update-failed-with-fatal-detected-dubious-ownership-in-repositor)
  * `git config --global --add safe.directory '*'`
  * Note: If you are using Windows Command Prompt, do not add single-quotes to the asterisk, i.e., `git config --global --add safe.directory *`

# References

* next-sl: {20}

## Guides

* General
  * [Git Detached Head: What This Means and How to Recover](https://www.cloudbees.com/blog/git-detached-head)

* Credential/Access
  * {1} [SSH vs. HTTPS for Git: Which One Should You Use?](https://phoenixnap.com/kb/git-ssh-vs-https)

* Cross Platform Line Ending
  * {2} [GitAttributes](https://git-scm.com/docs/gitattributes)
  * {3} [Resolving Git line ending issues in containers (resulting in many modified files)](https://code.visualstudio.com/docs/devcontainers/tips-and-tricks#_resolving-git-line-ending-issues-in-containers-resulting-in-many-modified-files)
  * {4} [Configuring Git to handle line endings](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings)
  * {5} [Mind the End of Your Line](https://adaptivepatchwork.com/2012/03/01/mind-the-end-of-your-line/)
  * {6} [Why should I use core.autocrlf=true in Git?](https://stackoverflow.com/questions/2825428/why-should-i-use-core-autocrlf-true-in-git)
  * {7} [Git status ignore line endings / identical files / windows & linux environment / dropbox / meld](https://stackoverflow.com/questions/20496084/git-status-ignore-line-endings-identical-files-windows-linux-environment)
  * {8} [How can I remove an entry in global configuration with git config?](https://stackoverflow.com/questions/11868447/how-can-i-remove-an-entry-in-global-configuration-with-git-config)
  * {14} [CR LF line endings - understanding and fixing the invisible characters hiding between the lines](https://www.youtube.com/watch?v=zn7m2Mdm_Vg)
