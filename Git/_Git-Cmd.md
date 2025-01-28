# Commands/Usage

## General Commands

* Go to the project’s directory
  * `cd /home/user/my_project` : for Linux <sup>{1}</sup>
  * `cd /Users/user/my_project` : for macOS <sup>{1}</sup>
  * `cd C:/Users/user/my_project` : for Windows <sup>{1}</sup>

* `echo 'My Project' > README` : Add text to "README" file <sup>{1}</sup>

* `echo '# test line' >> CONTRIBUTING.md` : Append text to "CONTRIBUTING.md" file <sup>{1}</sup>

* `vim CONTRIBUTING.md` : Edit "CONTRIBUTING.md" file using "vim" editor <sup>{1}</sup>

## Notes

* GitHub changed the default branch name from `master` to `main` in mid-2020. However, Git itself still uses `master` as the default <sup>{1}</sup>

## Install Git

* `sudo apt install git-all` : If you’re on a Debian-based distribution, such as Ubuntu, try `apt` <sup>{1}</sup>
* `sudo dnf install git-all` : If you’re on Fedora (or any closely-related RPM-based distribution, such as RHEL or CentOS), you can use `dnf` <sup>{1}</sup>

## GitIgnore

* In the simple case, a repository might have a single .gitignore file in its root directory, which applies recursively to the entire repository. <sup>{1}</sup>

* However, it is also possible to have additional .gitignore files in subdirectories. The rules in these nested `.gitignore` files apply only to the files under the directory where they are located. <sup>{1}</sup>

* GitHub maintains a fairly comprehensive list of good .gitignore file examples for dozens of projects and languages at https://github.com/github/gitignore if you want a starting point for your project. <sup>{1}</sup>

* Here is another example .gitignore file: <sup>{1}</sup>
```shell
# ignore all .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in any directory named build
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory and any of its subdirectories
doc/**/*.pdf
```

## git config

* `git config` variables can be stored in three different places: <sup>{1}</sup>

  * `[path]/etc/gitconfig` file: Contains values applied to every user on the system and all their repositories. If you pass the option `--system` to `git config`, it reads and writes from this file specifically. Because this is a system configuration file, you would need administrative or superuser privilege to make changes to it. <sup>{1}</sup>
  * `~/.gitconfig` or `~/.config/git/config` file: Values specific personally to you, the user. You can make Git read and write to this file specifically by passing the `--global` option, and this affects `all` of the repositories you work with on your system. <sup>{1}</sup>
  * `config` file in the Git directory (that is, `.git/config`) of whatever repository you’re currently using: Specific to that single repository. You can force Git to read from and write to this file with the `--local` option, but that is in fact the default. Unsurprisingly, you need to be located somewhere in a Git repository for this option to work properly. <sup>{1}</sup>

* Each level overrides values in the previous level, so values in `.git/config` trump those in `[path]/etc/gitconfig`. <sup>{1}</sup>

* On Windows systems, Git looks for the `.gitconfig` file in the `$HOME` directory (`C:\Users\$USER` for most people). It also still looks for `[path]/etc/gitconfig`, although it’s relative to the MSys root, which is wherever you decide to install Git on your Windows system when you run the installer. If you are using version 2.x or later of Git for Windows, there is also a system-level config file at `C:\Documents and Settings\All Users\Application Data\Git\config` on Windows XP, and in `C:\ProgramData\Git\config` on Windows Vista and newer. This config file can only be changed by `git config -f <file>` as an admin. <sup>{1}</sup>

* `git config --list --show-origin` : You can view all of your settings and where they are coming from using <sup>{1}</sup>

* The first thing you should do when you install Git is to set your user name and email address. This is important because every Git commit uses this information, and it’s immutably baked into the commits you start creating: <sup>{1}</sup>
  * `git config --global user.name "John Doe"` <sup>{1}</sup>
  * `git config --global user.email johndoe@example.com` <sup>{1}</sup>

* `git config --global core.editor emacs` : If you want to use a different text editor, such as Emacs, you can do the following <sup>{1}</sup>

* `git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"` : If you are on a 32-bit Windows system, or you have a 64-bit editor on a 64-bit system, you’ll type something like this <sup>{1}</sup>

* `git init` : By default Git will create a branch called `master` when you create a new repository with <sup>{1}</sup>

* `git config --global init.defaultBranch main` : To set `main` as the default branch name do <sup>{1}</sup>

* `git config --list` : If you want to check your configuration settings, you can use this command to list all the settings Git can find at that point <sup>{1}</sup>

* `git config <key>` : You can also check what Git thinks a specific key’s value is by typing <sup>{1}</sup>
  * `git config user.name` <sup>{1}</sup>

* `git config --show-origin rerere.autoUpdate` : You can query Git as to the origin for that value, and it will tell you which configuration file had the final say in setting that value <sup>{1}</sup>

## git help

* If you ever need help while using Git, there are three equivalent ways to get the comprehensive manual page (manpage) help for any of the Git commands: <sup>{1}</sup>
  * `git help <verb>` <sup>{1}</sup>
  * `git <verb> --help` <sup>{1}</sup>
  * `man git-<verb>` <sup>{1}</sup>

* `git help config` : you can get the manpage help for the `git config` command by running this <sup>{1}</sup>

