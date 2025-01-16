# Git Credential Manager/Helper

## Website Links

* [Git Credential Helper](https://git-scm.com/docs/gitcredentials)
* [GitCredentialManager/git-credential-manager](https://github.com/GitCredentialManager/git-credential-manager)

## Notes

* In Windows-Subsystem-for-Linux, git uses "credential.helper" and "credential.credentialStore" from Host Windows-OS.
* BitBucket Personal Access Token
  * {18} [Credential Manager doesn't remember apppassword](https://community.atlassian.com/t5/Bitbucket-questions/Credential-Manager-doesn-t-remember-apppassword/qaq-p/2528136)
  * BitBucket: If you are planning to use an App Password for basic authentication, it must at a minimum have Account Read permissions (as shown below). If your App Password does not have these permissions, you will be re-prompted for credentials on every interaction with the server.

## Multiple User Accounts
* Want to use multiple user accounts like "user1@github.com", "user2@github.com", "user3@bitbucket.org"

* {19} [Multiple users](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/multiple-users.md)

* Example: fresh clones

```shell
# instead of `git clone https://example.com/open-source/library.git`, run:
git clone https://contrib123@example.com/open-source/library.git

# instead of `git clone https://example.com/big-company/secret-repo.git`, run:
git clone https://employee9999@example.com/big-company/secret-repo.git
```

* Example: existing clones

```shell
# in the `library` repo, run:
git remote set-url origin https://contrib123@example.com/open-source/library.git

# in the `secret-repo` repo, run:
git remote set-url origin https://employee9999@example.com/big-company/secret-repo.git
```

## Delete Cached Credential

### Windows-OS (Delete Credential)
* [Remove credentials from Git](https://stackoverflow.com/questions/15381198/remove-credentials-from-git)
  * Goto Control Panel -> User Accounts -> Credential Manager -> Manage Windows Credentials
  * Remove credential under "git:https://github.com"

### Linux-OS (Delete Credential)
* GitHub Credential cache is stored in "/home/<user-name>/.password-store/git/https/github.com/<github-username>.gpg"
  * Delete "<github-username>.gpg" from this folder path.
* BitBucket Credential cache is stored in "/home/<user-name>/.password-store/git/https/bitbucket.org/<bitbucket-username>.gpg"
  * Delete "<bitbucket-username>.gpg" from this folder path.

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
  * Check credential helper: `git config --global credential.helper` [Shows "/usr/local/bin/git-credential-manager"]
  * Check credential store: `git config --global credential.credentialStore` [Shows "gpg"]

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
  * Check credential helper: `git config --global credential.helper` [Shows: `/usr/local/bin/git-credential-manager`]
  * Check credential store: `git config --global credential.credentialStore` [Shows: `gpg`]

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

## Linux Server (CLI-Only)

* Error Message: fatal: GPG_TTY is not set; add `export GPG_TTY=$(tty)` to your profile.
* Solution
* Follow all procedure from "## Linux-OS Installation"
* Add to "~/.bashrc" OR "~/.profile" file: `export GPG_TTY=$(tty)`
* Reload/execute "~/.bashrc" OR "~/.profile" file: `source ~/.bashrc` OR `source ~/.profile`

* GitHub
  * When use `git clone` (private repository), `git fetch`, `git pull`, `git push` then shows
    * 1. Device code (Default)
    * 2. Personal access token
  * Choose "1"
    * On Desktop PC Browser enter url "https://github.com/login/device"
    * Enter "Code" that is shown on Linux-Server's terminal.
    * Click OK
  * Choose "2"
    * Get GitHub Personal Access Token (PAT)
    * Login to GitHub -> Click "Profile Icon" -> Settings -> Developer Settins -> Personal Access Tokens
    * Fine-grained tokens: Repository wise access.
    * Tokens (classic): GitHub Account wise access.

* BitBucket
  * BitBucket Personal Access Token
  * {18} [Credential Manager doesn't remember apppassword](https://community.atlassian.com/t5/Bitbucket-questions/Credential-Manager-doesn-t-remember-apppassword/qaq-p/2528136)
  * BitBucket: If you are planning to use an App Password for basic authentication, it must at a minimum have Account Read permissions (as shown below). If your App Password does not have these permissions, you will be re-prompted for credentials on every interaction with the server.
  * Get BitBucket Personal Access Token (PAT)
    * Login to BitBucket -> Settings Icon (right-top position) -> Personal Bitbucket Settings -> App Passwords -> Create App Password
    * MUST ALLOW "Account: Read" PERMISSION, OTHERWISE CREDENTIAL WILL NOT BE CACHED IN GIT-CREDENTIAL-MANAGER (GCM).

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

## Git Pull/Push from Another Machine using SSH 

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

## Websites

* GitHub
  * [Connecting to GitHub with SSH](https://docs.github.com/en/articles/connecting-to-github-with-ssh)

* BitBucket
  * [Configure SSH and two-step verification](https://support.atlassian.com/bitbucket-cloud/docs/configure-ssh-and-two-step-verification/)

# References

* next-sl: {20}

* Git Credential Manager/Helper
  * {9} [Git Credential Manager](https://stackoverflow.com/questions/36585496/error-when-using-git-credential-helper-with-gnome-keyring-as-sudo/40312117#40312117)
  * {10} [Debian package](https://github.com/GitCredentialManager/git-credential-manager/blob/release/docs/install.md#debian-package)
  * {11} [Credential stores](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md)
  * {12} [Environment variables](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/environment.md)
  * {13} [How to fix git credential manager core](https://techoverflow.net/2021/09/19/how-to-fix-git-credential-manager-core-git-fatal-no-credential-backing-store-has-been-selected/)
  * {15} [zst compression not supported by apt/dpkg](https://unix.stackexchange.com/questions/669004/zst-compression-not-supported-by-apt-dpkg)
  * {16} [How to use Git credential store on WSL (Ubuntu on Windows)?](https://stackoverflow.com/questions/45925964/how-to-use-git-credential-store-on-wsl-ubuntu-on-windows)
  * {17} [RichardBronosky/Storing-git-Credentials.md](https://gist.github.com/RichardBronosky/9ab50abb8698e02341629db21e5fa6bf)
  * {18} [Credential Manager doesn't remember apppassword](https://community.atlassian.com/t5/Bitbucket-questions/Credential-Manager-doesn-t-remember-apppassword/qaq-p/2528136)
  * {19} [Multiple users](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/multiple-users.md)
