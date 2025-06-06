# Work-Git.md

# GitIgnore

## GitIgnored file committed accidentally

**[How do I make Git forget about a file that was tracked, but is now in .gitignore?](https://stackoverflow.com/questions/1274057/how-do-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore) <sup>{11}</sup>**

* WARNING: While this will not remove the physical file from your local machine, it will remove the files from other developers' machines on their next `git pull`.
* `.gitignore` will prevent untracked files from being added (without an `add -f`) to the set of files tracked by Git. However, Git will continue to track any files that are already being tracked.
* To stop tracking a file, we must remove it from the index: `git rm --cached <file>`
* To remove a folder and all files in the folder recursively: `git rm -r --cached <folder>`
* The removal of the file from the head revision will happen on the next commit.

**[2.2 Git Basics - Recording Changes to the Repository](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository) <sup>{10}</sup>**

* `git rm --cached README` : Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area. In other words, you may want to keep the file on your hard drive but not have Git track it anymore. This is particularly useful if you forgot to add something to your `.gitignore` file and accidentally staged it, like a large log file or a bunch of `.a` compiled files. To do this, use the `--cached` option

# Line Ending

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

### EOL Programs <sup>{9}</sup>

* file - Show line endings
* dos2unix - Convert Windows(crlf) line endings to Unix/Linux(lf)
* unix2dos - Convert Unix/Linux(lf) line endings to Windows(crlf)

# References

* next-sl: {12}

## Commands From

* {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)


## Tutorials
  
* {1} [Git Book](https://git-scm.com/book/en/v2) || [progit/progit2 GitHub](https://github.com/progit/progit2)

## Guides

* GitIgnore
  * {10} [2.2 Git Basics - Recording Changes to the Repository](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository)
  * {11} [How do I make Git forget about a file that was tracked, but is now in .gitignore?](https://stackoverflow.com/questions/1274057/how-do-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore)

* Cross Platform Line Ending
  * {2} [GitAttributes](https://git-scm.com/docs/gitattributes)
  * {3} [Resolving Git line ending issues in containers (resulting in many modified files)](https://code.visualstudio.com/docs/devcontainers/tips-and-tricks#_resolving-git-line-ending-issues-in-containers-resulting-in-many-modified-files)
  * {4} [Configuring Git to handle line endings](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings)
  * {5} [Mind the End of Your Line](https://adaptivepatchwork.com/2012/03/01/mind-the-end-of-your-line/)
  * {6} [Why should I use core.autocrlf=true in Git?](https://stackoverflow.com/questions/2825428/why-should-i-use-core-autocrlf-true-in-git)
  * {7} [Git status ignore line endings / identical files / windows & linux environment / dropbox / meld](https://stackoverflow.com/questions/20496084/git-status-ignore-line-endings-identical-files-windows-linux-environment)
  * {8} [How can I remove an entry in global configuration with git config?](https://stackoverflow.com/questions/11868447/how-can-i-remove-an-entry-in-global-configuration-with-git-config)
  * {9} [CR LF line endings - understanding and fixing the invisible characters hiding between the lines](https://www.youtube.com/watch?v=zn7m2Mdm_Vg)
