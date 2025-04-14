# Logical Volume Manager (LVM)

## Notes

* Its critical and may end up with disaster while we reduce the lvm. <sup>{3}</sup>

* LVM Snapshot : If the logical volume becomes full it will get dropped automatically and we can’t use it anymore, even if we extend the size of the snapshot volume. It is the best idea to have the same size as Source while creating a snapshot. <sup>{4}</sup>

* We can’t reduce the size of thin-pool. <sup>{5}</sup>

# References

* next-sl: {11}

## Tutorials

* {1} [Linux Logical Volume Manager (LVM) tutorial](https://linuxconfig.org/linux-lvm-logical-volume-manager)

* Preparation for Setting Up LVM (Logical Volume Management)
  * {2} [How to Create Disk Storage with Logical Volume Management (LVM) in Linux – PART 1](https://www.tecmint.com/create-lvm-storage-in-linux/)
  * {3} [How to Extend/Reduce LVM’s (Logical Volume Management) in Linux – Part II](https://www.tecmint.com/extend-and-reduce-lvms-in-linux/)
  * {4} [How to Take ‘Snapshot of Logical Volume and Restore’ in LVM – Part III](https://www.tecmint.com/take-snapshot-of-logical-volume-and-restore-in-lvm/)
  * {5} [Setup Thin Provisioning Volumes in Logical Volume Management (LVM) – Part IV](https://www.tecmint.com/setup-thin-provisioning-volumes-in-lvm/)
  * {6} [Manage Multiple Logical Volume Management Disks using Striping I/O](https://www.tecmint.com/manage-multiple-lvm-disks-using-striping-io/)
  * {7} [Migrating LVM Partitions to New Logical Volume (Drive) – Part VI](https://www.tecmint.com/lvm-storage-migration/)

* {8} [LVM => ArchLinux Wiki](https://wiki.archlinux.org/title/LVM)

## YouTube Tutorials

* {9} [Linux Logical Volume Manager (LVM) Deep Dive Tutorial BY Learn Linux TV](https://www.youtube.com/watch?v=MeltFN-bXrQ)
* {10} [Managing LVM Snapshots on Arch Linux BY Learn Linux TV](https://www.youtube.com/watch?v=RnjpLZmQ4DM)
