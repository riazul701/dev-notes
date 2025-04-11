# Upgrade-Fedora.md

# System Upgrade

## Upgrade Notes

* Upgrades across more than two releases are not supported. <sup>{7}</sup>

* When performing upgrade via remote shell, it is a good idea to use screen or tmux utility to be able to get back to running transaction in case your connection drops. <sup>{8}</sup>

## [How to Upgrade Fedora 40 to Fedora 41](https://www.tecmint.com/fedora-upgrade-guide/) <sup>{4}</sup>

**Upgrading Fedora 40 Using Command-Line**

* To upgrade from `Fedora 40` to `Fedora 41` via the command line, you can utilize the `dnf-plugin-system-upgrade` plugin, which is integrated with the DNF package manager to facilitate the seamless upgrade of your system to the latest Fedora release.

* Step 1: Update Fedora 40 (Required)

  * Before moving to the new version, it’s important to update your Fedora 40 system packages to most latest and most compatible versions. : `sudo dnf upgrade --refresh`

  * Updating your system is essential for obtaining the signing keys of newer releases and addressing potential issues during the upgrade process.

* Step 2: Install the DNF-plugin-system-upgrade Package on Fedora

  * `sudo dnf install dnf-plugin-system-upgrade` : Once the system upgrade is completed, you can install the `dnf-plugin-system-upgrade` plugin, which is a command-line tool for upgrading Fedora systems to a new major release.

* Step 3: Download Fedora 41 Release

  * `sudo dnf system-upgrade download --releasever=41` : Now it’s time to use the `system-upgrade` command to download the Fedora 41 release.

  * The above command downloads all the required packages for the upgrade. Keep in mind that the process might take a while, based on your internet speed and the number of packages to be downloaded.

  * `sudo dnf system-upgrade download --releasever=41 --allowerasing` : If you encounter conflicts during the upgrade, consider adding the `--allowerasing` option to your upgrade command, which will enable DNF to remove packages that could be causing conflicts during the upgrade.

  * `sudo dnf system-upgrade reboot` : After the package download is complete, restart your system to begin the final installation process.

  * After rebooting, you will see your Fedors system upgrade installation process as shown.

* Step 4: Verify Fedora 41 Release

  * `cat cat /etc/redhat-release` : Once the upgrade to `Fedora 41` is done, you log in and confirm the upgrade.

**Upgrading Fedora 40 Using GUI**

* In this section, we’ll walk you through the steps to upgrade `Fedora 39` to `Fedora 40` using the graphical software application called `Gnome` software.

* Step 1: Update Fedora 40 (Required)
  
  * In `Fedora Workstation`, once the next stable release becomes available, a graphical notification will pop up, resembling the update notifications.

  * You can either click on this notification or open the `Gnome Software` application and navigate to the `Updates` pane to access a straightforward graphical interface for upgrading your system.

  * Next, click on the `Refresh` button to make sure that the `Software` is aware of the most recent updates.

  * If there are any unapplied updates shown, please click the `Download` button next to them (and then `Restart & Update` button, when it appears), to fully update your existing system.

  * This is important, please do not skip this step.

* Step 2: Initiate Fedora 41 Upgrade

  * Once system updates are installed, you should see an option to `‘Download‘` to start the upgrade process and follow the on-screen instructions provided by `GNOME Software`.

  * The system will lead you through the download and installation steps, so make sure you have a reliable internet connection, as this stage involves fetching a substantial amount of data.

  * After the upgrade process is complete, `GNOME Software` will automatically restart your system.

* Step 4: Check the Fedora 41 Release

  * To confirm your Fedora 41, click on `“Activities”` and search for `“About“`, which will typically provide information about your Fedora version, system specifications, and other relevant details.

**How to Roll Back Fedora Upgrade**

* If something goes wrong (like if you can’t start `Fedora 41`), you can easily go back. When you boot your computer, choose the option in the `GRUB` menu and choose the older version of Fedora, and your system will start with that older version instead of Fedora 41. If you don’t see the GRUB menu, try pressing `ESC` during boot.

* `sudo rpm-ostree rollback` : To keep using the older version permanently, use this command

**Fresh Installation of Fedora 41 Server**

* In some cases, users may choose for a fresh [installation of Fedora 41 Server](https://www.tecmint.com/fedora-server-installation-guide/) instead of upgrading, as this method involves a fresh start, ensuring that your system benefits from the latest features without keeping any traces of the previous release.

# References

* next-sl: {9}

## Websites

* {1} [fedoraproject.org](https://fedoraproject.org/)
* {2} [Fedora All Releases](https://dl.fedoraproject.org/pub/fedora/linux/releases/)
* {3} [Fedora Old Releases](https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/)

## Tutorials

* System Upgrade
  * {6} [Upgrading Fedora Linux to a New Release](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-new-release/)
  * {7} [Upgrading Fedora Linux Using DNF System Plugin](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/)
  * {8} [Upgrading Fedora Linux Online Using Package Manager](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-online/)
  * {4} [How to Upgrade Fedora 40 to Fedora 41](https://www.tecmint.com/fedora-upgrade-guide/)
  * {5} [Upgrade Fedora 38 to 39](https://www.reddit.com/r/Fedora/comments/17v4d8j/upgrade_fedora_38_to_39/)
