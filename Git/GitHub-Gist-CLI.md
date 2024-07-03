# GitHub CLI Gist

## Instruction
* `ps`
* `which mintty` [Shows output: /usr/bin/mintty]
* From `ps` command search for `/usr/bin/mintty`, if exists then Git-Bash(mintty.exe) is running. Then prefix "winpty" before "gist-edit" command to work with "user-prompt".
* Alternative for Windows-OS prefix "winpty" before any command, it works with all terminal - PowerShell/Alacritty/Git-Bash(mintty.exe).
* In PowerShell/Alacritty terminal to enter into Git-Bash mode, just execute command `bash`

## Commands
* Must use a terminal, that supports "user-prompt". If using Git-Bash(mintty.exe), then prefix "winpty" berfore command.
* To add new file during gist create/edit, open specified text file and insert content into it.
* Login in Git-Bash terminal: `winpty gh auth login`
* Searching Gist
  * Filter gist using description: `gh gist list --limit 99999 | grep "<gist-description>"`
  * Filter gist using tag name: `gh gist list --limit 99999 | grep '#<tag-name>'`
  * Filter gist using multiple "grep", first tag name and then description: `gh gist list --limit 99999 | grep '#<tag-name>' | grep "<gist-description>"` [Also try Regular Expression]
  
* View Gist
  * See list of files in a gist: `gh gist view <gist-id> --files` [Get "gist-id" from `gh gist list` command]
  * See a file content: `gh gist view <gist-id> --filename "<file-name>"` [Get "file-name" from `gh gist view <gist-id> --files` command]
  
* Edit Gist
  * Edit a gist: `gh gist edit <gist-id> --filename "<file-name>"` [Get "file-name" from `gh gist view <gist-id> --files` command]
  * Edit gist description: `winpty gh gist edit <gist-id> --desc "<gist-description> #<tag-name>"`
  * Add new file to existing gist: `winpty gh gist edit <gist-id> --add "/d/test/file-06.txt"` [Here enter absolute file path]
  
* Create Gist
  * Create gist from file content: `cat /d/test/file-01.txt | gh gist create --desc "Test Gist 02 #test" --filename "file-01.txt"`

## Error and Solution
### Git Bash (Windows 8.1) Error
$ gh auth login
? What account do you want to log into?  [Use arrows to move, type to filter]
> GitHub.com
  GitHub Enterprise Server
could not prompt: Incorrect function.
You appear to be running in MinTTY without pseudo terminal support.
To learn about workarounds for this error, run:  gh help mintty


$ gh help mintty
MinTTY is the terminal emulator that comes by default with Git
for Windows. It has known issues with gh's ability to prompt a
user for input.

There are a few workarounds to make gh work with MinTTY:

- Reinstall Git for Windows, checking "Enable experimental support for pseudo consoles".

- Use a different terminal emulator with Git for Windows like Windows Terminal.
  You can run "C:\Program Files\Git\bin\bash.exe" from any terminal emulator to continue
  using all of the tooling in Git For Windows without MinTTY.

- Prefix invocations of gh with winpty, eg: "winpty gh auth login".
  NOTE: this can lead to some UI bugs.

Solution:
* Open Terminal by Double Clicking on -> C:\Program Files\Git\bin\bash.exe
* Run "gh" commands in this Terminal.
* Download Cmder from https://cmder.app/ and install it. [GitHub URL: https://github.com/cmderdev/cmder]
* SOLUTION: Open any terminal [PowerShell](https://github.com/PowerShell/PowerShell)/[Alacritty](https://github.com/alacritty/alacritty) and enter command `bash` to enter into Git-Bash, then user prompt will work.

