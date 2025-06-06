# OS-SparkyLinux.md

## Websites

* [repology.org => The packaging hub](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)

## Notes

## PATH

## Wallpaper

* SparkyLinux built-in wallpaper path: `/opt/artwork`

# Operating System Install

## Motherboard's UEFI Boot Manager

* In dual boot system, there are two boot managers in motherboard's UEFI. One for Linux and other for Windows.
  * Before reinstall Linux, remove Linux's boot manager from motherboard. Also format/delete Linux boot partitions.
  * Before reinstall Windows, remove Windows's boot manager from motherboard. Also format/delete Windows boot partitions.

## Sparky-Linux Installation

* ESP = EFI System Partition
* Shows follwing warning during OS installation in UEFI mode (Not BIOS) [GPT Partition]:
  > No EFI system partition configured
  > An EFI system partition is necessary to start Sparky.
  > To configure an EFI system partition, go back and select or create a suitable filesystem. The filesystem must be mounted on `/boot/efi`. The filesystem must have type `FAT32`. The filesystem must be at least 300 MiB in size. The filesystem must have flag `boot` set.
  > You can continue without setting up an EFI system partition but your system may fail to start.
  
* Note: For AntixLinux-23, `/boot/efi` is named as `ESP`

## Dual Boot SparkyLinux with Windows-OS

* {1} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
  * SparkyLinux does not detect Windows-OS on "GRUB" boot loader
  * On SparkyLinux open Terminal and type: `sudo nano /etc/default/grub`
    * To edit graphically, enter command `sudo pcmanfm`, and edit file `/etc/default/grub`
  * Uncomment line `#GRUB_DISABLE_OS_PROBER=false` [Remove `#` at first character] -> Save File
  * Reload GRUB: `sudo update-grub`
  * Restart PC and check "Windows Boot Manager"

# Configuration

## Create App/Menu Launcher

* Manually create Menu for software with following steps:
  * ".desktop"/Menu file is located at: `usr/share/applications`
  * Duplicate any ".desktop" file and edit following fields
    * Name
    * Comment
    * Keywords [Used to search programs from start-menu]
    * Icon
    * StartupWMClass
    * TryExec [Software path, that will be launched]
    * Exec [Software path, that will be launched]
    * Categories
    * Skip editing of following fields
      * Type
      * Terminal
      * StartupNotify

* Create menu entry for "Kitty" terminal
  * [Install kitty -> Binary install](https://sw.kovidgoyal.net/kitty/binary/#binary-install)
  * Install "Kitty" terminal: `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`
  * Kitty is installed in path : `/home/{{user-name}}/.local/kitty.app/bin`
  * Value of "TryExec" and "Exec" fields: `/home/{{user-name}}/.local/kitty.app/bin/kitty`
  * Follow ".desktop"/Menu file of WezTerm terminal, which is installed from ".deb" file using "GDebi" installer.

# References

* next-sl: {2}

* YouTube Tutorials

  * Dual Boot with Windows
    * {1} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
    