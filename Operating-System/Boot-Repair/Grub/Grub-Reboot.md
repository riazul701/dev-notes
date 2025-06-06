# Grub-Reboot.md

## Notes

# Print Boot/Grub Menu in Terminal

## Debian/Ubuntu <sup>{1}</sup>

* Print Boot/Grub Menu & Submenu in Terminal

```
# awk -F\'\|\" '/(submenu|menuentry) / { printf "%s\t%s\n", $1, $2}' /boot/grub/grub.cfg
menuentry Debian GNU/Linux
submenu Advanced options for Debian GNU/Linux
      menuentry Debian GNU/Linux, with Linux 6.6.13-amd64
      menuentry Debian GNU/Linux, with Linux 6.6.13-amd64 (recovery mode)
      menuentry Debian GNU/Linux, with Linux 6.6.9-amd64
      menuentry Debian GNU/Linux, with Linux 6.6.9-amd64 (recovery mode)
menuentry Memory test (memtest86+x64.bin, serial console)
```

**Make function to execute above command**

* Append this function/code to `~/.bashrc` file

```
function show-grub-menu {
  sudo awk -F\'\|\" '/(submenu|menuentry) / { printf "%s\t%s\n", $1, $2}' /boot/grub/grub.cfg
}
```

* `source ~/.bashrc` : Reload `~/.bashrc` file

* `show-grub-menu` : Print grub menu in terminal

# Boot from Linux to Windows OS

## Debian/Ubuntu <sup>{1}</sup>

**Instructions**

* `sudo grub-reboot 2` : Temporarily set for one time, during next reboot, number-2 item/OS in grub menu will be selected. Number starts from 0.

* `systemctl reboot` : Reboot/Restart PC.

## Fedora

**Instructions**

* `sudo grub2-reboot 2` : Temporarily set for one time, during next reboot, number-2 item/OS in grub menu will be selected. Number starts from 0.

* `systemctl reboot` : Reboot/Restart PC.

## Btrfs `root` Partition : `grub-reboot` or `grub2-reboot` is Permanent, Not One-Time

**Error Message**

* When Linux is installed for Btrfs snapshot, without separate `/boot` (ext4) partition, then `grub-reboot` (Debian/Ubunut) or `grub2-reboot` (Fedora) makes permanent changes, not one-time. `grub2-reboot --help` shows message: <sup>{10}</sup>
  * GRUB can only write to `ext4` partition, either separate `/boot` (ext4) partition or `root` (`/`) partition is `ext4` and `/boot` is nested inside. <sup>{10}</sup>
  * If `root` (`/`) partition is `btrfs` and `/boot` is nested inside, then GRUB can not write. <sup>{10}</sup>
  * So, I guess that because it can’t write, it can’t remember that it did successfully pull off the “one time boot”, and it keeps doing it over and over again. <sup>{12}</sup>

```
NOTE: In cases where GRUB can not write to the environment block, such as when it is stored on an MDRAID or LVM device, the chosen boot menu entry will remain the default even after reboot.
```

**Solution-1**

