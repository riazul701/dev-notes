# Commands/Usage

## Notes

* GitHub changed the default branch name from `master` to `main` in mid-2020. However, Git itself still uses `master` as the default <sup>{1}</sup>
* When you install Git, you also get its visual tools, `gitk` and `git-gui`. <sup>{1}</sup>

* In “detached HEAD” state, if you make changes and then create a commit, your new commit won’t belong to any branch and will be unreachable, except by the exact commit hash. Thus, if you need to make changes—say you’re fixing a bug on an older version, for instance—you will generally want to create a branch <sup>{1}</sup>

## General Commands

* Go to the project’s directory
  * `cd /home/user/my_project` : for Linux <sup>{1}</sup>
  * `cd /Users/user/my_project` : for macOS <sup>{1}</sup>
  * `cd C:/Users/user/my_project` : for Windows <sup>{1}</sup>

* `echo 'My Project' > README` : Add text to "README" file <sup>{1}</sup>

* `echo '# test line' >> CONTRIBUTING.md` : Append text to "CONTRIBUTING.md" file <sup>{1}</sup>

* `vim CONTRIBUTING.md` : Edit "CONTRIBUTING.md" file using "vim" editor <sup>{1}</sup>

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

* Set Git Tools
  * Set `delta` as pager <sup>{6}</sup>
  ```shell
  git config --global core.pager delta
  git config --global interactive.diffFilter 'delta --color-only'
  git config --global delta.navigate true
  git config --global merge.conflictStyle zdiff3
  ```
  * `git config --global core.editor "vim"` : Set vim as git editor <sup>{7}</sup>
  * `git config --global diff.tool vimdiff` : Viewing all `git diffs` with vimdiff <sup>{4}</sup>
  * `git config --global merge.tool vimdiff` : Set vimdiff as a git mergetool <sup>{5}</sup>

* The first thing you should do when you install Git is to set your user name and email address. This is important because every Git commit uses this information, and it’s immutably baked into the commits you start creating: <sup>{1}</sup>
  * `git config --global user.name "John Doe"` <sup>{1}</sup>
  * `git config --global user.email johndoe@example.com` <sup>{1}</sup>

* `git config --global core.editor emacs` : If you want to use a different text editor, such as Emacs, you can do the following <sup>{1}</sup>

* `git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"` : If you are on a 32-bit Windows system, or you have a 64-bit editor on a 64-bit system, you’ll type something like this <sup>{1}</sup>

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

* `git commit --amend` : One of the common undos takes place when you commit too early and possibly forget to add some files, or you mess up your commit message. If you want to redo that commit, make the additional changes you forgot, stage them, and commit again using the `--amend` option <sup>{1}</sup>

## git log

* `git log` : By default, with no arguments, `git log` lists the commits made in that repository in reverse chronological order; that is, the most recent commits show up first. <sup>{1}</sup>

* `git log -p -2` : Shows the difference (the patch output) introduced in each commit. You can also limit the number of log entries displayed, such as using -2 to show only the last two entries. <sup>{1}</sup>

* `git log --stat` : To see some abbreviated stats for each commit, you can use the `--stat` option <sup>{1}</sup>

* `git log --pretty=oneline` : Another really useful option is `--pretty`. This option changes the log output to formats other than the default. The `oneline` value for this option prints each commit on a single line, which is useful if you’re looking at a lot of commits. <sup>{1}</sup>

* `git log --pretty=format:"%h - %an, %ar : %s"` : The most interesting option value is `format`, which allows you to specify your own log output format. <sup>{1}</sup>
  * Useful specifiers for `git log --pretty=format`
  * Specifier : Description of Output
  * `%H` : Commit hash
  * `%h` : Abbreviated commit hash
  * `%T` : Tree hash
  * `%t` : Abbreviated tree hash
  * `%P` : Parent hashes
  * `%p` : Abbreviated parent hashes
  * `%an` : Author name
  * `%ae` : Author email
  * `%ad` : Author date (format respects the `--date=option`)
  * `%ar` : Author date, relative
  * `%cn` : Committer name
  * `%ce` : Committer email
  * `%cd` : Committer date
  * `%cr` : Committer date, relative
  * `%s` : Subject

* `git log --pretty=format:"%h %s" --graph` : The `oneline` and `format` option values are particularly useful with another `log` option called `--graph`. This option adds a nice little ASCII graph showing your branch and merge history <sup>{1}</sup>

