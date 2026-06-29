# Restic/Restic-Git.md

# Commands

## VirtualBox

* Permission/Ownership of file/folder <sup>{199}</sup>
  * Change file/folder permission: `sudo chmod a+rwx /d/test`
  * Change file/folder ownership inside VirtualBox: `sudo chown -R antix:vboxsf /d/test`

## Commands (pcsync)

* "git" commands
  * git clone/fetch/pull/push using SSH <sup>{185} {186}</sup>
    * The easiest way to do this is by adding the following to your profile (~/.bashrc, ~/.profile etc): `export GPG_TTY=$(tty)`
    * Git clone: `export GPG_TTY=$(tty) && cd '/pwd/path' && git clone https://git-url`
    * Git fetch: `export GPG_TTY=$(tty) && cd '/pwd/path' && git fetch`
    * Git pull: `export GPG_TTY=$(tty) && cd '/pwd/path' && git pull`
    * Git push: `export GPG_TTY=$(tty) && cd '/pwd/path' && git push`

* "cp" commands
  * Launch and monitor any heavy command using $!: `cp bigfile newfile & progress -mp $!` <sup>{74}</sup>
  * Copy all files and folders, included hidden ones: `cp -a /source/. /dest/` <sup>{76}</sup>
    * Copy all files and folders: `cp -rv '/source/path/.' '/dest/path/'`
  * Copy single file: `cp -rv '/source/path/file_name' '/dest/path/file_name'`
  * Solution of "ssh error opening terminal unknown": `ssh -t -p 22 user@host "cp -rv '/source/file.zip' '/dest/file.zip' & progress -mp $!"` <sup>{184}</sup>

* "mv" commands
  * Move all files and folders (excluding hidden): `mv  -v ~/Downloads/* ~/Videos/` <sup>{77}</sup>
    * Move all files and folders (excluding hidden): `mv -v "${cwd}/${folder}/data"/* "${cwd}/${folder}"` <sup>{78}</sup>
    * Movie all files and folders (including hidden): `mv '/src/path'/* '/src/path'/.* /dst/path/` <sup>{79}</sup>
  * Move single file: `mv -v '/source/path/file_name' '/dest/path/file_name'`

* "rsync" commands
  * Rsync transfer (one way sync): `rsync -rvz -e 'ssh -p 2222' --progress ./dir user@host:/path` <sup>{80}</sup>
    * Rsync content transfer (one way sync): `rsync -rvz -e 'ssh -p 22' --progress '/d/rsync_t/dir_1/' user@10.20.30.40:'/d/rsync_t/dir_1/'`
  * Linux box to a Windows machine <sup>{198}</sup>
    * Rsync inside Bash: `rsync -avP --rsync-path='C:\ProgramData\scoop\apps\git\current\usr\bin\rsync.exe' <file_to_send> <username>@<host_ip>:<path>`
    * Rsync inside WSL: `rsync -avP --rsync-path='wsl rsync' <file_to_send> <username>@<host_ip>:<path>`

* "unison" commands
  * Unison BiSync: `unison -fat /d/data1 ssh://USER@SERVER:ssh-port//d/data2` <sup>{81} {82}</sup> [If File System is FAT, then use "-fat" argument]

* "bsync" commands <sup>{187}</sup>
  * Bisync on same computer: `bsync /home/DIRECTORY1 /c/DIRECTORY2`
  * Bisync using ssh (port: 22): `bsync /home/ALICE_DIR  bob@sshserver:/c/BOB_DIR`
  * Bisync using ssh (port: 8022): `bsync -p 8022 /home/ALICE_DIR  bob@sshserver:/c/BOB_DIR`

# Elements of Restic-Git

