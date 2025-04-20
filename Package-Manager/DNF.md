# DNF.md

## Notes

* AUR (ArchLinux) requires users to build packages locally, while COPR (Fedora) provides pre-built packages. <sup>{6}</sup>

* `dnf check-update` (For APT: `apt update`) This command is rarely needed, as dnf updates its package cache automatically when it is stale. A cache update can be forced by appending `--refresh` to other commands, e.g. `dnf upgrade --refresh`. <sup>{3}</sup>

# References

* next-sl: {13}

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

## Guides

* Fedoara Copr
  * {6} [Copr security](https://discussion.fedoraproject.org/t/copr-security/85931)

## YouTube Tutorials

* DNF
  * {12} [Linux Crash Course - The dnf Command BY Learn Linux TV](https://www.youtube.com/watch?v=mL1hMBYP1bQ)

* Fedora Copr
  * {5} [Fedora's AUR? - What is Fedora COPR? BY The Linux Cast](https://www.youtube.com/watch?v=UwKI6BJuIRA)
