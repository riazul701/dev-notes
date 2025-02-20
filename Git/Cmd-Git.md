# Commands/Usage

## Notes

* The `.git/info/exclude` file acts just like a `.gitignore`, but isn’t included in commits. <sup>{1}</sup>

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

* It’s important to note that submodules these days keep all their Git data in the top project’s .git directory, so unlike much older versions of Git, destroying a submodule directory won’t lose any commits or branches that you had. <sup>{1}</sup>
  * With these tools, submodules can be a fairly simple and effective method for developing on several related but still separate projects simultaneously. <sup>{1}</sup>

## General Commands

* Go to the project’s directory
  * `cd /home/user/my_project` : for Linux <sup>{1}</sup>
  * `cd /Users/user/my_project` : for macOS <sup>{1}</sup>
  * `cd C:/Users/user/my_project` : for Windows <sup>{1}</sup>

* `echo 'My Project' > README` : Add text to "README" file <sup>{1}</sup>

* `echo '# test line' >> CONTRIBUTING.md` : Append text to "CONTRIBUTING.md" file <sup>{1}</sup>

* `vim CONTRIBUTING.md` : Edit "CONTRIBUTING.md" file using "vim" editor <sup>{1}</sup>

* `unix2dos hello.rb` : Change Unix line endings to DOS line endings <sup>{1}</sup>

## Install Git

* `sudo apt install git-all` : If you’re on a Debian-based distribution, such as Ubuntu, try `apt` <sup>{1}</sup>
  * `apt show git-all` : This is a dummy package which brings in all subpackages.
* `sudo dnf install git-all` : If you’re on Fedora (or any closely-related RPM-based distribution, such as RHEL or CentOS), you can use `dnf` <sup>{1}</sup>

## Environment Variables

* Git always runs inside a `bash` shell, and uses a number of shell environment variables to determine how it behaves. Occasionally, it comes in handy to know what these are, and how they can be used to make Git behave the way you want it to.

**Global Behavior**

* Some of Git’s general behavior as a computer program depends on environment variables. <sup>{1}</sup>

* `GIT_EXEC_PATH` determines where Git looks for its sub-programs (like `git-commit`, `git-diff`, and others). You can check the current setting by running `git --exec-path`. <sup>{1}</sup>

* `HOME` isn’t usually considered customizable (too many other things depend on it), but it’s where Git looks for the global configuration file. If you want a truly portable Git installation, complete with global configuration, you can override `HOME` in the portable Git’s shell profile. <sup>{1}</sup>

* `PREFIX` is similar, but for the system-wide configuration. Git looks for this file at `$PREFIX/etc/gitconfig`. <sup>{1}</sup>

* `GIT_CONFIG_NOSYSTEM`, if set, disables the use of the system-wide configuration file. This is useful if your system config is interfering with your commands, but you don’t have access to change or remove it. <sup>{1}</sup>

* `GIT_PAGER` controls the program used to display multi-page output on the command line. If this is unset, `PAGER` will be used as a fallback. <sup>{1}</sup>

* `GIT_EDITOR` is the editor Git will launch when the user needs to edit some text (a commit message, for example). If unset, `EDITOR` will be used. <sup>{1}</sup>

**Repository Locations**

* Git uses several environment variables to determine how it interfaces with the current repository. <sup>{1}</sup>

* `GIT_DIR` is the location of the `.git` folder. If this isn’t specified, Git walks up the directory tree until it gets to `~` or `/`, looking for a .git directory at every step. <sup>{1}</sup>

* `GIT_CEILING_DIRECTORIES` controls the behavior of searching for a `.git` directory. If you access directories that are slow to load (such as those on a tape drive, or across a slow network connection), you may want to have Git stop trying earlier than it might otherwise, especially if Git is invoked when building your shell prompt. <sup>{1}</sup>

* `GIT_WORK_TREE` is the location of the root of the working directory for a non-bare repository. If `--git-dir` or `GIT_DIR` is specified but none of `--work-tree`, `GIT_WORK_TREE` or `core.worktree` is specified, the current working directory is regarded as the top level of your working tree. <sup>{1}</sup>

* `GIT_INDEX_FILE` is the path to the index file (non-bare repositories only). <sup>{1}</sup>

* `GIT_OBJECT_DIRECTORY` can be used to specify the location of the directory that usually resides at `.git/objects`. <sup>{1}</sup>

* `GIT_ALTERNATE_OBJECT_DIRECTORIES` is a colon-separated list (formatted like `/dir/one:/dir/two:…`) which tells Git where to check for objects if they aren’t in `GIT_OBJECT_DIRECTORY`. If you happen to have a lot of projects with large files that have the exact same contents, this can be used to avoid storing too many copies of them. <sup>{1}</sup>

**Pathspecs**

* A “pathspec” refers to how you specify paths to things in Git, including the use of wildcards. These are used in the `.gitignore` file, but also on the command-line (`git add *.c`). <sup>{1}</sup>

* `GIT_GLOB_PATHSPECS` and `GIT_NOGLOB_PATHSPECS` control the default behavior of wildcards in pathspecs. If `GIT_GLOB_PATHSPECS` is set to 1, wildcard characters act as wildcards (which is the default); if `GIT_NOGLOB_PATHSPECS` is set to 1, wildcard characters only match themselves, meaning something like `*.c` would only match a file named “\*.c”, rather than any file whose name ends with `.c`. You can override this in individual cases by starting the pathspec with `:(glob)` or `:(literal)`, as in `:(glob)\*.c`. <sup>{1}</sup>

* `GIT_LITERAL_PATHSPECS` disables both of the above behaviors; no wildcard characters will work, and the override prefixes are disabled as well. <sup>{1}</sup>

* `GIT_ICASE_PATHSPECS` sets all pathspecs to work in a case-insensitive manner. <sup>{1}</sup>

**Committing**

* The final creation of a Git commit object is usually done by `git-commit-tree`, which uses these environment variables as its primary source of information, falling back to configuration values only if these aren’t present. <sup>{1}</sup>

* `GIT_AUTHOR_NAME` is the human-readable name in the “author” field. <sup>{1}</sup>

* `GIT_AUTHOR_EMAIL` is the email for the “author” field. <sup>{1}</sup>

* `GIT_AUTHOR_DATE` is the timestamp used for the “author” field. <sup>{1}</sup>

* `GIT_COMMITTER_NAME` sets the human name for the “committer” field. <sup>{1}</sup>

* `GIT_COMMITTER_EMAIL` is the email address for the “committer” field. <sup>{1}</sup>

* `GIT_COMMITTER_DATE` is used for the timestamp in the “committer” field. <sup>{1}</sup>

* `EMAIL` is the fallback email address in case the `user.email` configuration value isn’t set. If this isn’t set, Git falls back to the system user and host names. <sup>{1}</sup>

**Networking**

* Git uses the `curl` library to do network operations over HTTP, so `GIT_CURL_VERBOSE` tells Git to emit all the messages generated by that library. This is similar to doing `curl -v` on the command line. <sup>{1}</sup>

* `GIT_SSL_NO_VERIFY` tells Git not to verify SSL certificates. This can sometimes be necessary if you’re using a self-signed certificate to serve Git repositories over HTTPS, or you’re in the middle of setting up a Git server but haven’t installed a full certificate yet. <sup>{1}</sup>

* If the data rate of an HTTP operation is lower than `GIT_HTTP_LOW_SPEED_LIMIT` bytes per second for longer than `GIT_HTTP_LOW_SPEED_TIME` seconds, Git will abort that operation. These values override the `http.lowSpeedLimit` and `http.lowSpeedTime` configuration values. <sup>{1}</sup>

* `GIT_HTTP_USER_AGENT` sets the user-agent string used by Git when communicating over HTTP. The default is a value like `git/2.0.0`. <sup>{1}</sup>

**Diffing and Merging**

* `GIT_DIFF_OPTS` is a bit of a misnomer. The only valid values are `-u<n>` or `--unified=<n>`, which controls the number of context lines shown in a git diff command. <sup>{1}</sup>

