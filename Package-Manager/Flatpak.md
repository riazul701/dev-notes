# Flatpak.md

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* [repology.org](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)
* [flathub.org](https://flathub.org/)
* [Flathub Documentation](https://docs.flathub.org/docs/category/for-users)

## Notes

* PATHs
  * (Default) System-wide installations are installed in the system's installation directory, which is usually `/var/lib/flatpak` <sup>{1}</sup>
  * Per-user installations are installed in the user's home directory, in `~/.local/share/flatpak` <sup>{1}</sup>
  * Flatpak ".desktop"/Menu files are located at: `/var/lib/flatpak/exports/share/applications`

* In Q4OS, Flatpak does not add software to $PATH, for both graphical and command-line software. But adds to Menu.

## FlatSeal

* [Flatseal by Martin Abente Lahaye](https://flathub.org/apps/com.github.tchx84.Flatseal)

* [Manage Flatpak Permissions Graphically With Flatseal](https://itsfoss.com/flatseal/)

# References

* next-sl: {2}

* Guides

  * General
    * {1} [User vs system install](https://docs.flathub.org/docs/for-users/user-vs-system-install/)

* YouTube Tutorials
  * [What's the deal with Flatpak? (Linux Crash Course Series) BY Learn Linux TV](https://www.youtube.com/watch?v=IG2wTCacEtQ)
  * [Flatpak Tutorial - Setting up Flatpak and installing Packages BY Learn Linux TV](https://www.youtube.com/watch?v=31WRiI1nk8Q)
