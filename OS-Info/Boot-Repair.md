# Boot-Repair.md

## Websites

* [Super Grub2 Disk](https://www.supergrubdisk.org/super-grub2-disk/) <sup>{2}</sup>
* [Super Grub2 Disk GitHub](https://github.com/supergrub/supergrub) <sup>{2}</sup>
* [distrowatch.com => Super Grub2 Disk](https://distrowatch.com/table.php?distribution=supergrub)

## Notes

* "Boot-Repair" Software Is Built-In Into "Antix-Linux" Operating System's ISO File.
  * "EFI System Partition (ESP)" is used for boot repair.

## Sparky-Linux Installation

* ESP = EFI System Partition
* Shows follwing warning during OS installation in UEFI mode (Not BIOS):
* No EFI system partition configured
  * An EFI system partition is necessary to start Sparky.
  * To configure an EFI system partition, go back and select or create a suitable filesystem. The filesystem must be mounted on `/boot/efi`. The filesystem must have type `FAT32`. The filesystem must be at least 300 MiB in size. The filesystem must have flag `boot` set.
  * You can continue without setting up an EFI system partition but your system may fail to start.
  
# References

* next-sl: {3}

* YouTube Tutorials
  * {1} [How to Dual-Boot Linux Mint 22 and Windows 11: Step-by-Step Guide BY Learn Linux TV](https://www.youtube.com/watch?v=Nn7CPlUpflk)
  * {2} [How to Fix Dual Boot Problems BY Chris Titus Tech](https://www.youtube.com/watch?v=gEB6JEYZekE)
  * [Fixing Linux with Rescatux BY Switched to Linux](https://www.youtube.com/watch?v=vqlgAVyRaqs)
