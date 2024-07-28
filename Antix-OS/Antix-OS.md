# Commands

* Switch to "root" user: `sudo su -`

# Contents of Antix OS

## Websites
* [AntiX Linux Official Website](https://antixlinux.com/)
* [Repology, the packaging hub](https://repology.org/)
* [OSBoxes | VirtualBox Image Download](https://www.osboxes.org/)
* [LinuxVMImages | VirtualBox Image Download](https://www.linuxvmimages.com/)
* IceWM Themes
  * [How to: add new themes to IceWM Window Manager](https://www.antixforum.com/forums/topic/how-to-add-new-themes-to-icewm-window-manager/)
  * [Ice-WM Themes](https://www.box-look.org/browse?cat=142&ord=latest)

## TODO
* General
  * Add "scrcpy" and "scrcpy-server" in software list
  * Install Git-Credential-Manager using ".tar.gz" file.

* APT Antix Software
  * Problems in DEB file download and install section.
  * Download deb file again if already exists.
  * GDebi file not found error.
  * Antix does not support Ubuntu PPA, remove it.

## Access

* Live-OS ROOT Acces
  * {1} [Quick Tips](https://antixlinux.com/quick-tips/)
  * On live system, username login as demo, username password = demo.
  * For root access, password = root. Please do not login as root. It is totally unnecessary.
  * Sudo is configured by default. When prompted for a password, user your username password, not root, for example on live system use demo
  * Useful documentation:
  * [antiX-FAQ](https://download.tuxfamily.org/antix/docs-antiX-23/FAQ/index.html)
  * [Live boot menu options](https://download.tuxfamily.org/antix/docs-antiX-23/Boot_Menu/antiX-gfxboot.html)
  * [Detailed guide to antiX-live](https://download.tuxfamily.org/antix/docs-antiX-23/live-boot/index.html)

## Notes
* Snap runs on Ubuntu, but not in Antix because Antix does not have Systemd, it has SysVinit.
* When mount /c, /d, /e, /f drives then Antix flux, icewm, jwm menu entry hangs. Restart PC/Unmount drives solve this problem.
* Fix Windows-OS "C" drive mounting hibernation error on Linux
  * [How to Delete Hibernation File on Windows 10](https://www.diskpart.com/free-up-space/how-to-delete-hibernation-file-windows-10-3690.html)
  * Hit the Windows key and type "cmd" in the taskbar, hit "Run as administrator".
  * In the command line window, type "powercfg -h off" and press "Enter". This command will disable hibernation and the hibernation file will be deleted.

## On/ShutDown/Sleep/Hibernate
* [How to hibernate / real suspend for laptops? No battery use](https://www.antixforum.com/forums/topic/how-to-hibernate-real-suspend-for-laptops-no-battery-use/)
  * 1.) Make sure to have a swap partiton of double size of your amount of RAM to allow proper hibernating. So resize it to 8 GB on your system. (Might work with 6 GB already, check out yourself the lowest limit working reliably.) When hibernating it must take the complete RAM content plus what was outsourced to Swap before already.
  * 2.) Make sure this swap partition is ONLY used by this very instance of antiX, not by any other OS or antiX USB stick you might have in use.
  * 3.) Enter the command
    * `pm-is-supported --hibernate; echo $?`
    * If it’s output is 0 (Zero) your system supports hibernation. If it returns a 1 (one) this means, hibernation is not supported.For me on antiX 21, 22 and 23 the command returns hibernation is supported out of the box.
  * To actually hibernate enter
    * `sudo pm-hibernate`
  * Caution! Some systems refuse to come back to life after hibernation, then you’ll need some further testing. Common reasons are incompatible or broken graphics drivers. (On antiX 17 I had to learn I could only successfully resume from suspend or hibernate when using proprietary nvidia drivers. Have not checked with most recent nouveau driver by now. You might experience similar issues with other graphics device manufactuerers) If resume fails, it is a good idea to check with different kernel versions. Some might fail resuming, others might work.

## Works After Fresh Antix-OS Install
* Softwares installation using command: `sudo ./apt-antix-software.sh`
* Restic version update: `sudo restic self-update`
* LunarVim installation
* "Docker-Xampp" containers installation. Use Docker without "sudo".
* [Free File Sync](https://freefilesync.org/) setup with Document-Drive.
* [Syncthing](https://syncthing.net/) setup.
* DBeaver connect with Docker
* "restic-git" and "dbackup" scripts setup
* Git Credential Manager setup
* AppImage file setup - "neovim", "qownnotes"
* VirtualBox Antix-OS, Windows-OS setup for testing
* Vagrant HestiaCP, LinarVim setup
* Bangla, Indian fonts installation.

## Trash
* Antix-OS does not have Trash. Files are deleted permanently.
* To use Trash use file manager: "pcmanfm" or "nautilus".
* "rm" command deletes file permanently, install package "trash-cli" and use command "trash" instead of "rm".
* Website Links
  * [Does Linux have a recycle bin?](https://ngangasn.com/linux-recycle-bin/)
  * [Antix - Trashcan Possible?](https://www.antixforum.com/forums/topic/trashcan-possible/) 

## Keyboard Shortcuts
* "Ctrl+space" -> Open App Selector
  * Free "Ctrl+spce" keyboard shortcut, because it is used for IDE/Editor auto-completion.
  * Open program "Add Key (Add Key)"
  * Remove Item/Line: "Ctrl+space"
  * Add Item/Line: First Key: "Control"; Second Key: "Super" (Windows-Key); Third Key: "space"; Command: "app-select"
  * Restart PC

* "Alt+Ctrl+Esc" -> Window List
* "Alt+Tab" -> Switch Opened Application

## SSH (Secure Shell)

### SSH Setup
* SSH Server is built-in inside Antix-OS.
* SSH Server Management
  * Status: `service ssh status`
  * Stop: `service ssh stop`
  * Start: `service ssh start`
  * Restart: `service ssh restart`

### Guides (SSH)
* YouTube
  * [How to SSH Without a Password (like a boss)](https://www.youtube.com/watch?v=j2vBT3T79Pg)

## SSHFS (SSH File System)

### SSHFS Setup
* Setup Instructions
  * Check SSHFS is installed: `which sshfs`
  * Create directory for mount: 
    * `cd /mnt`
    * `sudo mkdir <directory-name>``
  * Mount Device via SSHFS: `sudo sshfs -p <22-OR-2222> <user-name>@101.102.103.104:/ /mnt/directory-name/`

* Add Mobile Phone
  * [SSH/SFTP Server - Terminal BY Banana Studio](https://play.google.com/store/apps/details?id=net.xnano.android.sshserver)
    * Install this Android software from Play Store
    * Add both Phone-Memory and SD-Card/Memory-Card
    * Remeber Alias (from "Users" tab) for both Phone-Memory and SD-Card
  * Open Terminal in Linux-OS
    * Create two folder "/mnt/<phone-memory-folder>" and "/mnt/<sdcard-folder>"
    * Mount Phone Memory: `sudo sshfs -p 2222 <user-name>@101.102.103.104:/<phone-memory-alias>/ /mnt/<phone-memory-folder>/`
    * Mount SD-Card: `sudo sshfs -p 2222 <user-name>@101.102.103.104:/<sdcard-alias>/ /mnt/<sdcard-folder>/`
    * Unmount Phone Memory: `sudo umount /mnt/<phone-memory-folder>`
    * Unmount SD-Card: `sudo umount /mnt/<sdcard-folder>`
  
### Guides (SSHFS)
* SSHFS Linux
  * [Mounting Remote Filesystems With SSHFS](https://www.youtube.com/watch?v=-0jyrvMl0Ic)

## Guides (Antix-OS)
* https://github.com/Genymobile/scrcpy/issues/185
* http://developer.android.com/tools/device.html

## Install bangla font
* Open Synaptic Package Manager -> Search for "font"
* Install "fonts-beng", "fonts-beng-extra", "fonts-lohit-beng-bengali", "fonts-lohit-beng-assamese", "fonts-indic"
* Then bangla font will work in Firefox, Chrome browser.
* Install Avro Keyboard "ibus-avro" [For problem use command "ibus" and "ibus-daemon"] [Run ibus daemon in background: `ibus-daemon -d`]

# Software Installation

## Install AppImage as Regular Software
* [Neovim Installation Details](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)
  * Remove the current version of NeoVim: `sudo apt remove neovim`
  * Download [this](https://github.com/neovim/neovim/releases/download/stable/nvim.appimage) (latest version - 0.5.0 appimage from github)
  * cd into the directory it was downloaded to e.g. cd ~/Downloads
  * Make it executable for your user chmod u+x ./nvim.appimage
  * Move it to a folder that's indexed in your PATH env var so your computer knows what you mean when you type nvim. You can check the folders in your current path by typing echo $PATH which will show you something like this: /usr/local/bin:/usr/bin. Notice there are 2 folders here in this case separated by a colon (:). You will likely have more than two. /usr/local/bin is a common place to stick it. To move it there you'll need to use sudo: sudo mv nvim.appimage /usr/local/bin/nvim
  * When you type nvim it should "just work"
  * Bonus: add this to ~/.bashrc/~/.zshrc etc to create an alias in case you accidentally type vi (I always type it by mistake): alias vi=nvim
  * Bonus #2: Also in your bashrc/zshrc etc set your EDITOR env var so various programs know what editor you prefer to use: EDITOR=/usr/local/bin/nvim
  
## DEB File Installation

### Error and Solution (DEB File)
* [zst compression not supported by apt/dpkg](https://unix.stackexchange.com/questions/669004/zst-compression-not-supported-by-apt-dpkg)
  * sudo apt upgrade dpkg

## Fonts Installation

* [How to Install New Fonts in Ubuntu and Other Linux Distributions](https://itsfoss.com/install-fonts-ubuntu/)
* [SutonnyMJ Regular](https://bengalifonts.net/fonts/sutonnymj-regular)

* Step 1: Create .fonts directory in your home directory
* Step 2: Put fonts files in the .fonts directory

# Error and Solution

## Can not see Website

* [Ubuntu 22.04.1 LTS: DNS address could not be found DNS_PROBE_POSSIBLE](https://askubuntu.com/questions/1435003/ubuntu-22-04-1-lts-dns-address-could-not-be-found-dns-probe-possible)

* Error Messages in Browser
  * dns address could not be found
  * IP address could not be found, check DNS, FireWall
* Reason
  * DNS resolves Domain Name to IP Address, and thus we visit website in web-browser.
  * This Computer is pointing to an incorrect DNS server, that can not resolve Domain Name to IP Address like "192.168.0.1", "0.0.0.0"
  * "/etc/resolv.conf" file point to DNS server.
* Solution
  * Open "Connman Sytem Tray" -> Details -> Configuration -> Nameservers -> Enter "8.8.8.8" -> OK [No need to restart PC]
  * Alternatively open "/etc/resolv.conf" file and Enter "nameserver 8.8.8.8" -> Restart PC
  * Google's DNS: 8.8.8.8
  * CloudFlare's DNS: 1.1.1.1

## App-Select

* Commands
  * Show "app-select" path: `which app-select`
  * Launch "app-select": `app-select`

* ModuleNotFoundError: No module named 'xdg.DesktopEntry' [When execute command `app-select` from Terminal]
  * [[SOLVED] Python modules directories are messed up](https://www.antixforum.com/forums/topic/python-modules-directories-are-messed-up/)
  * [python, change user site directory or install setup.py --prefix with --user](https://stackoverflow.com/questions/24420125/python-change-user-site-directory-or-install-setup-py-prefix-with-user)
  * Explanation
    * Antix-OS python package path is "/usr/lib/python3/dist-packages"
    * User python package path is "~/.local/lib/python3.9/site-packages"
    * User python package path has higher priority than Antix-OS python package path.
    * For this reason "app-select" command can not find necessary pathon packages from "~/.local" path.
    * Temporarily to check, rename "~/.local" to "~/local_old". Then "app-select" command will work.
    * Another solution is to use command `sudo app-select`, because it will use Antix-OS python package path.
  * Solution
    * Copy all contents from "/usr/lib/python3/dist-packages/xdg" to "~/.local/lib/python3.9/site-packages/xdg"

# References

* Next Serial: {2}

* Access
  * {1} [Quick Tips](https://antixlinux.com/quick-tips/)
  