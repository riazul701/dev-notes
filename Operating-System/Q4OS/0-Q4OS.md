# Commands/Usage

* `ip address` : Shows current device's IP Address
* `sudo apt install ssh` : Install ssh client and server (sshd)
* `systemctl status sshd` : Check ssh service is running or not

# Q4OS.md

## Websites

* [repology.org => The packaging hub](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)

## Notes

* If windows OS is used in dual boot system and shutdown/hibernate from windows OS, then failed to mount hard disk partitions in linux OS. To solve this issue, restart from windows OS. If problem persists, from windows OS enable "fast-startup" and shutdown, then start pc and disable "fast-startup" and shutdown, then start pc and restart to linux OS.

* PATHs
  * Installed software launcher path: `/usr/share/applications`

* Flatpak is built-in inside of Q4OS.

# Operating System Install

## Motherboard's UEFI Boot Manager

* In dual boot system, there are two boot managers in motherboard's UEFI. One for Linux and other for Windows.
  * Before reinstall Linux, remove Linux's boot manager from motherboard. Also format/delete Linux boot partitions.
  * Before reinstall Windows, remove Windows's boot manager from motherboard. Also format/delete Windows boot partitions.

# Configuration

## Create App/Menu Launcher

* Manually create Menu for software with following steps:
  * ".desktop"/Menu file is located at: `usr/share/applications`
  * Duplicate any ".desktop" file and edit following fields
    * Name
    * Comment
    * Keywords [Used to search programs from start-menu]
    * Exec [Software path, that will be launched]
    * Icon
    * Categories
    * Skip editing of following fields
      * Terminal
      * Type
      * StartupNotify

* Create menu entry for "Kitty" terminal
  * [Install kitty -> Binary install](https://sw.kovidgoyal.net/kitty/binary/#binary-install)
  * Install "Kitty" terminal: `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`
  * Kitty is installed in path : `/home/{{user-name}}/.local/kitty.app/bin`
  * Value of "TryExec" and "Exec" fields: `/home/{{user-name}}/.local/kitty.app/bin/kitty`
  * Follow ".desktop"/Menu file of WezTerm terminal, which is installed from ".deb" file using "GDebi" installer.

# References

* next-sl: {2}

* Guides

  * General

  * Commands

