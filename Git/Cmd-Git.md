# Commands/Usage

## Notes

* GitHub changed the default branch name from `master` to `main` in mid-2020. However, Git itself still uses `master` as the default <sup>{1}</sup>

* When you install Git, you also get its visual tools, `gitk` and `git-gui`. <sup>{1}</sup>

* Furthermore `git add --patch`, you can use patch mode for partially resetting files with the `git reset --patch` command, for checking out parts of files with the `git checkout --patch` command and for stashing parts of files with the `git stash save --patch` command. <sup>{1}</sup>

* In “detached HEAD” state, if you make changes and then create a commit, your new commit won’t belong to any branch and will be unreachable, except by the exact commit hash. Thus, if you need to make changes—say you’re fixing a bug on an older version, for instance—you will generally want to create a branch <sup>{1}</sup>

* Upstream shorthand : When you have a tracking branch set up, you can reference its upstream branch with the `@{upstream}` or `@{u}` shorthand. So if you’re on the `master` branch and it’s tracking `origin/master`, you can say something like `git merge @{u}` instead of `git merge origin/master` if you wish. <sup>{1}</sup>

* The Perils of Rebasing <sup>{1}</sup>
  * Do not rebase commits that exist outside your repository and that people may have based work on.

* Rerere stands for “reuse recorded resolution”—it’s a way of shortcutting manual conflict resolution. <sup>{1}</sup>

* Escaping braces in PowerShell <sup>{1}</sup>
  * When using PowerShell, braces like `{` and `}` are special characters and must be escaped. You can escape them with a backtick `` ` `` or put the commit reference in quotes:
  ```shell
  $ git show HEAD@{0}     # will NOT work
  $ git show HEAD@`{0`}   # OK
  $ git show "HEAD@{0}"   # OK
  ```

* Escaping the caret on Windows
  * On Windows in `cmd.exe`, `^` is a special character and needs to be treated differently. You can either double it or put the commit reference in quotes: <sup>{1}</sup>
  ```shell
  $ git show HEAD^     # will NOT work on Windows
  $ git show HEAD^^    # OK
  $ git show "HEAD^"   # OK
  ```

* Type `git rebase --abort`, and your repo will be returned to the state it was in before you started the rebase. <sup>{1}</sup>

* First, unlike `reset --hard`, `checkout` is working-directory safe; it will check to make sure it’s not blowing away files that have changes to them. Actually, it’s a bit smarter than that—it tries to do a trivial merge in the working directory, so all of the files you haven’t changed will be updated. `reset --hard`, on the other hand, will simply replace everything across the board without checking. <sup>{1}</sup>

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
  * `apt show git-all` : This is a dummy package which brings in all subpackages.
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

## config

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

* `git config --global credential.helper cache` : If you don’t want to type it every single time you push, you can set up a “credential cache”. The simplest is just to keep it in memory for a few minutes, which you can easily set up by running this <sup>{1}</sup>

* `git config --global rerere.enabled true` : Now, whenever you do a merge that resolves conflicts, the resolution will be recorded in the cache in case you need it in the future. <sup>{1}</sup>
  *  When rerere is enabled, Git will keep a set of pre- and post-images from successful merges, and if it notices that there’s a conflict that looks exactly like one you’ve already fixed, it’ll just use the fix from last time, without bothering you with it. <sup>{1}</sup>

## help

* If you ever need help while using Git, there are three equivalent ways to get the comprehensive manual page (manpage) help for any of the Git commands: <sup>{1}</sup>
  * `git help <verb>` <sup>{1}</sup>
  * `git <verb> --help` <sup>{1}</sup>
  * `man git-<verb>` <sup>{1}</sup>

* `git help config` : you can get the manpage help for the `git config` command by running this <sup>{1}</sup>

* `git add -h` : You can ask for the more concise “help” output with the `-h` option <sup>{1}</sup>

## alias

* If you don’t want to type the entire text of each of the Git commands, you can easily set up an alias for each command using `git config`. Here are a couple of examples you may want to set up: <sup>{1}</sup>
```shell
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
```

* `git config --global alias.unstage 'reset HEAD --'` :  To correct the usability problem you encountered with unstaging a file, you can add your own unstage alias to Git. This makes the following two commands equivalent: <sup>{1}</sup>
  * `git unstage fileA`
  * `git reset HEAD -- fileA`

* `git config --global alias.last 'log -1 HEAD'` : It’s also common to add a last command, like this. This way, you can see the last commit easily: <sup>{1}</sup>
  * `git last`

* `git config --global alias.visual '!gitk'` : Git simply replaces the new command with whatever you alias it for. However, maybe you want to run an external command, rather than a Git subcommand. In that case, you start the command with a `!` character. This is useful if you write your own tools that work with a Git repository. We can demonstrate by aliasing `git visual` to run `gitk` <sup>{1}</sup>

## init

* `git init` : This creates a new subdirectory named .git that contains all of your necessary repository files — a Git repository skeleton. <sup>{1}</sup>

* You can accomplish that with a few `git add` commands that specify the files you want to track, followed by a `git commit` <sup>{1}</sup>
  * `git add *.c` <sup>{1}</sup>
  * `git add LICENSE` <sup>{1}</sup>
  * `git commit -m 'Initial project version'` <sup>{1}</sup>

## clone

* Git has a number of different transfer protocols you can use. The previous example uses the `https://` protocol, but you may also see `git://` or `user@server:path/to/repo.git`, which uses the SSH transfer protocol. <sup>{1}</sup>

* `git clone <url>` : You clone a repository with <sup>{1}</sup>

* `git clone https://github.com/libgit2/libgit2` : If you want to clone the Git linkable library called `libgit2`, you can do so like this <sup>{1}</sup>