* `GIT_EXTERNAL_DIFF` is used as an override for the `diff.external` configuration value. If it’s set, Git will invoke this program when `git diff` is invoked. <sup>{1}</sup>

* `GIT_DIFF_PATH_COUNTER` and `GIT_DIFF_PATH_TOTAL` are useful from inside the program specified by `GIT_EXTERNAL_DIFF` or `diff.external`. The former represents which file in a series is being diffed (starting with 1), and the latter is the total number of files in the batch. <sup>{1}</sup>

* `GIT_MERGE_VERBOSITY` controls the output for the recursive merge strategy. The allowed values are as follows: <sup>{1}</sup>
  * 0 outputs nothing, except possibly a single error message.
  * 1 shows only conflicts.
  * 2 also shows file changes.
  * 3 shows when files are skipped because they haven’t changed.
  * 4 shows all paths as they are processed.
  * 5 and above show detailed debugging information.
  * The default value is 2.

**Debugging**

* Want to really know what Git is up to? Git has a fairly complete set of traces embedded, and all you need to do is turn them on. The possible values of these variables are as follows: <sup>{1}</sup>
  * “true”, “1”, or “2” – the trace category is written to stderr.
  * An absolute path starting with `/` – the trace output will be written to that file.

* `GIT_TRACE` controls general traces, which don’t fit into any specific category. This includes the expansion of aliases, and delegation to other sub-programs. <sup>{1}</sup>

* `GIT_TRACE_PACK_ACCESS` controls tracing of packfile access. The first field is the packfile being accessed, the second is the offset within that file <sup>{1}</sup>

* `GIT_TRACE_PACKET` enables packet-level tracing for network operations. <sup>{1}</sup>

* `GIT_TRACE_PERFORMANCE` controls logging of performance data. The output shows how long each particular git invocation takes. <sup>{1}</sup>

* `GIT_TRACE_SETUP` shows information about what Git is discovering about the repository and environment it’s interacting with. <sup>{1}</sup>

**Miscellaneous**

* `GIT_SSH`, if specified, is a program that is invoked instead of `ssh` when Git tries to connect to an SSH host. It is invoked like `$GIT_SSH [username@]host [-p <port>] <command>`. Note that this isn’t the easiest way to customize how `ssh` is invoked; it won’t support extra command-line parameters. To support extra command-line parameters, you can use `GIT_SSH_COMMAND`, write a wrapper script and set `GIT_SSH` to point to it or use the `~/.ssh/config` file. <sup>{1}</sup>

* `GIT_SSH_COMMAND` sets the SSH command used when Git tries to connect to an SSH host. The command is interpreted by the shell, and extra command-line arguments can be used with `ssh`, such as `GIT_SSH_COMMAND="ssh -i ~/.ssh/my_key" git clone git@example.com:my/repo`. <sup>{1}</sup>

* `GIT_ASKPASS` is an override for the `core.askpass` configuration value. This is the program invoked whenever Git needs to ask the user for credentials, which can expect a text prompt as a command-line argument, and should return the answer on `stdout` (see Credential Storage for more on this subsystem). <sup>{1}</sup>

* `GIT_NAMESPACE` controls access to namespaced refs, and is equivalent to the `--namespace` flag. This is mostly useful on the server side, where you may want to store multiple forks of a single repository in one repository, only keeping the refs separate. <sup>{1}</sup>

* `GIT_FLUSH` can be used to force Git to use non-buffered I/O when writing incrementally to stdout. A value of 1 causes Git to flush more often, a value of 0 causes all output to be buffered. The default value (if this variable is not set) is to choose an appropriate buffering scheme depending on the activity and the output mode. <sup>{1}</sup>

* `GIT_REFLOG_ACTION` lets you specify the descriptive text written to the reflog. <sup>{1}</sup>

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

## GitAttributes

* Some of these settings can also be specified for a path, so that Git applies those settings only for a subdirectory or subset of files. These path-specific settings are called Git attributes and are set either in a `.gitattributes` file in one of your directories (normally the root of your project) or in the `.git/info/attributes` file if you don’t want the attributes file committed with your project. <sup>{1}</sup>

* Using attributes, you can do things like specify separate merge strategies for individual files or directories in your project, tell Git how to diff non-text files, or have Git filter content before you check it into or out of Git. <sup>{1}</sup>

**Binary Files**

* One cool trick for which you can use Git attributes is telling Git which files are binary (in cases it otherwise may not be able to figure out) and giving Git special instructions about how to handle those files. For instance, some text files may be machine generated and not diffable, whereas some binary files can be diffed. You’ll see how to tell Git which is which. <sup>{1}</sup>

**Identifying Binary Files**

* Some files look like text files but for all intents and purposes are to be treated as binary data. For instance, Xcode projects on macOS contain a file that ends in `.pbxproj`, which is basically a JSON (plain-text JavaScript data format) dataset written out to disk by the IDE, which records your build settings and so on. Although it’s technically a text file (because it’s all UTF-8), you don’t want to treat it as such because it’s really a lightweight database – you can’t merge the contents if two people change it, and diffs generally aren’t helpful. The file is meant to be consumed by a machine. In essence, you want to treat it like a binary file. <sup>{1}</sup>

* To tell Git to treat all `pbxproj` files as binary data, add the following line to your `.gitattributes` file: <sup>{1}</sup>
  * `*.pbxproj binary` <sup>{1}</sup>
  * Now, Git won’t try to convert or fix CRLF issues; nor will it try to compute or print a diff for changes in this file when you run `git show` or `git diff` on your project. <sup>{1}</sup>

**Diffing Binary Files**

* `*.docx diff=word` : Put line in your `.gitattributes` file. This tells Git that any file that matches this pattern (`.docx`) should use the “word” filter when you try to view a diff that contains changes. What is the “word” filter? You have to set it up. Here you’ll configure Git to use the docx2txt program to convert Word documents into readable text files, which it will then diff properly. <sup>{1}</sup>

  * First, you’ll need to install docx2txt; you can download it from https://sourceforge.net/projects/docx2txt. Follow the instructions in the `INSTALL` file to put it somewhere your shell can find it. Next, you’ll write a wrapper script to convert output to the format Git expects. Create a file that’s somewhere in your path called `docx2txt`, and add these contents: <sup>{1}</sup>
  ```shell
  #!/bin/bash
  docx2txt.pl "$1" -
  ```
  * Don’t forget to `chmod a+x` that file. Finally, you can configure Git to use this script <sup>{1}</sup>
  * `git config diff.word.textconv docx2txt`
  * Now Git knows that if it tries to do a diff between two snapshots, and any of the files end in `.docx`, it should run those files through the “word” filter, which is defined as the `docx2txt` program. This effectively makes nice text-based versions of your Word files before attempting to diff them. <sup>{1}</sup>
  * `git diff`

* `*.png diff=exif` : Put line in your `.gitattributes` file. <sup>{1}</sup>
  * `git config diff.exif.textconv exiftool` : Configure Git to use this tool
  * `git diff`

**Exporting Your Repository**

* `test/ export-ignore` : Put line in your `.gitattributes` file. If there is a subdirectory or file that you don’t want to include in your archive file but that you do want checked into your project, you can determine those files via this attribute. <sup>{1}</sup>

* If you want to include a file named `LAST_COMMIT` in your project, and have metadata about the last commit automatically injected into it when `git archive` runs, you can for example set up your `.gitattributes` and `LAST_COMMIT` files like this <sup>{1}</sup>
* `LAST_COMMIT export-subst`
```shell
$ echo 'Last commit date: $Format:%cd by %aN$' > LAST_COMMIT
$ git add LAST_COMMIT .gitattributes
$ git commit -am 'adding LAST_COMMIT file for archives'
```

**Merge Strategies**

