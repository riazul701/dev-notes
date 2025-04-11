# Install-Debian-Desktop.md

# Partition

## UEFI Custom Partition

* `/boot/efi` : 600 MiB [Must] [Only on UEFI, Not Legacy BIOS] [Must for GRUB repair/reinstall]
  * Size: 600 MiB; Partition Type: GPT; File System: fat32; Unchecked "Encrypt"; Mount Point: /boot/efi; FS Label: <empty>; Flags: boot; [Flags: boot, esp]

* `/boot` : 1024 MiB [Must] [Must for GRUB repair/reinstall]
  * Size: 1024 MiB; Partition Type: GPT; File System: ext4; Unchecked "Encrypt"; Mount Point: /boot; FS Label: <empty>; Flags: <empty>

* `swap` : 8192 MiB [Must, Better for Low-RAM PC]
  * Size: 8192 MiB; Partition Type: GPT; File System: linuxswap; Unchecked "Encrypt"; Mount Point: (no mount point); FS Label: <empty>; Flags: swap

* `/` : All remaining space (MiB) [Must]
  * Size: All remaining space (MiB); Partition Type: GPT; File System: ext4; Unchecked "Encrypt"; Mount Point: /; FS Label: <empty>; Flags: <empty>

## Legacy BIOS Custom Partition

* Create `/boot` as Primary partition. Also create `swap` and `/` as Logical(Extended) partitions. Fedora's Anaconda installer creates Logical(Extended) partitions automatically. Debian installer can not (Use GParted for Debian).
  * Using GParted, move/resize space inside Extended partition.

* `/boot` : 1024 MiB [Must] [Must for GRUB repair/reinstall]
  * Size: 1024 MiB; Partition Type: Primary; File System: ext4; Unchecked "Encrypt"; Mount Point: /boot; FS Label: <empty>; Flags: <empty>

* `swap` : 8192 MiB [Must, Better for Low-RAM PC]
  * Size: 8192 MiB; Partition Type: Primary/Logical; File System: linuxswap; Unchecked "Encrypt"; Mount Point: (no mount point); FS Label: <empty>; Flags: swap

* `/` : All remaining space (MiB) [Must]
  * Size: All remaining space (MiB); Partition Type: Primary/Logical; File System: ext4; Unchecked "Encrypt"; Mount Point: /; FS Label: <empty>; Flags: <empty>

* Option to use GPT on BIOS (Message from Installer)
```
A GPT partition table is the best option for all systems. This installer supports such a setup for BIOS systems too.

To configure a GPT partition table on BIOS, (if not done so already) go back and set the partition table to GPT, next create a 8 MB unformatted partition with the "bios-grub" flag enabled.

An unformatted 8 MB partition is necessary to start Debian on a BIOS system with GPT.
```