* `git clone https://github.com/libgit2/libgit2 mylibgit` : If you want to clone the repository into a directory named something other than libgit2, you can specify the new directory name as an additional argument <sup>{1}</sup>

* `git clone -o booyah` : If you run it instead, then you will have `booyah/master` as your default remote branch. <sup>{1}</sup>

* `git clone --bare /path/to/git_project gitproject.git` : Uust put the bare repository in its path. A repository that doesn’t contain a working directory.  <sup>{1}</sup>

* `git clone ssh://[user@]server/project.git` : To clone a Git repository over SSH, you can specify an `ssh://` URL like this <sup>{1}</sup>
  * `git clone [user@]server:project.git` : Or you can use the shorter scp-like syntax for the SSH protocol <sup>{1}</sup>

## add

* Notes
  * Furthermore `git add --patch`, you can use patch mode for partially resetting files with the `git reset --patch` command, for checking out parts of files with the `git checkout --patch` command and for stashing parts of files with the `git stash save --patch` command.

* `git add README` : In order to begin tracking a new file, you use the command `git add`. To begin tracking the README file, you can run this <sup>{1}</sup>

* `git add --patch` : If some of the changes modify the same file, try to use this to partially stage files <sup>{1}</sup>

**Interactive Staging**

* If you run `git add` with the `-i` or `--interactive` option, Git enters an interactive shell mode, displaying something like this:
```shell
$ git add -i
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb

*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now>
```

**Staging and Unstaging Files**

* If you type `u` or `2` (for update) at the `What now>` prompt, you’re prompted for which files you want to stage:
```shell
What now> u
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Update>>
```

* To stage the `TODO` and `index.html` files, you can type the numbers:
```shell
Update>> 1,2
           staged     unstaged path
* 1:    unchanged        +0/-1 TODO
* 2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Update>>
```

* The `*` next to each file means the file is selected to be staged. If you press Enter after typing nothing at the Update>> prompt, Git takes anything selected and stages it for you:
```shell
Update>>
updated 2 paths

*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> s
           staged     unstaged path
  1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
```

* Now you can see that the `TODO` and `index.html` files are staged and the `simplegit.rb` file is still unstaged. If you want to unstage the TODO file at this point, you use the `r` or `3` (for revert) option:
```shell
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> r
           staged     unstaged path
  1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Revert>> 1
           staged     unstaged path
* 1:        +0/-1      nothing TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
Revert>> [enter]
reverted one path
```

* Looking at your Git status again, you can see that you’ve unstaged the `TODO` file:
```shell
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> s
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:        +1/-1      nothing index.html
  3:    unchanged        +5/-1 lib/simplegit.rb
```

* To see the diff of what you’ve staged, you can use the `d` or `6` (for diff) command. It shows you a list of your staged files, and you can select the ones for which you would like to see the staged diff. This is much like specifying `git diff --cached` on the command line:
```shell
*** Commands ***
  1: [s]tatus     2: [u]pdate      3: [r]evert     4: [a]dd untracked
  5: [p]atch      6: [d]iff        7: [q]uit       8: [h]elp
What now> d
           staged     unstaged path
  1:        +1/-1      nothing index.html
Review diff>> 1
diff --git a/index.html b/index.html
index 4d07108..4335f49 100644
--- a/index.html
+++ b/index.html
@@ -16,7 +16,7 @@ Date Finder

 <p id="out">...</p>

-<div id="footer">contact : support@github.com</div>
+<div id="footer">contact : email.support@github.com</div>

 <script type="text/javascript">
```

**Staging Patches**

* It’s also possible for Git to stage certain parts of files and not the rest. For example, if you make two changes to your `simplegit.rb` file and want to stage one of them and not the other, doing so is very easy in Git. From the same interactive prompt explained in the previous section, type `p` or `5` (for patch). Git will ask you which files you would like to partially stage; then, for each section of the selected files, it will display hunks of the file diff and ask if you would like to stage them, one by one:
```shell
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index dd5ecc4..57399e0 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -22,7 +22,7 @@ class SimpleGit
   end

   def log(treeish = 'master')
-    command("git log -n 25 #{treeish}")
+    command("git log -n 30 #{treeish}")
   end

   def blame(path)
Stage this hunk [y,n,a,d,/,j,J,g,e,?]?
```

* You have a lot of options at this point. Typing `?` shows a list of what you can do:
```shell
Stage this hunk [y,n,a,d,/,j,J,g,e,?]? ?
y - stage this hunk
n - do not stage this hunk
a - stage this and all the remaining hunks in the file
d - do not stage this hunk nor any of the remaining hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
```

* Generally, you’ll type `y` or `n` if you want to stage each hunk, but staging all of them in certain files or skipping a hunk decision until later can be helpful too. If you stage one part of the file and leave another part unstaged, your status output will look like this:
```shell
What now> 1
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:        +1/-1      nothing index.html
  3:        +1/-1        +4/-0 lib/simplegit.rb
```

* The status of the `simplegit.rb` file is interesting. It shows you that a couple of lines are staged and a couple are unstaged. You’ve partially staged this file. At this point, you can exit the interactive adding script and run `git commit` to commit the partially staged files.

* You also don’t need to be in interactive add mode to do the partial-file staging—you can start the same script by using `git add -p` or `git add --patch` on the command line.

## status

* `git status` : Determine which files are in which state using this command <sup>{1}</sup>

* `git status --short` OR `git status -s` : Get a far more simplified output from this command <sup>{1}</sup>
  * There are two columns to the output — the left-hand column indicates the status of the staging area and the right-hand column indicates the status of the working tree. <sup>{1}</sup>

## commit