* You can also use Git attributes to tell Git to use different merge strategies for specific files in your project. One very useful option is to tell Git to not try to merge specific files when they have conflicts, but rather to use your side of the merge over someone else’s. <sup>{1}</sup>

* `database.xml merge=ours` : Put line in your `.gitattributes` file. Say you have a database settings file called `database.xml` that is different in two branches, and you want to merge in your other branch without messing up the database file. <sup>{1}</sup>
  * `git config --global merge.ours.driver true` : And then define a dummy `ours` merge strategy with
  * If you merge in the other branch, instead of having merge conflicts with the `database.xml` file, you see something like this:
  ```shell
  $ git merge topic
  Auto-merging database.xml
  Merge made by recursive.
  ```
  * In this case, `database.xml` stays at whatever version you originally had.

## help

* If you ever need help while using Git, there are three equivalent ways to get the comprehensive manual page (manpage) help for any of the Git commands: <sup>{1}</sup>
  * `git help <verb>` <sup>{1}</sup>
  * `git <verb> --help` <sup>{1}</sup>
  * `man git-<verb>` <sup>{1}</sup>

* `git help config` : you can get the manpage help for the `git config` command by running this <sup>{1}</sup>

* `git add -h` : You can ask for the more concise “help” output with the `-h` option <sup>{1}</sup>

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

* `git config submodule.DbConnector.url PRIVATE_URL` :  If you use a different URL to push to than others would to pull from, use the one that others have access to. You can overwrite this value locally with this command for your own use. When applicable, a relative URL can be helpful. <sup>{1}</sup>

* `git config --global diff.submodule log` : Now if you go back into the main project and run `git diff --submodule` you can see that the submodule was updated and get a list of commits that were added to it. If you don’t want to type `--submodule` every time you run `git diff`, you can set it as the default format by setting the `diff.submodule` config value to “log”. <sup>{1}</sup>

* `git config -f .gitmodules submodule.DbConnector.branch stable` : This command will by default assume that you want to update the checkout to the default branch of the remote submodule repository (the one pointed to by `HEAD` on the remote). You can, however, set this to something different if you want. For example, if you want to have the `DbConnector` submodule track that repository’s “stable” branch, you can set it in either your `.gitmodules` file (so everyone else also tracks it), or just in your local `.git/config` file. Let’s set it in the `.gitmodules` file <sup>{1}</sup>

* `git config status.submodulesummary 1` : If you set the configuration setting `status.submodulesummary`, Git will also show you a short summary of changes to your submodules <sup>{1}</sup>

* `git config push.recurseSubmodules on-demand` : Git went into the `DbConnector` module and pushed it before pushing the main project. If that submodule push fails for some reason, the main project push will also fail. You can make this behavior the default by doing this <sup>{1}</sup>

* `git config --global credential.helper cache` : You can choose one of these methods by setting a Git configuration value. <sup>{1}</sup>

* `git config --global credential.helper 'store --file ~/.my-credentials'` : Some of these helpers have options. The “store” helper can take a `--file <path>` argument, which customizes where the plain-text file is saved (the default is `~/.git-credentials`). The “cache” helper accepts the `--timeout <seconds>` option, which changes the amount of time its daemon is kept running (the default is “900”, or 15 minutes). Here’s an example of how you’d configure the “store” helper with a custom file name <sup>{1}</sup>

* `git config --global credential.helper 'read-only --file /mnt/shared/creds'` : Since its name starts with “git-”, we can use the simple syntax for the configuration value <sup>{1}</sup>

## Basic Client Configuration

* `man git-config` : If you want to see a list of all the options your version of Git recognizes, you can run <sup>{1}</sup>

**core.editor**

* `git config --global core.editor emacs` : By default, Git uses whatever you’ve set as your default text editor via one of the shell environment variables `VISUAL` or `EDITOR`, or else falls back to the `vi` editor to create and edit your commit and tag messages. To change that default to something else, you can use the `core.editor` setting <sup>{1}</sup>
  * Now, no matter what is set as your default shell editor, Git will fire up Emacs to edit messages. <sup>{1}</sup>

**commit.template**

* If you set this to the path of a file on your system, Git will use that file as the default initial message when you commit. The value in creating a custom commit template is that you can use it to remind yourself (or others) of the proper format and style when creating a commit message. <sup>{1}</sup>

* For instance, consider a template file at `~/.gitmessage.txt` that looks like this: <sup>{1}</sup>
```shell
Subject line (try to keep under 50 characters)

Multi-line description of commit,
feel free to be detailed.

[Ticket: X]
```

* Note how this commit template reminds the committer to keep the subject line short (for the sake of `git log --oneline` output), to add further detail under that, and to refer to an issue or bug tracker ticket number if one exists. <sup>{1}</sup>

* To tell Git to use it as the default message that appears in your editor when you run git commit, set the commit.template configuration value: <sup>{1}</sup>
```shell
$ git config --global commit.template ~/.gitmessage.txt
$ git commit
```

* Then, your editor will open to something like this for your placeholder commit message when you commit: <sup>{1}</sup>
```shell
Subject line (try to keep under 50 characters)

Multi-line description of commit,
feel free to be detailed.

[Ticket: X]
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
# modified:   lib/test.rb
#
~
~
".git/COMMIT_EDITMSG" 14L, 297C
```

* If your team has a commit-message policy, then putting a template for that policy on your system and configuring Git to use it by default can help increase the chance of that policy being followed regularly. <sup>{1}</sup>

**core.pager**

* `git config --global core.pager ''` : This setting determines which pager is used when Git pages output such as `log` and `diff`. You can set it to `more` or to your favorite pager (by default, it’s `less`), or you can turn it off by setting it to a blank string <sup>{1}</sup>
  * If you run that, Git will print the entire output of all commands, no matter how long they are. <sup>{1}</sup>

**user.signingkey**

* `git config --global user.signingkey <gpg-key-id>` : If you’re making signed annotated tags (as discussed in Signing Your Work), setting your GPG signing key as a configuration setting makes things easier. Set your key ID like so <sup>{1}</sup>

* `git tag -s <tag-name>` : Now, you can sign tags without having to specify your key every time with the `git tag` command <sup>{1}</sup>

**core.excludesfile**

* You can put patterns in your project’s `.gitignore` file to have Git not see them as untracked files or try to stage them when you run `git add` on them, as discussed in Ignoring Files. <sup>{1}</sup>

* But sometimes you want to ignore certain files for all repositories that you work with. If your computer is running macOS, you’re probably familiar with `.DS_Store` files. If your preferred editor is Emacs or Vim, you know about filenames that end with a `~` or `.swp`. <sup>{1}</sup>

* This setting lets you write a kind of global `.gitignore` file. If you create a `~/.gitignore_global` file with these contents: <sup>{1}</sup>
```shell
*~
.*.swp
.DS_Store
```

* `git config --global core.excludesfile ~/.gitignore_global` : …and you run this , Git will never again bother you about those files. <sup>{1}</sup>

**help.autocorrect**

* If you mistype a command, it shows you something like this: <sup>{1}</sup>
```shell
$ git chekcout master
git: 'chekcout' is not a git command. See 'git --help'.

The most similar command is
    checkout
```

* Git helpfully tries to figure out what you meant, but it still refuses to do it. If you set `help.autocorrect` to 1, Git will actually run this command for you: <sup>{1}</sup>
```shell
$ git chekcout master
WARNING: You called a Git command named 'chekcout', which does not exist.
Continuing under the assumption that you meant 'checkout'
in 0.1 seconds automatically...
```

* Note that “0.1 seconds” business. `help.autocorrect` is actually an integer which represents tenths of a second. So if you set it to 50, Git will give you 5 seconds to change your mind before executing the autocorrected command. <sup>{1}</sup>

**Colors in Git**

* Git fully supports colored terminal output, which greatly aids in visually parsing command output quickly and easily. A number of options can help you set the coloring to your preference. <sup>{1}</sup>

**color.ui**

* Git automatically colors most of its output, but there’s a master switch if you don’t like this behavior. <sup>{1}</sup>

