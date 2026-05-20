# Commands/Usage

## Pager, Difftool, Mergetool

* Use `delta` as pager
```gitconfig
[core]
    pager = delta
```

* Use `vimdiff` as difftool/mergetool
```gitconfig
[diff]
    tool = vimdiff

[merge]
    tool = vimdiff
```

## PATH

### In Git-Bash Windows, Add Bash To PATH 

**ChatGPT: "git found on PATH, but bash not found."**

* Git-Bash is installed via `scoop` package manager.

* `git` command is added to PATH, but `bash` is not added intentionally.
  * Important note (why this happens)
  * Scoop mainly exposes:
    * `git.exe` via shims (good for CLI usage)
    * but does NOT always shim `bash.exe`, because it’s considered an internal tool of Git for Windows
    * So `git` works, but `bash` is not automatically global.

* `scoop prefix git` (Inside PowerShell) : First confirm where Git Bash actually is. Then check inside that folder.
  * Typical path: `C:\Users\<you>\scoop\apps\git\current\usr\bin\bash.exe`
  * `dir "$(scoop prefix git)\usr\bin\bash.exe"` (Inside PowerShell) : Now verify. If that file exists → Bash is installed, just not in PATH.

* `& "$(scoop prefix git)\usr\bin\bash.exe"` (Inside PowerShell) : Use full path once. You can launch it directly. If this works, your issue is 100% PATH exposure, not missing install.

* `$env:Path += ";$(scoop prefix git)\usr\bin"` (Inside PowerShell) : Temporary (current session only).
  * `bash --version` (Inside PowerShell) : Now test

* `setx PATH "$env:PATH;$(scoop prefix git)\usr\bin"` (Inside PowerShell) : Permanent fix (recommended). Then restart terminal.
  * `bash --version` (Inside PowerShell) : Verify after terminal restart.

* `bash` (Inside PowerShell) : Enter into `bash` shell.

## Git-Credential-Manager (GCM)

* Shows installation path: `which git-credential-manager`
* Shows version: `git-credential-manager --version`
* Shows help: `git-credential-manager --help`

## Git Dubious Ownership

* ["git submodule update" failed with 'fatal: detected dubious ownership in repository at...'](https://stackoverflow.com/questions/72978485/git-submodule-update-failed-with-fatal-detected-dubious-ownership-in-reposit)
  * `git config --global --add safe.directory '*'` : Silence all warnings related to Git's `safe.directory` system.

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
  * [Atlassian/Bitbucket Git Tutorials => Simple Explain Selected](https://www.atlassian.com/git/tutorials)
  * [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)
  * [GitHub Docs](https://docs.github.com/en)
  * [Bitbucket Docs](https://support.atlassian.com/bitbucket-cloud/resources/)
  * [Backlog Git Tutorial](https://nulab.com/learn/software-development/git-tutorial/)
  * [git-rebase.io](https://git-rebase.io/)
  * [geeksforgeeks.org => Git Cheat Sheet](https://www.geeksforgeeks.org/git-cheat-sheet/)
  * [Git => Archlinux Wiki](https://wiki.archlinux.org/title/Git)

* Collection
  * [o2sh/onefetch GitHub => Command-line Git information tool](https://github.com/o2sh/onefetch)
  * [orhun/git-cliff GitHub => Changelog Generator](https://github.com/orhun/git-cliff)
  * [git-ftp/git-ftp GitHub](https://github.com/git-ftp/git-ftp)
  * [gitjournal.io](https://gitjournal.io/) || [GitJournal/GitJournal](https://github.com/GitJournal/GitJournal)
  * [sobolevn/git-secret GitHub](https://github.com/sobolevn/git-secret)
  * [hbons/SparkleShare GitHub](https://github.com/hbons/SparkleShare)
  * [erikbern/git-of-theseus GitHub](https://github.com/erikbern/git-of-theseus)

## Notes

# Problem and Solution

* Error: fatal: detected dubious ownership in repository at... To add an exception for this directory, call:...
  * Solution:
  * [How to correct `git` reporting `detected dubious ownership in repository` without adding `safe.directory` when using WSL?](https://stackoverflow.com/questions/73485958/how-to-correct-git-reporting-detected-dubious-ownership-in-repository-withou)
  * [git submodule update failed with 'fatal: detected dubious ownership in repository at'](https://stackoverflow.com/questions/72978485/git-submodule-update-failed-with-fatal-detected-dubious-ownership-in-repositor)
  * `git config --global --add safe.directory '*'`
  * Note: If you are using Windows Command Prompt, do not add single-quotes to the asterisk, i.e., `git config --global --add safe.directory *`

# References

* next-sl: {3}

## Commands From

## Guides

* General
  * {2} [Git Detached Head: What This Means and How to Recover](https://www.cloudbees.com/blog/git-detached-head)

* Credential/Access
  * {1} [SSH vs. HTTPS for Git: Which One Should You Use?](https://phoenixnap.com/kb/git-ssh-vs-https)

