# Commands/Usage

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

## Commands

* `fd prop -x mpv &` : open result in `mpv res1; mpv res2` in background <sup>{2}</sup>

# Bash.md

## Notes

* If Bash is not default shell, then open any terminal and run command `bash` to enter into Bash-Shell.
* If Powershell is not default shell, then run command `pwsh` to enter into Powershell-7-GitHub. Run command `powershell.exe` to enter into Windows-OS default Powershell-5.

# References

* next-sl: {4}

## Websites

* [GNU Bash](https://www.gnu.org/software/bash/)
* [koalaman/shellcheck GitHub](https://github.com/koalaman/shellcheck)

* Auto-Completion
  * [lincheney/fzf-tab-completion GitHub => Tab completion using fzf](https://github.com/lincheney/fzf-tab-completion)

## Tutorials
  
* [w3schools.com => Bash Tutorial](https://www.w3schools.com/bash/index.php)
* [tutorialspoint.com => Shell Scripting Tutorial](https://www.tutorialspoint.com/unix/shell_scripting.htm)
* [learnshell.org => Interactive Shell Programming tutorial](https://www.learnshell.org/)
* [Ryans Tutorials => Bash Scripting Tutorial](https://ryanstutorials.net/bash-scripting-tutorial/)
* [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
* [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html)

## Guides

* General
  * {1} [bashrc vs. bash_profile: What Is the Difference?](https://phoenixnap.com/kb/bashrc-vs-bash-profile)

* Background Process
  * {2} [fd: find but better](https://www.reddit.com/r/commandline/comments/uibug7/fd_find_but_better/)

## YouTube Tutorials

* General
  * {3} [Unknown Bash shell Tips and Tricks you Must know! BY Dispatch](https://www.youtube.com/watch?v=c773YRyBprw)