* `git config --global color.ui false` : To turn off all Git’s colored terminal output, do this <sup>{1}</sup>

* The default setting is `auto`, which colors output when it’s going straight to a terminal, but omits the color-control codes when the output is redirected to a pipe or a file. <sup>{1}</sup>

* You can also set it to `always` to ignore the difference between terminals and pipes. You’ll rarely want this; in most scenarios, if you want color codes in your redirected output, you can instead pass a `--color` flag to the Git command to force it to use color codes. The default setting is almost always what you’ll want. <sup>{1}</sup>

**color.\***

* If you want to be more specific about which commands are colored and how, Git provides verb-specific coloring settings. Each of these can be set to true, false, or always: <sup>{1}</sup>
```shell
color.branch
color.diff
color.interactive
color.status
```

* `git config --global color.diff.meta "blue black bold"` : In addition, each of these has subsettings you can use to set specific colors for parts of the output, if you want to override each color. For example, to set the meta information in your diff output to blue foreground, black background, and bold text, you can run this <sup>{1}</sup>

* You can set the color to any of the following values: `normal`, `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, or `white`. If you want an attribute like bold in the previous example, you can choose from `bold`, `dim`, `ul` (underline), `blink`, and `reverse` (swap foreground and background). <sup>{1}</sup>

**External Merge and Diff Tools**

* Now you can set up your config file to use your custom merge resolution and diff tools. So, you can either run four config commands: <sup>{1}</sup>
```shell
$ git config --global merge.tool extMerge
$ git config --global mergetool.extMerge.cmd \
  'extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
$ git config --global mergetool.extMerge.trustExitCode false
$ git config --global diff.external extDiff
```

* or you can edit your ~/.gitconfig file to add these lines:
```shell
[merge]
  tool = extMerge
[mergetool "extMerge"]
  cmd = extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
  trustExitCode = false
[diff]
  external = extDiff
```

* `git diff 32d1776b1^ 32d1776b1` : After all this is set, if you run diff commands such as this. Instead of getting the diff output on the command line, Git fires up P4Merge, which looks something like this. <sup>{1}</sup>

* Git comes preset to use a number of other merge-resolution tools without your having to set up the cmd configuration. To see a list of the tools it supports, try this: <sup>{1}</sup>
```shell
$ git mergetool --tool-help
'git mergetool --tool=<tool>' may be set to one of the following:
        emerge
        gvimdiff
        gvimdiff2
        opendiff
        p4merge
        vimdiff
        vimdiff2

The following tools are valid, but not currently available:
        araxis
        bc3
        codecompare
        deltawalker
        diffmerge
        diffuse
        ecmerge
        kdiff3
        meld
        tkdiff
        tortoisemerge
        xxdiff

Some of the tools listed above only work in a windowed
environment. If run in a terminal-only session, they will fail.
```

* `git config --global merge.tool kdiff3` : If you’re not interested in using KDiff3 for diff but rather want to use it just for merge resolution, and the kdiff3 command is in your path, then you can run this. If you run this instead of setting up the `extMerge` and `extDiff` files, Git will use KDiff3 for merge resolution and the normal Git diff tool for diffs. <sup>{1}</sup>

**Formatting and Whitespace**

* Formatting and whitespace issues are some of the more frustrating and subtle problems that many developers encounter when collaborating, especially cross-platform. It’s very easy for patches or other collaborated work to introduce subtle whitespace changes because editors silently introduce them, and if your files ever touch a Windows system, their line endings might be replaced. Git has a few configuration options to help with these issues. <sup>{1}</sup>

**core.autocrlf**

* If you’re programming on Windows and working with people who are not (or vice-versa), you’ll probably run into line-ending issues at some point. This is because Windows uses both a carriage-return character and a linefeed character for newlines in its files, whereas macOS and Linux systems use only the linefeed character. This is a subtle but incredibly annoying fact of cross-platform work; many editors on Windows silently replace existing LF-style line endings with CRLF, or insert both line-ending characters when the user hits the enter key. <sup>{1}</sup>

* `git config --global core.autocrlf true` : Git can handle this by auto-converting CRLF line endings into LF when you add a file to the index, and vice versa when it checks out code onto your filesystem. You can turn on this functionality with the `core.autocrlf` setting. If you’re on a Windows machine, set it to `true`—this converts LF endings into CRLF when you check out code <sup>{1}</sup>

* `git config --global core.autocrlf input` : If you’re on a Linux or macOS system that uses LF line endings, then you don’t want Git to automatically convert them when you check out files; however, if a file with CRLF endings accidentally gets introduced, then you may want Git to fix it. You can tell Git to convert CRLF to LF on commit but not the other way around by setting `core.autocrlf` to `input`
  * This setup should leave you with CRLF endings in Windows checkouts, but LF endings on macOS and Linux systems and in the repository. <sup>{1}</sup>

* `git config --global core.autocrlf false` : If you’re a Windows programmer doing a Windows-only project, then you can turn off this functionality, recording the carriage returns in the repository by setting the config value to `false` <sup>{1}</sup>

**core.whitespace**

* Git comes preset to detect and fix some whitespace issues. It can look for six primary whitespace issues—three are enabled by default and can be turned off, and three are disabled by default but can be activated. <sup>{1}</sup>

* The three that are turned on by default are `blank-at-eol`, which looks for spaces at the end of a line; `blank-at-eof`, which notices blank lines at the end of a file; and `space-before-tab`, which looks for spaces before tabs at the beginning of a line. <sup>{1}</sup>

* The three that are disabled by default but can be turned on are `indent-with-non-tab`, which looks for lines that begin with spaces instead of tabs (and is controlled by the `tabwidth` option); `tab-in-indent`, which watches for tabs in the indentation portion of a line; and `cr-at-eol`, which tells Git that carriage returns at the end of lines are OK. <sup>{1}</sup>

* `git config --global core.whitespace \
    trailing-space,-space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol` : You can tell Git which of these you want enabled by setting `core.whitespace` to the values you want on or off, separated by commas. You can disable an option by prepending a `-` in front of its name, or use the default value by leaving it out of the setting string entirely. For example, if you want all but `space-before-tab` to be set, you can do this (with `trailing-space` being a short-hand to cover both `blank-at-eol` and `blank-at-eof`) <sup>{1}</sup>

  * `git config --global core.whitespace \
    -space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol` : Or you can specify the customizing part only <sup>{1}</sup>

* `git apply --whitespace=warn <patch>` : Git will detect these issues when you run a `git diff` command and try to color them so you can possibly fix them before you commit. It will also use these values to help you when you apply patches with `git apply`. When you’re applying patches, you can ask Git to warn you if it’s applying patches with the specified whitespace issues <sup>{1}</sup>

* `git apply --whitespace=fix <patch>` : Or you can have Git try to automatically fix the issue before applying the patch <sup>{1}</sup>

* `git rebase --whitespace=fix` : These options apply to the git rebase command as well. If you’ve committed whitespace issues but haven’t yet pushed upstream, you can run this to have Git automatically fix whitespace issues as it’s rewriting the patches. <sup>{1}</sup>

**Server Configuration**

* `receive.fsckObjects`
* `receive.denyNonFastForwards`
* `receive.denyDeletes`

## credential

* Here’s what a `.gitconfig` would look like if you had a credentials file on a thumb drive, but wanted to use the in-memory cache to save some typing if the drive isn’t plugged in: <sup>{1}</sup>
```shell
[credential]
    helper = store --file /mnt/thumbdrive/.git-credentials
    helper = cache --timeout 30000
