# Commands/Usage

* `sudo sh -c 'rm -rf /var/lib/snapd/cache/*'` : Remove snap cache files in `/var/lib/snapd/cache` without issue. Also there is no need to stop snapd before. <sup>{3}</sup>
* `apt show snapd` : Shows information about "snap"/"snapd" package
* `sudo apt install snapd` : Install "snap"/"snapd" package
* `which snap` : Shows "snap" installation path
* `systemctl status snapd` : Check "snapd" status
* `snap help --all` : Shows help of "snap" command

# Snap Package Manager

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* [repology.org](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)
* [snapcraft.io](https://snapcraft.io/)
* [Snap documentation](https://snapcraft.io/docs)

## Notes

* PATHs
  * Snap ".desktop"/Menu files are located at: `/var/lib/snapd/desktop/applications`
  * Snap cache files are located at: `/var/lib/snapd/cache` <sup>{3}</sup>

* In Q4OS, Snap adds software to $PATH, for both graphical and command-line software. Also Snap adds software to Menu.

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
  *

# References

* next-sl: {5}

* Guides

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

* YouTube Tutorials
