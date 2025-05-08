# Commands/Usage

## Snapper

* `sudo dnf install ps_mem` : Install the `ps_mem` package. It displays the core memory used per program (not per process). <sup>{13}</sup>
  * `sudo ps_mem` : Run the `ps_mem` program to see if it was installed successfully. <sup>{13}</sup>

* `snapper ls` : List the snapshots for `/` volume. For the root, you may use `snapper -c root ls` or simply `snapper ls`. Both provide the same output. <sup>{13}</sup>

* `snapper -c home ls` : List the snapshots for `/home` volume. <sup>{13}</sup>

* `snapper status 2..3` : shows which files have to add/change to migrate from snapshot `2` to `3`. <sup>{13}</sup>
  * Inversely, `snapper status 3..2` shows which files have to remove/change to migrate from snapshot `3` to `2`. <sup>{13}</sup>
  * Installing package `sudo dnf install ps_mem`. <sup>{13}</sup>

* `sudo snapper undochange 2..3` : Undo changes from snapshot id `2` to `3`. Remove `ps_mem` package. <sup>{13}</sup>
  * Uninstalled package `ps_mem`. <sup>{13}</sup>

* `sudo snapper undochange 3..2` : Undo (Redo) changes from snapshot id `3` to `2`. <sup>{13}</sup>
  * Installed package `ps_mem`. <sup>{13}</sup>

* `snapper diff 3..0 /etc/hosts` : Using the snapper tool, compare the `/etc/hosts` file with the one in snapshot #3. In `3..0`, `0` means current file state. <sup>{13}</sup>
  * `sudo sed -i '$d' /etc/hosts` : Remove the last line from `/etc/hosts` file. <sup>{13}</sup>

* `sudo snapper undochange 3..0 /etc/hosts` : To replace the `/etc/hosts` file with the one in snapshot #3, use the following command. <sup>{13}</sup>

* Create a manual 'pre' snapshot for both the `/` and `/home` directories. <sup>{13}</sup>
```
$ snapper -c root create -t pre -c number -d 'Pre Color Picker'
$ snapper -c home create -t pre -c number -d 'Pre Color Picker'
```

* Install Color Picker package
  * Install the pre-requisite packages before compiling the source file.
  ```
  $ sudo dnf install meson gcc-c++ libhandy-devel libportal-devel \
    libportal-gtk3-devel
  ```
  * Compile the source.
  ```
  $ git clone https://github.com/Hjdskes/gcolor3.git
  $ cd gcolor3
  $ meson setup build
  $ ninja-build -C build
  $ sudo ninja-build -C build install
  ```

* Create 'post' snapshots for the `/` and `/home` directories. <sup>{13}</sup>
```
$ snapper -c root create -t post --pre-number 4 -c number -d 'Post Color Picker'
$ snapper -c home create -t post --pre-number 1 -c number -d 'Post Color Picker'
```

* Review the changes made to the system between the pre and post snapshots. <sup>{13}</sup>
```
$ snapper -c root status 4..7
$ snapper -c home status 1..2
```

* This is the total number of files added, removed, or modified. <sup>{13}</sup>
```
$ snapper -c root status 4..7 | wc -l
$ snapper -c home status 1..2 | wc -l
```

* Undo the changes in the `/` and `/home` directories. <sup>{13}</sup>
```
$ sudo snapper -c root undochange 4..7
$ sudo snapper -c home undochange 1..2
```

* Since you removed the Color Picker package, there is no reason to keep its pre-post snapshots if you do not intend to use it again. So you can delete those snapshots. <sup>{13}</sup>
```
$ snapper -c root delete 4-7
$ snapper -c home delete 1-2
```

# Snapper.md

## PATH

* Snapper configurations are saved under the `/etc/snapper/configs` directory. <sup>{5}</sup>

# References

* next-sl: {15}

## Websites

* {1} [Snapper => Linux file system snapshot management](http://snapper.io/)
* {2} [openSUSE/snapper GitHub](https://github.com/openSUSE/snapper)

## Commands

* {4} [cheat.sh/snapper](https://cheat.sh/snapper)

## Tutorials

* {5} [How to manage snapshots with Snapper on Linux](https://linuxconfig.org/how-to-manage-snapshots-with-snapper-on-linux)
* {6} [Snapper => ArchLinux Wiki](https://wiki.archlinux.org/title/Snapper)

* Fedora: Install/Snapshot
  * {8} [How to Install Fedora 41 with Snapshot and Rollback Support](https://sysguides.com/install-fedora-41-with-snapshot-and-rollback-support) <sup>{7}</sup>
  * {10} [How to Install Fedora 41 with Full Disk Encryption, Snapshot, and Rollback Support](https://sysguides.com/install-fedora-41-with-full-disk-encryption-snapshot-and-rollback-support) <sup>{9}</sup>
  * {13} [How to Install Fedora 40 with Snapshot and Rollback Support => Similarity with {8}, plus Snapper test](https://sysguides.com/install-fedora-with-snapshot-and-rollback-support) <sup>{8} {11}</sup>
  * {14} [How to Install Fedora 40 with LUKS Full Disk Encryption, Snapshot, and Rollback Support => Similarity with {10}, plus Snapper test](https://sysguides.com/install-fedora-with-luks-fde-snapshot-rollback-support) <sup>{10} {11}</sup>

* SystemD Timer
  * [How to schedule tasks with systemd timers in Linux](https://linuxconfig.org/how-to-schedule-tasks-with-systemd-timers-in-linux)

## YouTube Tutorials

* Fedora: Install/Snapshot
  * {7} [How to Install Fedora 41 with Snapshot and Rollback Support BY SysGuides](https://www.youtube.com/watch?v=LwM3wUXJyU8)
  * {9} [How to Install Fedora 41 with Full Disk Encryption, Snapshot, and Rollback Support BY SysGuides](https://www.youtube.com/watch?v=LT8gDWEaG4o)
  * {11} [Fedora Snapper Tests: Create, Delete, Compare, Revert, and Rollback Snapshots BY SysGuides](https://www.youtube.com/watch?v=hlAgYA4mVvs)
  * {12} [Installing Fedora with Timeshift compatible encrypted BTRFS Snapshots - Easy GUI Method! BY FOSS World](https://www.youtube.com/watch?v=bN8gGoBaZ5M)
