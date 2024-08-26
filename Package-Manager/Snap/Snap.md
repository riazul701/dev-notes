# Snap Package Manager

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)

## Guides
* [Bash only show first column value](https://unix.stackexchange.com/questions/136884/how-to-use-a-shell-command-to-only-show-the-first-column-and-last-column-in-a-te)
* `/bin/bash^M: bad interpreter: No such file or directory`
  * [Bash script – "/bin/bash^M: bad interpreter: No such file or directory" [duplicate]](https://stackoverflow.com/questions/14219092/bash-script-bin-bashm-bad-interpreter-no-such-file-or-directory)
  * [Are shell scripts sensitive to encoding and line endings?](https://stackoverflow.com/questions/39527571/are-shell-scripts-sensitive-to-encoding-and-line-endings)
* [Bash array with spaces in elements](https://stackoverflow.com/questions/9084257/bash-array-with-spaces-in-elements)
* [Linux replace space to newline for a string](https://stackoverflow.com/questions/33533897/linux-replace-space-to-newline-for-a-string)

## Test Code
* Install package: `sudo snap install smplayer`
* Check "smplayer" package installed or not: `snap list | awk '{print $1}' | grep smplayer`
* To execute software installation script enter into sudo mode `sudo su` for one time.
* Execute script: `./snap-install.sh`
  * Error: `bash: ./snap-install.sh: /bin/bash^M: bad interpreter: No such file or directory`
  * Get bash path: `which bash` [Shows output: `/usr/bin/bash`]
  * Change "End Of Line": In Notepad++ Edit->EOL Conversion->Unix (LF)
  *