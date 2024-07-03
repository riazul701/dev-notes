# Git - Source Code Management (SCM)

# Commands

# Elements of Git-SCM

## Websites
* [Git Official Site](https://git-scm.com/)
* [MSYS2](https://www.msys2.org/)

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

## GitHub Pages
* [How to see an HTML page on Github as a normal rendered HTML page to see preview in browser, without downloading?](https://stackoverflow.com/questions/8446218/how-to-see-an-html-page-on-github-as-a-normal-rendered-html-page-to-see-preview)
  * [htmlpreview/htmlpreview.github.com](https://github.com/htmlpreview/htmlpreview.github.com)
  * [GitHub Pages](https://pages.github.com/)

## Notes

## Guides

* [Git Detached Head: What This Means and How to Recover](https://www.cloudbees.com/blog/git-detached-head)

# Git Credential Manager/Helper

## Website Links

* [Git Credential Helper](https://git-scm.com/docs/gitcredentials)
* [GitCredentialManager/git-credential-manager](https://github.com/GitCredentialManager/git-credential-manager)

## Notes

* In Windows-Subsystem-for-Linux, git uses "credential.helper" and "credential.credentialStore" from Host Windows-OS.

## Windows-OS Installation

### Instructions (Windows-OS)
* Git-Credential-Manger is built-in inside Git-Bash.
* Install using [Scoop](https://scoop.sh/)
  * Open PowerShell in Administrator mode.
  * scoop bucket add main
  * scoop install --global main/git
* Git installation output shows:
  * Set Git Credential Manager Core by running: "git config --global credential.helper manager"
  * To add context menu entries, run 'C:\ProgramData\scoop\apps\git\current\install-context.reg'
  * To create file-associations for .git* and .sh files, run 'C:\ProgramData\scoop\apps\git\current\install-file-associations.reg'
* Check Git-Credential-Manager Version: `git-credential-manager --version`

### Git-Bash Configuraion (Windows-OS)
* [Install instructions](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md)
* Configure "git config --global credential.helper" (Attach GCM with Git): `git-credential-manager configure`
  * Shows help: `git-credential-manager --help`
* [Credential stores](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/credstores.md)
  * git config --global credential.credentialStore wincredman [Does not work over a network/SSH session.]
  * git config --global credential.credentialStore dpapi [Works over a network/SSH session.]
    * This credential store uses Windows DPAPI to encrypt credentials which are stored as files in your file system. The file structure is the same as the [plaintext files credential store](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/credstores.md#plaintext-files) except the first line (the secret value) is protected by DPAPI.
    * By default files are stored in `%USERPROFILE%\.gcm\dpapi_store`. This can be configured using the environment variable `GCM_DPAPI_STORE_PATH` environment variable.
    * If the directory doesn't exist it will be created.
* Check credential helper: `git config --global credential.helper`
* Check credential store: `git config --global credential.credentialStore`

## Windows Subsystem for Linux

* {16} [How to use Git credential store on WSL (Ubuntu on Windows)?](https://stackoverflow.com/questions/45925964/how-to-use-git-credential-store-on-wsl-ubuntu-on-windows)
* {17} [RichardBronosky/Storing-git-Credentials.md](https://gist.github.com/RichardBronosky/9ab50abb8698e02341629db21e5fa6bf)
* On Host Windows-OS, to install Git-Bash, open PowerShell in Administrator mode and enter command: `scoop install --global git`
* By default, WSL shares "git.exe" and "git-credential-manager.exe" from Host Windows-OS Git-Bash.
* We can check this by `git --version` command. If it shows "windows" in version name, then it is from Host Windows-OS.
* If we install "git-credential-manager" for Linux then it will not work.
* Must use "git-credential-manager.exe", NOT "/usr/local/bin/git-credential-manager".
* If we want to use "/usr/bin/git" (Linux-Git), NOT "git.exe" (Git-Bash), then
  * Open file: `~/.bashrc`
  * Append line: `alias git="/usr/bin/git"`
  * `source ~/.bashrc`
  * Check "windows" string is not in version name: `git --version`
* Link "/usr/bin/git" (Linux-Git) with "git-credential-manager.exe" (Git-Bash)
  * Get "git-credential-manager.exe" path: `which git-credential-manager.exe`
  * Add "git-credential-manager.exe" to "/usr/bin/git" (Linux-Git): `git config --global credential.helper "<git-credential-manager.exe path>"`
    * Error: error: cannot overwrite multiple values with a single value. Use a regexp, --add or --replace-all to change credential.helper.
    * Solution: `git config --global --replace-all credential.helper "<git-credential-manager.exe path>"`
  * Configure "git-credential-manager.exe": `git-credential-manager.exe configure`
* GitHub/BitBucket credentials will be shared from Host Windows-OS to WSL.

## Linux-OS Installation

### Instructions (Linux-OS)

* [Install instructions](https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md)

* Install Using DEB file
  * Download DEB file from [GitCredentialManager DEB File](https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.886/gcm-linux_amd64.2.0.886.deb)
  * Use "wget" to download: `wget <URL>`
  * Install: `sudo dpkg -i <path-to-package>`
  * Installation configure: `git-credential-manager configure`
  * Uninstallation configure: `git-credential-manager unconfigure`
  * Uninstall: `sudo dpkg -r gcm`
  
* If there are errors duing DEB file installation, then try TAR file
  * Error Reason: {15} [zst compression not supported by apt/dpkg](https://unix.stackexchange.com/questions/669004/zst-compression-not-supported-by-apt-dpkg)
  * Debian’s dpkg package didn’t support zstd compression prior to version 1.21.18. Support was added just in time for Debian 12.

* Install Using TAR file
  * In Antix-OS-22-amd64 Full version, dpkg version is 1.20.12 (amd64). So use TAR instruction set.
  * Download TAR file from [GitCredentialManager TAR File](https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.886/gcm-linux_amd64.2.0.886.tar.gz)
  * Use "wget" to download: `wget <URL>`
  * Install: `sudo tar -xvf <path-to-tarball> -C /usr/local/bin` [For permission error use `sudo` command]
  * Installation configure: `git-credential-manager configure`
  * Uninstallation configure: `git-credential-manager unconfigure`
  * Uninstall: `rm $(command -v git-credential-manager)`
  * Check version: `git-credential-manager --version`

* Check Configuration
  * Check credential helper: `git config --global credential.helper`
  * Check credential store: `git config --global credential.credentialStore`

### Configuration (Linux-OS)

* [Credential stores](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md)
* Check "git-credential-manager" path: `which git-credential-manager`
* Configure "git config --global credential.helper" (Attach GCM with Git): `git-credential-manager configure` [Shows help: `git-credential-manager --help`]
* Settings for "credentialStore: gpg"
  * Install "gpg" command if not exists: `sudo apt install gpg`
  * Install "pass" command if not exists: `sudo apt install pass`
  * Generates "gpg-id": `gpg --gen-key` [Here provide Name and Email]
  * Generates pass file: `pass init <gpg-id>` [<gpg-id> is long hash which is under "pub" tag from `gpg --gen-key` command] [Here a password is optional, which will be required during GitHub/BitBucket authentication. Do not use password for "LazyGit" software.]
  * Set credential backing store: `git config --global credential.credentialStore gpg`
* Configuration for [LazyGit](https://github.com/jesseduffield/lazygit)
  * Problem: GPG password prompt does not work with LazyGit.
  * When `gpg --gen-key` command asks for password, then do not enter any password and press "OK" button.
  * Now, during use of `git push` command, no password will be asked.
* Check GitCredentialManager is working or not: `git push`
* [NOT APPLICABLE] Settings for "credentialStore: cache"
  * Set credential backing store: `git config --global credential.credentialStore cache`
  * By default, git credential-cache stores credentials for 900 seconds.

* Check Configuration
  * Check credential helper: `git config --global credential.helper`
  * Check credential store: `git config --global credential.credentialStore`

* GPG Key Management
  * [How to Delete GPG Keys in Linux](https://linuxhint.com/delete-gpg-keys-linux/)
  * We have to delete the private key first and then move towards the public key deletion process, as GPG only permits you to delete the public key when its related private key is removed from the system.
  * List public keys: `gpg --list-keys`
  * List private keys: `gpg --list-secret-keys`
  * Delete private key: `gpg --delete-secret-key [Key_ID]`
  * Delete public key: `gpg --delete-key [Key_ID]`

* Pass (password-command) Management
  * Pass command help: `pass --help`
  * Pass list: `pass ls`
  * Delete pass: `pass rm -r <pass-name>`

### GCM Error (Linux-OS)

* Error Message: fatal: No credential store has been selected.
  > $ git push
  > fatal: No credential store has been selected.
  > 
  > Set the GCM_CREDENTIAL_STORE environment variable or the credential.credentialStore Git configuration setting to one of the following options:
  >
  >  secretservice : freedesktop.org Secret Service (requires graphical interface)
  >  gpg           : GNU `pass` compatible credential storage (requires GPG and `pass`)
  >  cache         : Git's in-memory credential cache
  >  plaintext     : store credentials in plain-text files (UNSECURE)
  >
  > See https://aka.ms/gcm/credstores for more information.

  * Solution:
  * [How to fix git credential manager core](https://techoverflow.net/2021/09/19/how-to-fix-git-credential-manager-core-git-fatal-no-credential-backing-store-has-been-selected/)
  * `git config --global credential.credentialStore gpg`

## Git Pull/Push via SSH

* [Credential stores](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/credstores.md)
  * In Windows-OS: `git config --global credential.credentialStore wincredman [Does not work over a network/SSH session.]
  * In Windows-OS: `git config --global credential.credentialStore dpapi` [Works over a network/SSH session.]
  * Linux-OS does not have this issue.

* Error Message: fatal: GPG_TTY is not set; add `export GPG_TTY=$(tty)` to your profile.
* [Headless/TTY-only sessions](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/credstores.md#headlesstty-only-sessions)
* [How to force GPG to use console-mode pinentry to prompt for passwords?](https://superuser.com/questions/520980/how-to-force-gpg-to-use-console-mode-pinentry-to-prompt-for-passwords)
  * The easiest way to do this is by adding the following to your profile (~/.bashrc, ~/.profile etc):
  * Open file "~/.bashrc" and "~/.profile"
  * Append code: `export GPG_TTY=$(tty)`
  * Reload "~/.bashrc" file: `source ~/.bashrc`
  * Reload "~/.profile" file: `source ~/.profile`
* Commands
  * Git clone: `export GPG_TTY=$(tty) && cd '/pwd/path' && git clone https://git-url`
  * Git fetch: `export GPG_TTY=$(tty) && cd '/pwd/path' && git fetch`
  * Git pull: `export GPG_TTY=$(tty) && cd '/pwd/path' && git pull`
  * Git push: `export GPG_TTY=$(tty) && cd '/pwd/path' && git push`

# Authentication Using SSH

## BitBucket

## GitHub

# Problem and Solution

* Error: fatal: detected dubious ownership in repository at... To add an exception for this directory, call:...
  * Solution:
  * [How to correct `git` reporting `detected dubious ownership in repository` without adding `safe.directory` when using WSL?](https://stackoverflow.com/questions/73485958/how-to-correct-git-reporting-detected-dubious-ownership-in-repository-withou)
  * [git submodule update failed with 'fatal: detected dubious ownership in repository at'](https://stackoverflow.com/questions/72978485/git-submodule-update-failed-with-fatal-detected-dubious-ownership-in-repositor)
  * `git config --global --add safe.directory '*'`
  * Note: If you are using Windows Command Prompt, do not add single-quotes to the asterisk, i.e., `git config --global --add safe.directory *`

# References

* next-sl: {18}

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

* Git Credential Manager/Helper
  * {9} [Git Credential Manager](https://stackoverflow.com/questions/36585496/error-when-using-git-credential-helper-with-gnome-keyring-as-sudo/40312117#40312117)
  * {10} [Debian package](https://github.com/GitCredentialManager/git-credential-manager/blob/release/docs/install.md#debian-package)
  * {11} [Credential stores](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md)
  * {12} [Environment variables](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/environment.md)
  * {13} [How to fix git credential manager core](https://techoverflow.net/2021/09/19/how-to-fix-git-credential-manager-core-git-fatal-no-credential-backing-store-has-been-selected/)
  * {15} [zst compression not supported by apt/dpkg](https://unix.stackexchange.com/questions/669004/zst-compression-not-supported-by-apt-dpkg)
  * {16} [How to use Git credential store on WSL (Ubuntu on Windows)?](https://stackoverflow.com/questions/45925964/how-to-use-git-credential-store-on-wsl-ubuntu-on-windows)
  * {17} [RichardBronosky/Storing-git-Credentials.md](https://gist.github.com/RichardBronosky/9ab50abb8698e02341629db21e5fa6bf)
