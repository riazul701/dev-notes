# Debian-Server.md

## Download ISO

* [What's the difference between Debian Standard and Gnome?](https://unix.stackexchange.com/questions/87182/whats-the-difference-between-debian-standard-and-gnome)
  * `Debian Live Standard` is Debian without the Graphical User Interface.
  * `Debian Live Gnome` is Debian Standard with Gnome.

# Debian APT Sources

## Notes

* Keep in mind that if you track trixie (future Debian 13), it will become Debian stable after it's release. If you track testing, it will continue as Debian testing after release of Debian 13. <sup>{7}</sup>

* Avoid using stable in your sources.list as that results in nasty surprises and broken systems when the next release is made; upgrading to a new release should be a deliberate, careful action and editing a file once every two years is not a burden. <sup>{3}</sup>

* For example, if you always want to help test the testing release, use 'testing'. If you are tracking trixie and want to stay with it from testing to end of life, use 'trixie'. <sup>{3}</sup>

* Old sources.list can be modernized by running apt modernize-sources with no parameters. <sup>{3}</sup>

## PATH

* The main Apt sources configuration file is at `/etc/apt/sources.list`. <sup>{3}</sup>

## Edit APT Sources `sudo apt update`

**Using ISO "debian-live-testing-amd64-standard.iso"**

* Get Debian-Testing ISO (Weekly-Live-Build) From [Debian Testing Branch ISO](https://cdimage.debian.org/cdimage/weekly-live-builds/amd64/iso-hybrid/)

**Error Message From `sudo apt update`**

```
Ign:1 cdrom://[Auto-generated Debian GNU/Linux Live testing standard 2025-03-10T02:22:58Z] trixie InRelease
Err:2 cdrom://[Auto-generated Debian GNU/Linux Live testing standard 2025-03-10T02:22:58Z] trixie Release
  Please use apt-cdrom to make this CD-ROM recognized by APT. apt-get update cannot be used to add new CD-ROMs

Error: The repository 'cdrom://[Auto-generated Debian GNU/Linux Live testing standard 2025-03-10T02:22:58Z] trixie Release' does not have a Release file.
Notice: Updating from such a repository can't be done securely, and is therefore disabled by default.
Notice: See apt-secure(8) manpage for repository creation and user configuration details.
Notice: Some sources can be modernized. Run 'apt modernize-sources' to do so.
```

**Reason**

* Live Build ISO means full ISO file, that do not download during Operating System installation.

* Net ISO means minimal ISO file, that download Operating System packages during installation.

* Live Build ISO has this "Install packages from cdrom://" issue. Net ISO does not have this issue.

**Solution <sup>{3}</sup>**

* `sudo apt edit-sources` : Edit the main Apt sources configuration file is at `/etc/apt/sources.list`. <sup>{3}</sup>

* Uses HTTP to get binary packages as well as sources from the stable, testing and unstable suites and the components main and contrib.

```shell
deb http://deb.debian.org/debian stable main contrib
deb-src http://deb.debian.org/debian stable main contrib
deb http://deb.debian.org/debian testing main contrib
deb-src http://deb.debian.org/debian testing main contrib
deb http://deb.debian.org/debian unstable main contrib
deb-src http://deb.debian.org/debian unstable main contrib
```

* For Debian-Testing ISO "debian-live-testing-amd64-standard.iso", Use this APT sources:
```shell
deb http://deb.debian.org/debian testing main contrib
deb-src http://deb.debian.org/debian testing main contrib
```

* `sudo apt update`

* Old sources.list can be modernized by running `apt modernize-sources` with no parameters. <sup>{3}</sup>

* `sudo apt upgrade`

# OS Installation

## Notes

* During installation of `Debian Live Standard` (Server), Do not enter password for `sudo` user because it does not add `general-user` to `sudoer` group and can not perform commands like `sudo apt update`

# Error & Solution

# References

* next-sl: {13}

## Websites

* {8} [Live install images => Debian offline installer](https://www.debian.org/CD/live/) <sup>{1}</sup>
* {9} [repology.org => The packaging hub](https://repology.org/)
* {10} [distrowatch.com](https://distrowatch.com/)

* {11} [Debian ISO Download => Live Image](https://www.debian.org/CD/)
  * {12} [Debian Testing Branch ISO](https://cdimage.debian.org/cdimage/weekly-live-builds/amd64/iso-hybrid/)

## Tutorials

* Debian APT Sources
  * {2} [DebianTesting](https://wiki.debian.org/DebianTesting)
  * {3} [SourcesList => Debian](https://wiki.debian.org/SourcesList)
  * {4} [sources.list - List of configured APT data sources](https://manpages.debian.org/bookworm/apt/sources.list.5.en.html)
  * {5} [DebianRepository](https://wiki.debian.org/DebianRepository)
  * {6} [Unofficial => Debian Repository](https://wiki.debian.org/DebianRepository/Unofficial)
  * {7} [sources.list and Debian testing](https://www.reddit.com/r/debian/comments/1alt66a/sourceslist_and_debian_testing/)

## Guides

* [Debian vs. Ubuntu Server](https://phoenixnap.com/blog/debian-vs-ubuntu-server)

## YouTube Tutorials
  
* {1} [Beginner’s Guide for Navigating the Debian 12 "Bookworm" Live Installer BY Learn Linux TV](https://www.youtube.com/watch?v=Xd1uFBZbe8w)
