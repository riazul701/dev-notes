# Boot-Repair.md

## Websites

## Notes

* "Boot-Repair" Software Is Built-In Into "Antix-Linux" Operating System's ISO File.

## Sparky-Linux Installation

* No EFI system partition configured
  * An EFI system partition is necessary to start Sparky.
  * To configure an EFI system partition, go back and select or create a suitable filesystem. The filesystem must be mounted on `/boot/efi`. The filesystem must have type `FAT32`. The filesystem must be at least 300 MiB in size. The filesystem must have flag `boot` set.
  * You can continue without setting up an EFI system partition but your system may fail to start.
  
# References

* YouTube Tutorials
  * [How to Dual-Boot Linux Mint 22 and Windows 11: Step-by-Step Guide BY Learn Linux TV](https://www.youtube.com/watch?v=Nn7CPlUpflk)
