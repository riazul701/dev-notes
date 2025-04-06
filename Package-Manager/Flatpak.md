# Commands/Usage

* `flatpak remove --unused` : only removes dependencies that are no longer needed, so yes, you should remove them.

# Flatpak.md

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* [repology.org](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)
* [flatpak.org](https://flatpak.org/)
* [flathub.org](https://flathub.org/)
* [Flathub Documentation](https://docs.flathub.org/docs/category/for-users)

## Notes

* Flatpak/Flathub includes mostly graphical apps. Terminal apps are very less. 

## PATH

* PATHs
  * (Default) System-wide installations are installed in the system's installation directory, which is usually `/var/lib/flatpak` <sup>{1}</sup>
  * Per-user installations are installed in the user's home directory, in `~/.local/share/flatpak` <sup>{1}</sup>
  * Flatpak ".desktop"/Menu files are located at: `/var/lib/flatpak/exports/share/applications`
  * Launch an executable by providing the full path name: `/var/lib/flatpak/exports/bin/org.mozilla.firefox` <sup>{3}</sup>

* In Q4OS ("Q4OS 5.6 TDE (64bit).vdi"), Flatpak does not add software to $PATH, for both graphical and command-line software. But adds to Menu.

## Add to $PATH

* {2} [Invoking Flatpak applications like they’re in $PATH #994](https://github.com/flatpak/flatpak/issues/994)
  * If you use BASH: `alias gedit="flatpak run org.gnome.gedit"`

* {3} [Can not find executable path of flatpak apps](https://askubuntu.com/questions/1417313/can-not-find-executable-path-of-flatpak-apps)

## FlatSeal

* [Flatseal GitHub](https://github.com/tchx84/flatseal)
* [Flatseal by Martin Abente Lahaye](https://flathub.org/apps/com.github.tchx84.Flatseal)
* [Manage Flatpak Permissions Graphically With Flatseal](https://itsfoss.com/flatseal/)
* [YouTube => Flatseal - The Essential Flatpak BY Chris Titus Tech](https://www.youtube.com/watch?v=IfDUXZfDhEI)

## Warehouse

* [Warehouse GitHub](https://github.com/flattool/warehouse)
* [Warehouse by Heliguy](https://flathub.org/apps/io.github.flattool.Warehouse)
* [YouTube => Warehouse Makes Flatpaks Even Easier To Use BY DistroTube](https://www.youtube.com/watch?v=XONP03uMq08)

# Installation

## Ubuntu

**[Ubuntu Quick Setup => Flatpak](https://flatpak.org/setup/Ubuntu) <sup>{5}</sup>**

* Install Flatpak
  * `sudo apt install flatpak` : To install Flatpak on Ubuntu 18.10 (Cosmic Cuttlefish) or later, open the Terminal app and run

* Install GNOME Software Flatpak plugin
  * `sudo apt install gnome-software-plugin-flatpak` : The GNOME Software plugin makes it possible to install apps without needing the command line. To install, run
  * Note: Ubuntu distributes GNOME Software as a Snap in versions 20.04 to 23.04, and replaced it with App Center in 23.10 and newer—neither of which support installing Flatpak apps. Installing the Flatpak plugin will also install a deb version of GNOME Software, resulting in two "Software" apps being installed at the same time on Ubuntu 20.04 to 23.04, and a single new \"Software\" app on Ubuntu 23.10 and newer.

* Add the Flathub repository
  * `flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo` : Flathub is the best place to get Flatpak apps. To enable it, run

* Restart
  * To complete setup, restart your system. Now all you have to do is [install apps](https://flathub.org/)!

## Fedora

* `sudo dnf install flatpak`

**[Fedora Quick Setup => Flatpak](https://flatpak.org/setup/Fedora)**

# References

* next-sl: {6}

## Tutorials

* {5} [Ubuntu Quick Setup => Flatpak](https://flatpak.org/setup/Ubuntu)
* [Using Flatpak on Linux [Complete Guide]](https://itsfoss.com/flatpak-guide/)

## Guides

* General
  * {1} [User vs system install](https://docs.flathub.org/docs/for-users/user-vs-system-install/)
  * {4} [Flatpak has gotten too big.](https://www.reddit.com/r/flatpak/comments/18bx2mo/flatpak_has_gotten_too_big/)

* $PATH
  * {2} [Invoking Flatpak applications like they’re in $PATH #994](https://github.com/flatpak/flatpak/issues/994)
  * {3} [Can not find executable path of flatpak apps](https://askubuntu.com/questions/1417313/can-not-find-executable-path-of-flatpak-apps)

## YouTube Tutorials
  
* [What's the deal with Flatpak? (Linux Crash Course Series) BY Learn Linux TV](https://www.youtube.com/watch?v=IG2wTCacEtQ)
* [Flatpak Tutorial - Setting up Flatpak and installing Packages BY Learn Linux TV](https://www.youtube.com/watch?v=31WRiI1nk8Q)