* `git add -h` : You can ask for the more concise “help” output with the `-h` option <sup>{1}</sup>

## git init

* `git init` : This creates a new subdirectory named .git that contains all of your necessary repository files — a Git repository skeleton. <sup>{1}</sup>

* You can accomplish that with a few `git add` commands that specify the files you want to track, followed by a `git commit` <sup>{1}</sup>
  * `git add *.c` <sup>{1}</sup>
  * `git add LICENSE` <sup>{1}</sup>
  * `git commit -m 'Initial project version'` <sup>{1}</sup>

## git clone

* Git has a number of different transfer protocols you can use. The previous example uses the `https://` protocol, but you may also see `git://` or `user@server:path/to/repo.git`, which uses the SSH transfer protocol. <sup>{1}</sup>

* `git clone <url>` : You clone a repository with <sup>{1}</sup>

* `git clone https://github.com/libgit2/libgit2` : If you want to clone the Git linkable library called `libgit2`, you can do so like this <sup>{1}</sup>

* `git clone https://github.com/libgit2/libgit2 mylibgit` : If you want to clone the repository into a directory named something other than libgit2, you can specify the new directory name as an additional argument <sup>{1}</sup>

## git add

* `git add README` : In order to begin tracking a new file, you use the command `git add`. To begin tracking the README file, you can run this <sup>{1}</sup>

## git status

* `git status` : Determine which files are in which state using this command <sup>{1}</sup>

* `git status --short` OR `git status -s` : Get a far more simplified output from this command <sup>{1}</sup>
  * There are two columns to the output — the left-hand column indicates the status of the staging area and the right-hand column indicates the status of the working tree. <sup>{1}</sup>

## git commit

* `git commit` : Doing so launches your editor of choice <sup>{1}</sup>
  * This is set by your shell’s `EDITOR` environment variable — usually vim or emacs, although you can configure it with whatever you want using the `git config --global core.editor` command <sup>{1}</sup>
  * `git commit -v` : For an even more explicit reminder of what you’ve modified, you can pass the `-v` option to `git commit`. Doing so also puts the diff of your change in the editor so you can see exactly what changes you’re committing. <sup>{1}</sup>

* `git commit -m "Story 182: fix benchmarks for speed"` : Alternatively, you can type your commit message inline with the `commit` command by specifying it after a `-m` flag, like this <sup>{1}</sup>

* `git commit -a` : Adding the `-a` option to the `git commit` command makes Git automatically stage every file that is already tracked before doing the commit, letting you skip the `git add` part <sup>{1}</sup>

## git diff

* `git diff` : To see what you’ve changed but not yet staged, type this with no other arguments <sup>{1}</sup>

* `git diff --staged` : If you want to see what you’ve staged that will go into your next commit, you can use git this. This command compares your staged changes to your last commit <sup>{1}</sup>

* `git diff --cached` : Use this to see what you’ve staged so far (`--staged` and `--cached` are synonyms) <sup>{1}</sup>

## git difftool

* If you run `git difftool` instead of `git diff`, you can view any of these diffs in software like emerge, vimdiff and many more (including commercial products). <sup>{1}</sup>

* `git difftool --tool-help` : Run this to see what is available on your system. <sup>{1}</sup>

## git mv

* `git mv file_from file_to` : If you want to rename a file in Git, you can run something like <sup>{1}</sup>
  * `git mv README.md README` : However, this is equivalent to running something like this <sup>{1}</sup>
    * `git rm README.md` <sup>{1}</sup>
    * `git add README` <sup>{1}</sup>

## git rm

* `git rm {{file}}` : To remove a file from Git, you have to remove it from your tracked files (more accurately, remove it from your staging area) and then commit. The `git rm` command does that, and also removes the file from your working directory so you don’t see it as an untracked file the next time around. <sup>{1}</sup>
  * `git rm -f {{file}}` : If you modified the file or had already added it to the staging area, you must force the removal with the `-f` option. <sup>{1}</sup>

* `git rm --cached README` : Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area. This is particularly useful if you forgot to add something to your .gitignore file and accidentally staged it <sup>{1}</sup>

* `git rm log/\*.log` : You can pass files, directories, and file-glob patterns to the `git rm` command. That means you can do things such as. <sup>{1}</sup>
  * Note the backslash (`\`) in front of the `*`. This is necessary because Git does its own filename expansion in addition to your shell’s filename expansion. <sup>{1}</sup>

* `git rm \*~` : This command removes all files whose names end with a `~`. <sup>{1}</sup>

## Commands From

* {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)

# Git-Cmd.md

## Websites

* [Git Official Site](https://git-scm.com/)
* [Git SCM to Windows => Official](https://gitforwindows.org/)
* [github/gitignore GitHub](https://github.com/github/gitignore)
* [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)
* Git Diff Tool
* Git Merge Tool
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
* Test Code
  * [schacon/simplegit-progit GitHub => Code from {1} Git Book](https://github.com/schacon/simplegit-progit)

# References

* next-sl: {3}

* Tutorials
  * {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)

* Guides

  * Git Index/Staging Area
    * {2} [Commit only part of a file's changes in Git](https://stackoverflow.com/questions/1085162/commit-only-part-of-a-files-changes-in-git)
