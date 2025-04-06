# Fedora.md

## Notes

* Fedora uses `Anaconda Installer` for operating system installation.
* AUR (ArchLinux) requires users to build packages locally, while COPR (Fedora) provides pre-built packages.

# System Upgrade

## Upgrade Notes

* Upgrades across more than two releases are not supported. <sup>{7}</sup>

* When performing upgrade via remote shell, it is a good idea to use screen or tmux utility to be able to get back to running transaction in case your connection drops. <sup>{8}</sup>

# Installation

## Custom Partition

**Fedora "Installation Destination" -> "Storage Configuration" : "Custom"**

* New Fedora 38 Installation

* You haven't created any mount points for your Fedora 38 installation yet. You can:
  * Click here to create them automatically

* Create new mount points by clicking the '+' button

* New mount points will use the following partitioning scheme: "Btrfs" (Other options: "Standard Partition", "Btrfs", "LVM", "LVM Thin Provisioning")

* Encrypt automatically created mount points by default: "Encrypt my data"

* "Click here to create them automatically" (You haven't created any mount points for your Fedora 38 installation yet. You can:)
  * DATA
    * `/home` (home) : All remaining space (GiB)
    * `btrfs` (fedora_localhost-live) : All remaining space (GiB)

  * SYSTEM
    * `/` (root) : All remaining space (GiB)
    * `/boot/efi` (sda1) : 600 MiB
    * `/boot` (sda2) : 1024 MiB

# References

* next-sl: {9}

## Websites

* {1} [fedoraproject.org](https://fedoraproject.org/)
* {2} [Fedora All Releases](https://dl.fedoraproject.org/pub/fedora/linux/releases/)
* {3} [Fedora Old Releases](https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/)
* [Fedora Copr](https://copr.fedorainfracloud.org/coprs/)

## Tutorials

* Documentation
  * [Fedora Quick Docs](https://docs.fedoraproject.org/en-US/quick-docs/)
  * [Fedora Linux Releases](https://docs.fedoraproject.org/en-US/releases/)

* Installation
  * {5} [Learning about Partitions and How to Create Them for Fedora](https://fedoramagazine.org/learning-about-partitions-and-how-to-create-them-for-fedora/) <sup>{4}</sup>

* System Upgrade
  * {6} [Upgrading Fedora Linux to a New Release](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-new-release/)
  * {7} [Upgrading Fedora Linux Using DNF System Plugin](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/)
  * {8} [Upgrading Fedora Linux Online Using Package Manager](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-online/)
  * [How to Upgrade Fedora 40 to Fedora 41](https://www.tecmint.com/fedora-upgrade-guide/)
  * [Upgrade Fedora 38 to 39](https://www.reddit.com/r/Fedora/comments/17v4d8j/upgrade_fedora_38_to_39/)

## YouTube Tutorials

* {4} [The Anaconda Installer BY EF - Linux Made Simple](https://www.youtube.com/watch?v=euzxE-7TL6A)

* Fedora Copr
  * [Fedora's AUR? - What is Fedora COPR? BY The Linux Cast](https://www.youtube.com/watch?v=UwKI6BJuIRA)