```

* Here’s the same example from above, but skipping git-credential and going straight for git-credential-store: <sup>{1}</sup>
  * `git credential-store --file ~/git.store store`
  * `git credential-store --file ~/git.store get`

* `git credential-read-only --file=/mnt/shared/creds get` : We’ll save our helper as `git-credential-read-only`, put it somewhere in our `PATH` and mark it executable. Here’s what an interactive session looks like <sup>{1}</sup>

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

* You may want to set up some aliases for some of these commands as they can be quite long and you can’t set configuration options for most of them to make them defaults. We covered setting up Git aliases in Git Aliases, but here is an example of what you may want to set up if you plan on working with submodules in Git a lot. <sup>{1}</sup>
```shell
$ git config alias.sdiff '!'"git diff && git submodule foreach 'git diff'"
$ git config alias.spush 'push --recurse-submodules=on-demand'
$ git config alias.supdate 'submodule update --remote --merge'
```
  * This way you can simply run `git supdate` when you want to update your submodules, or `git spush` to push with submodule dependency checking. <sup>{1}</sup>

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

* `git clone repo.bundle repo` : On the other side, say you are sent this repo.bundle file and want to work on the project. You can clone from the binary file into a directory, much like you would from a URL. <sup>{1}</sup>

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

* `git checkout --recurse-submodules master` : Using the `--recurse-submodules` flag of `git checkout` can also be useful when you work on several branches in the superproject, each having your submodule pointing at different commits. Indeed, if you switch between branches that record the submodule at different commits, upon executing `git status` the submodule will appear as “modified”, and indicate “new commits”. That is because the submodule state is by default not carried over when switching branches. <sup>{1}</sup>

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

* `git merge --abort` : If you perhaps weren’t expecting conflicts and don’t want to quite deal with the situation yet, you can simply back out of the merge with this. <sup>{1}</sup>

* `git merge -Xignore-space-change whitespace` : If you see that you have a lot of whitespace issues in a merge, you can simply abort it and do it again, this time with `-Xignore-all-space` or `-Xignore-space-change`. The first option ignores whitespace completely when comparing lines, the second treats sequences of one or more whitespace characters as equivalent. <sup>{1}</sup>

* You can extract a copy of each of these versions of the conflicted file with the git show command and a special syntax. <sup>{1}</sup>
```shell
$ git show :1:hello.rb > hello.common.rb
$ git show :2:hello.rb > hello.ours.rb
$ git show :3:hello.rb > hello.theirs.rb
```
  * If you want to get a little more hard core, you can also use the `ls-files -u` plumbing command to get the actual SHA-1s of the Git blobs for each of these files. <sup>{1}</sup>
  ```shell
  $ git ls-files -u
  100755 ac51efdc3df4f4fd328d1a02ad05331d8e2c9111 1 hello.rb
  100755 36c06c8752c78d2aff89571132f3bf7841a7b5c3 2 hello.rb
  100755 e85207e04dfdd5eb0a1e9febbc67fd837c44a1cd 3 hello.rb
  ```

* Now that we have the content of all three stages in our working directory, we can manually fix up theirs to fix the whitespace issue and re-merge the file with the little-known `git merge-file` command which does just that. <sup>{1}</sup>
  * `dos2unix hello.theirs.rb`
  * `git merge-file -p \
    hello.ours.rb hello.common.rb hello.theirs.rb > hello.rb`
  * `git diff -b`

* `git rerere status` : `git rerere` will also tell you what it has recorded the pre-merge state for with <sup>{1}</sup>

* `git rerere diff` : This will show the current state of the resolution—what you started with to resolve and what you’ve resolved it to. <sup>{1}</sup>

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

* `git push --recurse-submodules=check` : You can ask Git to check that all your submodules have been pushed properly before pushing the main project. The `git push` command takes the `--recurse-submodules` argument which can be set to either “check” or “on-demand”. The “check” option will make `push` simply fail if any of the committed submodule changes haven’t been pushed. <sup>{1}</sup>

* `git push --recurse-submodules=on-demand` : Git went into the `DbConnector` module and pushed it before pushing the main project. If that submodule push fails for some reason, the main project push will also fail. You can make this behavior the default by doing  <sup>{1}</sup>
  * `git config push.recurseSubmodules on-demand`. <sup>{1}</sup>

## remote

* `git remote -v` : You can also specify `-v`, which shows you the URLs that Git has stored for the shortname to be used when reading and writing to that remote <sup>{1}</sup>

* `git remote show origin` : If you want to see more information about a particular remote, you can use the `git remote show <remote>` command. If you run this command with a particular shortname, such as `origin`, you get something like this <sup>{1}</sup>

* `git remote add local_proj /srv/git/project.git` : To add a local repository to an existing Git project, you can run something like this <sup>{1}</sup>

* `git remote rename pb paul` : You can run `git remote rename` to change a remote’s shortname. For instance, if you want to rename `pb` to `paul`, you can do so with <sup>{1}</sup>

* `git remote remove paul` : If you want to remove a remote for some reason—you’ve moved the server or are no longer using a particular mirror, or perhaps a contributor isn’t contributing anymore—you can either use `git remote remove` or `git remote rm` <sup>{1}</sup>

## submodule

* Notes
  * It’s important to note that submodules these days keep all their Git data in the top project’s .git directory, so unlike much older versions of Git, destroying a submodule directory won’t lose any commits or branches that you had. <sup>{1}</sup>

  * With these tools, submodules can be a fairly simple and effective method for developing on several related but still separate projects simultaneously. <sup>{1}</sup>

* `git submodule add https://github.com/chaconinc/DbConnector` : To add a new submodule you use the `git submodule add` command with the absolute or relative URL of the project you would like to start tracking. In this example, we’ll add a library called “DbConnector”. <sup>{1}</sup>

* First you should notice the new `.gitmodules` file. This is a configuration file that stores the mapping between the project’s URL and the local subdirectory you’ve pulled it into: <sup>{1}</sup>
```shell
[submodule "DbConnector"]
  path = DbConnector
  url = https://github.com/chaconinc/DbConnector
```

* Cloning a Project with Submodules <sup>{1}</sup>

  * `git clone https://github.com/chaconinc/MainProject` : Here we’ll clone a project with a submodule in it. When you clone such a project, by default you get the directories that contain submodules, but none of the files within them yet <sup>{1}</sup>
  
  * `git submodule init` : The DbConnector directory is there, but empty. You must run two commands from the main project: `git submodule init` to initialize your local configuration file, and `git submodule update` to fetch all the data from that project and check out the appropriate commit listed in your superproject <sup>{1}</sup>
  
  * `git clone --recurse-submodules https://github.com/chaconinc/MainProject` : There is another way to do this which is a little simpler, however. If you pass `--recurse-submodules` to the `git clone` command, it will automatically initialize and update each submodule in the repository, including nested submodules if any of the submodules in the repository have submodules themselves. <sup>{1}</sup>

* `git submodule update --remote DbConnector` : If you prefer to not manually fetch and merge in the subdirectory. If you run `git submodule update --remote`, Git will go into your submodules and fetch and update for you. <sup>{1}</sup>

* `git submodule update --init --recursive` : By default, the `git pull` command recursively fetches submodules changes, as we can see in the output of the first command above. However, it does not update the submodules. This is shown by the output of the `git status` command, which shows the submodule is “modified”, and has “new commits”. What’s more, the brackets showing the new commits point left (<), indicating that these commits are recorded in MainProject but are not present in the local `DbConnector` checkout. To finalize the update, you need to run `git submodule update` <sup>{1}</sup>

* `git submodule sync --recursive` OR `git submodule update --init --recursive` : There is a special situation that can happen when pulling superproject updates: it could be that the upstream repository has changed the URL of the submodule in the `.gitmodules` file in one of the commits you pull. This can happen for example if the submodule project changes its hosting platform. In that case, it is possible for `git pull --recurse-submodules`, or `git submodule update`, to fail if the superproject references a submodule commit that is not found in the submodule remote locally configured in your repository. In order to remedy this situation, the `git submodule sync command` is required <sup>{1}</sup>
  * `git submodule sync --recursive` : copy the new URL to your local config <sup>{1}</sup>
  * `git submodule update --init --recursive` : update the submodule from the new URL <sup>{1}</sup>