* `git commit` : Doing so launches your editor of choice <sup>{1}</sup>
  * This is set by your shell’s `EDITOR` environment variable — usually vim or emacs, although you can configure it with whatever you want using the `git config --global core.editor` command <sup>{1}</sup>
  * `git commit -v` : For an even more explicit reminder of what you’ve modified, you can pass the `-v` option to `git commit`. Doing so also puts the diff of your change in the editor so you can see exactly what changes you’re committing. <sup>{1}</sup>

* `git commit -m "Story 182: fix benchmarks for speed"` : Alternatively, you can type your commit message inline with the `commit` command by specifying it after a `-m` flag, like this <sup>{1}</sup>

* `git commit -a` : Adding the `-a` option to the `git commit` command makes Git automatically stage every file that is already tracked before doing the commit, letting you skip the `git add` part <sup>{1}</sup>

* `git commit -am 'Remove invalid default value'` : Automatically stage every file that is already tracked before doing the commit, letting you skip the `git add` part and commit with message. <sup>{1}</sup>

* `git commit --amend` : One of the common undos takes place when you commit too early and possibly forget to add some files, or you mess up your commit message. If you want to redo that commit, make the additional changes you forgot, stage them, and commit again using the `--amend` option <sup>{1}</sup>

* `git commit --amend --no-edit` : On the other hand, if your amendments are suitably trivial (fixing a silly typo or adding a file you forgot to stage) such that the earlier commit message is just fine, you can simply make the changes, stage them, and avoid the unnecessary editor session entirely with <sup>{1}</sup>

## notes

## restore

* `git restore --staged CONTRIBUTING.md` : `git status`, Right below the “Changes to be committed” text, it says use `git restore --staged <file>…` to unstage. So, let’s use that advice to unstage the CONTRIBUTING.md file <sup>{1}</sup>

* `git restore CONTRIBUTING.md` : It tells you pretty explicitly how to discard the changes you’ve made, in working directory <sup>{1}</sup>

## reset

* Notes
  * `--mixed` reset is the default, if no argument mentioned <sup>{1}</sup>
  * It’s also interesting to note that like `git add`, the `reset` command will accept a `--patch` option to unstage content on a hunk-by-hunk basis. So you can selectively unstage or revert content. <sup>{1}</sup>

* `git reset HEAD CONTRIBUTING.md` : `git status` Right below the “Changes to be committed” text, it says use `git reset HEAD <file>…` to unstage. So, let’s use that advice to unstage the CONTRIBUTING.md file <sup>{1}</sup>

* `git reset --soft HEAD~` : When you `reset` back to `HEAD~` (the parent of HEAD), you are moving the branch back to where it was, without changing the index or working directory. You could now update the index and run `git commit` again to accomplish what `git commit --amend` would have done (see Changing the Last Commit). <sup>{1}</sup>

* `git reset HEAD~` OR `git reset --mixed HEAD~` : It still undid your last commit, but also unstaged everything. You rolled back to before you ran all your `git add` and `git commit` commands. <sup>{1}</sup>

* `git reset --hard HEAD~` : You undid your last commit, the `git add` and `git commit` commands, and all the work you did in your working directory. <sup>{1}</sup>

* `git reset file.txt` OR `git reset --mixed HEAD file.txt` : It essentially just copies file.txt from HEAD to the index. <sup>{1}</sup>

* `git reset eb43bf file.txt` OR `git reset eb43bf -- file.txt` : We could just as easily not let Git assume we meant “pull the data from HEAD” by specifying a specific commit to pull that file version from. We would just run something like this <sup>{1}</sup>

* Squashing <sup>{1}</sup>
  * `git reset --soft HEAD~2` : To move the HEAD branch back to an older commit (the most recent commit you want to keep)
  * And then simply run `git commit` again:
  * Now you can see that your reachable history, the history you would push, now looks like you had one commit with `file-a.txt` `v1`, then a second that both modified `file-a.txt` to `v3` and added `file-b.txt`. The commit with the `v2` version of the file is no longer in the history.

## rm

* `git rm {{file}}` : To remove a file from Git, you have to remove it from your tracked files (more accurately, remove it from your staging area) and then commit. The `git rm` command does that, and also removes the file from your working directory so you don’t see it as an untracked file the next time around. <sup>{1}</sup>
  * `git rm -f {{file}}` : If you modified the file or had already added it to the staging area, you must force the removal with the `-f` option. <sup>{1}</sup>

* `git rm --cached README` : Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area. This is particularly useful if you forgot to add something to your .gitignore file and accidentally staged it <sup>{1}</sup>

