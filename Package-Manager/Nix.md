# Commands/Usage

## Important

* Restart terminal, after installing any package using Nix package manager.
* To install unfree software like "Smartgit", execute `export NIXPKGS_ALLOW_UNFREE=1` to set environment variable.

## Commands

* `nix-env -iA {{package_name}}` : Install a package, using following command syntax. <sup>{6}</sup>
* `nix-env -q` || `nix-env --query` : Shows list of installed packages. <sup>{4}</sup>
* `nix-collect-garbage` : clear old nix-store paths and references<sup>{5}</sup>
* `nix-env --uninstall {{package_name}}` : Remove a package, using given command syntax. <sup>{6}</sup>

# Nix.md

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)
* [repology.org](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)

* [NixOS/nixpkgs](https://github.com/NixOS/nixpkgs)
* {1} [Nix Official Packages](https://search.nixos.org/packages)
* [nix-community/home-manager](https://github.com/nix-community/home-manager)
* [thiagokokada/nix-alien](https://github.com/thiagokokada/nix-alien)
* [DeterminateSystems/zero-to-nix](https://github.com/DeterminateSystems/zero-to-nix) || [zero-to-nix.com](https://zero-to-nix.com/)
* [nix-community/awesome-nix](https://github.com/nix-community/awesome-nix)
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

## PATH

**Software Installation PATH**

* Installed softwares are located at: `/home/{{user-name}}/.nix-profile/bin` [Softwares are installed with `nix-env -iA nixpkgs.{{package-name}}` command] <sup>{1}</sup>

**Q4OS Operating System**

* In Q4OS, Nix adds software to $PATH instantly, for both graphical and command-line software. Also Nix adds software to Menu after logout/restart.

# Install Nix Package Manager

## Debian

* [Nix : the package manager](https://nixos.org/download/) <sup>{7}</sup>
* [Install and Use Nix Package Manager on non-Nix OS like Ubuntu](https://itsfoss.com/ubuntu-install-nix-package-manager/) <sup>{3}</sup>

* Multi-user installation (recommended) / global installation
  * `$ sh <(curl -L https://nixos.org/nix/install) --daemon`
  * We recommend the multi-user install if you are on Linux running systemd, with SELinux disabled and you can authenticate with `sudo`.

* Single-user installation / local installation
  * `$ sh <(curl -L https://nixos.org/nix/install) --no-daemon`
  * Above command will perform a single-user installation of Nix, meaning that `nix` is owned by the invoking user. You should run this under your usual user account, not as `root`. The script will invoke `sudo` to create `/nix` if it doesn’t already exist.

# References

* next-sl: {8}

## Guides

* General
  * {1} [Nix Official Packages](https://search.nixos.org/packages)
  
* NixOS/Nix Package Manager
  * {2} [NixOS Basics](https://itsfoss.com/tag/nix-os/)
  * {3} [Install and Use Nix Package Manager on non-Nix OS like Ubuntu](https://itsfoss.com/ubuntu-install-nix-package-manager/)
  * {7} [Nix : the package manager](https://nixos.org/download/)

* Package Install/Uninstall/List
  * {4} [Why doesn't `nix-env -q` find my installed packages? (NixOS channels, profiles and packages)](https://stackoverflow.com/questions/47953868/why-doesnt-nix-env-q-find-my-installed-packages-nixos-channels-profiles-a)
  * {5} [Unable to clear old nix-store paths and references](https://www.reddit.com/r/NixOS/comments/15bjqrw/unable_to_clear_old_nixstore_paths_and_references/)
  * {6} [Install and Remove Packages in NixOS](https://itsfoss.com/nixos-package-management/)

* Server
  * [NixOS friendly hosters](https://nixos.wiki/wiki/NixOS_friendly_hosters)

## YouTube Tutorials
  
* {1} [Nix BY Li Yang => PlayList](https://www.youtube.com/playlist?list=PLLvdqTlFTmuKsiyAI8Q9FgHP4mY0ktPVq)
* [How to use Nix on Ubuntu or any Linux Distro BY Li Yang](https://www.youtube.com/watch?v=5Dd7rQPNDT8)
* [I was WRONG! This is the BEST Package Manager. BY Chris Titus Tech](https://www.youtube.com/watch?v=Ty8C2B910EI)
