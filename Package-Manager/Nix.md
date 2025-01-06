# Nix.md

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* [repology.org](https://repology.org/)
* {1} [Nix Official Packages](https://search.nixos.org/packages)
* [distrowatch.com](https://distrowatch.com/)
* [nix-community/home-manager](https://github.com/nix-community/home-manager)
* [thiagokokada/nix-alien](https://github.com/thiagokokada/nix-alien)
* [DeterminateSystems/zero-to-nix](https://github.com/DeterminateSystems/zero-to-nix) || [zero-to-nix.com](https://zero-to-nix.com/)
* [nix-community/nix-on-droid](https://github.com/nix-community/nix-on-droid)
* [Misterio77/nix-starter-configs](https://github.com/Misterio77/nix-starter-configs)
* [ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book) || [nixos-and-flakes.thiscute.world](https://nixos-and-flakes.thiscute.world/)
  * [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
  * [the-nix-way/dev-templates](https://github.com/the-nix-way/dev-templates)
  * [cachix/devenv](https://github.com/cachix/devenv)
  * [jetify-com/devbox](https://github.com/jetify-com/devbox)
* [NixOS/nix.dev](https://github.com/nixos/nix.dev)
* [joaberg/Desktop-Ubuntu-Nix](https://github.com/joaberg/Desktop-Ubuntu-Nix)
* [tech.aufomm.com](https://tech.aufomm.com/) <sup>{1}</sup>

* Tutorials
  * [Nix language basics](https://nix.dev/tutorials/nix-language.html)

## Notes

* PATHs
  * Installed softwares are located at: `/home/{{user-name}}/.nix-profile/bin` [Softwares are installed with `nix-env -iA nixpkgs.{{package-name}}` command] <sup>{1}</sup>

* In Q4OS, Nix adds software to $PATH, for both graphical and command-line software. But Nix does not add software to Menu.


# References

* next-sl: {1}

* Guides

  * General
    * {1} [Nix Official Packages](https://search.nixos.org/packages)

  * NixOS
    * [NixOS Basics](https://itsfoss.com/tag/nix-os/)

  * Package Manager
    * [Install and Use Nix Package Manager on non-Nix OS like Ubuntu](https://itsfoss.com/ubuntu-install-nix-package-manager/)

  * Server
    * [NixOS friendly hosters](https://nixos.wiki/wiki/NixOS_friendly_hosters)

* YouTube Tutorials
  * {1} [Nix BY Li Yang => PlayList](https://www.youtube.com/playlist?list=PLLvdqTlFTmuKsiyAI8Q9FgHP4mY0ktPVq)
  * [How to use Nix on Ubuntu or any Linux Distro BY Li Yang](https://www.youtube.com/watch?v=5Dd7rQPNDT8)
  * [I was WRONG! This is the BEST Package Manager. BY Chris Titus Tech](https://www.youtube.com/watch?v=Ty8C2B910EI)