* `git log` lists the options we’ve covered so far, as well as some other common formatting options that may be useful, along with how they change the output of the `log` command. <sup>{1}</sup>
  * Common options to `git log`
  * Option : Description
  * `-p` : Show the patch introduced with each commit.
  * `--stat` : Show statistics for files modified in each commit.
  * `--shortstat` : Display only the changed/insertions/deletions line from the `--stat` command.
  * `--name-only` : Show the list of files modified after the commit information.
  * `--name-status` : Show the list of files affected with added/modified/deleted information as well.
  * `--abbrev-commit` : Show only the first few characters of the SHA-1 checksum instead of all 40.
  * `--relative-date` : Display the date in a relative format (for example, “2 weeks ago”) instead of using the full date format.
  * `--graph` : Display an ASCII graph of the branch and merge history beside the log output.
  * `--pretty` : Show commits in an alternate format. Option values include `oneline`, `short`, `full`, `fuller`, and `format` (where you specify your own format).
  * `--oneline` : Shorthand for `--pretty=oneline --abbrev-commit` used together.

* `git log --since=2.weeks` : The time-limiting options such as `--since` and `--until` are very useful. For example, this command gets the list of commits made in the last two weeks <sup>{1}</sup>

* `git log -S function_name` : Another really helpful filter is the `-S` option (colloquially referred to as Git’s “pickaxe” option), which takes a string and shows only those commits that changed the number of occurrences of that string. For instance, if you wanted to find the last commit that added or removed a reference to a specific function, you could call <sup>{1}</sup>

* `git log -- path/to/file` : If you specify a directory or file name, you can limit the log output to commits that introduced a change to those files. This is always the last option and is generally preceded by double dashes (`--`) to separate the paths from the options <sup>{1}</sup>

* Options to limit the output of `git log` <sup>{1}</sup>
  * Option : Description
  * `-<n>` : Show only the last n commits.
  * `--since, --after` : Limit the commits to those made after the specified date.
  * `--until, --before` : Limit the commits to those made before the specified date.
  * `--author` : Only show commits in which the author entry matches the specified string.
  * `--committer` : Only show commits in which the committer entry matches the specified string.
  * `--grep` : Only show commits with a commit message containing the string.
  * `-S` : Only show commits adding or removing code matching the string.

* `git log --pretty="%h - %s" --author='Junio C Hamano' --since="2008-10-01" \
   --before="2008-11-01" --no-merges -- t/` : If you want to see which commits modifying test files in the Git source code history were committed by Junio Hamano in the month of October 2008 and are not merge commits, you can run something like this <sup>{1}</sup>

## git reset

* `git reset HEAD CONTRIBUTING.md` : `git status` Right below the “Changes to be committed” text, it says use `git reset HEAD <file>…` to unstage. So, let’s use that advice to unstage the CONTRIBUTING.md file <sup>{1}</sup>

## git restore

* `git restore --staged CONTRIBUTING.md` : `git status`, Right below the “Changes to be committed” text, it says use `git restore --staged <file>…` to unstage. So, let’s use that advice to unstage the CONTRIBUTING.md file <sup>{1}</sup>

* `git restore CONTRIBUTING.md` : It tells you pretty explicitly how to discard the changes you’ve made, in working directory <sup>{1}</sup>

## git checkout

* `git checkout -- CONTRIBUTING.md` : It tells you pretty explicitly how to discard the changes you’ve made, in working directory <sup>{1}</sup>

* `git checkout v2.0.0` : If you want to view the versions of files a tag is pointing to, you can do a `git checkout` of that tag, although this puts your repository in “detached HEAD” state, which has some ill side effects <sup>{1}</sup>

* `git checkout -b version2 v2.0.0` : In “detached HEAD” state, if you make changes and then create a commit, the tag will stay the same, but your new commit won’t belong to any branch and will be unreachable, except by the exact commit hash. Thus, if you need to make changes—say you’re fixing a bug on an older version, for instance—you will generally want to create a branch <sup>{1}</sup>

## git remote

* `git remote -v` : You can also specify `-v`, which shows you the URLs that Git has stored for the shortname to be used when reading and writing to that remote <sup>{1}</sup>

* `git remote show origin` : If you want to see more information about a particular remote, you can use the `git remote show <remote>` command. If you run this command with a particular shortname, such as `origin`, you get something like this <sup>{1}</sup>

* `git remote rename pb paul` : You can run `git remote rename` to change a remote’s shortname. For instance, if you want to rename `pb` to `paul`, you can do so with <sup>{1}</sup>

