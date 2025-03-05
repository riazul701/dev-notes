# Configuration.md

## Websites

# Debian/Ubuntu

## Sound

* Install "pavucontrol" : `sudo apt install pavucontrol`
* Goto Start Menu -> Applications -> Multimedia -> PulseAudio Volume Control
  * Alternatively, goto Start Menu -> App Select -> Search for "pavucontrol"
* For shortcut, add "pavucontrol" to "Personal Menu". Goto Start Menu -> Applications -> antiX -> Personal Menu Editor -> ADD ICON -> Select "PulseAudio Volume Control -- /usr/share/applications/pavucontrol.desktop"

## Trash

* Antix-OS does not have Trash. Files are deleted permanently.
* To use Trash use file manager: "pcmanfm" or "nautilus".
* "rm" command deletes file permanently, install package "trash-cli" and use command "trash" instead of "rm".
* Website Links
  * [Does Linux have a recycle bin?](https://ngangasn.com/linux-recycle-bin/)
  * [Antix - Trashcan Possible?](https://www.antixforum.com/forums/topic/trashcan-possible/)

## Fonts Installation

* [How to Install New Fonts in Ubuntu and Other Linux Distributions](https://itsfoss.com/install-fonts-ubuntu/)
* [SutonnyMJ Regular](https://bengalifonts.net/fonts/sutonnymj-regular)

* Step 1: Create .fonts directory in your home directory
* Step 2: Put fonts files in the .fonts directory

**Alternate Way**

* [Copying Configurations => Fonts](https://github.com/addy-dclxvi/i3-starterpack?tab=readme-ov-file#copying-configurations)

* Create `.local/share/fonts` directory in your home directory
* Put fonts files in the `.local/share/fonts` directory
* Refresh your fontconfig cache `fc-cache -fv` after You copy the font.

## Install bangla font

* Open Synaptic Package Manager -> Search for "font"
* Install "fonts-beng", "fonts-beng-extra", "fonts-lohit-beng-bengali", "fonts-lohit-beng-assamese", "fonts-indic"
* Then bangla font will work in Firefox, Chrome browser.
* Install Avro Keyboard "ibus-avro" [For problem use command "ibus" and "ibus-daemon"] [Run ibus daemon in background: `ibus-daemon -d`]

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

# References

* Next Serial: {7}

* Websites
  * {6} [antiX also has two possible init systems: sysVinit (default option) or runit.](https://antixlinux.com/download/)

* Access
  * {1} [Quick Tips](https://antixlinux.com/quick-tips/)

* Software Installation

  * Install Backports/Updated Software
    * {2} [DebianUnstable](https://wiki.debian.org/DebianUnstable)
    * {3} [DontBreakDebian](https://wiki.debian.org/DontBreakDebian)
    * {4} [Debian Backports](https://backports.debian.org/)
    * {5} [Debian Backports ›› Instructions](https://backports.debian.org/Instructions/)

* SSH & SSH-FS
  * [ERROR: "adb push" returned with value 1 #185](https://github.com/Genymobile/scrcpy/issues/185)
  * [Run apps on a hardware device](http://developer.android.com/tools/device.html)
