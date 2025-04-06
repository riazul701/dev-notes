# Commands/Usage

* `echo 'export PATH=$PATH:/snap/bin' >> ~/.bashrc` : Add Snap $PATH to "~/.bashrc", if snap packages are not added to path automatically. <sup>{5}</sup>
  * `source ~/.bashrc` : Reload "~/.bashrc" file
}

* `sudo sh -c 'rm -rf /var/lib/snapd/cache/*'` : Remove snap cache files in `/var/lib/snapd/cache` without issue. Also there is no need to stop snapd before. <sup>{3}</sup>

* `apt show snapd` : Shows information about "snap"/"snapd" package

* `sudo apt install snapd` : Install "snap"/"snapd" package

* `which snap` : Shows "snap" installation path

* `snap --version` : Check "snap"(client) and "snapd"(server) version

* `systemctl status snapd` : Check "snapd" service status (running or not)

* `systemctl start snapd` : Start "snapd" service if not running

* `systemctl stop snapd` : Stop "snapd" service

* `systemctl restart snapd` : Restart "snapd" service

* `snap help --all` : Shows help of "snap" command

* `sudo snap install snap-store` : The Snap Store is a Snap app itself. Install it by entering the following command in the terminal <sup>{6}</sup>
  * `snap-store` : Open the Snap Store by entering the following in the terminal <sup>{6}</sup>

* `sudo snap install {{package-name}}` : Install snap package <sup>{6}</sup>
  * `sudo snap install opera`

* `snap run {{package-name}}` : Run snap package, mostly Graphical-User-Interface and Terminal-User-Interface app

* `snap list` : To list installed Snaps using the terminal, use the `list` command <sup>{6}</sup>

* `snap find {{search_term}}` : Run the find command with snap to search for an application <sup>{6}</sup>
  * `snap find media_player` : The search term doesn't need to match the application name. For example, you can search for a media player by typing "media_player". <sup>{6}</sup>

* `sudo snap refresh {{package_name}}` : Check for updates for a single app or see all available updates via the following command <sup>{6}</sup>
  * `sudo snap refresh opera` <sup>{6}</sup>

* `sudo snap refresh --list` : To see which Snap packages have available updates, use the command below <sup>{6}</sup>

* `sudo snap revert {{package_name}}` : If you encounter issues after updating a Snap to its latest version, or if you do not like the new update, revert to the previous one by entering the `snap revert` command <sup>{6}</sup>

* `sudo snap remove {{package-name}}` : To remove a Snap from the system, use the following command <sup>{6}</sup>
  * `sudo snap remove opera` <sup>{6}</sup>

* `sudo snap remove {{package_name}} --purge` : To remove a Snap without keeping a snapshot, use the `--purge` option with the `snap remove` command <sup>{6}</sup>
  * When an app is removed, Snap's system snapshot, configuration, and user data are retained for 31 days. <sup>{6}</sup>
  * The procedure also removes all previous revisions. <sup>{6}</sup>
  * `sudo snap remove opera --purge` <sup>{6}</sup>

* `sudo snap disable {{package_name}}` : If you don't need a Snap, but you don’t want to remove it from your system, disable it by entering <sup>{6}</sup>
  * `sudo snap disable opera` <sup>{6}</sup>

* `sudo snap enable {{package_name}}` : Enable a disabled Snap with the following command <sup>{6}</sup>
  * `sudo snap enable opera` <sup>{6}</sup>

* `snap services` : Use the following command to list all system services launched by Snap packages currently installed and enabled on your system <sup>{6}</sup>

* `snap services {{app_name}}` : To list the services of a Snap, state the app name in the command <sup>{6}</sup>

* `sudo snap restart {{app_name}}` : To restart all services for a specified Snap, enter the following command <sup>{6}</sup>
  * `sudo snap restart firmware-updater` : To restart all services for `firmware-updater`, run <sup>{6}</sup>

* `sudo snap restart {{service_name}}` : To restart a specific service of an app, use the same command but with the `{{service_name}}`. <sup>{6}</sup>
  * `sudo snap restart snapd-desktop-integration` : To restart the `snapd-desktop-integration` service (which is associated with `snapd`), run <sup>{6}</sup>

* `sudo snap stop {{package_name}}` : To stop all Snap services, use the following command <sup>{6}</sup>
  * `sudo snap stop firmware-updater` : To stop all `firmware-updater` services, run <sup>{6}</sup>

