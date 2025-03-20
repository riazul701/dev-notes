# Information

* Warning: Be careful in skipping packages AND package groups, since [partial upgrades](https://wiki.archlinux.org/title/Partial_upgrade) are unsupported. <sup>{1}</sup>

# Commands

* `pacman -S package_name1 package_name2 ...` : To install a single package or list of packages, including dependencies, issue the following command <sup>{1}</sup>

* `pacman -S $(pacman -Ssq package_regex)` : To install a list of packages with regex (see [this forum thread](https://bbs.archlinux.org/viewtopic.php?id=7179)) <sup>{1}</sup>

* `pacman -S extra/package_name` : Sometimes there are multiple versions of a package in different repositories (e.g. extra and testing). To install the version from the extra repository in this example, the repository needs to be defined in front of the package name <sup>{1}</sup>

* `pacman -S plasma-{desktop,mediacenter,nm}` : To install a number of packages sharing similar patterns in their names, one can use curly brace expansion. For example <sup>{1}</sup>
  * `pacman -S plasma-{workspace{,-wallpapers},pa}` : This can be expanded to however many levels needed <sup>{1}</sup>

* `pacman -S gnome` : Some packages belong to a group of packages that can all be installed simultaneously. For example, issuing the command <sup>{1}</sup>
  * `Enter a selection (default=all): 1-10 15` : which will select packages 1 through 10 and 15 for installation, or <sup>{1}</sup>
  * `Enter a selection (default=all): ^5-8 ^2` : which will select all packages except 5 through 8 and 2 for installation. <sup>{1}</sup>
  * `pacman -Sg gnome` : To see what packages belong to the gnome group, run <sup>{1}</sup>
  * Note: If a package in the list is already installed on the system, it will be reinstalled even if it is already up-to-date. This behavior can be overridden with the `--needed` option. <sup>{1}</sup>

* `pacman -R package_name` : To remove a single package, leaving all of its dependencies installed <sup>{1}</sup>

* `pacman -Rs package_name` : To remove a package and its dependencies which are not required by any other installed package <sup>{1}</sup>
  
  * Warning: When removing a group, such as gnome, this ignores the install reason of the packages in the group, because it acts as though each package in the group is listed separately. Install reason of dependencies is still respected. <sup>{1}</sup>
  
  * `pacman -Rsu package_name` : The above may sometimes refuse to run when removing a group which contains otherwise needed packages. In this case try <sup>{1}</sup>
  
  * `pacman -Rsc package_name` : To remove a package, its dependencies and all the packages that depend on the target package <sup>{1}</sup>
    * Warning: This operation is recursive, and must be used with care since it can remove many potentially needed packages. <sup>{1}</sup>

  * `pacman -Rdd package_name` : To remove a package, which is required by another package, without removing the dependent package <sup>{1}</sup>
    * Warning: The following operation can break a system and should be avoided. See [System maintenance#Avoid certain pacman commands](https://wiki.archlinux.org/title/System_maintenance#Avoid_certain_pacman_commands). <sup>{1}</sup>

* `pacman -Rn package_name` : Pacman saves important configuration files when removing certain applications and names them with the extension: `.pacsave`. To prevent the creation of these backup files use the `-n` option <sup>{1}</sup>
  * Note: Pacman will not remove configurations that the application itself creates (for example "dotfiles" in the home directory). <sup>{1}</sup>

* `pacman -Syu` : Pacman can update all packages on the system with just one command. This could take quite a while depending on how up-to-date the system is. The following command synchronizes the repository databases and updates the system's packages, excluding "local" packages that are not in the configured repositories <sup>{1}</sup>
  * Warning:
    * Users are expected to follow the guidance in the [System maintenance#Upgrading the system](https://wiki.archlinux.org/title/System_maintenance#Upgrading_the_system) section to upgrade their systems regularly and not blindly run the following command. <sup>{1}</sup>
    * Arch only supports full system upgrades. See [System maintenance#Partial upgrades are unsupported](https://wiki.archlinux.org/title/System_maintenance#Partial_upgrades_are_unsupported) and [#Installing packages](https://wiki.archlinux.org/title/Pacman#Installing_packages) for details. <sup>{1}</sup>

* `pacman -Q --help`, `pacman -S --help` and `pacman -F --help` : for the respective suboptions of each flag. <sup>{1}</sup>
  * Pacman queries the local package database with the `-Q` flag, the sync database with the `-S` flag and the files database with the `-F` flag. <sup>{1}</sup>

* `pacman -Fy` : Sync the files database before querying it to get up-to-date results <sup>{1}</sup>

* `pacman -Ss string1 string2 ...` : Pacman can search for packages in the database, searching both in packages' names and descriptions <sup>{1}</sup>

* `pacman -Ss '^vim-'` : Sometimes, `-s`'s builtin ERE (Extended Regular Expressions) can cause a lot of unwanted results, so it has to be limited to match the package name only; not the description nor any other field <sup>{1}</sup>

* `pacman -Qs string1 string2 ...` : To search for already installed packages <sup>{1}</sup>

* `pacman -F string1 string2 ...` : To search for package file names in remote packages <sup>{1}</sup>

* `pacman -Si package_name` : To display extensive information about a given package (e.g. its dependencies) <sup>{1}</sup>

* `pacman -Qi package_name` : For locally installed packages, display information <sup>{1}</sup>

* `pacman -Qii package_name` : Passing two `-i` flags will also display the list of backup files and their modification states <sup>{1}</sup>

* `pacman -Ql package_name` : To retrieve a list of the files installed by a package <sup>{1}</sup>

* `pacman -Fl package_name` : To retrieve a list of the files installed by a remote package <sup>{1}</sup>

* `pacman -Qk package_name` : To verify the presence of the files installed by a package <sup>{1}</sup>
  * Passing the `k` flag twice will perform a more thorough check. <sup>{1}</sup>

* `pacman -Qo /path/to/file_name` : To query the database to know which package a file in the file system belongs to <sup>{1}</sup>

* `pacman -F /path/to/file_name` : To query the database to know which remote package a file belongs to <sup>{1}</sup>

* `pacman -Qdt` : To list all packages no longer required as dependencies (orphans) <sup>{1}</sup>

* `pacman -Qet` : To list all packages explicitly installed and not required as dependencies <sup>{1}</sup>

* `pactree package_name` : To view the dependency tree of a package <sup>{1}</sup>
  * To view the dependent tree of a package, pass the reverse flag `-r` to pactree. <sup>{1}</sup>

* `paccache -r` : The [paccache(8)](https://man.archlinux.org/man/paccache.8) script, provided within the [pacman-contrib](https://archlinux.org/packages/?name=pacman-contrib) package, deletes all cached versions of installed and uninstalled packages, except for the most recent three, by default <sup>{1}</sup>

* `paccache -rk1` : You can also define how many recent versions you want to keep. To retain only one past version use <sup>{1}</sup>

* `paccache -ruk0` : Add the `-u`/`--uninstalled` switch to limit the action of paccache to uninstalled packages. For example to remove all cached versions of uninstalled packages, use the following <sup>{1}</sup>
  * `paccache -h` : See this for more options. <sup>{1}</sup>

* `pacman -Sc` : To remove all the cached packages that are not currently installed, and the unused sync databases, execute <sup>{1}</sup>

* `pacman -Scc` : To remove all files from the cache, use the clean switch twice, this is the most aggressive approach and will leave nothing in the cache directory <sup>{1}</sup>
  * Warning: One should avoid deleting from the cache all past versions of installed packages and all uninstalled packages unless one desperately needs to free some disk space. This will prevent downgrading or reinstalling packages without downloading them again. <sup>{1}</sup>

* `pacman -Sw package_name` : Download a package without installing it <sup>{1}</sup>

* `pacman -U /path/to/package/package_name-version.pkg.tar.zst` : Install a 'local' package that is not from a remote repository (e.g. the package is from the [AUR](https://wiki.archlinux.org/title/AUR)) <sup>{1}</sup>

* `pacman -U file:///path/to/package/package_name-version.pkg.tar.zst` : To keep a copy of the local package in pacman's cache, use <sup>{1}</sup>

* `pacman -U http://www.example.com/repo/example.pkg.tar.zst` : Install a 'remote' package (not from a repository stated in pacman's configuration files) <sup>{1}</sup>

* `dry run`
  * To get a list in a processable format, and to prevent the actions of `-S`, `-U` and `-R`, you can use `-p`, short for `--print`. <sup>{1}</sup>
  * `--print-format` can be added to format this list in various ways. `--print-format %n` will return a list without package versions. <sup>{1}</sup>

* `pacman -S --asdeps package_name` : When installing a package, it is possible to force its installation reason to dependency with <sup>{1}</sup>

* `pacman -Qe` : The list of explicitly-installed packages can be shown with <sup>{1}</sup>

* `pacman -Qd` : the complementary list of dependencies can be shown with <sup>{1}</sup>

* `pacman -D --asdeps package_name` : To change the installation reason of an already installed package, execute <sup>{1}</sup>
  * Use `--asexplicit` to do the opposite operation <sup>{1}</sup>
  * Note: Using `--asdeps` and `--asexplicit` options when upgrading, such as with pacman `-Syu` package_name `--asdeps`, is discouraged. This would change the installation reason of not only the package being installed, but also the packages being upgraded. <sup>{1}</sup>

* `pacman -Q $(pactree -u pacman)` : If you have a healthy Arch system on hand, you can see the full list of dependencies with <sup>{1}</sup>

# Pacman.md

## PATH

**Database structure <sup>{1}</sup>**

* The pacman databases are normally located at `/var/lib/pacman/sync`. For each repository specified in /etc/pacman.conf, there will be a corresponding database file located there. Database files are gzipped tar archives containing one directory for each package, for example for the [which](https://archlinux.org/packages/?name=which) package: <sup>{1}</sup>
  
```shell
$ tree which-2.21-5
which-2.21-5
|-- desc
``` 

* The `desc` file contains meta data such as the package description, dependencies, file size and MD5 hash. <sup>{1}</sup>

**Cleaning the package cache <sup>{1}</sup>**

* Pacman stores its downloaded packages in `/var/cache/pacman/pkg/` and does not remove the old or uninstalled versions automatically. <sup>{1}</sup>

**Configuration <sup>{1}</sup>**

* Pacman settings are located in `/etc/pacman.conf`: this is the place where the user configures the program to work in the desired manner. <sup>{1}</sup>

* In-depth information about the configuration file can be found in [pacman.conf(5)](https://man.archlinux.org/man/pacman.conf.5). <sup>{1}</sup>

## Pacman config file: `/etc/pacman.conf`

**Comparing versions before updating <sup>{1}</sup>**

* To see old and new versions of available packages, uncomment the "VerbosePkgLists" line in `/etc/pacman.conf`. The output of `pacman -Syu` will be like this:

```shell
Package (6)             Old Version  New Version  Net Change  Download Size

extra/libmariadbclient  10.1.9-4     10.1.10-1      0.03 MiB       4.35 MiB
extra/libpng            1.6.19-1     1.6.20-1       0.00 MiB       0.23 MiB
extra/mariadb           10.1.9-4     10.1.10-1      0.26 MiB      13.80 MiB
```

**Enabling parallel downloads <sup>{1}</sup>**

* The number of packages being downloaded in parallel (at the same time) can be set with `ParallelDownloads` under `[options]` in `/etc/pacman.conf`. If the option is unset, packages will be downloaded sequentially.

## "Failed to init transaction (unable to lock database)" error <sup>{1}</sup>

* When pacman is about to alter the package database, for example installing a package, it creates a lock file at `/var/lib/pacman/db.lck`.

* This prevents another instance of pacman from trying to alter the package database at the same time.

* If pacman is interrupted while changing the database, this stale lock file can remain.

* If you are certain that no instances of pacman are running then delete the lock file: `# rm /var/lib/pacman/db.lck`

* Tip: You can run `fuser /var/lib/pacman/db.lck` as root to verify if there is any process still using it.

## Fixing an unbootable system caused by an interrupted upgrade <sup>{1}</sup>

* Whether due to power loss, kernel panic or hardware failure an update may be interrupted. In most cases, there will not be much damage but the system will likely be unbootable.

* Ready a [USB flash installation medium](https://wiki.archlinux.org/title/USB_flash_installation_medium) and boot it.

* [Mount](https://wiki.archlinux.org/title/Mount) the root filesystem.

* `arch-chroot` into the mounted root filesystem.

* Check `/var/log/pacman.log` and replicate the exact update by supplying the entire list of packages that was upgraded during the failed transaction to `pacman -S` and allowing it to reinstall, e.g:

```shell
# pacman -S linux linux-headers systemd systemd-libs systemd-sysvcompat firefox texlive-basic texlive-fontsextra texlive-latex texlive-latexextra texlive-latexrecommended texlive-pictures
```

* Replicating the exact upgrade is needed to ensure the right scriptlets and hooks will run.

## Pacman crashes during an upgrade <sup>{1}</sup>

* In the case that pacman crashes with a "database write" error while removing packages, and reinstalling or upgrading packages fails thereafter, do the following:

* Boot using the Arch [USB flash installation medium](https://wiki.archlinux.org/title/USB_flash_installation_medium). Preferably use a recent media so that the pacman version matches/is newer than the system.

* Mount the system's root filesystem, e.g., `mount /dev/sdaX /mnt as root`, and check the mount has sufficient space with `df -h`

* Mount the proc, sys and dev filesystems as well: `mount -t proc proc /mnt/proc; mount --rbind /sys /mnt/sys; mount --rbind /dev /mnt/dev`

* If the system uses default database and directory locations, you can now update the system's pacman database and upgrade it via `pacman --root=/mnt --cachedir=/mnt/var/cache/pacman/pkg -Syu` as root.
  * Alternatively, if you cannot update/upgrade, refer to [Pacman/Tips and tricks#Reinstalling all packages](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Reinstalling_all_packages).

* After the upgrade, one way to double-check for not upgraded but still broken packages: `find /mnt/usr/lib -size 0`

* Followed by a re-install of any still broken package via `pacman --root /mnt --cachedir=/mnt/var/cache/pacman/pkg -S package`

## How do I reinstall all packages, retaining information on whether something was explicitly installed or as a dependency? <sup>{1}</sup>

* To reinstall all the native packages: `pacman -Qnq | pacman -S -` or `pacman -S $(pacman -Qnq)` (the `-S` option preserves the installation reason by default).

* You will then need to reinstall all the foreign packages, which can be listed with `pacman -Qmq`.

# References

* next-sl: {16}

## Websites

* {7} [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* {8} [repology.org](https://repology.org/)
* {9} [distrowatch.com](https://distrowatch.com/)

* {6} [Archlinux Package Search](https://archlinux.org/packages/)

## Commands

* {5} [pacman - package manager utility](https://man.archlinux.org/man/pacman.8) <sup>{1}</sup>
* {13} [pactree - package dependency tree viewer](https://man.archlinux.org/man/pactree.8) <sup>{1}</sup>
* {14} [paccache - flexible pacman cache cleaning utility](https://man.archlinux.org/man/paccache.8) <sup>{1}</sup>
* {15} [pacman.conf - pacman package manager configuration file](https://man.archlinux.org/man/pacman.conf.5) <sup>{1}</sup>
* [alpm-hooks - alpm hook file format](https://man.archlinux.org/man/alpm-hooks.5) <sup>{1}</sup>
* [arch-chroot - enhanced chroot command](https://man.archlinux.org/man/arch-chroot.8) <sup>{1}</sup>

## Tutorials

* {1} [Pacman => Archlinux Wiki](https://wiki.archlinux.org/title/Pacman)
* {2} [Arch User Repository => Archlinux Wiki](https://wiki.archlinux.org/title/Arch_User_Repository)
* {3} [Official repositories => Archlinux Wiki](https://wiki.archlinux.org/title/Official_repositories)
* {4} [System maintenance => Archlinux Wiki](https://wiki.archlinux.org/title/System_maintenance)
* {10} [Repository => Archlinux Wiki](https://wiki.archlinux.org/title/Repository)
* {11} [Meta package and package group => Archlinux Wiki](https://wiki.archlinux.org/title/Meta_package_and_package_group)
* [Mirrors => Archlinux Wiki](https://wiki.archlinux.org/title/Mirrors)

## Package List

* {12} [Package Groups Overview => Archlinux Wiki](https://archlinux.org/groups/) <sup>{1}</sup>
* [pacman-contrib => Contributed scripts and tools for pacman systems](https://archlinux.org/packages/?name=pacman-contrib) <sup>{1}</sup>
* [pkgcacheclean => Application to clean the pacman package cache](https://aur.archlinux.org/packages/pkgcacheclean) <sup>{1}</sup>
* [pacleaner => Script to clean up pacman cache in a more flexible way than with paccache or pacman itself. Fully configurable and flexible](https://aur.archlinux.org/packages/pacleaner) <sup>{1}</sup>
