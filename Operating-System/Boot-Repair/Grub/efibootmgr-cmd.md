# efibootmgr-cmd.md

## Using `efibootmgr`, one-time boot

**[GRUBENV and BTRFS](https://www.reddit.com/r/btrfs/comments/qw2maq/grubenv_and_btrfs/) <sup>{2}</sup>**

* Taking a step back, what you want to do is booting windows once, right?

* Skip grub and use efi.

* `efibootmgr` : gets you a list of registered boot entries and 

* `efibootmgr --bootnext XXXX` : boots the specified one (windows) once and then goes back to default (grub).

# References

* next-sl: {3}

## Tutorials

* {1} [How to manage EFI boot manager entries on Linux](https://linuxconfig.org/how-to-manage-efi-boot-manager-entries-on-linux)
* {2} [GRUBENV and BTRFS](https://www.reddit.com/r/btrfs/comments/qw2maq/grubenv_and_btrfs/)