* `sudo snap stop {{service_name}}` : To stop a Snap's single service, enter the following <sup>{6}</sup>
  * `sudo stop snapd-desktop-integration` : Stop the `snapd-desktop-integration` service with <sup>{6}</sup>

* `sudo snap stop --disable {{service_name}}` : To prevent a Snap service from starting on boot, add the `--disable` argument <sup>{6}</sup>
  * `sudo snap stop --disable snapd-desktop-integration` : For example, run the following <sup>{6}</sup>

* `sudo snap start {{package_name}}` : Use the following command to start all Snap services <sup>{6}</sup>
  * `sudo snap start firmware-updater` : For instance, run the following <sup>{6}</sup>

* `sudo snap start {{service_name}}` : On the other hand, to start an individual Snap service, use the following command <sup>{6}</sup>
  * `sudo snap start snapd-desktop-integration` : For example, start the service with <sup>{6}</sup>

* `sudo snap start --enable {{service_name}}` : For a service to start on the next boot, add the `--enable` argument <sup>{6}</sup>
  * `sudo snap start --enable snapd-desktop-integration` : For instance, enable `snapd-desktop-integration` to start on the next boot with <sup>{6}</sup>

* `snap download {{package_name}}` : On a machine with internet access, download the Snap app with <sup>{6}</sup>
  * `snap download kubectl` : For example. to download the kubectl package, which is the command-line tool for interacting with Kubernetes clusters, run <sup>{6}</sup>

* On the offline machine, run the following commands to install the Snap app: <sup>{6}</sup>
  * `sudo snap ack {{package_name.assert}}` <sup>{6}</sup>
  * `sudo snap install {{package_name.snap}}` <sup>{6}</sup>
  * The `ack` command is used to confirm the Snap package's authenticity by accepting its assertion file and ensuring it's safe to install, while the install command installs the app itself. <sup>{6}</sup>

  * For example, to install Snap, run: <sup>{6}</sup>
    * `sudo snap ack kubectl_3513.assert` <sup>{6}</sup>
    * `sudo snap install kubectl_3513.snap` <sup>{6}</sup>

* `sudo snap get {{package_name}}` : To see a Snap’s configuration options, use the <sup>{6}</sup>
  * `sudo snap get core` : For example, the configuration for the core Snap, which provides essential system services and supports other snaps, run <sup>{6}</sup>
  * `sudo snap get opera` : The output also indicates if the specified app does not have configuration options. For example, in Opera <sup>{6}</sup>

* `sudo snap get {{package_name}} {{key_name}}` : To explore additional options, add the `{{key name}}` to the previous command <sup>{6}</sup>
  * `sudo snap get core refresh` : For example, run the following to show Snap's automatic update settings, including the update schedule <sup>{6}</sup>

* `sudo snap set {{package_name}} {{key_name}}={{value}}` : To change a Snap's configuration option, use the command <sup>{6}</sup>
  * `sudo snap set core refresh.timer=00:00-04:00` : For example, set a refresh timer for Snap updates (core) <sup>{6}</sup>

* `sudo snap unset {{package_name}} {{key_name}}` : To restore a configuration value to its default state, use <sup>{6}</sup>
  * `sudo snap unset core refresh.timer` : Reset the refresh timer to default for core <sup>{6}</sup>

* `sudo snap set {{package_name}} {{key_name}}!` : Alternatively, to restore a value to its default stage, use the `set command` but add `!` at the end of the key name to restore the default value <sup>{6}</sup>
  * `sudo snap set core refresh.timer!` : For example, reset the refresh timer for `core` with <sup>{6}</sup>

* `sudo snap set {{package_name}} {{key_name}}! {{key_name2}}={{key_value}}` : Moreover, combine `!` with other setting options at the same time <sup>{6}</sup>
  * `sudo snap set core refresh.timer! refresh.retain=3` : For example, reset the refresh timer and change the number of retained versions with <sup>{6}</sup>

* `snap changes` : Use the following to see a full list of changes in your system <sup>{6}</sup>

* `sudo snap refresh {{package_name}} --channel={{channel_name}}` : To change to a different channel, use the following command <sup>{6}</sup>
  * `sudo snap refresh kubectl --channel=beta` : For example, to switch kubectl to the beta channel, use the following command <sup>{6}</sup>

