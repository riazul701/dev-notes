# Btrfs-Fedora.md

## Notes

* For LXQt desktop environment, display manager is `/var/lib/sddm` <sup>{8} {20}</sup>

* For LXDE desktop environment, display manager is `/var/lib/lxdm` <sup>{75} {76}</sup>
  * Autologin : To log in to one account automatically on startup, without providing a password, find the line in `/etc/lxdm/lxdm.conf` that looks like this: `#autologin=dgod`. Uncomment it, substituting the target user instead of `dgod`. <sup>{76}</sup>

* {38} [How to Install Fedora 40 with Snapshot and Rollback Support => Similarity with {8}, plus Snapper test](https://sysguides.com/install-fedora-with-snapshot-and-rollback-support) <sup>{8} {16}</sup>

# References

## Tutorials

* Fedora: Install/Snapshot
  * {74} [How to Install Fedora 42 with Snapshot and Rollback Support](https://sysguides.com/install-fedora-42-with-snapshot-and-rollback-support) <sup>{73}</sup>
  * {8} [How to Install Fedora 41 with Snapshot and Rollback Support](https://sysguides.com/install-fedora-41-with-snapshot-and-rollback-support) <sup>{7}</sup>
  * {10} [How to Install Fedora 41 with Full Disk Encryption, Snapshot, and Rollback Support](https://sysguides.com/install-fedora-41-with-full-disk-encryption-snapshot-and-rollback-support) <sup>{9}</sup>
  * {38} [How to Install Fedora 40 with Snapshot and Rollback Support => Similarity with {8}, plus Snapper test](https://sysguides.com/install-fedora-with-snapshot-and-rollback-support) <sup>{8} {16}</sup>
  * {39} [How to Install Fedora 40 with LUKS Full Disk Encryption, Snapshot, and Rollback Support => Similarity with {10}, plus Snapper test](https://sysguides.com/install-fedora-with-luks-fde-snapshot-rollback-support) <sup>{10} {16}</sup>

* Others
  * {43} [Desktop environment => ArchLinux Wiki](https://wiki.archlinux.org/title/Desktop_environment) <sup>{8}</sup>
  * {20} [LXQt => ArchLinux Wiki](https://wiki.archlinux.org/title/LXQt)
  * {75} [LXDE => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDE)
  * {76} [LXDM => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDM)

## YouTube Tutorials

* Fedora: Install/Snapshot
  * {73} [How to Install Fedora 42 with Btrfs Snapshots and Rollback Support (Step-by-Step Guide) BY SysGuides](https://www.youtube.com/watch?v=iSyDgIuBDWU)
  * {7} [How to Install Fedora 41 with Snapshot and Rollback Support BY SysGuides](https://www.youtube.com/watch?v=LwM3wUXJyU8)
  * {9} [How to Install Fedora 41 with Full Disk Encryption, Snapshot, and Rollback Support BY SysGuides](https://www.youtube.com/watch?v=LT8gDWEaG4o)
  * {16} [Fedora Snapper Tests: Create, Delete, Compare, Revert, and Rollback Snapshots BY SysGuides](https://www.youtube.com/watch?v=hlAgYA4mVvs)
  * {17} [Installing Fedora with Timeshift compatible encrypted BTRFS Snapshots - Easy GUI Method! BY FOSS World](https://www.youtube.com/watch?v=bN8gGoBaZ5M)
