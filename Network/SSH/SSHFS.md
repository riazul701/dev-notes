# SSHFS.md

## Both-Common\\SSHFS

## Windows\\SSHFS

### Websites (Windows//SSHFS)
* [Windows File System Proxy](https://winfsp.dev/)
* [winfsp/sshfs-win GitHub](https://github.com/winfsp/sshfs-win)
* [winfsp/winfsp GitHub](https://github.com/winfsp/winfsp)
* [evsar3/sshfs-win-manager GitHub](https://github.com/evsar3/sshfs-win-manager)
* [mhogomchungu/sirikali](https://github.com/mhogomchungu/sirikali)

### Windows Setup (SSHFS)

* {39} [SSHFS: How to Mount Remote File Systems Over SSH](https://phoenixnap.com/kb/sshfs)
* {41} [SSHFS-Win · SSHFS for Windows](https://github.com/winfsp/sshfs-win/blob/master/README.md)

* Open PowerShell in Administrator mode and enter command: `winget install WinFsp.WinFsp; winget install SSHFS-Win.SSHFS-Win`
* If shows error "System error 67 has occurred. The network name cannot be found.", then uninstall and reinstall `WinFsp` and `SSHFS-Win` from GitHub binaries and restart-pc. <sup>{38}</sup>

* CMD Instructions - PC
  * Open CMD/PowerShell
  * Connect using UserName & Password: `net use R: \\sshfs\<remote-user>@<remote-ip>[!port][\path]` [The sshfs prefix maps to Remote-User's home directory]
  * Connect using UserName & Password: `net use R: \\sshfs.r\<remote-user>@<remote-ip>[!port][\path]` [The sshfs.r prefix maps to the Remote HOST's root directory]
  * Connect using ssh key in %USERPROFILE%/.ssh/id_rsa: `net use R: \\sshfs.k\<remote-user>@<remote-ip>[!port][\path]` [Maps to Remote-User's home directory. Only keys without a pass phrase are supported]
  * Connect using ssh key in %USERPROFILE%/.ssh/id_rsa: `net use R: \\sshfs.kr\<remote-user>@<remote-ip>[!port][\path]` [Maps to the Remote HOST's root directory. Only keys without a pass phrase are supported]
  * `net use R: \\sshfs.kr\<remote-user>@<remote-ip>!22\`
  * View the Mounted Devices: `net use`
  * Unmount a Remote File System: `net use R: /delete` [drive "R"]

* GUI Instructions - PC
  * Open windows-explorer -> Right click on "This PC" -> Map network drive -> Enter details
    * Drive : `R`
	  * Folder: `\\sshfs.kr\<remote-user>@<remote-ip>!22\`
  * Unmount "Network Drive"
    * Open windows-explorer -> Network locations -> Right click on any item -> Select "Disconnect"
  * Alternatively use Graphical-User-Interface for connection: [evsar3/sshfs-win-manager GitHub](https://github.com/evsar3/sshfs-win-manager)
  * Alternatively use Graphical-User-Interface 2 [mhogomchungu/sirikali](https://github.com/mhogomchungu/sirikali)

* Add Android Mobile

  * Termux Instruction
    * If empty mount, but shows storage size, then delete-and-create existing mount folder.
    * Open Termux on Android and start SSH server: `sshd`

  * Termux CMD
    * Open CMD/PowerShell
    * Connect using identity file: `net use S: \\sshfs.kr\<remote-user>@<remote-ip>!<port:8022>\storage\emulated\0` [Get Termux username: `whoami`] [Get path by "SSH/SFTP Server BY Banana Studio App" -> Users -> Alias]
    * View the Mounted Devices: `net use`
    * Unmount a Remote File System: `net use S: /delete` [drive "S"]

  * Termux GUI
    * Open Termux on Android and start SSH server: `sshd`
    * Open windows-explorer -> Right click on "This PC" -> Map network drive -> Enter details
      * Drive : Q
      * Folder: \\sshfs.kr\<remote-user>@<remote-ip>!<port:8022>\storage\emulated\0
    * Unmount "Network Drive"
      * Open windows-explorer -> Network locations -> Right click on any item -> Select "Disconnect"

  * [SSH/SFTP Server - Terminal BY Banana Studio](https://play.google.com/store/apps/details?id=net.xnano.android.sshserver)
    * Install this Android software from Play Store
    * Set Alias/Location (from "Users" tab) for both Phone-Memory and SD-Card (As different SSH user)
    * Commands To Mount
      * Mount Device: `net use S: \\sshfs\<remote-user>@<remote-ip>!<port:2222>\\`
      * View the Mounted Devices: `net use`
      * Unmount a Remote File System: `net use S: /delete` [drive "S"]
    * Open windows-explorer -> Right click on "This PC" -> Select "Map network drive" -> Enter details:
      * Drive : `S`
      * Folder: `\\sshfs\<remote-user>@<remote-ip>!<port:2222>\`
    * Unmount "Network Drive"
      * Open windows-explorer -> Network locations -> Right click on any item -> Select "Disconnect"
    * Alternatively use Graphical-User-Interface for connection: [evsar3/sshfs-win-manager GitHub](https://github.com/evsar3/sshfs-win-manager)
  
## Linux\\SSHFS

### Linux Setup (SSHFS)

* {39} [SSHFS: How to Mount Remote File Systems Over SSH](https://phoenixnap.com/kb/sshfs)
* {40} [How do I specify SSH options for SSHFS?](https://askubuntu.com/questions/975818/how-do-i-specify-ssh-options-for-sshfs)

* Setup Instructions
  * Install SSHFS: `sudo apt install sshfs`
  * Check SSHFS is installed: `which sshfs`
  * Create folder for mount: 
    * `cd /mnt`
    * `sudo mkdir <folder-name>`
  * Mount Device via SSHFS: `sudo sshfs -o allow_other,IdentityFile=/home/<user>/.ssh/id_rsa -p <port:22> <user>@101.102.103.104:/ /mnt/<folder-name>/`
  * Unmount: `sudo umount /mnt/<folder-name>`

* Add Android Mobile

  * Using Termux CLI
    * If empty mount, but shows storage size, then delete-and-create existing mount folder.
    * Open Termux on Android and start SSH server: `sshd`
    * Open Terminal in Linux-OS
    * Create folder for mount: 
    * `cd /mnt`
    * `sudo mkdir <folder-name>`
    * Mount Device via SSHFS: `sudo sshfs -o allow_other,IdentityFile=/home/<local-user>/.ssh/id_rsa -p <port:8022> <remote-user>@<remote-ip>:/storage/emulated/0/ /mnt/<folder-name>/`  [Get Termux username: `whoami`] [Get path by "SSH/SFTP Server BY Banana Studio App" -> Users -> Alias]
    * Unmount: `sudo umount /mnt/<folder-name>`

  * [SSH/SFTP Server - Terminal BY Banana Studio](https://play.google.com/store/apps/details?id=net.xnano.android.sshserver)
    * Install this Android software from Play Store
    * Set Alias/Location (from "Users" tab) for both Phone-Memory and SD-Card (As different SSH user)
    * Open Terminal in Linux-OS
    * Create two folder "/home/<local-user>/mount/<phone-memory-folder>" and "/home/<local-user>/mount/<sdcard-folder>"
    * Mount Phone Memory: `sshfs -p <port:2222> <remote-user>@<remote-ip>:/ /home/<local-user>/mount/<phone-memory-folder>/` ["sudo" does not work here and "/mnt" path. Shows error "read: Connection reset by peer"]
    * Mount SD-Card: `sshfs -p <port:2222> <remote-user>@<remote-ip>:/ /home/<local-user>/mount/<sdcard-folder>/`
    * Unmount Phone Memory: `umount /home/<local-user>/mount/<phone-memory-folder>`
    * Unmount SD-Card: `umount /home/<local-user>/mount/<sdcard-folder>`

# References

## YouTube Tutorials

* [How to SSH Without a Password (like a boss)](https://www.youtube.com/watch?v=j2vBT3T79Pg)
* [Mounting Remote Filesystems With SSHFS](https://www.youtube.com/watch?v=-0jyrvMl0Ic)