* `git rm log/\*.log` : You can pass files, directories, and file-glob patterns to the `git rm` command. That means you can do things such as. <sup>{1}</sup>
  * Note the backslash (`\`) in front of the `*`. This is necessary because Git does its own filename expansion in addition to your shell’s filename expansion. <sup>{1}</sup>

* `git rm \*~` : This command removes all files whose names end with a `~`. <sup>{1}</sup>

## mv

* `git mv file_from file_to` : If you want to rename a file in Git, you can run something like <sup>{1}</sup>
  * `git mv README.md README` : However, this is equivalent to running something like this <sup>{1}</sup>
    * `git rm README.md` <sup>{1}</sup>
    * `git add README` <sup>{1}</sup>

## branch

* `git branch` : Get a simple listing of your current branches. Notice the `*` character that prefixes the `master` branch: it indicates the branch that you currently have checked out (i.e., the branch that `HEAD` points to). This means that if you commit at this point, the master branch will be moved forward with your new work. <sup>{1}</sup>

* `git branch --all` : Shows list of all branch <sup>{1}</sup>

* `git branch -v` : To see the last commit on each branch, you can run <sup>{1}</sup>

* `git branch -vv` : This will list out your local branches with more information including what each branch is tracking and if your local branch is ahead, behind or both. <sup>{1}</sup>

* `git branch testing` : You want to create a new branch called testing. You do this with the git branch command <sup>{1}</sup>

* `git branch -d hotfix` : You can delete it with the `-d` option to `git branch` <sup>{1}</sup>
  * `git branch -d testing` : This shows your other branch. Because it contains work that isn’t merged in yet, trying to delete it with it will fail <sup>{1}</sup>

* `git branch --move bad-branch-name corrected-branch-name` : Rename the branch locally with the `git branch --move` command. This replaces your `bad-branch-name` with `corrected-branch-name`, but this change is only local for now. <sup>{1}</sup>

* `git push --set-upstream origin corrected-branch-name` : To let others see the corrected branch on the remote, push it <sup>{1}</sup>

* `git branch --merged` : To see which branches are already merged into the branch you’re on, you can run <sup>{1}</sup>

* `git branch --no-merged` : To see all the branches that contain work you haven’t yet merged in, you can run <sup>{1}</sup>

## checkout

* `git checkout testing` : To switch to an existing branch, you run the `git checkout` command. Let’s switch to the new `testing` branch <sup>{1}</sup>

* `git checkout -b <newbranchname>` : It’s typical to create a new branch and want to switch to that new branch at the same time—this can be done in one operation with <sup>{1}</sup>
  * `git checkout -b iss53` : To create a new branch and switch to it at the same time, you can run the `git checkout` command with the `-b` switch
  * `git branch iss53` : This is shorthand for above

* `git checkout -b serverfix origin/serverfix` : If you want your own `serverfix` branch that you can work on, you can base it off your remote-tracking branch <sup>{1}</sup>

* `git checkout -b sf origin/serverfix` : To set up a local branch with a different name than the remote branch, you can easily use the first version with a different local branch name. Now, your local branch `sf` will automatically pull from `origin/serverfix`. <sup>{1}</sup>

* `git checkout --track origin/serverfix` : You can set up other tracking branches if you wish—ones that track branches on other remotes, or don’t track the master branch. This is a common enough operation that Git provides the `--track` shorthand <sup>{1}</sup>

* `git checkout -- CONTRIBUTING.md` : It tells you pretty explicitly how to discard the changes you’ve made, in working directory <sup>{1}</sup>

* `git checkout v2.0.0` : If you want to view the versions of files a tag is pointing to, you can do a `git checkout` of that tag, although this puts your repository in “detached HEAD” state, which has some ill side effects <sup>{1}</sup>

* `git checkout -b version2 v2.0.0` : In “detached HEAD” state, if you make changes and then create a commit, the tag will stay the same, but your new commit won’t belong to any branch and will be unreachable, except by the exact commit hash. Thus, if you need to make changes—say you’re fixing a bug on an older version, for instance—you will generally want to create a branch <sup>{1}</sup>

## switch

* From Git version 2.23 onwards you can use `git switch` instead of `git checkout` to: <sup>{1}</sup>

* `git switch testing-branch` : Switch to an existing branch <sup>{1}</sup>

* `git switch -c new-branch` : Create a new branch and switch to it. The `-c` flag stands for create, you can also use the full flag: `--create`. <sup>{1}</sup>

* `git switch -` : Return to your previously checked out branch <sup>{1}</sup>

## merge

* `git merge iss53` : Occasionally, this process doesn’t go smoothly. If you changed the same part of the same file differently in the two branches you’re merging, Git won’t be able to merge them cleanly. If your fix for issue #53 modified the same part of a file as the `hotfix branch`, you’ll get a merge conflict that looks something like this:
  ```shell
  $ git merge iss53
  Auto-merging index.html
  CONFLICT (content): Merge conflict in index.html
  Automatic merge failed; fix conflicts and then commit the result.
  ```
  * Anything that has merge conflicts and hasn’t been resolved is listed as unmerged. Git adds standard conflict-resolution markers to the files that have conflicts, so you can open them manually and resolve those conflicts. Your file contains a section that looks something like this:
  ```shell
  <<<<<<< HEAD:index.html
  <div id="footer">contact : email.support@github.com</div>
  =======
  <div id="footer">
  please contact us at support@github.com
  </div>
  >>>>>>> iss53:index.html
  ```
  * In order to resolve the conflict, you have to either choose one side or the other or merge the contents yourself. For instance, you might resolve this conflict by replacing the entire block with this:
  ```shell
  <div id="footer">
  please contact us at email.support@github.com
  </div>
  ```
  * This resolution has a little of each section, and the `<<<<<<<`, `=======`, and `>>>>>>>` lines have been completely removed. After you’ve resolved each of these sections in each conflicted file, run `git add` on each file to mark it as resolved. Staging the file marks it as resolved in Git.
  * If you want to use a graphical tool to resolve these issues, you can run `git mergetool`, which fires up an appropriate visual merge tool and walks you through the conflicts:
  ```shell
  $ git mergetool

  This message is displayed because 'merge.tool' is not configured.
  See 'git mergetool --tool-help' or 'git help config' for more details.
  'git mergetool' will now attempt to use one of the following tools:
  opendiff kdiff3 tkdiff xxdiff meld tortoisemerge gvimdiff diffuse diffmerge ecmerge p4merge araxis bc3 codecompare vimdiff emerge
  Merging:
  index.html
  
  Normal merge conflict for 'index.html':
    {local}: modified file
    {remote}: modified file
  Hit return to start merge resolution tool (opendiff):
  ```

* `git merge origin/serverfix` : To merge this work into your current working branch, you can run this <sup>{1}</sup>

## mergetool

## stash

* Notes
  * By default, `git stash` will stash only modified and staged tracked files. <sup>{1}</sup>
  * `git stash push` introduces the option of stashing selected pathspecs, something `git stash save` does not support. <sup>{1}</sup>

* `git stash` OR `git stash push` : Now you want to switch branches, but you don’t want to commit what you’ve been working on yet, so you’ll stash the changes. To push a new stash onto your stack, run this <sup>{1}</sup>

* `git stash list` : To see which stashes you’ve stored, you can use this <sup>{1}</sup>

* `git stash apply` :  If you don’t specify a stash, Git assumes the most recent stash and tries to apply it <sup>{1}</sup>

* `git stash apply stash@{2}` : If you want to apply one of the older stashes, you can specify it by naming it, like this <sup>{1}</sup>

* `git stash apply --index` : The changes to your files were reapplied, but the file you staged before wasn’t restaged. To do that, you must run the `git stash apply` command with a `--index` option to tell the command to try to reapply the staged changes. If you had run that instead, you’d have gotten back to your original position: <sup>{1}</sup>

* `git stash drop stash@{0}` : To remove it, you can run this with the name of the stash to remove <sup>{1}</sup>

* `git stash pop` : You can also run this to apply the stash and then immediately drop it from your stack. <sup>{1}</sup>

* `git stash --keep-index` : This tells Git to not only include all staged content in the stash being created, but simultaneously leave it in the index. <sup>{1}</sup>

* `git stash -u` : If you specify `--include-untracked` or `-u`, Git will include untracked files in the stash being created. However, including untracked files in the stash will still not include explicitly ignored files. <sup>{1}</sup>
  
* `git stash --all` : To additionally include ignored files, use `--all` (or just `-a`). <sup>{1}</sup>

* `git stash --patch` : If you specify the --patch flag, Git will not stash everything that is modified but will instead prompt you interactively which of the changes you would like to stash and which you would like to keep in your working directory. <sup>{1}</sup>
```shell
$ git stash --patch
diff --git a/lib/simplegit.rb b/lib/simplegit.rb
index 66d332e..8bb5674 100644
--- a/lib/simplegit.rb
+++ b/lib/simplegit.rb
@@ -16,6 +16,10 @@ class SimpleGit
         return `#{git_cmd} 2>&1`.chomp
       end
     end
+
+    def show(treeish = 'master')
+      command("git show #{treeish}")
+    end

 end
 test
Stash this hunk [y,n,q,a,d,/,e,?]? y

Saved working directory and index state WIP on master: 1b65b17 added the index file
```

* `git stash branch testchanges` : Which creates a new branch for you with your selected branch name, checks out the commit you were on when you stashed your work, reapplies your work there, and then drops the stash if it applies successfully <sup>{1}</sup>

## tag

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

* `git tag -s v1.5 -m 'my signed 1.5 tag'` : If you decide to sign the tag as the maintainer, the tagging may look something like this <sup>{1}</sup>
  * `gpg --list-keys` : The maintainer of the Git project has solved this issue by including their public key as a blob in the repository and then adding a tag that points directly to that content. To do this, you can figure out which key you want by running this <sup>{1}</sup>
  * `gpg -a --export F721C45A | git hash-object -w --stdin` : Then, you can directly import the key into the Git database by exporting it and piping that through `git hash-object`, which writes a new blob with those contents into Git and gives you back the SHA-1 of the blob <sup>{1}</sup>
  * `git tag -a maintainer-pgp-pub 659ef797d181633c87ec71ac3f9ba29fe5775b92` : Now that you have the contents of your key in Git, you can create a tag that points directly to it by specifying the new SHA-1 value that the `hash-object` command gave you <sup>{1}</sup>
  * `git show maintainer-pgp-pub | gpg --import` : If you run `git push --tags`, the `maintainer-pgp-pub` tag will be shared with everyone. If anyone wants to verify a tag, they can directly import your PGP key by pulling the blob directly out of the database and importing it into GPG <sup>{1}</sup>
  * `git show <tag>` : Running this will let you give the end user more specific instructions about tag verification. <sup>{1}</sup>

## worktree

## fetch

* `git fetch pb` : Now you can use the string `pb` on the command line instead of the whole URL. For example, if you want to fetch all the information that Paul has but that you don’t yet have in your repository, you can run <sup>{1}</sup>

* `git fetch --all` : Retch from all your remotes <sup>{1}</sup>

## pull

* There is a command called `git pull` which is essentially a `git fetch` immediately followed by a `git merge` in most cases. <sup>{1}</sup>

* `git pull --rebase` : If instead of doing a merge when we’re at Someone pushes rebased commits, abandoning commits you’ve based your work on we run `git rebase teamone/master`. Or you could do it manually with a `git fetch` followed by a `git rebase teamone/master` in this case. <sup>{1}</sup>

## push

* `git push origin master` : If you want to push your `master` branch to your `origin` server (again, cloning generally sets up both of those names for you automatically), then you can run this to push any commits you’ve done back up to the server <sup>{1}</sup>

* `git push origin serverfix:awesomebranch` : If you didn’t want it to be called `serverfix` on the remote, you could instead run this to push your local `serverfix` branch to the `awesomebranch` branch on the remote project. <sup>{1}</sup>

* `git push origin --delete serverfix` : Delete your `serverfix` branch from the server, you run the following. <sup>{1}</sup>

* `git push -u origin featureA` : Pushes `featureA` branch commits up to the server, with upstream tracking. <sup>{1}</sup>

## remote

* `git remote -v` : You can also specify `-v`, which shows you the URLs that Git has stored for the shortname to be used when reading and writing to that remote <sup>{1}</sup>

* `git remote show origin` : If you want to see more information about a particular remote, you can use the `git remote show <remote>` command. If you run this command with a particular shortname, such as `origin`, you get something like this <sup>{1}</sup>

* `git remote add local_proj /srv/git/project.git` : To add a local repository to an existing Git project, you can run something like this <sup>{1}</sup>

* `git remote rename pb paul` : You can run `git remote rename` to change a remote’s shortname. For instance, if you want to rename `pb` to `paul`, you can do so with <sup>{1}</sup>

* `git remote remove paul` : If you want to remove a remote for some reason—you’ve moved the server or are no longer using a particular mirror, or perhaps a contributor isn’t contributing anymore—you can either use `git remote remove` or `git remote rm` <sup>{1}</sup>

## submodule

## show

* `git show 1c002dd4b536e7479fe34593e72e6c6c1819e53b` : You can inspect that commit with any of the following variations of git show (assuming the shorter versions are unambiguous) <sup>{1}</sup>
  * `git show 1c002dd4b536e7479f`
  * `git show 1c002d`

* `git show HEAD@{5}` : If you want to see the fifth prior value of the HEAD of your repository, you can use the @{5} reference that you see in the reflog output <sup>{1}</sup>

* `git show master@{yesterday}` : You can also use this syntax to see where a branch was some specific amount of time ago. For instance, to see where your master branch was yesterday, you can type <sup>{1}</sup>

* `git show HEAD^` : See the previous commit by specifying `HEAD^`, which means “the parent of HEAD” <sup>{1}</sup>

* `git show d921970^` : You can also specify a number after the `^` to identify which parent you want; for example, `d921970^2` means “the second parent of d921970.” <sup>{1}</sup>

* `git show HEAD~3` :  `HEAD~2` means “the first parent of the first parent,” or “the grandparent”—it traverses the first parents the number of times you specify. For example, in the history listed earlier, `HEAD~3` would be <sup>{1}</sup>

* `git show HEAD~~~` : This can also be written `HEAD~~~`, which again is the first parent of the first parent of the first parent <sup>{1}</sup>

## log

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

* `git log --oneline --decorate` : You can easily see this by running a simple `git log` command that shows you where the branch pointers are pointing. This option is called `--decorate`. <sup>{1}</sup>

* `git log --oneline --decorate --graph --all` : It will print out the history of your commits, showing where your branch pointers are and how your history has diverged. <sup>{1}</sup>

* `git log contrib --not master` : Get a review of all the commits that are in this `contrib` branch but that aren’t in your master branch. <sup>{1}</sup>

* `git log --abbrev-commit --pretty=oneline` : If you pass `--abbrev-commit` to the `git log` command, the output will use shorter values but keep them unique; it defaults to using seven characters but makes them longer if necessary to keep the SHA-1 unambiguous <sup>{1}</sup>

* `git log master..experiment` : See what is in your `experiment` branch that hasn’t yet been merged into your `master` branch. Show you a log of just those commits with `master..experiment`—that means “all commits reachable from `experiment` that aren’t reachable from `master` <sup>{1}</sup>

* `git log experiment..master` : All commits in `master` that aren’t in `experiment`, you can reverse the branch names. `experiment..master` shows you everything in `master` not reachable from `experiment` <sup>{1}</sup>

* `git log origin/master..HEAD` : See what you’re about to push to a remote. This command shows you any commits in your current branch that aren’t in the `master` branch on your `origin` remote. <sup>{1}</sup>

* Using either the `^` character or `--not` before any reference from which you don’t want to see reachable commits. Thus, the following three commands are equivalent: <sup>{1}</sup>
  * `git log refA..refB`
  * `git log ^refA refB`
  * `git log refB --not refA`

* If you want to see all commits that are reachable from `refA` or `refB` but not from `refC`, you can use either of: <sup>{1}</sup>
  * `git log refA refB ^refC`
  * `git log refA refB --not refC`

* `git log --left-right master...experiment` : Which shows you which side of the range each commit is in. <sup>{1}</sup>

* `git log -S ZLIB_BUF_MAX --oneline` : We want to find out when the ZLIB_BUF_MAX constant was originally introduced, we can use the -S option (colloquially referred to as the Git “pickaxe” option) to tell Git to show us only those commits that changed the number of occurrences of that string. <sup>{1}</sup>
  * If you need to be more specific, you can provide a regular expression to search for with the `-G` option.

* `git log -L :git_deflate_bound:zlib.c` : If we wanted to see every change made to the function `git_deflate_bound` in the `zlib.c` file, we could run this. This will try to figure out what the bounds of that function are and then look through the history and show us every change that was made to the function as a series of patches back to when the function was first created. <sup>{1}</sup>
  * If Git can’t figure out how to match a function or method in your programming language, you can also provide it with a regular expression (or regex). For example, this would have done the same thing as the example above: `git log -L '/unsigned long git_deflate_bound/',/^}/:zlib.c`. You could also give it a range of lines or a single line number and you’ll get the same sort of output. <sup>{1}</sup>

## diff

* `git diff` : To see what you’ve changed but not yet staged, type this with no other arguments <sup>{1}</sup>

* `git diff --staged` : If you want to see what you’ve staged that will go into your next commit, you can use git this. This command compares your staged changes to your last commit <sup>{1}</sup>

* `git diff --cached` : Use this to see what you’ve staged so far (`--staged` and `--cached` are synonyms) <sup>{1}</sup>

* `git diff --check` : Git provides an easy way to check for this—before you commit, run this, which identifies possible whitespace errors and lists them for you. <sup>{1}</sup>

* `git diff master` : To see a full diff of what would happen if you were to merge this topic branch with another branch, you may have to use a weird trick to get the correct results. You may think to run this <sup>{1}</sup>

* `git diff master...contrib` : The triple-dot syntax, This command shows you only the work your current topic branch has introduced since its common ancestor with `master`. <sup>{1}</sup>

* `git log --pretty=format:'%h %s' --graph` : Look at the history of your project <sup>{1}</sup>

## difftool

* If you run `git difftool` instead of `git diff`, you can view any of these diffs in software like emerge, vimdiff and many more (including commercial products). <sup>{1}</sup>

* `git difftool --tool-help` : Run this to see what is available on your system. <sup>{1}</sup>

## range-diff

## shortlog

* `git shortlog --no-merges master --not v1.0.1` : It summarizes all the commits in the range you give it; for example, the following gives you a summary of all the commits since your last release, if your last release was named `v1.0.1` <sup>{1}</sup>
## describe

* `git describe master` :  In response, Git generates a string consisting of the name of the most recent tag earlier than that commit, followed by the number of commits since that tag, followed finally by a partial SHA-1 value of the commit being described (prefixed with the letter "g" meaning Git) <sup>{1}</sup>
  * This way, you can export a snapshot or build and name it something understandable to people. <sup>{1}</sup>

## apply

* `git apply /tmp/patch-ruby-client.patch` : You can apply the patch like this <sup>{1}</sup>

* `git apply --check 0001-see-if-this-helps-the-gem.patch` : You can also use `git apply` to see if a patch applies cleanly before you try actually applying it—you can run `git apply --check` with the patch <sup>{1}</sup>

## cherry-pick

* `git cherry-pick e43a6` : If you want to pull commit `e43a6` into your `master` branch, you can run this. This pulls the same change introduced in `e43a6`, but you get a new commit SHA-1 value, because the date applied is different. <sup>{1}</sup>

## rebase

* You would check out the experiment branch, and then rebase it onto the master branch as follows: <sup>{1}</sup>
  * `git checkout experiment`
  * `git rebase master`
  * At this point, you can go back to the master branch and do a fast-forward merge.
    * `git checkout master`
    * `git merge experiment`

* `git rebase --onto master server client` : You can take the changes on `client` that aren’t on `server` and replay them on your `master` branch by using the `--onto` option of `git rebase` <sup>{1}</sup>
  * Now you can fast-forward your master branch (see Fast-forwarding your master branch to include the client branch changes):
    * `git checkout master`
    * `git merge client`

* `git rebase master server` : You can rebase the `server` branch onto the `master` branch without having to check it out first by running `git rebase <basebranch> <topicbranch>`—which checks out the topic branch (in this case, `server`) for you and replays it onto the base branch (`master`) <sup>{1}</sup>
  * Then, you can fast-forward the base branch (`master`):
    * `git checkout master`
    * `git merge server`

* `git rebase -i HEAD~3` : If you want to change the last three commit messages, or any of the commit messages in that group, you supply as an argument to `git rebase -i` the parent of the last commit you want to edit, which is `HEAD~2^` or `HEAD~3`. It may be easier to remember the `~3` because you’re trying to edit the last three commits, but keep in mind that you’re actually designating four commits ago, the parent of the last commit you want to edit <sup>{1}</sup>
  * Running this command gives you a list of commits in your text editor
  * It’s important to note that these commits are listed in the opposite order than you normally see them using the `log` command. If you run a `log`, you see something like this:
    * `git log --pretty=format:"%h %s" HEAD~3..HEAD`
```shell
$ git rebase -i HEAD~3
Stopped at f7f3f6d... Change my name a bit
You can amend the commit now, with

       git commit --amend