## Websites
* [Restic Website](https://restic.net/)
* [Restic GitHub](https://github.com/restic/restic)
* [Restic Browser](https://github.com/emuell/restic-browser)
* [jakobwesthoff/prettytable.sh](https://github.com/jakobwesthoff/prettytable.sh)

## Guides
* [Rclone serve Restic](https://rclone.org/commands/rclone_serve_restic/)
* 

## Required Packages for "Restic-Git"
* [git](https://git-scm.com/) - Git is a free and open source distributed version control system
* [restic](https://restic.net/) - Fast, secure, efficient backup program
* [rclone](https://rclone.org/) - "rsync for cloud storage"
* [jq](https://github.com/stedolan/jq) - Command-line JSON processor
* [dasel](https://github.com/TomWright/dasel) - Select, put and delete data from JSON
* [column](https://man7.org/linux/man-pages/man1/column.1.html) - The column utility formats its input into multiple columns.
* [gzip](https://www.gzip.org/) - gzip is a single-file/stream lossless data compression utility
* [MkDocs](https://www.mkdocs.org/) - Project documentation with Markdown.
* [composer](https://getcomposer.org/) (optional) - Composer is a tool for dependency management in PHP.
* [npm](https://www.npmjs.com/) (optional) - The package manager for JavaScript
* [typicode/json-server](https://github.com/typicode/json-server) - Get a full fake REST API with zero coding
* Additional Tools
  * [Restic Browser](https://github.com/emuell/restic-browser)
  * [kapitainsky/RcloneBrowser](https://github.com/kapitainsky/RcloneBrowser)
  
## Installation of Required Packages

### Windows-OS Installation

### Linux-OS Installation
* [MkDocs - Linux](https://www.mkdocs.org/)
  * `pip install mkdocs`
  * Note: Do not add to ".bashrc" file, because "mkdocs" command does not work outside of "bash" shell.
  * [How to create a symbolic link in Linux](https://linuxhint.com/create-symbolic-link-linux/)
    * echo $PATH
    * ln -s original_file_name symbolic_file_name
    * sudo ln -s /home/<user-name>/.local/bin/mkdocs /usr/local/bin/mkdocs
    * mkdocs --help

## Note
* To make Git Bash interactive, enable "Experimental pseudo" during git installation.
* [If previous step does not work] Git Bash is non-interactive terminal. If Git Bash is used for restic backup then upload progress is not shown. To see upload progress use Windows-Powershell terminal.
* For Google-Drive "root_folder_id" is the last part of URL.
* For Microsoft-OneDrive "root_folder_id" is this value of "id=" parameter.

## Restic - Problem and Solution
* If `restic init --repo /d/test/restic-repo/test-repo-1` command does not work then use following commands:
  * Set local repository location: `export RESTIC_REPOSITORY=/d/test/restic-repo/test-repo-1`
  * Set password: `export RESTIC_PASSWORD=yourpassword`
  * Initialize: `restic init`

## RClone - Problem and Solution
* RClone GoogleDrive Error 403: rate_limit_exceeded
  * [Google Drive error 403:rate limit exceeded when authorizing rclone](https://forum.rclone.org/t/google-drive-error-403-rate-limit-exceeded-when-authorizing-rclone/34565)
  * [Making your own client_id](https://rclone.org/drive/#making-your-own-client-id)
    * [Google API Console](https://console.developers.google.com/)

## Setup
* Download "restic" from "https://github.com/restic/restic/releases" and unzip it to "C:\restic"
* This PC (right click) -> Properties -> Advanced system settings -> Environment Variables -> User variable for <user_name> -> Path -> Edit -> Append text ";C:\restic" [On Windows 10 click on "New" button. In "New user variable" dialog, set "Variable name: Path" and "Variable value: C:\restic"]
* Open Terminal and enter command "restic" to check it is installed.
* Restic Browser Settings for Rclone
  * Click on "Open Repository". Here are settings:
  * Type: REST Server
  * URL: rest:http://localhost:8080/
  * Repository Password: yourpassword
  
# "restic-git" Workflow

## Workflow - Git, Restic, Rclone
* Initialize git repository: `git init`
* Add files to git index: `git add .`
* Commit files to git: `git commit -m "<message>"`
* Add github remote: `git remote add origin <github_url>`
* Push to github remote: `git push -u origin master`
* Config rclone: `rclone config`
* Serve restic to rclone: `rclone serve restic`

## Change Scripts Configuration Values
* For Windows-OS: Copy these scripts from "restic-git-sync" to Git-Bash "/usr/local/bin" folder (if /usr/local/bin" folder does not exist, then create it) and then commands will be available as script-name. For Linux-OS: Folder path is "/usr/local/bin"
  * If use "bash" from PowerShell then "/usr/local/bin" folder does not work, instead place it inside "/usr/bin" folder.
* "restic-git"
* "restore-restic-git"
* "sync-restic-git"
* "restic-drive"
* "restic-repository-list"
* "git-repository-list"

# "restic-git" script/command

## TODO
* In "DBackup" and "DB-Sync" script, when create database backup (structure, full, data) using Xampp-Windows, then change line ending to Unix.
* Check all required packages are installed/not, if not then guide to install.
* [DONE] Automatically create and edit "exclude.txt" file from "restic-git".
* [DONE] Check "rclone" remote-name exists or not.
* Automaticlly add configuration to "restic-repository-list" script for not existing directory.
* Create "restore-restic-git" script to backup all project/project-related data.
* Make "restic-git" script works for multiple server (server-1/server-2/server-3). For this create an Environment Variable like "PWD" and match it with "restic_repo_list[workstation_name]".
* When using restic restore, it only replaces files with same name, but does not delete other files. So move all restic tracked files other drive-partition with timestamp before restic restore to make exact copy.
* When using "restic-git init", but rclone-serve-restic is running GoogleDrive101 instead of GoogleDrive102, then restic repository is created at GoogleDrive101.

## Installation steps of "restic-git" script

### Git Cross Platform Operating System
* [Git status ignore line endings / identical files / windows & linux environment / dropbox / meld](https://stackoverflow.com/questions/20496084/git-status-ignore-line-endings-identical-files-windows-linux-environment)
* Git Settings: `git config --global core.autocrlf true`

### General Instruction
* Required software packages are Git, Restic, Rclone, Git-Bash(Windows-OS), ~~Curl, GNU-Screen(Server-Ubuntu/Alpine), XTerm(Linux-OS)~~.
* On Terminal run command "source restic-git" to export environment variable "RESTIC_REPOSITORY" and "RESTIC_PASSWORD" to Terminal, so that plain restic command can be executed on Terminal. To unset environment variable use command "unset RESTIC_REPOSITORY" and "unset RESTIC_PASSWORD"
* Set restic repository path, password and exclude-file path in "restic_repo_list" array.
* Custom restore path format will be "/d/test/restic-restore/test-restore-1"
* Download remote repository from cloud storage and point to it in "restic-repository-list" script to use it as local repository.
* Once a file/folder is excluded, then it never can be included (see "restic exclude files" documentation).
* "restic-exclue-file.txt" file path will be <restic-git-sync>/<exclude>/<desktop/server-1/server-2/server-3>/<present-working-directory-of-project>
* Content of restic-exclude-file.txt (Be careful when using "*" because once a file/folder is excluded, then it never can be included)
```
  *
  !upload
```
* In Ubuntu-Desktop and Ubuntu-Server/Alpine-Linux(via Vagrant) hard symbolic link does not work because "restic-git" script is not inside any path of linux-os. Moving to "/etc/restic-git-sync" directory works, but soft symbolic link does not update instantly.
* In Windows-OS hard symbolic link of "restic-git" script works.
* In Windows-OS Git-Bash does not support "user-prompt". Solution: Open any terminal [Powershell-GitHub](https://github.com/PowerShell/PowerShell) OR [Alacritty](https://github.com/alacritty/alacritty) and then enter command `bash` to enter into Git-Bash. Alternatively in Git-Bash use "winpty <restic-command>" to work with "user-prompt" and to see backup progress.
* If "rclone serve restic --verbose <remote-repository-name>:" does not keep running, then reinstall "rclone".

### Windows-OS Installation Instruction
* Create file "restic-git", without any file extension. During file save, choose "Save as type: All Files"
* Make "restic-git" command available globally
  * If /usr/local/bin" folder does not exist, then create it.
  * There are two ways to make "restic-git" command. One is creating hard symbolic link to "/usr/local/bin" folder and another is moving "restic-git" script to "/usr/local/bin" folder.
  * Create hard symbolic link of "restic-git" script. Open "cmd" in administrator mode and enter command - [[Command Format: `mklink /H Link Target`]] [[Normal Git Installation: `mklink /H C:\Program Files\Git\usr\local\bin\restic-git C:\ProgramData\restic-git\restic-git-sync\restic-git`]] [[Git Installation Via Scoop: `mklink /H C:\ProgramData\scoop\apps\git\2.39.0.windows.2\usr\local\bin\restic-git C:\ProgramData\restic-git\restic-git-sync\restic-git`]]
  * Move "restic-git" script to "C:\Program Files\Git\usr\local\bin" folder. If git is installed using Scoop then this path is "C:\ProgramData\scoop\apps\git\2.39.0.windows.2\usr\local\bin"
* Restart Git Bash
* Set "exclude_file_path" in "restic-repository-list" script. For Windows-OS path format: "/c/ProgramData/restic-git/restic-git-sync/". Create directory structure for "exclude_file" same as folder/file to backup inside "exclude" folder like "/d/test/restic/test-restic-1/exclude.txt".
* To use Remote repository open Git-Bash in Administrator mode and enter command `rclone serve restic --verbose GoogleDrive101-Restic:` to start REST server in separate Terminal window. Press "Ctrl+C" to stop REST server.

### Linux-OS Installation Instruction
* Create file "restic-git", without any file extension.
* Make "restic-git" command available globally
  * `cd /var` -> `sudo git clone restic-git-sync.git` -> `cd restic-git-sync` -> `sudo chmod a+x restic-git` -> `sudo chmod a+x restic-repository-list` -> `sudo ln -S -v /c/Users/<user_name>/AppData/Local/restic-git-sync/restic-git /usr/local/bin/restic-git`
  * If symbolic link does not work, then copy file "restic-git" from "/c/ProgramData/restic-git/restic-git-sync/" to "/usr/local/bin" using command `sudo cp /c/ProgramData/restic-git/restic-git-sync/restic-git /usr/local/bin/restic-git`. And make both files executable using command: `sudo chmod a+x restic-git` -> `sudo chmod a+x restic-repository-list`
  * Error message when creating symbolic link: `ln: failed to create hard link '/usr/local/bin/restic-git' => 'restic-git': Invalid cross-device link`
  * **On Linux-OS run "restic-git" as: `bash restic-git`**
* Create same directory structure like Windows-OS
  * Check hard disk partition list: `sudo fdisk -l`
  * `cd /` -> `ls` -> `sudo mkdir c` -> `sudo mkdir d` -> `sudo mkdir e`
  * Mount Hard Disk Partition: `sudo mount /dev/sda2 /c` -> `sudo mount /dev/sda4 /d` -> `sudo mount /dev/sda5 /e` [IF SHOWS WARNING: Windows is hibernated, refused to mount. The disk contains an unclean file system (0, 0). Metadata kept in Windows cache, refused to mount. Falling back to read-only mount because the NTFS partition is in an unsafe state. Please resume and shutdown Windows fully (no hibernation or fast restarting.) Could not mount read-write, trying read-only] [SOLUTION: Now restart from Linux-OS to Windows-OS and then restart from Windows-OS to Linux-OS. Do Restart, Not ShutDown] [SOLUTION-2: During Windows ShutDown, press "Shift" key and click "ShutDown" button.]
  * Fix Windows-OS "C" drive mounting hibernation error on Linux
    * [How to Delete Hibernation File on Windows 10](https://www.diskpart.com/free-up-space/how-to-delete-hibernation-file-windows-10-3690.html)
    * Hit the Windows key and type "cmd" in the taskbar, hit "Run as administrator".
    * In the command line window, type "powercfg -h off" and press "Enter". This command will disable hibernation and the hibernation file will be deleted.
  * Unmount Hard Disk Partition: `sudo umount /dev/sda2` -> `sudo umount /dev/sda4` -> `sudo umount /dev/sda5`
* Linux-OS (Desktop): XTerm is opened automatically to run "rclone serve restic" command in background mode (using "&" at end of command: `xterm -e "rclone serve restic --verbose GoogleDrive101:" &`). Inside XTerm, if font size is increased by pressing "Ctrl+Right-Click" then if anything appears in Main Terminal press "Ctrl+C"/"Enter" to get control back in Main Terminal. 
  
### Server-OS (Ubuntu/Alpine) Installation Instruction
* Make "restic-git" command available globally
  * `cd /etc` -> `sudo git clone Restic-Git-Sync.git restic-git-sync` -> `cd restic-git-sync` -> `sudo chmod a+x restic-git` -> `sudo chmod a+x restic-repository-list` -> `sudo ln -S -v /etc/restic-git-sync/restic-git /usr/local/bin/restic-git`
  * If symbolic link does not work, then copy file "restic-git" from "/etc/restic-git-sync" to "/usr/local/bin". And make both files executable using command: `sudo chmod a+x restic-git` -> `sudo chmod a+x restic-repository-list`
* Install software package on Ubuntu-Server: `sudo apt update` -> `sudo apt install git rclone restic curl screen`
* Install software package on Alpine-Linux: `sudo apk update` -> `sudo apk add git rclone restic curl screen`
* **On Ubuntu/Alpine-Linux run "restic-git" as: `bash restic-git`**
* BUG: GNU-Screen auto starting "rclone-serve-restic" in detached session, does not work instantly. First, attach session "rclone-serve-restic" using command `screen -list` -> `screen -r <process-id-from-screen-list-command>` -> Again detach using keyboard shortcut "Ctrl+a+d", then `bash rclone-git <init/backup/restore/snapshot>` command works.

## Notes of "restic-git"
* If previous git commit hash is required for restic-git (tag name) then checkout to that specific git commit using command `git checkout <commit_hash>`. To return latest commit use command `git checkout <branch_name>` `git checkout master`.
* Define restic repository details - restic_repo_list[present working directory, from where running this script]='restic-repository-address(local/remote(N/A)) restic-repository-password repository-type(local/rclone) remote-repository-name(rclone/N/A) workstation-type(desktop-pc/server-pc) workstation-name(desktop/server-1/server-2) synchronization-type(restic-git/restic-only/project)'
  * PWD(Desktop): /d/test/restic/test-restic-1
  * restic_repo_list['/d/test/restic/test-restic-1']='/d/test/restic-repo/test-repo-1 1234 local N/A desktop-pc desktop restic-git'
  * restic_repo_list['/d/test/restic/test-restic-1']='N/A 1234 rclone GoogleDrive704 desktop-pc desktop project'
  * PWD(Server): /home/vagrant/test/restic/test-restic-1
  * restic_repo_list['/home/vagrant/test/restic/test-restic-1']='/home/vagrant/test/restic-repo/test-repo-1 1234 local N/A server-pc server-1 restic-git'
  * restic_repo_list['/home/vagrant/test/restic/test-restic-1']='N/A 1234 rclone GoogleDrive704 server-pc server-1 restic-git'
* Restic remote(rclone) repository address: restic-desktop/restic-server/restic-server2/restic-server3 [Only one Desktop, but Multiple Server] <then-path-of-pc-working-directory>
* Repository Type: local/rclone(remote)
* Workstation Type: desktop-pc/server-pc
* Synchronization Type: restic-git/restic-only/project

## Commands of "restic-git"
* Check which files are going to backup: `restic-git backup-dry-run`
* Create backup with latest git commit hash: `restic-git backup`
* Create backup with latest git commit hash and a tag: `restic-git backup "<tag_name>"`
* Get list of all shapshots: `restic-git snapshots`
* Get specific snapshot for git commit hash: `restic-git snapshots "<git_commit_hash>"`
* Restore restic backup: `restic-git restore <snapshot_id>` [Leave empty to restore files to current directory OR enter directory path to restore files there.] [Restore path format (without space): /d/test/restic-single-restore/test-restic-501] [Restore path format (with space/spaces): /d/test/restic-single-restore/test restic<single/multiple_spaces>501]
* Restore restic latest backup: `restic-git restore latest`
* Forget/Remove snapshot: `restic-git forget <snapshot_id>`
* Prune/Clear repository: `restic-git prune`
* Check repository for error: `restic-git check`
* Edit exclude-file using "vim" editor: `restic-git exclude-edit`
* Works with synchronized remote-repository: `restic-git --work-local snapshots` [Note: Backup/Backup-dry-run is not allowed in synchronized restic repository. Because it is one way synchronization from cloud to local pc.]
* Restore from synchronized remote-repository: `restic-git --work-local restore latest` [Note: If this command shows "repository-path-error", then use command: `winpty restic -r /d/test/restic-sync/restic-desktop/d/test/restic/test-restic-504 restore latest --target . --verbose`]
* Git uncommitted files push from local pc to remote(rclone): `restic-git --git-uncommitted-sync push`
* Git uncommitted files pull from remote(rclone) to local pc: `restic-git --git-uncommitted-sync pull`
* Git uncommitted files list show (stored in rclone-remote): `restic-git --git-uncommitted-sync status`

## "restic" test commands
* On Git-Bash Terminal: `winpty restic --repo /g/restic_project_drive backup --exclude-file="/c/Users/Logitech/AppData/Local/restic-git-sync/exclude/restic-drive/exclude.txt" --tag "Initial Backup" /e`
* On PowerShell Terminal: `restic --repo G:\restic_project_drive backup E:\ --tag "Initial Backup"`

## Configure "rclone" for remote backup
* Open Git-Bash/Terminal in Administrator Mode.
* Show list of remote storage: `rclone listremotes`
* Configure "rclone": `rclone config` -> `n/s/q> n` (new remote) -> `name> GoogleDrive101-Restic` -> `Storage> 18 (Google Drive)` -> `client_id> (Press Enter to leave empty)` -> `client_secret> (Press Enter to leave empty)` -> `scope> 1 (Full Access)` -> Edit advanced config? `y/n> n (no)` -> Use web browser to automatically authenticate rclone with remote? `y/n> y (yes)` -> Configure this as a Shared Drive (Team Drive)? `y/n> n (no)` -> Keep this "GoogleDrive101-Restic" remote? `y/e/d> y (yes)` -> q) Quit config `e/n/d/r/c/s/q> q (quit)`
* Start rclone REST server: `rclone serve restic --verbose GoogleDrive101-Restic:` [Press "Ctrl+C" to stop REST server.]
* Note(To Set Root Folder): Edit advanced config? `y/n> y (yes)` ->`root_folder_id> (Last Part of Google-Drive URL. After "/")`

# "restore-restic-git" script/command

## Notes of "restore-restic-git"
* synchronization-type(restic-git/restic-only/project). Only "project" tagged repositories will be restored.
* Define restic repository details - restic_repo_list[present working directory, from where running this script]='restic-repository-address(local/remote(N/A)) restic-repository-password repository-type(local/rclone) remote-repository-name(rclone/N/A) workstation-type(desktop-pc/server-pc) workstation-name(desktop/server-1/server-2) synchronization-type(restic-git/restic-only/project)'
  * PWD(Desktop): /d/test/restic/test-restic-1
  * restic_repo_list['/d/test/restic/test-restic-1']='/d/test/restic-repo/test-repo-1 1234 local N/A desktop-pc desktop restic-git'
  * restic_repo_list['/d/test/restic/test-restic-1']='N/A 1234 rclone GoogleDrive704 desktop-pc desktop project'
  * PWD(Server): /home/vagrant/test/restic/test-restic-1
  * restic_repo_list['/home/vagrant/test/restic/test-restic-1']='/home/vagrant/test/restic-repo/test-repo-1 1234 local N/A server-pc server-1 restic-git'
  * restic_repo_list['/home/vagrant/test/restic/test-restic-1']='N/A 1234 rclone GoogleDrive704 server-pc server-1 restic-git'
* Define git repository details - git_repo_list['git project folder path']='git-repository-url php-composer-package-download node-npm-package-download'
  * git_repo_list['/d/test/restic/laravel-package']='https://github.com/riazul701/laravel-package.git no no'

# "sync-restic-repo" script/command

## Notes of "sync-restic-repo"

## Commands of "sync-restic-repo"
* By default "sync-restic-repo" only synchronizes current directory's remote-restic-repository to local pc.
* Synchronize only current directory's remote-repository to local pc: `sync-restic-repo`
* Synchronize all remote-repository to local pc: `sync-restic-repo --all-repo-sync`

# "restic-drive" script/command

## General Instruction of "restic-drive"
* This script is used to backup/restore entire drive from working pc to portable hard disk.
* Create two folder in portable hard disk - "restic_project_drive" and "restic_document_drive"
* Create two file in portable hard disk to identify restic repository folder - "project_drive_psd_identification" and "document_drive_psd_identification" [psd = portable-storage-device]
* In Linux-OS mount portable hard disk into a drive letter like Windows-OS - "c/d/e/f/g/h"
* In Windows-OS Git-Bash does not support "user-prompt". Solution: Open any terminal [Powershell-GitHub](https://github.com/PowerShell/PowerShell) OR [Alacritty](https://github.com/alacritty/alacritty) and then enter command `bash` to enter into Git-Bash. Alternatively in Git-Bash use "winpty <restic-command>" to work with "user-prompt" and to see backup progress.

## Notes of "restic-drive"

## Commands of "restic-drive"
* Init repository: `restic-drive init`
* Backup changes: `restic-drive backup`
* Backup changes with tag: `restic-drive backup "<tag-name>"`
* Backup Dry Run (Only shows, what will be changed): `restic-drive backup-dry-run`
* Restore backup: `restic-drive restore <snapshot-id>`
* Show snapshots: `restic-drive snapshots`
* Forget snapshot: `restic-drive forget <snapshot-id>`
* Prune (remove unused data) repository: `restic-drive prune`
* Check repository for errors: `restic-drive check`
* Clear cache from "/c/Users/<User-Name>/AppData/Local/restic" directory: `restic-drive cache-clear`
* Edit exclude-file: `restic-drive exclude-edit`

# "[pj]note" script/command

## General Instruction of "[pj]note"

## Notes of "[pj]note"
* Windows-OS open file in editor
  * Open "Notepad": `start notepad "/d/file.txt"`
  * Open "Notepad++": `start notepad++ "/d/file.txt"`

## Commands of "[pj]note"
* Open file "about.md" (create file if not exists): `[pj]note about`
* Open file "todo.md" (create file if not exists): `[pj]note todo`
* Open file "bug.md" (create file if not exists): `[pj]note bug`
* Open file "guide.md" (create file if not exists): `[pj]note guide`
* Open file "document.md" (create file if not exists): `[pj]note document`
* Open file "password.md" (create file if not exists): `[pj]note password`
* Create new file (enter file name with extension): `[pj]note create`
* Open file: `[pj]note open`
* Rename file: `[pj]note rename`
* Delete file: `[pj]note delete`
* Git status - note-files: `[pj]note status`
* Git commit - note-files: `[pj]note commit`
* Git push - note-files: `[pj]note push`
* Git fetch - note-files: `[pj]note fetch`
* Git pull - note-files: `[pj]note pull`

# "[pj]todo" script/command

## Commands of "[pj]todo"
* Get file basename: `basename /data/backup-file.tar.gz` <sup>{202}</sup>

# "gist" script/command

## Notes of "gist" script

## Commands of "gist" script
* To view/edit/delete gist, first must perform search operation.
* Create gist: `gist --create`
* If "Create" option is selected
  * "Enter new gist title(description) (Enter 'exit' to close program):"
  * "Choose gist create action (y[es]/n[o]/exit):"
  * "Enter new file name:"
* Search gist using description(title): `gist "<description-text>"`
* Search gist using description(title) and tag: `gist "<description-text>" "<tag-1>" "<tag-2>" <tag-3>`
* Search gist using only tag: `gist "" "<tag-1>" "<tag-2>" "<tag-3>"`
* After search result appears, select a gist using number. Then select what to do with selected gist - v[iew]/e[dit]/d[elete]/b[rowser-open]/exit
* If "v[iew]" option is selected
  * "Enter file number you want to view (Enter 'exit' to close program):"
* If "e[dit]" option is selected
  * "Enter gist edit type (a[dd-file]/e[dit-file]/t[itle-description]):"
  * If "a[dd-file]" option is selected
    * "Enter new file name:"
  * If "[edit-file]"/"t[itle-description]" option is selected
    * "gh" native prompt will be opened (if Terminal support "user-prompt". For Git-Bash use "winpty")
* If "d[elete]" option is selected
  * "Do you want to delete gist (yes-delete-this-gist-entirely/no)?"
* If "b[rowser-open]" option is selected
  * Open gist in default web browser.
* If "exit" option is selected
  * Exit/Close the program.
  
# "db-sync" script/command

## TODO of "db-sync"
* For new database backup (that does not exist earlier), shows warning from `eval rm *` and `rclone purge` command.
* During fetch database, create folder if does not exist.
* For large database zip "sql-database-file". It will save storage space. For example 1859KB sql file will be 387KB zip file, if 7-zip ultra compression is used then size will be 273KB.

## Notes of "db-sync"
* During database backup "mysqldump.exe" asks for password. Git-Bash(mintty.exe) does not support password asking prompt. Open "PowerShell" and enter command `bash` to enter into Git-Bash mode, then it will support user-prompt.
* Database server must be in running state, to backup/restore database.

## Commands of "db-sync"
* Backup database (xampp/docker/vagrant): `db-sync xampp backup`
* Fetch database from cloud (xampp/docker/vagrant): `db-sync xampp fetch`
* Restore database (xampp/docker/vagrant): `db-sync xampp restore`

# "pcsync" script/command

## Websites (pcsync)
* [Xfennec/progress GitHub](https://github.com/Xfennec/progress)

## Notes (pcsync)
* Use "eval" command to execute command string.
* Use command "echo ${normal_string} | jq -R ." for json_encoding.
* Use command "echo ${encoded_string} | jq -r ." for json_decoding.
* For Unison, if File System is FAT, then use "-fat" argument.

# Specific Workflow
* Folder and File Tree for "Restic with Rclone (Both Single and Multiple Repository)"
* d (Drive Letter)
  * test (Folder)
    * restic (Folder)
	  * test-restic-1 (Folder)
	  * test-restic-2 (Folder)
	  * test-restic-3 (Folder)
	  * test-restic-4 (Folder)
	  * exclude-test-restic-1.txt (File)
	* restic-repo (Folder)
	  * test-repo-1 (Folder)

* Restice with Rclone (Single Repository)
  * Rclone serve format: `rclone serve restic -v remote:backup` [Keep this process running in a separate terminal]
  * Rclone serve format: `rclone serve restic -v testrc:/d/test/restic/test-restic-1`
  * `export RESTIC_REPOSITORY=rest:http://localhost:8080/`
  * `export RESTIC_PASSWORD=yourpassword`
  * Initialize repository: `restic init`
  * Restic backup format: `restic backup /path/to/files/to/backup`
  * Restic backup command: `restic backup /d/test/restic/test-restic-1` [Files are saved in Google-Drive-Root-Folder{/d/test/restic/test-restic-1} folder] **[Here {/d/test/restic/test-restic-1} path is added for file backup, because it is used during `rclone serve restic -v testrc:/d/test/restic/test-restic-1`]**  [Google-Drive-Root-Folder is set during `rclone config`. It is the last part of Google Drive URL]
  * Show snapshots: `restic -r rest:http://localhost:8080/ snapshots`
  
* Restic with Rclone (Multiple Repository)
  * `rclone serve restic -v remote:backup` [Keep this process running in a separate terminal]
  * `rclone serve restic -v testrc:/d/test/restic`
	```bash
	$ export RESTIC_REPOSITORY=rest:http://localhost:8080/test-restic-1/
	# backup test-restic-1 stuff
	$ export RESTIC_REPOSITORY=rest:http://localhost:8080/test-restic-2/
	# backup test-restic-2 stuff
	```
  * `export RESTIC_PASSWORD=yourpassword`	
  * Initialize repository: `restic init`
  * Restic backup format: `restic backup /path/to/files/to/backup`
  * Restic backup command: `restic backup /d/test/restic/test-restic-1` [Files are saved in Google-Drive-Root-Folder/d/test/restic/test-restic-1 folder] **[Here {/d/test/restic/test-restic-1} path is added for file backup, it is used during `rclone serve restic -v testrc:/d/test/restic`]** [Google-Drive-Root-Folder is set during `rclone config`. It is the last part of Google Drive URL]
  * Show snapshots: `restic -r rest:http://localhost:8080/test-restic-1/ snapshots`  

* Restic with Local Repository
  * Initialize Repository:
    * Set local repository location: `export RESTIC_REPOSITORY=/d/test/restic-repo/test-repo-1`
    * Set password: `export RESTIC_PASSWORD=yourpassword`
    * Initialize: `restic init`
  * Backup:
    * Check files to backup from current directory: `restic backup --dry-run .`
	* Check backup files with exclude: `restic backup --dry-run . --exclude-file=/d/test/restic/exclude-test-restic-1.txt`
	* Create backup: `restic backup . --exclude-file=/d/test/restic/exclude-test-restic-1.txt`
	* Create backup with tag: `restic backup . --exclude-file=/d/test/restic/exclude-test-restic-1.txt --tag "git-commit:<git_commit_id>" --tag "<other_tag_name>"`
	* Content of "/d/test/restic/exclude-test-restic-1.txt"
	```
	  *
      !upload
	```
  * Snapshot:
    * Snapshot list: `restic snapshots`
	* Remove snapshot: `restic forget <snapshot_id>` [Get "<snapshot_id>" from command `restic snapshots`]
  * Restore:
    * Restore to current directory: `restic restore <snapshot_id> --target .` [Get "<snapshot_id>" from command `restic snapshots`]

* Working with Repos 
  * Filter the listing by directory path: `restic -r /srv/restic-repo snapshots --path="/srv"`
  * Filter the listing by host: `restic -r /srv/restic-repo snapshots --host luigi`
  * Group the output by the same filters (host, paths, tags): `restic -r /srv/restic-repo snapshots --group-by host`
  * Copying snapshots between repositories: `restic -r /srv/restic-repo-copy copy --from-repo /srv/restic-repo`
  * Verify the structure of the repository: `restic -r /srv/restic-repo check`
  * Verify the integrity of the pack files in the repository: `restic -r /srv/restic-repo check --read-data`
  * Upgrading the repository format version: `migrate upgrade_repo_v2`
  
* Restic with Git
  * Create file "restic-git", without any file extension. During file save, choose "Save as type: All Files"
  * Move "restic-git" script to "C:\Program Files\Git\usr\bin" folder. If git is installed using Scoop then this path is "C:\ProgramData\scoop\apps\git\2.39.0.windows.2\usr\bin"
  * Restart Git Bash

# "cmdref" script/command

# Configuration JSON Editing

## Websites - JSON
* [typicode/json-server](https://github.com/typicode/json-server)

## Notes
* Postman POST/PUT request - Body -> x-www-form-urlencoded

## Install Node.js and NPM
* Install Node.js and NPM latest version on linux
  * ~~sudo apt install nodejs [Check version: `node --version`] (Install Old Version)~~
  * ~~sudo apt install npm [Check version: `npm --version`] (Install Old Version)~~
  * [How to install the latest Node.js on Linux?](https://linuxhint.com/how-to-install-latest-node-js-on-linux/) || [nodesource/distributions](https://github.com/nodesource/distributions)
  * curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash - && sudo apt-get install -y nodejs

## Commands - JSON
* Start json-server: `json-server --watch repository-list.json`

# Graphical User Interface

## Websites - GUI

## Notes - GUI

## Commands - GUI

* Start PHP Web Server
  * Change directory where php server will start: `cd ~/public_html`
  * Foreground php server 
    * If php in path: `php -S localhost:8000`
    * If php in path: `php -S localhost:7701`
    * Windows-OS, php not in path: `/d/xampp_8.2.0/php/php.exe -S localhost:7701`
  * Background php server
    * Linux-OS, php in path: `nohup php -S localhost:7701 &`

* BASH Pipe Input
  * Pass single argument: `echo "0" | jjkk note open`
  * Pass multiple argument: `printf "0\ndocument123.md" | jjkk note rename`
  * Pass multiple argument from file: `jjkk note rename < test.txt`
    * Contents of text.txt
      ```shellscript
      0
      document123.md
      ```
  * Windows-OS PHP - Execute Bash command: `$cmd_output = shell_exec('bash -c "printf \"0\ndocument123.md\" | jjkk note rename');`

# Sync Devices

## Websites - Sync
* [db4free.net](https://www.db4free.net/)

## Required Software - Sync

* NMap
  * [NMap.org](https://nmap.org/) || [NMap GitHub](https://github.com/nmap/nmap)
  * [NMap Scoop](https://scoop.sh/#/apps?q=nmap)
    * `scoop bucket add main`
	* `scoop install main/nmap`
	* Follow additional instructions which in shown in PowerShell.
  * `sudo apt install nmap`

# References

* next-sl: {203}

## "restic-git" Workflow (Ref)

* "rsync" in Git-Bash
  * {1} [Add rsync to Windows git bash](https://prasaz.medium.com/add-rsync-to-windows-git-bash-f42736bae1b3)
  * {2} [How to use rsync on Git Bash](https://shchae7.medium.com/how-to-use-rsync-on-git-bash-6c6bba6a03ca)
  * {3} [radleta/how-to-win-rsync-from-cmd.md](https://gist.github.com/radleta/0b337a2b14f761951cf2aab0578512b9)
  * {4} [How to Add rsync to Git Bash for Windows 10](https://gist.github.com/hisplan/ee54e48f17b92c6609ac16f83073dde6)

* "TMux" in Git-Bash
  * {5} [Install Tmux on Git for Windows](https://dev.to/timothydjones/install-tmux-on-git-for-windows-1cf2)

## "restic-git" script/command (Ref)
* Restic Specific
  * {6} [“Unable to open config file” – Can I restore it?](https://forum.restic.net/t/unable-to-open-config-file-can-i-restore-it/1648)

* Common Guide
  * {7} [Git Detached Head: What This Means and How to Recover](https://www.cloudbees.com/blog/git-detached-head)
  * {8} [Can I export a variable to the environment from a Bash script without sourcing it?](https://stackoverflow.com/questions/16618071/can-i-export-a-variable-to-the-environment-from-a-bash-script-without-sourcing-i)
  * {9} [How do I delete an exported environment variable?](https://stackoverflow.com/questions/6877727/how-do-i-delete-an-exported-environment-variable)
  * {10} [Check if current directory is a Git repository](https://stackoverflow.com/questions/2180270/check-if-current-directory-is-a-git-repository)
  * {11} [How to concatenate string variables in Bash](https://stackoverflow.com/questions/4181703/how-to-concatenate-string-variables-in-bash)
  * {12} [How to evaluate http response codes from bash/shell script?](https://stackoverflow.com/questions/2220301/how-to-evaluate-http-response-codes-from-bash-shell-script)
  * {13} [How do I tell if a file does not exist in Bash?](https://stackoverflow.com/questions/638975/how-do-i-tell-if-a-file-does-not-exist-in-bash)
  * {14} [Create file and its parent directory](https://askubuntu.com/questions/800845/create-file-and-its-parent-directory)
  * {15} [Remove first character of a string in Bash](https://stackoverflow.com/questions/6594085/remove-first-character-of-a-string-in-bash)
  * {16} [In Bash test if associative array is declared](https://stackoverflow.com/questions/26925905/in-bash-test-if-associative-array-is-declared)
  * {17} [How to use a variable as part of an array name](https://unix.stackexchange.com/questions/60584/how-to-use-a-variable-as-part-of-an-array-name)
  * {18} [Bash , use variable as name of associative array when calling value](https://stackoverflow.com/questions/39297530/bash-use-variable-as-name-of-associative-array-when-calling-value)
  * {19} [Check if an element is present in a Bash array [duplicate]](https://stackoverflow.com/questions/14366390/check-if-an-element-is-present-in-a-bash-array)
  * {20} [Looping over arrays, printing both index and value](https://stackoverflow.com/questions/6723426/looping-over-arrays-printing-both-index-and-value/59991764#59991764)
  * {21} [How to remove last n characters from a string in Bash?](https://stackoverflow.com/questions/27658675/how-to-remove-last-n-characters-from-a-string-in-bash)
  * {22} [How to change the output color of echo in Linux](https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)
  * {23} [Capturing multiple line output into a Bash variable](https://stackoverflow.com/questions/613572/capturing-multiple-line-output-into-a-bash-variable)
  * {24} [Treat 2nd column with space as one column](https://stackoverflow.com/questions/71114506/treat-2nd-column-with-space-as-one-column)
  * {25} [Treat second column with spaces as one column with awk](https://stackoverflow.com/questions/14327442/treat-second-column-with-spaces-as-one-column-with-awk)
  * {26} [Split bash string by newline characters](https://stackoverflow.com/questions/19771965/split-bash-string-by-newline-characters)
  * {27} [How to trim whitespace from a Bash variable?](https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable)
  
* Windows-OS Guide
  * {28} [The Complete Guide to Creating Symbolic Links (aka Symlinks) on Windows](https://www.howtogeek.com/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/)
  * {29} [Open a new git-bash terminal and run commands in it](https://stackoverflow.com/questions/61342746/open-a-new-git-bash-terminal-and-run-commands-in-it)

* Linux-OS Guide
  * {30} [Open another terminal window with the same SSH session as original window](https://askubuntu.com/questions/332104/open-another-terminal-window-with-the-same-ssh-session-as-original-window)
  * {31} [GNU Screen - Wikipedia](https://en.wikipedia.org/wiki/GNU_Screen)
  * {32} [YouTube -  Screen - terminal multiplexer BY Linux Leech](https://www.youtube.com/playlist?list=PLew9cBMjbI-39_rdQ6sdw0u91eGPNvW6V)
  * {33} [How To Use Linux Screen](https://linuxize.com/post/how-to-use-linux-screen/)
  * {34} [How to create a screen executing given command?](https://stackoverflow.com/questions/7049252/how-to-create-a-screen-executing-given-command)
  * {35} [Screen Official User’s Manual](https://www.gnu.org/software/screen/manual/screen.html)
  * {36} [Getting Started with Linux Screen Command [20 Useful Examples]](https://www.tecmint.com/screen-command-examples-to-manage-linux-terminals/)
  * {37} [How to Create Hard Links Linux?](https://linuxhint.com/how_to_create_hard_links_linux/)
  * {38} [How to mount a drive in Ubuntu](https://www.fosslinux.com/64306/how-to-mount-drive-in-ubuntu.htm)
  * {39} [fdisk command in Linux with examples](https://www.geeksforgeeks.org/fdisk-command-in-linux-with-examples/amp/)
  * {40} [Windows is hibernated, refuses to mount [duplicate]](https://askubuntu.com/questions/751194/windows-is-hibernated-refuses-to-mount)
  * {41} [How to check if running in Cygwin, Mac or Linux?](https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux)
  * {42} [How can I get the name of the current terminal from command-line?](https://askubuntu.com/questions/476641/how-can-i-get-the-name-of-the-current-terminal-from-command-line)
  * {43} [How can I check if a command exists in a shell script? [duplicate]](https://stackoverflow.com/questions/7522712/how-can-i-check-if-a-command-exists-in-a-shell-script)
  * {44} [How to have back the command prompt after calling an application [duplicate]](https://unix.stackexchange.com/questions/145367/how-to-have-back-the-command-prompt-after-calling-an-application)

## "restore-restic-git" script/command (Ref)

* Common
  * {45} [Why is $$ returning the same id as the parent process?](https://stackoverflow.com/questions/21063765/why-is-returning-the-same-id-as-the-parent-process)
  * {46} [Grep regex NOT containing a string](https://stackoverflow.com/questions/10411616/grep-regex-not-containing-a-string)

* Windows-OS
  * {47} [How to capture the PID of a process when launching it from command line?](https://stackoverflow.com/questions/1807794/how-to-capture-the-pid-of-a-process-when-launching-it-from-command-line)
  * {48} [How to get PID of process just started from within a batch file?](https://stackoverflow.com/questions/9486960/how-to-get-pid-of-process-just-started-from-within-a-batch-file)
  * {49} [Taskkill /PID not working in GitBash](https://stackoverflow.com/questions/34981745/taskkill-pid-not-working-in-gitbash)
  * {50} [How to kill a windows process in a cygwin terminal?](https://superuser.com/questions/439539/how-to-kill-a-windows-process-in-a-cygwin-terminal)
  * {51} [Convert a Cygwin PID to a Windows PID](https://stackoverflow.com/questions/1679337/convert-a-cygwin-pid-to-a-windows-pid)
  
* Linux-OS
  * {52} [How can a Linux/Unix Bash script get its own PID?](https://stackoverflow.com/questions/2493642/how-can-a-linux-unix-bash-script-get-its-own-pid)
  * {53} [Equivalent of ctrl c in command to cancel a program](https://stackoverflow.com/questions/514771/equivalent-of-ctrl-c-in-command-to-cancel-a-program)
  * {54} [killing a process in git bash](https://stackoverflow.com/questions/62317084/killing-a-process-in-git-bash)

## "sync-restic-repo" script/command (Ref)

* Common
  * {55} [How to split a string into an array in Bash?](https://stackoverflow.com/questions/10586153/how-to-split-a-string-into-an-array-in-bash)

## "restic-drive" script/command (Ref)
  * 

## "[pj]note" script/command (Ref)

* Common
  * {56} [using "ls" and preserving the spaces in the resulting array](https://stackoverflow.com/questions/54646366/using-ls-and-preserving-the-spaces-in-the-resulting-array)
  
* BASH
  * {57} [What's the difference between eval and exec?](https://unix.stackexchange.com/questions/296838/whats-the-difference-between-eval-and-exec)
  * {58} [Windows PATH to posix path conversion in bash](https://stackoverflow.com/questions/13701218/windows-path-to-posix-path-conversion-in-bash)
  * {59} [How to check if running in Cygwin, Mac or Linux?](https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux)
  
## "[pj]todo" script/command (Ref)
* Common
  * {202} [Bash get filename from given path on Linux or Unix](https://www.cyberciti.biz/faq/bash-get-filename-from-given-path-on-linux-or-unix/)

## "gist" script/command (Ref)
* Common
  * {60} [How to grep for case insensitive string in a file?](https://stackoverflow.com/questions/48492422/how-to-grep-for-case-insensitive-string-in-a-file)
  * {61} [Split string on newline and write it into array using read](https://unix.stackexchange.com/questions/628527/split-string-on-newline-and-write-it-into-array-using-read)
  * {62} [How to delete temporary files in Windows](https://helpcenter.trendmicro.com/en-us/article/tmka-20576)
  * {63} [How to remove all files from a directory?](https://askubuntu.com/questions/60228/how-to-remove-all-files-from-a-directory)

## "db-sync" script/command (Ref)
* Common
  * {64} [YYYY-MM-DD format date in shell script](https://stackoverflow.com/questions/1401482/yyyy-mm-dd-format-date-in-shell-script)
  * {65} [mysqldump: Couldn't execute. Unknown table 'column_statistics' in information_schema](https://stackoverflow.com/questions/52423595/mysqldump-couldnt-execute-unknown-table-column-statistics-in-information-sc)
  * {66} [using "ls" and preserving the spaces in the resulting array](https://stackoverflow.com/questions/54646366/using-ls-and-preserving-the-spaces-in-the-resulting-array)
  * {67} [Get the short Git version hash](https://stackoverflow.com/questions/5694389/get-the-short-git-version-hash)
  * {68} [Best Way to to compress mysqldump?](https://stackoverflow.com/questions/18173012/best-way-to-to-compress-mysqldump)
  * {69} [How to compress a mysqldump backup](https://mysqldump.guru/how-to-compress-mysqldump-backup.html)
  
* Vagrant
  * {70} [Easiest way to copy a single file from host to Vagrant guest?](https://stackoverflow.com/questions/16704059/easiest-way-to-copy-a-single-file-from-host-to-vagrant-guest)
  * {71} [Using scp and vagrant-scp in VirtualBox to copy from Guest VM to Host OS and vice-versa](https://medium.com/@smartsplash/using-scp-and-vagrant-scp-in-virtualbox-to-copy-from-guest-vm-to-host-os-and-vice-versa-9d2c828b6197)
  * {72} [Running Commands on Vagrant Guest from Host](https://www.calebwoods.com/2015/05/05/vagrant-guest-commands/)

## "pcsync" script/command (Ref)

* Installation
  * {200} [How to enable rsync through ssh on a Windows machine](https://gist.github.com/fmartins-andre/532faaad71ace2af6f396f176adee5de)

* Commands
  * {73} [How to get the primary IP address of the local machine on Linux and OS X? (closed)](https://stackoverflow.com/questions/13322485/how-to-get-the-primary-ip-address-of-the-local-machine-on-linux-and-os-x)
  * {189} [Grep only the first match and stop](https://stackoverflow.com/questions/14093452/grep-only-the-first-match-and-stop)
  * {74} [CP & MV command progress](https://github.com/Xfennec/progress#what-can-i-do-with-it)
  * {75} [YYYY-MM-DD format date in shell script](https://stackoverflow.com/questions/1401482/yyyy-mm-dd-format-date-in-shell-script)
  * {76} [How can I copy the contents of a folder to another folder in a different directory using terminal?](https://askubuntu.com/questions/86822/how-can-i-copy-the-contents-of-a-folder-to-another-folder-in-a-different-directo)
  * {77} [How do I move all files from one folder to another using the command line?](https://askubuntu.com/questions/172629/how-do-i-move-all-files-from-one-folder-to-another-using-the-command-line)
  * {78} [mv: cannot stat No such file or directory in shell script](https://unix.stackexchange.com/questions/77007/mv-cannot-stat-no-such-file-or-directory-in-shell-script)
  * {79} [How can I get mv (or the * wildcard) to move hidden files?](https://askubuntu.com/questions/259383/how-can-i-get-mv-or-the-wildcard-to-move-hidden-files)
  * {80} [Is it possible to specify a different ssh port when using rsync?](https://stackoverflow.com/questions/4549945/is-it-possible-to-specify-a-different-ssh-port-when-using-rsync)
  * {81} [How to use Unison to sync files on Linux machines across a network](https://www.techrepublic.com/article/how-to-use-unison-to-sync-files-on-linux-machines-across-a-network/)
  * {82} [How do I change the port for Unison?](https://www.linuxquestions.org/questions/linux-software-2/how-do-i-change-the-port-for-unison-4175477318/)
  * {83} [How To Run Multiple SSH Command On Remote Machine And Exit Safely](https://www.cyberciti.biz/faq/linux-unix-osx-bsd-ssh-run-command-on-remote-machine-server/)
  * {184} [running a program through ssh fails with "Error opening terminal: unknown."](https://stackoverflow.com/questions/30469813/running-a-program-through-ssh-fails-with-error-opening-terminal-unknown)
  * {185} [How to force GPG to use console-mode pinentry to prompt for passwords?](https://superuser.com/questions/520980/how-to-force-gpg-to-use-console-mode-pinentry-to-prompt-for-passwords)
  * {186} [Headless/TTY-only sessions](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/credstores.md#headlesstty-only-sessions)
  * {187} [dooblem/bsync](https://github.com/dooblem/bsync)
  * {194} [How can I automate sending commands from Windows to Linux (WSL/Ubuntu)?](https://superuser.com/questions/1631997/how-can-i-automate-sending-commands-from-windows-to-linux-wsl-ubuntu)
  * {195} [WSL command doesn't work through CMD/PowerShell [duplicate]](https://superuser.com/questions/1769477/wsl-command-doesnt-work-through-cmd-powershell)
  * {197} [How to Use echo Command Without Newline](https://linuxhandbook.com/echo-without-newline/)
  * {198} [How to rsync directly into a Windows 10 machine (using OpenSSH not cygwin or WSL)](https://akliang.medium.com/how-to-rsync-directly-into-a-windows-10-machine-using-openssh-not-cygwin-or-wsl-cbbadff95712)

* Bash
  * {84} [How to remove last n characters from a string in Bash?](https://stackoverflow.com/questions/27658675/how-to-remove-last-n-characters-from-a-string-in-bash)
  * {85} [How to split one string into multiple strings separated by at least one space in bash shell?](https://stackoverflow.com/questions/1469849/how-to-split-one-string-into-multiple-strings-separated-by-at-least-one-space-in)
  * {86} [Return value in a Bash function](https://stackoverflow.com/questions/17336915/return-value-in-a-bash-function)
  * {87} [How to Simulate an Array of Arrays in Bash](https://linuxhint.com/simulate-bash-array-of-arrays/)
  * {88} [Shell script - remove first and last quote (") from a variable](https://stackoverflow.com/questions/9733338/shell-script-remove-first-and-last-quote-from-a-variable)
  * {89} [Bash sed escape double quotes](https://gist.github.com/miguelmota/a0d37934c689f9ad000d01306905868c)
  * {90} [How to while loop correctly in bash script?](https://stackoverflow.com/questions/8390379/how-to-while-loop-correctly-in-bash-script)
  * {91} [Working with Bash Arrays](https://www.section.io/engineering-education/working-with-bash-arrays/)
  * {92} [How to Use Bash Arrays](https://www.hostinger.com/tutorials/bash-array)
  * {93} [A little trick to embed python code in a BASH script.](https://gist.github.com/welbornprod/ccbf43393ecd610032f4)
  * {94} [embedding short python scripts inside a bash script](https://stackoverflow.com/questions/2189098/embedding-short-python-scripts-inside-a-bash-script)
  * {95} [Multiple logical operators, ((A || B) && C), and "syntax error near unexpected token"](https://unix.stackexchange.com/questions/290146/multiple-logical-operators-a-b-c-and-syntax-error-near-unexpected-t)
  * {96} [How to get the last character of a string in a shell?](https://stackoverflow.com/questions/17542892/how-to-get-the-last-character-of-a-string-in-a-shell)
  * {188} [How to detect the OS from a Bash script?](https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script)
  * {201} [How can I check if the environment is WSL from a shell script?](https://superuser.com/questions/1749781/how-can-i-check-if-the-environment-is-wsl-from-a-shell-script)
  * {190} [Accessing a JSON object in Bash - associative array / list / another model](https://stackoverflow.com/questions/26717277/accessing-a-json-object-in-bash-associative-array-list-another-model)
  * {191} [How to convert a JSON object to key=value format in jq?](https://stackoverflow.com/questions/25378013/how-to-convert-a-json-object-to-key-value-format-in-jq/25378171#25378171)
  * {192} [How can I extract the first two characters of a string in shell scripting?](https://stackoverflow.com/questions/1405611/how-can-i-extract-the-first-two-characters-of-a-string-in-shell-scripting)
  * {193} [Remove first character of a string in Bash](https://stackoverflow.com/questions/6594085/remove-first-character-of-a-string-in-bash)
  * {196} [Windows PATH to posix path conversion in bash](https://stackoverflow.com/questions/13701218/windows-path-to-posix-path-conversion-in-bash)

* JSON
  * {97} [Escaping characters in bash (for JSON)](https://stackoverflow.com/questions/10053678/escaping-characters-in-bash-for-json)
  * {98} [Format strings and escaping](https://jqlang.github.io/jq/manual/#format-strings-and-escaping)
  * {99} [jq: output array of json objects [duplicate]](https://stackoverflow.com/questions/38061346/jq-output-array-of-json-objects)

* VirtualBox
  * {199} [Virtualbox shared folder permissions [closed]](https://stackoverflow.com/questions/26740113/virtualbox-shared-folder-permissions)
  
## "cmdref" script/command (Ref)

* Bash
  * {100} [How do I tell if a file does not exist in Bash?](https://stackoverflow.com/questions/638975/how-do-i-tell-if-a-file-does-not-exist-in-bash)

## Configuration JSON Editing (Ref)

* REST API
  * {101} [Create A REST API With JSON Server](https://medium.com/codingthesmartway-com-blog/create-a-rest-api-with-json-server-36da8680136d)

* AJAX Request
  * {102} [AJAX - The XMLHttpRequest Object](https://www.w3schools.com/js/js_ajax_http.asp)
  * {103} [Create a JavaScript AJAX Post Request: With and Without jQuery](https://code.tutsplus.com/articles/create-a-javascript-ajax-post-request-with-and-without-jquery--cms-39195)
  * {104} [jQuery Ajax PUT with parameters](https://stackoverflow.com/questions/8032938/jquery-ajax-put-with-parameters)
  * {105} [jQuery ajax delete](https://www.educba.com/jquery-ajax-delete/)

* configure-repository.html
  * {106} [How TO - CSS/JS Modal](https://www.w3schools.com/howto/howto_css_modals.asp)
  * {107} [How TO - Delete Modal](https://www.w3schools.com/howto/howto_css_delete_modal.asp)
  * {108} [CSS Tables](https://www.w3schools.com/css/css_table.asp)
  * {109} [CSS Forms](https://www.w3schools.com/css/css_form.asp)
  * Icons
    * {110} [LOWER RIGHT PENCIL](https://www.toptal.com/designers/htmlarrows/symbols/lower-right-pencil/)
    * {111} [BLACK SUN WITH RAYS](https://www.toptal.com/designers/htmlarrows/symbols/black-sun-with-rays/)
    * {112} [HEAVY GREEK CROSS](https://www.toptal.com/designers/htmlarrows/symbols/heavy-greek-cross/)
    * {113} [HEAVY MULTIPLICATION X](https://www.toptal.com/designers/htmlarrows/symbols/heavy-multiplication-x/)
    * {114} [UTF-8 Arrows](https://www.w3schools.com/charsets/ref_utf_arrows.asp)

## Graphical User Interface (Ref)

* General
  * {115} [How to see an HTML page on Github as a normal rendered HTML page to see preview in browser, without downloading?](https://stackoverflow.com/questions/8446218/how-to-see-an-html-page-on-github-as-a-normal-rendered-html-page-to-see-preview)
  * {116} [htmlpreview/htmlpreview.github.com](https://github.com/htmlpreview/htmlpreview.github.com)
  * {117} [GitHub Pages](https://pages.github.com/)

* Terminal
  * {118} [How can I keep the gnome-terminal open after a program closes?](https://askubuntu.com/questions/630698/how-can-i-keep-the-gnome-terminal-open-after-a-program-closes)
  * {119} [Stop Powershell from exiting](https://stackoverflow.com/questions/9362722/stop-powershell-from-exiting)
  * {120} [Escaping Double Quotes in Batch Script](https://stackoverflow.com/questions/562038/escaping-double-quotes-in-batch-script)

* PHP
  * PHP Web Server
    * {121} [How can I run a php without a web server?](https://stackoverflow.com/questions/4301975/how-can-i-run-a-php-without-a-web-server)
    * {122} [PHP - Built-in web server](https://www.php.net/manual/en/features.commandline.webserver.php)
    * {123} [Running PHP script from command line as background process](https://stackoverflow.com/questions/6989161/running-php-script-from-command-line-as-background-process)
    * {124} [nohup Command in Linux with Examples](https://www.geeksforgeeks.org/nohup-command-in-linux-with-examples/)

  * PHP Execute Command
    * {125} [shell_exec() vs exec() Function | PHP](https://www.geeksforgeeks.org/php-shell_exec-vs-exec-function/)
    * {126} [shell_exec — Execute command via shell and return the complete output as a string | PHP](https://www.php.net/manual/en/function.shell-exec.php)
    * {127} [exec — Execute an external program | PHP](https://www.php.net/manual/en/function.exec.php)
    * {128} [passthru — Execute an external program and display raw output | PHP](https://www.php.net/manual/en/function.passthru.php)
    * {129} [escapeshellarg — Escape a string to be used as a shell argument | PHP](https://www.php.net/manual/en/function.escapeshellarg.php)
    * {130} [escapeshellcmd — Escape shell metacharacters | PHP](https://www.php.net/manual/en/function.escapeshellcmd.php)
    * {131} [system — Execute an external program and display the output | PHP](https://www.php.net/manual/en/function.system.php)
    * {132} [pcntl_exec — Executes specified program in current process space | PHP](https://www.php.net/manual/en/function.pcntl-exec.php)
    * {133} [Execution Operators | PHP](https://www.php.net/manual/en/language.operators.execution.php)
    * {134} [Run an Interactive Shell Script in PHP](https://stackoverflow.com/questions/11460394/run-an-interactive-shell-script-in-php)
  
  * PHP Execture Command Example
    * {135} [PHP exec() vs system() vs passthru()](https://stackoverflow.com/questions/732832/php-exec-vs-system-vs-passthru)

  * PHP JSON CRUD
    * {136} [JSON CRUD Operation in PHP Tutorial](https://www.sourcecodester.com/tutorial/php/15842/json-crud-operation-php-tutorial)
    * {137} [PHP CRUD Operations with JSON File](https://www.codexworld.com/php-crud-operations-with-json-file/)
    * {138} [Why does my JavaScript code receive a "No 'Access-Control-Allow-Origin' header is present on the requested resource" error, while Postman does not?](https://stackoverflow.com/questions/20035101/why-does-my-javascript-code-receive-a-no-access-control-allow-origin-header-i)
    * {139} [Request header field Access-Control-Allow-Headers is not allowed by Access-Control-Allow-Headers](https://stackoverflow.com/questions/25727306/request-header-field-access-control-allow-headers-is-not-allowed-by-access-contr)
    * {140} [Multiple Flags for json_encode()](https://stackoverflow.com/questions/32311103/multiple-flags-for-json-encode)
    * {141} [json_encode() escaping forward slashes](https://stackoverflow.com/questions/10210338/json-encode-escaping-forward-slashes)
    * {142} [AJAX: How to send back a success/error message](https://stackoverflow.com/questions/61473306/ajax-how-to-send-back-a-success-error-message)
    * {143} [Deleting an element from an array in PHP](https://stackoverflow.com/questions/369602/deleting-an-element-from-an-array-in-php)
    * {144} [json_encode/json_decode - returns stdClass instead of Array in PHP](https://stackoverflow.com/questions/2281973/json-encode-json-decode-returns-stdclass-instead-of-array-in-php)

  * PHP Code
    * {145} [method_exists — Checks if the class method exists | PHP](https://www.php.net/manual/en/function.method-exists.php)
    * {146} [Variable variables | PHP](https://www.php.net/manual/en/language.variables.variable.php)
    * {147} [How do I dynamically invoke a class method in PHP? [duplicate]](https://stackoverflow.com/questions/273169/how-do-i-dynamically-invoke-a-class-method-in-php)

* AJAX
  * {147} [Calling a JavaScript function returned from an Ajax response](https://stackoverflow.com/questions/510779/calling-a-javascript-function-returned-from-an-ajax-response)
  * {148} [PHP - Response to preflight request doesn't pass access control check: It does not have HTTP ok status](https://stackoverflow.com/questions/61642547/php-response-to-preflight-request-doesnt-pass-access-control-check-it-does-n)

* JavaScript Code
  * {150} [Loop Through an Object in JavaScript – How to Iterate Over an Object in JS](https://www.freecodecamp.org/news/how-to-iterate-over-objects-in-javascript/)
  * {151} [Usage of the backtick character () in JavaScript](https://stackoverflow.com/questions/27678052/usage-of-the-backtick-character-in-javascript)
  * {152} [Remove Last Character from String in Javascript](https://www.scaler.com/topics/remove-last-character-from-string-javascript/)
  * {153} [Escape all special characters in a string that is sent by jquery ajax](https://stackoverflow.com/questions/10133082/escape-all-special-characters-in-a-string-that-is-sent-by-jquery-ajax)
  * {154} [JavaScript encodeURIComponent()](https://www.w3schools.com/jsref/jsref_encodeuricomponent.asp)
  * {155} [Objects inside objects in javascript](https://stackoverflow.com/questions/6429959/objects-inside-objects-in-javascript)
  * {156} [How do I escape a single quote ( ' ) in JavaScript? [duplicate]](https://stackoverflow.com/questions/16134910/how-do-i-escape-a-single-quote-in-javascript)
  * {157} [Loop through array of values with Arrow Function [closed]](https://stackoverflow.com/questions/33763768/loop-through-array-of-values-with-arrow-function)
  * {158} [Remove table row after clicking table row delete button](https://stackoverflow.com/questions/11553768/remove-table-row-after-clicking-table-row-delete-button)
  * {159} [How to get all the values of input array element jquery [duplicate]](https://stackoverflow.com/questions/24503865/how-to-get-all-the-values-of-input-array-element-jquery)
  * {160} [HTML DOM Element setAttribute()](https://www.w3schools.com/jsref/met_element_setattribute.asp)
  * {161} [javascript: pass an object as the argument to a onclick function inside string](https://stackoverflow.com/questions/12109811/javascript-pass-an-object-as-the-argument-to-a-onclick-function-inside-string)

* BASH
  * {162} [Pipe input into a script](https://stackoverflow.com/questions/19408649/pipe-input-into-a-script)
  * {163} [Passing arguments to an interactive program non-interactively](https://stackoverflow.com/questions/14392525/passing-arguments-to-an-interactive-program-non-interactively)
  * {164} [Passing arguments to /bin/bash via a bash script](https://stackoverflow.com/questions/12059528/passing-arguments-to-bin-bash-via-a-bash-script)
  * {165} [Pass args for script when going thru pipe](https://stackoverflow.com/questions/14693100/pass-args-for-script-when-going-thru-pipe)
  * {166} [How to escape single quotes within single quoted strings](https://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings)
    * I always just replace each embedded single quote with the sequence: '\'' (that is: quote backslash quote quote) which closes the string, appends an escaped single quote and reopens the string.

* Other
  * {167} [What characters are forbidden in Windows and Linux directory names?](https://stackoverflow.com/questions/1976007/what-characters-are-forbidden-in-windows-and-linux-directory-names)

## Sync Devices (Ref)

* Terminal
  * {168} [How can I keep the gnome-terminal open after a program closes?](https://askubuntu.com/questions/630698/how-can-i-keep-the-gnome-terminal-open-after-a-program-closes)
  * {169} [How to show the transfer progress and speed when copying files with cp?](https://askubuntu.com/questions/17275/how-to-show-the-transfer-progress-and-speed-when-copying-files-with-cp)
  * {170} [Xfennec/progress GitHub](https://github.com/Xfennec/progress)

* PHP
  * {171} [JSON encode MySQL results](https://stackoverflow.com/questions/383631/json-encode-mysql-results)
  * {172} [PHP UPDATE prepared statement](https://stackoverflow.com/questions/18316501/php-update-prepared-statement)
  * {173} [Mysqli SELECT query with prepared statements](https://phpdelusions.net/mysqli_examples/prepared_select)

* Mysql
  * {174} [Should you cache a MySQL connection in PHP?](https://stackoverflow.com/questions/25884354/should-you-cache-a-mysql-connection-in-php)
  * {175} [The mysqli Extension and Persistent Connections](https://www.php.net/manual/en/mysqli.persistconns.php)

* JavaScript
  * {176} [How to execute code before window.load and after DOM has been loaded?](https://stackoverflow.com/questions/13270290/how-to-execute-code-before-window-load-and-after-dom-has-been-loaded)
  * {177} [Get selected option text with JavaScript](https://stackoverflow.com/questions/14976495/get-selected-option-text-with-javascript)

* HTML/CSS
  * {178} [How TO - CSS Loader](https://www.w3schools.com/howto/howto_css_loader.asp)
  * Icon
    * {179} [Unicode Refresh Icon](https://www.amp-what.com/unicode/search/refresh)
  * {180} [How to correctly iterate through getElementsByClassName](https://stackoverflow.com/questions/15843581/how-to-correctly-iterate-through-getelementsbyclassname)

* Port Scan
  * {181} [Checking host availability by using ping in bash scripts](https://stackoverflow.com/questions/18123211/checking-host-availability-by-using-ping-in-bash-scripts)
  * {182} [Ping a Specific Port](https://serverfault.com/questions/309357/ping-a-specific-port)
  * {183} [How to Scan & Find All Open Ports with Nmap](https://phoenixnap.com/kb/nmap-scan-open-ports)

* BASH
  * 