* Download and Install [maharmstone/btrfs GitHub](https://github.com/maharmstone/btrfs) <sup>{13}</sup>
  * To install the driver, download and extract the latest release, right-click btrfs.inf, and choose Install.

* Using Notepad++, edit `/boot/grub2/grubenv`
  * Download and Install [Notepad Plus Plus](https://notepad-plus-plus.org/) <sup>{16}</sup>
  * Open file `/boot/grub2/grubenv` in Notepad++
  * Check Edit -> EOL Conversion : "Unix (LF)"

* Using Vim, edit `/boot/grub2/grubenv`
  * Open PowerShell in Administrator mode
  * `iex "& {$(irm get.scoop.sh)} -RunAsAdmin"` : Install scoop in Admin mode<sup>{17}</sup>
  * `scoop install --global main/vim` : Install vim using scoop package manager
  * `cd D:` : Go to `D:` drive
  * `ls` : Show list of files
  * `vim boot/grub2/grubenv` : Edit `/boot/grub2/grubenv` file using vim

* Change `next_entry=2` to `next_entry=0` : During next reboot, number-0 item/OS in grub menu will be selected. Number starts from 0. `0` entry is for Fedora-OS, `2` entry is for Windows-OS.

## Using `efibootmgr`, One-Time Boot

**[GRUBENV and BTRFS](https://www.reddit.com/r/btrfs/comments/qw2maq/grubenv_and_btrfs/) <sup>{18}</sup>**

* Taking a step back, what you want to do is booting windows once, right?

* Skip grub and use efi.

* `efibootmgr` : gets you a list of registered boot entries and 

* `efibootmgr --bootnext XXXX` : boots the specified one (windows) once and then goes back to default (grub).

# Configuration

## `/boot/grub2/grubenv` File

* `grub-reboot` and `grub2-reboot` commands write instructions to `/boot/grub2/grubenv` file.

* `/boot/grub2/grubenv` file contents:
```
# GRUB Environment Block
# WARNING: Do not edit this file by tools other than grub-editenv!!!
saved_entry=0
boot_success=1
next_entry=2
```

## Set GRUB Default OS

* `sudo nano /etc/default/grub` : Open file `/etc/default/grub` in sudo mode <sup>{7}</sup>
* Change `GRUB_DEFAULT=saved` (boot the last booted os/kernel) TO `GRUB_DEFAULT=0`, `GRUB_DEFAULT="0"` (first entry in grub menu) <sup>{6} {7}</sup>

* Debian/Ubuntu
  * `# update-grub` : Generate the GRUB configuration file <sup>{8}</sup>
  * `/boot/grub/grub.cfg` (Debian/Ubuntu) - the GRUB 2 configuration file, not editable. <sup>{11}</sup>

* Fedora
  * `# grub2-mkconfig -o /boot/grub2/grub.cfg` : Recreate the GRUB2 configuration file. <sup>{9}</sup>
  * `/boot/grub2/grub.cfg` (Fedora) - the GRUB 2 configuration file, not editable. <sup>{11}</sup>

## GRUB Menu Permanent/Temporary Info

**Google Search: "fedora grub reboot permanently" => AI Overview**

To ensure GRUB on a Fedora system permanently boots the desired operating system, you can adjust the default boot order in the GRUB configuration file. After making changes, you'll need to update GRUB to apply them. If you're experiencing boot issues, consider reinstalling GRUB or updating it from a live environment.

Here's how to change the default boot order:

1. Edit the GRUB configuration file:
  * Open the `/etc/default/grub` file as root.
  * Modify the `GRUB_DEFAULT` and `GRUB_SAVEDEFAULT` lines:
    * `GRUB_DEFAULT=saved`: This will boot the last selected OS.
    * `GRUB_SAVEDEFAULT=true`: This enables the GRUB menu to save the last selected OS.
    * `GRUB_DEFAULT=number`: Replace number with the number of the desired boot entry in the GRUB menu (e.g., `GRUB_DEFAULT=0` for the first entry).

2. Update GRUB:
  * Run `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg` (for EFI systems) or `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` (for BIOS systems).

3. Reboot:
  * Restart your system to see the changes in effect. 

If you're experiencing boot issues (GRUB not appearing, or incorrect boot):

1. Check for EFI/BIOS issues:
  * Ensure your system is booting in the correct mode (EFI or BIOS). 
  * Verify the boot order in your UEFI/BIOS settings. 

2. Reinstall GRUB:
  * You can reinstall GRUB from a live Fedora environment. 
  * Mount the root partition and EFI boot partition, bind mount special partitions, and chroot to the broken installation. 
  * Run `sudo dnf reinstall shim-* grub2-*` and `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg` or `sudo grub2-mkconfig -o /boot/grub2/grub.cfg`. 

3. Update GRUB:
  * Use `sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg` or `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` to update the GRUB configuration. 

If you've modified GRUB and automatic updates are interfering:
  * Review the Fedora documentation on managing GRUB. 
  * Consider using BLS (Bootloader Specification) for managing GRUB entries. 
  * If you've manually edited grub.cfg, you might need to adjust your approach to ensure automatic updates don't overwrite your changes. 

# Draft

## Btrfs `root` Partition : Change `grubenv` Location

**Google Search "change grubenv file location" => AI Overview**

**Comment: Does not work, only read from `/boot/grub2/grubenv` file**

To change the location of the `grubenv` file, you need to modify the `00_header` script in `/etc/grub.d`. Specifically, you'll adjust the `GRUBENV` variable and the `load_env` and `save_env` commands within that script. After making these changes, you'll need to update GRUB's configuration.

Here's a step-by-step guide:

1. Edit the `00_header` script:

* Open the file `/etc/grub.d/00_header` with root privileges using a text editor (e.g., `sudo nano /etc/grub.d/00_header`).

* Find the `GRUBENV` variable. It's usually defined at the beginning of the script.

* Change the value of `GRUBENV` to the desired path for the `grubenv` file. For example, if you want it in `/mnt/myfatpart`, you might set `GRUBENV="/mnt/myfatpart/grubenv"`.

* Find the `load_env` command and change it to: `load_env --file \"${grubenv}\"`.

* Find all instances of `save_env` and change them to: `save_env --file \"${grubenv}\"`.

2. Create the new grubenv file (if it doesn't exist):

* If the directory specified in `GRUBENV` doesn't exist, create it with appropriate permissions.

* If the `grubenv` file already exists, you can either copy the one from `/boot/grub` or leave it as is.

3. Update GRUB:

* Run `sudo update-grub`. This will regenerate the GRUB configuration file.

* If using `grub2-mkconfig`, you may need to run `sudo grub2-mkconfig -o /boot/grub2/grub.cfg`.

Example:

Let's say you want to move the `grubenv` file to a FAT32 partition mounted at `/mnt/myfatpart`:

1. In `/etc/grub.d/00_header`, change the lines:

Code
```
# GRUBENV="/boot/grub/grubenv"
GRUBENV="/mnt/myfatpart/grubenv"
```
and the `load_env` and `save_env` commands accordingly.

* Make sure `/mnt/myfatpart` exists and has appropriate permissions.

* Run `sudo update-grub` to update GRUB.

Important Considerations:

Permissions:
Ensure that the new directory where you are placing the `grubenv` file has the correct permissions for the GRUB process.

Mount Point:
Make sure the mount point where you're placing the `grubenv` file is accessible and persistent.

Testing:
After making these changes, test that your system boots correctly and that GRUB loads the new `grubenv` file. 

# References

* next-sl: {19}

## Websites

* Windows-OS Btrfs
  * {13} [maharmstone/btrfs GitHub](https://github.com/maharmstone/btrfs)
  * {14} [maharmstone/ntfs2btrfs GitHub](https://github.com/maharmstone/ntfs2btrfs)
  * {15} [maharmstone/quibble GitHub](https://github.com/maharmstone/quibble)

* Tools
  * {16} [Notepad Plus Plus](https://notepad-plus-plus.org/)

## Commands

* {2} [grub-reboot - set the default boot entry for GRUB, for the next boot only](https://manpages.debian.org/bookworm/grub2-common/grub-reboot.8.en.html) <sup>{1}</sup>

## Tutorials

* Concept
  * {11} [GRUB 2 bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub-2.html)

* Debian
  * {1} [GrubReboot => Debian Wiki](https://wiki.debian.org/GrubReboot)
  * {8} [GrubEFIReinstall](https://wiki.debian.org/GrubEFIReinstall)

* Fedora
  * {9} [The GRUB2 Bootloader – Installation and Configuration](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/)

* Fedora: Install/Snapshot
  * {10} [How to Install Fedora 41 with Snapshot and Rollback Support](https://sysguides.com/install-fedora-41-with-snapshot-and-rollback-support) <sup>{7}</sup>

* Scoop
  * {17} [Scoop Admin Installation](https://github.com/ScoopInstaller/Install?tab=readme-ov-file#for-admin)

* `efibootmgr` command
  * {18} [GRUBENV and BTRFS](https://www.reddit.com/r/btrfs/comments/qw2maq/grubenv_and_btrfs/)

## Guides

* Debian/Ubuntu
  * {3} [How to list GRUB's "menuentries" in command-line?](https://askubuntu.com/questions/599208/how-to-list-grubs-menuentries-in-command-line)
  * {4} [How to preview my GRUB menu without rebooting?](https://unix.stackexchange.com/questions/405515/how-to-preview-my-grub-menu-without-rebooting)

* Fedora
  * {5} [Grub one time boot of a different entry](https://discussion.fedoraproject.org/t/grub-one-time-boot-of-a-different-entry/98693)
  * {6} [How to boot the last used OS each time in grub](https://discussion.fedoraproject.org/t/how-to-boot-the-last-used-os-each-time-in-grub/78418)
  * {7} [Dual boot and grub screen at bootup](https://discussion.fedoraproject.org/t/dual-boot-and-grub-screen-at-bootup/90494/28)

* GRUB Btrfs: `root` (`/`) partition is `btrfs` and `/boot` is nested inside
  * {12} [[SOLVED] Grub not respecting the default entry](https://forum.level1techs.com/t/solved-grub-not-respecting-the-default-entry/177028)
  * [grub-reboot from Windows](https://superuser.com/questions/1587567/grub-reboot-from-windows)
  * [Are there any drawbacks to installing /boot on btrfs?](https://www.reddit.com/r/btrfs/comments/ofm6sl/are_there_any_drawbacks_to_installing_boot_on/)