Once you're satisfied with your changes, run

       git rebase --continue
```
  * These instructions tell you exactly what to do. Type: `git commit --amend`
  * Change the commit message, and exit the editor. Then, run: `git rebase --continue`
  * This command will apply the other two commits automatically, and then you’re done. If you change `pick` to `edit` on more lines, you can repeat these steps for each commit you change to `edit`. Each time, Git will stop, let you amend the commit, and continue when you’re finished.

## revert

## bisect

## blame

## grep

* Notes
  * By default, `git grep` will look through the files in your working directory.

* `git grep -n gmtime_r` : By default, `git grep` will look through the files in your working directory. As a first variation, you can use either of the `-n` or `--line-number` options to print out the line numbers where Git has found matches <sup>{1}</sup>

* `git grep --count gmtime_r` : For instance, instead of printing all of the matches, you can ask `git grep` to summarize the output by showing you only which files contained the search string and how many matches there were in each file with the `-c` or `--count` option <sup>{1}</sup>

* `git grep -p gmtime_r *.c` : If you’re interested in the context of a search string, you can display the enclosing method or function for each matching string with either of the `-p` or `--show-function` options <sup>{1}</sup>

* `git grep --break --heading \
    -n -e '#define' --and \( -e LINK -e BUF_MAX \) v1.8.0` : You can also search for complex combinations of strings with the `--and` flag, which ensures that multiple matches must occur in the same line of text. For instance, let’s look for any lines that define a constant whose name contains either of the substrings “LINK” or “BUF_MAX”, specifically in an older version of the Git codebase represented by the tag `v1.8.0` (we’ll throw in the `--break` and `--heading` options which help split up the output into a more readable format) <sup>{1}</sup>

## am

* `git am 0001-limit-log-function.patch` : If someone uploaded a patch file generated via `git format-patch` to a ticketing system or something similar, you can save the file locally and then pass that file saved on your disk to `git am` to apply it <sup>{1}</sup>
  * `git am --resolved` : Previous command puts conflict markers in any files it has issues with, much like a conflicted merge or rebase operation. You solve this issue much the same way—edit the file to resolve the conflict, stage the new file, and then run this to continue to the next patch <sup>{1}</sup>
  * `git am -3 0001-see-if-this-helps-the-gem.patch` : You can pass a `-3` option to it, which makes Git attempt a three-way merge. <sup>{1}</sup>

* `git am -3 -i mbox` : If you’re applying a number of patches from an mbox, you can also run the `am` command in interactive mode, which stops at each patch it finds and asks if you want to apply it <sup>{1}</sup>

## format-patch

* `git format-patch -M origin/master` : Generate the mbox-formatted files that you can email to the list—it turns each commit into an email message with the first line of the commit message as the subject and the rest of the message plus the patch that the commit introduces as the body. <sup>{1}</sup>

## send-email

* `git send-email *.patch` : You can use this to send your patches <sup>{1}</sup>

## request-pull

## svn

## fast-import

## clean

* Notes
  * By default, the `git clean` command will only remove untracked files that are not ignored.
  * There is a quirky situation where you might need to be extra forceful in asking Git to clean your working directory. If you happen to be in a working directory under which you’ve copied or cloned other Git repositories (perhaps as submodules), even `git clean -fd` will refuse to delete those directories. In cases like that, you need to add a second `-f` option for emphasis.

* `git clean` : Assuming you do want to remove cruft files or clean your working directory, you can do so with this. <sup>{1}</sup>

* `git clean -f -d` : To remove all the untracked files in your working directory, you can run this, which removes any files and also any subdirectories that become empty as a result. The `-f` means 'force' or “really do this,” and is required if the Git configuration variable `clean.requireForce` is not explicitly set to false. <sup>{1}</sup>

* `git clean -d -n` : You can run the command with the `--dry-run` (or `-n`) option, which means “do a dry run and tell me what you would have removed”. <sup>{1}</sup>

* `git clean -n -d -x` : Any file that matches a pattern in your `.gitignore` or other ignore files will not be removed. If you want to remove those files too, such as to remove all `.o` files generated from a build so you can do a fully clean build, you can add a `-x` to the `clean` command. <sup>{1}</sup>

* `git clean -x -i` : This will run the `clean` command in an interactive mode. `-x` remove gitignored file. <sup>{1}</sup>
```shell
$ git clean -x -i
Would remove the following items:
  build.TMP  test.o
