# Commands/Usage

* `sudo dnf install {{package-name.rpm}}` : To install local `.rpm` packages with the `dnf` command <sup>{14}</sup>
  * In general it would be preferred to use `"dnf install *.rpm"` since it checks for dependencies and requirements while using `rpm` would just install the packages. <sup>{14}</sup>

# DNF.md

## Notes

* AUR (ArchLinux) requires users to build packages locally, while COPR (Fedora) provides pre-built packages. <sup>{6}</sup>

* `dnf check-update` (For APT: `apt update`) This command is rarely needed, as dnf updates its package cache automatically when it is stale. A cache update can be forced by appending `--refresh` to other commands, e.g. `dnf upgrade --refresh`. <sup>{3}</sup>

# Error & Solution

## Repository Package's Dependency Version Conflict

**[How to solve dnf update conflicts?](https://www.reddit.com/r/Fedora/comments/l3msbj/how_to_solve_dnf_update_conflicts/) <sup>{13}</sup>**

* `sudo dnf update --best --allowerasing` : Solved it today with the recommended command

* `sudo dnf install jellyfin` : Installing `jellyfin` package from RPM Fusion repository causes dependency version conflicts like `ffmpeg`
  * `sudo dnf install jellyfin --allowerasing` : Prefer RPM-Fusion over Fedora repository, because dependency version is conflicted, like `ffmpeg`

# References

* next-sl: {15}

## Websites

* {1} [manatools/dnfdragora GitHub](https://github.com/manatools/dnfdragora)

* Repository
  * {4} [Fedora Copr => Official](https://copr.fedorainfracloud.org/coprs/)
  * [RPM Fusion](https://rpmfusion.org/)
  * [Terra Repository](https://terra.fyralabs.com/)

## Tutorials

* Comparison
  * {2} [pacman/Rosetta => Compare package manager : pacman, dnf, apt, zypper, emerge](https://wiki.archlinux.org/title/Pacman/Rosetta)
  * {3} [DNF and its APT command equivalents on Fedora](https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/)

* General
  * {7} [Essential DNF Commands for Linux Users [With Examples]](https://www.debugpoint.com/dnf-commands-examples/)
  * {8} [27 ‘DNF’ (Fork of Yum) Commands for RPM Package Management in Linux](https://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/)
  * {9} [Using the DNF software package manager](https://docs.fedoraproject.org/en-US/quick-docs/dnf/)
  * {10} [DNF Command Reference](https://dnf.readthedocs.io/en/latest/command_ref.html)
  * {11} [Package management system](https://docs.fedoraproject.org/en-US/quick-docs/package-management/)

* Repository
  * {13} [How to solve dnf update conflicts?](https://www.reddit.com/r/Fedora/comments/l3msbj/how_to_solve_dnf_update_conflicts/)

## Guides

* Fedoara Copr
  * {6} [Copr security](https://discussion.fedoraproject.org/t/copr-security/85931)

* Install Package
  * {14} [installing local pacakges with either dnf or rpm](https://forums.fedoraforum.org/showthread.php?327037-installing-local-pacakges-with-either-dnf-or-rpm)

* Check Package Installed
  * [How to Check a Particular Package is Installed on Linux](https://www.tecmint.com/check-package-installed-linux/)

## YouTube Tutorials

* DNF
  * {12} [Linux Crash Course - The dnf Command BY Learn Linux TV](https://www.youtube.com/watch?v=mL1hMBYP1bQ)

* Fedora Copr
  * {5} [Fedora's AUR? - What is Fedora COPR? BY The Linux Cast](https://www.youtube.com/watch?v=UwKI6BJuIRA)