# Snap Package Manager

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* [repology.org](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)
* [snapcraft.io](https://snapcraft.io/)
* [Snap documentation](https://snapcraft.io/docs)

## Notes

## PATH

* PATHs
  * Snap binaries (graphical and command-line) are located at: `/snap/bin`
  * Snap ".desktop"/Menu files are located at: `/var/lib/snapd/desktop/applications`
  * Snap cache files are located at: `/var/lib/snapd/cache` <sup>{3}</sup>

* In Q4OS ("Q4OS 5.6 TDE (64bit).vdi"), Snap adds software to $PATH, for both graphical and command-line software. Also Snap adds software to Menu.

* In SparkyLinux ("sparkylinux-7.6-x86_64-minimalgui.iso"), Snap does not add software to $PATH, for both graphical and command-line software. Also Snap does not add software to Menu.
  * `echo 'export PATH="/snap/bin:$PATH"' >> ~/.bashrc` : Add a directory to `PATH` permanently by editing the `.bashrc` file located in the `Home` directory. <sup>{5}</sup>
  * `echo $PATH` : Verify the result with <sup>{5}</sup>

# Installation

## Fedora

**[Installing snap on Fedora](https://snapcraft.io/docs/installing-snap-on-fedora)**

# Configuration

## App Auto Update

* {4} [Flatpak vs. Snap: 10 Differences You Should Know](https://itsfoss.com/flatpak-vs-snap/)
  * Snap applications get updated automatically by default. The user can modify when and how often the updates happen. Also, you can hold and postpone updates for selected snaps.
  * On the contrary, Flatpak packages do not get updated automatically. If you have Flatpak integration with the software center, you will be notified of available updates, but it will not be forcefully updated.

## Test Code
* Install package: `sudo snap install smplayer`
* Check "smplayer" package installed or not: `snap list | awk '{print $1}' | grep smplayer`
* To execute software installation script enter into sudo mode `sudo su` for one time.
* Execute script: `./snap-install.sh`
  * Error: `bash: ./snap-install.sh: /bin/bash^M: bad interpreter: No such file or directory`
  * Get bash path: `which bash` [Shows output: `/usr/bin/bash`]
  * Change "End Of Line": In Notepad++ Edit->EOL Conversion->Unix (LF)

# Error and Solution

## Snap Package Download/Verify Error

* Error_1
  > error: cannot perform the following tasks:
  > - Fetch and check assertions for snap "rclone" (525) (cannot verify snap "rclone", no matching signatures found)

* Solution_1
  * {3} [How to remove uninstalled snaps from cache?](https://askubuntu.com/questions/1075050/how-to-remove-uninstalled-snaps-from-cache)
  * You can remove the files in `/var/lib/snapd/cache` without issue. Also there is no need to stop snapd before.
  * This was answered in [Snapcraft forum](https://forum.snapcraft.io/t/is-if-safe-for-me-to-remove-cache-files/7641):
  * Here the command to do that: `sudo sh -c 'rm -rf /var/lib/snapd/cache/*'`

# References

* next-sl: {7}

## Tutorials

* {6} [A Comprehensive Guide to Using Snap Packages on Ubuntu](https://phoenixnap.com/kb/snap-packages)
* {5} [Linux: Add a Directory to PATH](https://phoenixnap.com/kb/linux-add-to-path)

## Guides

* General

* Comparison
  * {4} [Flatpak vs. Snap: 10 Differences You Should Know](https://itsfoss.com/flatpak-vs-snap/)

* Bash
  * [Bash only show first column value](https://unix.stackexchange.com/questions/136884/how-to-use-a-shell-command-to-only-show-the-first-column-and-last-column-in-a-te)
  * `/bin/bash^M: bad interpreter: No such file or directory`
    * [Bash script – "/bin/bash^M: bad interpreter: No such file or directory" [duplicate]](https://stackoverflow.com/questions/14219092/bash-script-bin-bashm-bad-interpreter-no-such-file-or-directory)
    * [Are shell scripts sensitive to encoding and line endings?](https://stackoverflow.com/questions/39527571/are-shell-scripts-sensitive-to-encoding-and-line-endings)
  * [Bash array with spaces in elements](https://stackoverflow.com/questions/9084257/bash-array-with-spaces-in-elements)
  * [Linux replace space to newline for a string](https://stackoverflow.com/questions/33533897/linux-replace-space-to-newline-for-a-string)

* Snap Package Manager
  * {1} [Snap => Installing the daemon](https://snapcraft.io/docs/installing-snapd)
  * {2} [Installing snap on Debian](https://snapcraft.io/docs/installing-snap-on-debian)
  * {3} [How to remove uninstalled snaps from cache?](https://askubuntu.com/questions/1075050/how-to-remove-uninstalled-snaps-from-cache)

## YouTube Tutorials