*** Commands ***
    1: clean                2: filter by pattern    3: select by numbers    4: ask each             5: quit
    6: help
What now>
```

## gc

## fsck

## reflog

* It’s important to note that reflog information is strictly local—it’s a log only of what you’ve done in your repository. The references won’t be the same on someone else’s copy of the repository; also, right after you initially clone a repository, you’ll have an empty reflog, as no activity has occurred yet in your repository. <sup>{1}</sup>

* `git reflog` : One of the things Git does in the background while you’re working away is keep a “reflog”—a log of where your HEAD and branch references have been for the last few months. <sup>{1}</sup>

* `git show HEAD@{2.months.ago}` : Running this will show you the matching commit only if you cloned the project at least two months ago—if you cloned it any more recently than that, you’ll see only your first local commit. <sup>{1}</sup>

## filter-branch

* `git filter-branch --tree-filter 'rm -f passwords.txt' HEAD` : To remove a file named `passwords.txt` from your entire history, you can use the `--tree-filter` option to `filter-branch` <sup>{1}</sup>

* `git filter-branch --tree-filter 'rm -f *~' HEAD` : If you want to remove all accidentally committed editor backup files, you can run something like this <sup>{1}</sup>

* In any case, you can change email addresses in multiple commits in a batch with `filter-branch` as well. You need to be careful to change only the email addresses that are yours, so you use `--commit-filter`
```shell
git filter-branch --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "schacon@localhost" ];
        then
                GIT_AUTHOR_NAME="Scott Chacon";
                GIT_AUTHOR_EMAIL="schacon@example.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD
```

## instaweb

## archive

* `git archive master --prefix='project/' | gzip > `git describe master`.tar.gz` : create an archive of the latest snapshot of your code for those who don’t use Git. <sup>{1}</sup>

* `git archive master --prefix='project/' --format=zip > `git describe master`.zip` : Create a zip archive in much the same way, but by passing the `--format=zip` option to `git archive` <sup>{1}</sup>

## bundle

## daemon

## update-server-info

## cat-file

* `git cat-file -p HEAD` : Shows details of `HEAD` pointer <sup>{1}</sup>

## check-ignore

## checkout-index

## commit-tree

## count-objects

## diff-index

## for-each-ref

## hash-object

## ls-files

* `git ls-files -s` : Git populates this index with a list of all the file contents that were last checked out into your working directory and what they looked like when they were originally checked out. You then replace some of those files with new versions of them, and `git commit` converts that into the tree for a new commit. <sup>{1}</sup>

## ls-tree

* In fact, it’s pretty easy to see what that snapshot looks like. Here is an example of getting the actual directory listing and SHA-1 checksums for each file in the HEAD snapshot: <sup>{1}</sup>
  * `git cat-file -p HEAD`
  * `git ls-tree -r HEAD`

## merge-base

* `git merge-base contrib master` : What you really want to see are the changes added to the topic branch—the work you’ll introduce if you merge this branch with `master`. You do that by having Git compare the last commit on your topic branch with the first common ancestor it has with the `master` branch. <sup>{1}</sup>
  * `git diff 36c7db` : Technically, you can do that by explicitly figuring out the common ancestor and then running your diff on it
  * or, more concisely:
  * `git diff $(git merge-base contrib master)`

## read-tree

## rev-list

## rev-parse

* `git rev-parse topic1` : If you want to see which specific SHA-1 a branch points to, or if you want to see what any of these examples boils down to in terms of SHA-1s, you can use a Git plumbing tool called `rev-parse`. <sup>{1}</sup>

## show-ref

## symbolic-ref

## update-index

## update-ref

## verify-pack

## write-tree

## Others

* `git ls-remote https://github.com/schacon/blink` : If we run this command against the “blink” repository we were using earlier, we will get a list of all the branches and tags and other references in the repository. <sup>{1}</sup>
  * `git ls-remote origin` : Of course, if you’re in your repository and you run this or whatever remote you want to check, it will show you something similar to this. <sup>{1}</sup>

* Sign Commits and Tags
  * [7.4 Git Tools - Signing Your Work](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work)

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