* `git submodule update --remote --merge` : Let’s try updating our submodule with the “merge” option. To specify it manually, we can just add the `--merge` option to our `update` call. Here we’ll see that there was a change on the server for this submodule and it gets merged in. <sup>{1}</sup>

* `git submodule update --remote --rebase` : Now if we update our submodule we can see what happens when we have made a local change and upstream also has a change we need to incorporate. <sup>{1}</sup>
  * `git submodule update --remote` : If you forget the `--rebase` or `--merge`, Git will just update the submodule to whatever is on the server and reset your project to a detached HEAD state. <sup>{1}</sup>

* `git submodule update --remote` : If you haven’t committed your changes in your submodule and you run a `submodule update` that would cause issues, Git will fetch the changes but not overwrite unsaved work in your submodule directory. <sup>{1}</sup>

* `git submodule update --remote --merge` : If you made changes that conflict with something changed upstream, Git will let you know when you run the update. <sup>{1}</sup>

* `git submodule foreach 'git stash'` : There is a `foreach` submodule command to run some arbitrary command in each submodule. This can be really helpful if you have a number of submodules in the same project. For example, let’s say we want to start a new feature or do a bugfix and we have work going on in several submodules. We can easily stash all the work in all our submodules. <sup>{1}</sup>
  * `git submodule foreach 'git checkout -b featureA'` : Then we can create a new branch and switch to it in all our submodules. <sup>{1}</sup>
  * `git diff; git submodule foreach 'git diff'` : You get the idea. One really useful thing you can do is produce a nice unified diff of what is changed in your main project and all your subprojects as well. <sup>{1}</sup>

* Switching from subdirectories to submodules <sup>{1}</sup>

  * The other main caveat that many people run into involves switching from subdirectories to submodules. If you’ve been tracking files in your project and you want to move them out into a submodule, you must be careful or Git will get angry at you. Assume that you have files in a subdirectory of your project, and you want to switch it to a submodule. If you delete the subdirectory and then run `submodule add`, Git yells at you: <sup>{1}</sup>
  ```shell
  $ rm -Rf CryptoLibrary/
  $ git submodule add https://github.com/chaconinc/CryptoLibrary
  'CryptoLibrary' already exists in the index
  ```

  * You have to unstage the `CryptoLibrary` directory first. Then you can add the submodule: <sup>{1}</sup>
  ```shell
  $ git rm -r CryptoLibrary
  $ git submodule add https://github.com/chaconinc/CryptoLibrary
  ```

  * Now suppose you did that in a branch. If you try to switch back to a branch where those files are still in the actual tree rather than a submodule — you get this error: <sup>{1}</sup>
  ```shell
  $ git checkout master
  error: The following untracked working tree files would be overwritten by checkout:
    CryptoLibrary/Makefile
    CryptoLibrary/includes/crypto.h
    ...
  Please move or remove them before you can switch branches.
  Aborting
  ```

  * You can force it to switch with checkout -f, but be careful that you don’t have unsaved changes in there as they could be overwritten with that command. <sup>{1}</sup>
  ```shell
  $ git checkout -f master
  warning: unable to rmdir CryptoLibrary: Directory not empty
  Switched to branch 'master'
  ```

  * Then, when you switch back, you get an empty `CryptoLibrary` directory for some reason and `git submodule update` may not fix it either. You may need to go into your submodule directory and run a `git checkout .` to get all your files back. You could run this in a `submodule foreach` script to run it for multiple submodules. <sup>{1}</sup>

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

* `git log --pretty=format:'%h %s' --graph` : Look at the history of your project <sup>{1}</sup>

* `git log -p --submodule` : This is pretty cool as we can actually see the log of commits that we’re about to commit to in our submodule. Once committed, you can see this information after the fact as well when you run `git log -p`. <sup>{1}</sup>

## diff

* `git diff` : To see what you’ve changed but not yet staged, type this with no other arguments <sup>{1}</sup>

* `git diff --staged` : If you want to see what you’ve staged that will go into your next commit, you can use git this. This command compares your staged changes to your last commit <sup>{1}</sup>

* `git diff --cached` : Use this to see what you’ve staged so far (`--staged` and `--cached` are synonyms) <sup>{1}</sup>

* `git diff --check` : Git provides an easy way to check for this—before you commit, run this, which identifies possible whitespace errors and lists them for you. <sup>{1}</sup>

* `git diff master` : To see a full diff of what would happen if you were to merge this topic branch with another branch, you may have to use a weird trick to get the correct results. You may think to run this <sup>{1}</sup>

* `git diff master...contrib` : The triple-dot syntax, This command shows you only the work your current topic branch has introduced since its common ancestor with `master`. <sup>{1}</sup>

* `git diff --ours` : To compare your result to what you had in your branch before the merge, in other words, to see what the merge introduced, you can run this <sup>{1}</sup>

* `git diff --theirs -b` : If we want to see how the result of the merge differed from what was on their side, you can run this. In this and the following example, we have to use `-b` to strip out the whitespace because we’re comparing it to what is in Git. <sup>{1}</sup>

* `git diff --base -b` : You can see how the file has changed from both sides during merge conflict with this <sup>{1}</sup>

* `git diff-tree -p rack_branch` : Another slightly weird thing is that to get a diff between what you have in your `rack` subdirectory and the code in your `rack_branch` branch—to see if you need to merge them—you can’t use the normal `diff` command. Instead, you must run `git diff-tree` with the branch you want to compare to <sup>{1}</sup>

* `git diff-tree -p rack_remote/master` : To compare what is in your rack subdirectory with what the master branch on the server was the last time you fetched, you can run this <sup>{1}</sup>

* `git diff --cached DbConnector` : The other listing in the `git status` output is the project folder entry. If you run `git diff` on that, you see something interesting <sup>{1}</sup>

* `git diff --cached --submodule` : If you want a little nicer diff output, you can pass the `--submodule` option to `git diff`. <sup>{1}</sup>

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

* `git bisect start` : First you run `git bisect start` to get things going, and then you use `git bisect bad` to tell the system that the current commit you’re on is broken. Then, you must tell bisect when the last known good state was, using `git bisect good <good_commit>` <sup>{1}</sup>
  * `git bisect start HEAD v1.0`

* `git bisect reset` : When you’re finished, you should run this to reset your HEAD to where you were before you started, or you’ll end up in a weird state <sup>{1}</sup>

* `git bisect run test-error.sh` : Doing so automatically runs `test-error.sh` on each checked-out commit until Git finds the first broken commit. You can also run something like `make` or `make tests` or whatever you have that runs automated tests for you. <sup>{1}</sup>

## blame

* `git blame -L 69,82 Makefile` : The following example uses `git blame` to determine which commit and committer was responsible for lines in the top-level Linux kernel `Makefile` and, further, uses the `-L` option to restrict the output of the annotation to lines 69 through 82 of that file <sup>{1}</sup>

* `git blame -C -L 141,153 GITPackUpload.m` : You are refactoring a file named `GITServerHandler.m` into multiple files, one of which is `GITPackUpload.m`. By blaming `GITPackUpload.m` with the `-C` option, you can see where sections of the code originally came from <sup>{1}</sup>

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

**Git and Subversion**

* `git svn clone file:///tmp/test-svn -T trunk -b branches -t tags` : Now that you have a Subversion repository to which you have write access, you can go through a typical workflow. You’ll start with the `git svn clone` command, which imports an entire Subversion repository into a local Git repository. Remember that if you’re importing from a real hosted Subversion repository, you should replace the `file:///tmp/test-svn` here with the URL of your Subversion repository <sup>{1}</sup>

* `git svn dcommit` : Next, you need to push your change upstream. Notice how this changes the way you work with Subversion – you can do several commits offline and then push them all at once to the Subversion server. To push to a Subversion server, you run this command <sup>{1}</sup>

* `git svn rebase` : To resolve this (conflict) situation, you can run `git svn rebase`, which pulls down any changes on the server that you don’t have yet and rebases any work you have on top of what is on the server <sup>{1}</sup>