* `git remote remove paul` : If you want to remove a remote for some reason—you’ve moved the server or are no longer using a particular mirror, or perhaps a contributor isn’t contributing anymore—you can either use `git remote remove` or `git remote rm` <sup>{1}</sup>

## git fetch

* `git fetch pb` : Now you can use the string `pb` on the command line instead of the whole URL. For example, if you want to fetch all the information that Paul has but that you don’t yet have in your repository, you can run <sup>{1}</sup>

## git push

* `git push origin master` : If you want to push your `master` branch to your `origin` server (again, cloning generally sets up both of those names for you automatically), then you can run this to push any commits you’ve done back up to the server <sup>{1}</sup>

## git tag

* `git tag` : Listing the existing tags in Git is straightforward. Just type `git tag` (with optional `-l` or `--list`) <sup>{1}</sup>

* `git tag -l "v1.8.5*"` : You can also search for tags that match a particular pattern. The Git source repo, for instance, contains more than 500 tags. If you’re interested only in looking at the 1.8.5 series, you can run this <sup>{1}</sup>

* `git tag -a v1.4 -m "my version 1.4"` : Creating an annotated tag in Git is simple. The easiest way is to specify `-a` when you run the `tag` command. The `-m` specifies a tagging message, which is stored with the tag. If you don’t specify a message for an annotated tag, Git launches your editor so you can type it in. <sup>{1}</sup>

* `git show v1.4` : You can see the tag data along with the commit that was tagged by using the `git show` command <sup>{1}</sup>

* `git tag v1.4-lw` : Another way to tag commits is with a lightweight tag. This is basically the commit checksum stored in a file—no other information is kept. To create a lightweight tag, don’t supply any of the `-a`, `-s`, or `-m` options, just provide a tag name <sup>{1}</sup>

* `git show v1.4-lw` : This time, if you run `git show` on the tag, you don’t see the extra tag information. The command just shows the commit <sup>{1}</sup>

* `git tag -a v1.2 9fceb02` : `git log --pretty=oneline`, Now, suppose you forgot to tag the project at v1.2, which was at the “Update rakefile” commit. You can add it after the fact. To tag that commit, you specify the commit checksum (or part of it) at the end of the command <sup>{1}</sup>

* `git push origin v1.5` : By default, the `git push` command doesn’t transfer tags to remote servers. You will have to explicitly push tags to a shared server after you have created them. This process is just like sharing remote branches—you can run `git push origin <tagname>`. <sup>{1}</sup>

* `git push origin --tags` : If you have a lot of tags that you want to push up at once, you can also use the `--tags` option to the `git push` command. This will transfer all of your tags to the remote server that are not already there. <sup>{1}</sup>

* `git tag -d v1.4-lw` : To delete a tag on your local repository, you can use `git tag -d <tagname>`. For example, we could remove our lightweight tag above as follows <sup>{1}</sup>
  * Note that this does not remove the tag from any remote servers.

* There are two common variations for deleting a tag from a remote server. <sup>{1}</sup>
  * `git push origin :refs/tags/v1.4-lw` : The first variation is `git push <remote> :refs/tags/<tagname>`. The way to interpret the above is to read it as the null value before the colon is being pushed to the remote tag name, effectively deleting it.
  * `git push origin --delete <tagname>` : The second (and more intuitive) way to delete a remote tag is with

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

# Git-Cmd.md

## Websites

* [Git Official Site](https://git-scm.com/)
* [Git SCM to Windows => Official](https://gitforwindows.org/)
* [github/gitignore GitHub](https://github.com/github/gitignore)
* [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)

* Test Code
  * [schacon/simplegit-progit GitHub => Code from {1} Git Book](https://github.com/schacon/simplegit-progit)

# References

* next-sl: {8}

## Commands From

* {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)
* {2} [Git Reference](https://git-scm.com/docs)

* Set Git Tools
  * {6} [dandavison/delta GitHub](https://github.com/dandavison/delta)
  * {4} [Viewing all `git diffs` with vimdiff](https://stackoverflow.com/questions/3713765/viewing-all-git-diffs-with-vimdiff)
  * {5} [Use vimdiff as git mergetool](https://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/)
  * {7} [How do I make git use the editor of my choice for editing commit messages?](https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages)

## Tutorials
  
* {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)
* {2} [Git Reference](https://git-scm.com/docs)

## Guides

* Git Index/Staging Area
  * {3} [Commit only part of a file's changes in Git](https://stackoverflow.com/questions/1085162/commit-only-part-of-a-files-changes-in-git)