* `git svn log` : If you’re used to Subversion and want to see your history in SVN output style, you can run this to view your commit history in SVN formatting <sup>{1}</sup>

* `git svn blame README.txt` : Much as the `git svn log` command simulates the `svn log` command offline, you can get the equivalent of `svn annotate` by running `git svn blame [FILE]`. The output looks like this <sup>{1}</sup>

* `git svn info` : You can also get the same sort of information that `svn info` gives you by running this <sup>{1}</sup>

* `git svn show-ignore > .git/info/exclude` : The second command is `git svn show-ignore`, which prints to stdout the lines you need to put in a `.gitignore` file so you can redirect the output into your project exclude file <sup>{1}</sup>
  * That way, you don’t litter the project with `.gitignore` files. This is a good option if you’re the only Git user on a Subversion team, and your teammates don’t want `.gitignore` files in the project. <sup>{1}</sup>

**Git and Mercurial**

* `hg clone http://selenic.com/repo/hello /tmp/hello` : All you need is a Mercurial repository you can push to. Fortunately, every Mercurial repository can act this way, so we’ll just use the "hello world" repository everyone uses to learn Mercurial. <sup>{1}</sup>

* `git clone hg::/tmp/hello /tmp/hello-git` : As you’ll see, these two systems are similar enough that there isn’t much friction. As always with Git, first we clone <sup>{1}</sup>

* `cp .hgignore .git/info/exclude` : There’s one more thing we should attend to before we continue: ignores. Mercurial and Git use a very similar mechanism for this, but it’s likely you don’t want to actually commit a `.gitignore` file into a Mercurial repository. Fortunately, Git has a way to ignore files that’s local to an on-disk repository, and the Mercurial format is compatible with Git, so you just have to copy it over <sup>{1}</sup>

* `hg log -G --style compact` : That’s it! If you take a look at the Mercurial repository, you’ll see that this did what we’d expect <sup>{1}</sup>

* `hg log -l 1` : Mercurial’s concept of a “branch” is more heavyweight. The branch that a changeset is made on is recorded with the changeset, which means it will always be in the repository history. Here’s an example of a commit that was made on the `develop` branch <sup>{1}</sup>

* Note the line that begins with “branch”. Git can’t really replicate this (and doesn’t need to; both types of branch can be represented as a Git ref), but git-remote-hg needs to understand the difference, because Mercurial cares. <sup>{1}</sup>
  * `git checkout -b featureA` : Creating Mercurial bookmarks is as easy as creating Git branches. On the Git side <sup>{1}</sup>
  * `hg bookmarks` : That’s all there is to it. On the Mercurial side, it looks like this <sup>{1}</sup>

* `hg branches` : Shows Mercurial banch list <sup>{1}</sup>

**Git and Perforce**

* Perforce provides a product called Git Fusion (available at https://www.perforce.com/manuals/git-fusion/), which synchronizes a Perforce server with Git repositories on the server side. <sup>{1}</sup>

* You should take note of the IP address that’s shown here, we’ll be using it later on. Next, we’ll create a Perforce user. Select the “Login” option at the bottom and press enter (or SSH to the machine), and log in as root. Then use these commands to create a user: <sup>{1}</sup>
```shell
$ p4 -p localhost:1666 -u super user -f john
$ p4 -p localhost:1666 -u john passwd
$ exit
```

* `git p4 clone //depot/www/live www-shallow` : As with anything in Git, the first command is to clone <sup>{1}</sup>

* `git p4 sync` : We’ve made two new commits that we’re ready to submit to the Perforce server. Let’s check if anyone else was working today <sup>{1}</sup>

* `git p4 rebase` : Looks like they were, and `master` and `p4/master` have diverged. Perforce’s branching system is nothing like Git’s, so submitting merge commits doesn’t make any sense. Git-p4 recommends that you rebase your commits, and even comes with a shortcut to do so <sup>{1}</sup>

* `git p4 submit` : The result is as though we just did a `git push`, which is the closest analogy to what actually did happen. <sup>{1}</sup>

* `git p4 submit -n` : The `-n` flag is short for `--dry-run`, which tries to report what would happen if the submit command were run for real. <sup>{1}</sup>

* `git p4 clone --detect-branches //depot/project@all` : Note the “@all” specifier in the depot path; that tells git-p4 to clone not just the latest changeset for that subtree, but all changesets that have ever touched those paths. This is closer to Git’s concept of a clone, but if you’re working on a project with a long history, it could take a while. <sup>{1}</sup>

  * The `--detect-branches` flag tells git-p4 to use Perforce’s branch specs to map the branches to Git refs. If these mappings aren’t present on the Perforce server (which is a perfectly valid way to use Perforce), you can tell git-p4 what the branch mappings are, and you get the same result: <sup>{1}</sup>
    * `git config git-p4.branchList main:dev`
    * `git clone --detect-branches //depot/project@all .`

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

* `git gc` : The initial format in which Git saves objects on disk is called a “loose” object format. However, occasionally Git packs up several of these objects into a single binary file called a “packfile” in order to save space and be more efficient. Git does this if you have too many loose objects around, if you run the `git gc` command manually, or if you push to a remote server. To see what happens, you can manually ask Git to pack up the objects by calling the `git gc` command <sup>{1}</sup>

* `git gc --auto` : Occasionally, Git automatically runs a command called “auto gc”. Most of the time, this command does nothing. However, if there are too many loose objects (objects not in a packfile) or too many packfiles, Git launches a full-fledged git gc command. The “gc” stands for garbage collect, and the command does a number of things: it gathers up all the loose objects and places them in packfiles, it consolidates packfiles into one big packfile, and it removes objects that aren’t reachable from any commit and are a few months old. You can run `auto gc` manually as follows <sup>{1}</sup>

## fsck

* `git fsck --full` : Because the reflog data is kept in the `.git/logs/` directory, you effectively have no reflog. How can you recover that commit at this point? One way is to use the `git fsck` utility, which checks your database for integrity. If you run it with the `--full` option, it shows you all objects that aren’t pointed to by another object <sup>{1}</sup>

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

* `git filter-branch --index-filter \
  'git rm --ignore-unmatch --cached git.tgz' -- 7b30847^..` : You must rewrite all the commits downstream from `7b30847` to fully remove this file from your Git history. To do so, you use `filter-branch`, which you used in Rewriting History. The `--index-filter` option is similar to the `--tree-filter` option used in Rewriting History, except that instead of passing a command that modifies files checked out on disk, you’re modifying your staging area or index each time. <sup>{1}</sup>

## instaweb

## archive

* `git archive master --prefix='project/' | gzip > `git describe master`.tar.gz` : create an archive of the latest snapshot of your code for those who don’t use Git. <sup>{1}</sup>

* `git archive master --prefix='project/' --format=zip > `git describe master`.zip` : Create a zip archive in much the same way, but by passing the `--format=zip` option to `git archive` <sup>{1}</sup>

## bundle

* `git bundle create repo.bundle HEAD master` : If you want to send that repository to someone and you don’t have access to a repository to push to, or simply don’t want to set one up, you can bundle it with this. Now you have a file named `repo.bundle` that has all the data needed to re-create the repository’s `master` branch. <sup>{1}</sup>

* `git clone repo.bundle repo` : On the other side, say you are sent this repo.bundle file and want to work on the project. You can clone from the binary file into a directory, much like you would from a URL. <sup>{1}</sup>

* `git bundle create commits.bundle master ^9a466c5` : So now that we have the list of commits we want to include in the bundle, let’s bundle them up. We do that with the `git bundle create` command, giving it a filename we want our bundle to be and the range of commits we want to go into it. Now we have a commits.bundle file in our directory <sup>{1}</sup>
  * `git bundle verify ../commits.bundle` : When he gets the bundle, he can inspect it to see what it contains before she imports it into her repository. The first command is the bundle verify command that will make sure the file is actually a valid Git bundle and that you have all the necessary ancestors to reconstitute it properly. <sup>{1}</sup>

## daemon

## update-server-info

## cat-file

* `git cat-file -p d670460b4b4aece5915caf5c68d12f560a9fe3e4` : Once you have content in your object database, you can examine that content with the `git cat-file` command. This command is sort of a Swiss army knife for inspecting Git objects. Passing `-p` to `cat-file` instructs the command to first figure out the type of content, then display it appropriately <sup>{1}</sup>

* `git cat-file -p HEAD` : Inspect/Shows details of `HEAD` pointer <sup>{1}</sup>

* `git cat-file commit ca82a6` : You have to figure out how to get the commit message from each of these commits to test. To get the raw commit data, you can use another plumbing command called `git cat-file`. <sup>{1}</sup>

* Now, you can add content to Git and pull it back out again. You can also do this with content in files. For example, you can do some simple version control on a file. First, create a new file and save its contents in your database: <sup>{1}</sup>
```shell
$ echo 'version 1' > test.txt
$ git hash-object -w test.txt
83baae61804e65cc73a7201a7252750c76066a30
```

* Let’s say you have a project where the most-recent tree looks something like this. The `master^{tree}` syntax specifies the tree object that is pointed to by the last commit on your `master` branch. <sup>{1}</sup>
```shell
$ git cat-file -p master^{tree}
100644 blob a906cb2a4a904a152e80877d4088654daad0c859      README
100644 blob 8f94139338f9404f26296befa88755fc2598c289      Rakefile
040000 tree 99f1a6d12cb4b6f19c8655fca46c3ecf317074e0      lib
```

## check-ignore

## checkout-index

## commit-tree

* `echo 'First commit' | git commit-tree d8329f` : To create a commit object, you call `commit-tree` and specify a single tree SHA-1 and which commit objects, if any, directly preceded it. Start with the first tree you wrote <sup>{1}</sup>

## count-objects

* `git count-objects -v` : You can run the `count-objects` command to quickly see how much space you’re using <sup>{1}</sup>

## diff-index

## for-each-ref

## hash-object

* `echo 'test content' | git hash-object -w --stdin` : In its simplest form, `git hash-object` would take the content you handed to it and merely return the unique key that would be used to store it in your Git database. The `-w` option then tells the command to not simply return the key, but to write that object to the database. Finally, the `--stdin` option tells `git hash-object` to get the content to be processed from stdin; otherwise, the command would expect a filename argument at the end of the command containing the content to be used. <sup>{1}</sup>

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

* `git read-tree --prefix=bak d8329fc1cc938780ffdd9f94e0d364e0ea74f579` : You can read trees into your staging area by calling this. In this case, you can read an existing tree into your staging area as a subtree by using the `--prefix` option with this command <sup>{1}</sup>

## rev-list

* `git rev-list 538c33..d14fc7` : You can get a list of the SHA-1 values of all the commits that are being pushed by taking the `$newrev` and `$oldrev` values and passing them to a Git plumbing command called `git rev-list`. This is basically the `git log` command, but by default it prints out only the SHA-1 values and no other information. So, to get a list of all the commit SHA-1s introduced between one commit SHA-1 and another, you can run something like this <sup>{1}</sup>

* `git rev-list --objects --all | grep 82c99a3` : To find out what file it is, you’ll use the `rev-list` command, which you used briefly in Enforcing a Specific Commit-Message Format. If you pass `--objects` to `rev-list`, it lists all the commit SHA-1s and also the blob SHA-1s with the file paths associated with them. You can use this to find your blob’s name <sup>{1}</sup>

## rev-parse

* `git rev-parse topic1` : If you want to see which specific SHA-1 a branch points to, or if you want to see what any of these examples boils down to in terms of SHA-1s, you can use a Git plumbing tool called `rev-parse`. <sup>{1}</sup>

## show-ref

## symbolic-ref

* `git symbolic-ref HEAD` : You can also manually edit this file (`.git/HEAD`), but again a safer command exists to do so: `git symbolic-ref`. You can read the value of your HEAD via this command <sup>{1}</sup>

* `git symbolic-ref HEAD refs/heads/test` : You can also set the value of HEAD using the same command <sup>{1}</sup>

* You can’t set a symbolic reference outside of the refs style: <sup>{1}</sup>
```shell
$ git symbolic-ref HEAD test
fatal: Refusing to point HEAD outside of refs/
```

## update-index

## update-ref

* `git update-ref refs/heads/master 1a410efbd13591db07496601ebc7a059dd55cfe9` : You aren’t encouraged to directly edit the reference files; instead, Git provides the safer command `git update-ref` to do this if you want to update a reference. That’s basically what a branch in Git is: a simple pointer or reference to the head of a line of work. <sup>{1}</sup>
  * `git update-ref refs/heads/test cac0ca` : To create a branch back at the second commit, you can do this <sup>{1}</sup>

* `git update-ref refs/tags/v1.0 cac0cab538b970a37ea1e769cbbde608743bc96d` : As discussed in Git Basics, there are two types of tags: annotated and lightweight. You can make a lightweight tag by running something like this <sup>{1}</sup>

* `git tag -a v1.1 1a410efbd13591db07496601ebc7a059dd55cfe9 -m 'Test tag'` : If you create an annotated tag, Git creates a tag object and then writes a reference to point to it rather than directly to the commit. You can see this by creating an annotated tag (using the `-a` option) <sup>{1}</sup>
  * Here’s the object SHA-1 value it created: `cat .git/refs/tags/v1.1` <sup>{1}</sup>

## verify-pack

* `git verify-pack -v .git/objects/pack/pack-978e03944f5c581011e6998cd0e9e30000905586.idx` : When Git packs objects, it looks for files that are named and sized similarly, and stores just the deltas from one version of the file to the next. You can look into the packfile and see what Git did to save space. The `git verify-pack` plumbing command allows you to see what was packed up <sup>{1}</sup>

* `git verify-pack -v .git/objects/pack/pack-29…69.idx \
  | sort -k 3 -n \
  | tail -3` : But suppose you didn’t; how would you identify what file or files were taking up so much space? If you run `git gc`, all the objects are in a packfile; you can identify the big objects by running another plumbing command called `git verify-pack` and sorting on the third field in the output, which is file size. You can also pipe it through the `tail` command because you’re only interested in the last few largest files <sup>{1}</sup>
  * Shows Output
  ```shell
  dadf7258d699da2c8d89b09ef6670edb7d5f91b4 commit 229 159 12
  033b4468fa6b2a9547a70d88d1bbe8bf3f9ed0d5 blob   22044 5792 4977696
  82c99a3e86bb1267b236a4b6eff7868d97489af1 blob   4975916 4976258 1438
  ```
  * The big object is at the bottom: 5MB.

## write-tree

* `git write-tree` : Now, you can use this to write the staging area out to a tree object. No -w option is needed—calling this command automatically creates a tree object from the state of the index if that tree doesn’t yet exist <sup>{1}</sup>

## Others

* `git ls-remote https://github.com/schacon/blink` : If we run this command against the “blink” repository we were using earlier, we will get a list of all the branches and tags and other references in the repository. <sup>{1}</sup>
  * `git ls-remote origin` : Of course, if you’re in your repository and you run this or whatever remote you want to check, it will show you something similar to this. <sup>{1}</sup>

* `git replace 81a708d c6e1e95` : To combine them, you can simply call git replace with the commit you want to replace and then the commit you want to replace it with. So we want to replace the "fourth" commit in the master branch with the "fourth" commit in the project-history/master branch <sup>{1}</sup>

* `git prune --expire now` : The packed repository size is down to 8K, which is much better than 5MB. You can see from the size value that the big object is still in your loose objects, so it’s not gone; but it won’t be transferred on a push or subsequent clone, which is what is important. If you really wanted to, you could remove the object completely by running `git prune` with the `--expire` option <sup>{1}</sup>
  * `git count-objects -v` : Let’s see how much space you saved. <sup>{1}</sup>

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
