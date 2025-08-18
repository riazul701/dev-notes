# Commands/Usage

## Important

* Restart terminal, after installing any package using Nix package manager.
* To install unfree software like "Smartgit", execute `export NIXPKGS_ALLOW_UNFREE=1` to set environment variable.

## Commands

* `nix-env -iA {{package_name}}` : Install a package, using following command syntax. <sup>{6}</sup>
* `nix-env -q` || `nix-env --query` : Shows list of installed packages. <sup>{4}</sup>
* `nix-collect-garbage` : clear old nix-store paths and references<sup>{5}</sup>
* `nix-env --uninstall {{package_name}}` : Remove a package, using given command syntax. <sup>{6}</sup>

* `systemctl status nix-daemon`

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

## Fedora

* `sh <(curl -L https://nixos.org/nix/install) --daemon` : Shows following error on 
Fedora linux

```
Nix does not work with selinux enabled yet!
see https://github.com/NixOS/nix/issues/2374

We'd love to help if you need it.

You can open an issue at
https://github.com/NixOS/nix/issues/new?labels=installer&template=installer.md

Or get in touch with the community: https://nixos.org/community
```

**Solution-1: Permanently Disable SELinux**

* [How to Disable SELinux Temporarily or Permanently](https://www.tecmint.com/disable-selinux-in-centos-rhel-fedora/)
  * Disable SELinux Permanently
  * To permanently disable SELinux, use your favorite text editor to open the file `/etc/sysconfig/selinux` as follows: `# vi /etc/sysconfig/selinux`
  * Then change the directive `SELinux=enforcing` to `SELinux=disabled` as shown in the below image. `SELINUX=disabled`
  * Then, save and exit the file, for the changes to take effect, you need to reboot your system and then check the status of SELinux using sestatus command as shown: `sestatus`

**Solution-2**

* [Nix does not work with selinux enabled yet! #7906](https://github.com/NixOS/nix/issues/7906)
* [an alternate set of installers using distribution native packaging formats](https://github.com/NixOS/nix/issues/2374#issuecomment-1103734992)
* [Nix-installers for legacy (imperative) distributions](https://nix-community.github.io/nix-installers/)

* `wget https://nix-community.github.io/nix-installers/nix/x86_64/nix-multi-user-2.24.10.rpm`
* `sudo dnf localinstall nix-multi-user-2.24.10.rpm`
* Restart Terminal/Shell
* `which nix-env`
* `nix-env --version`

# Uninstall Nix In Linux

* [Uninstalling Nix](https://nix.dev/manual/nix/2.21/installation/uninstall) <sup>{8}</sup>

**Single User**

* If you have a [single-user installation](https://nix.dev/manual/nix/2.21/installation/installing-binary#single-user-installation) of Nix, uninstall it by running:
```bash
$ rm -rf /nix
```

**Multi User**

* Removing a [multi-user installation](https://nix.dev/manual/nix/2.21/installation/installing-binary#multi-user-installation) of Nix is more involved, and depends on the operating system.

**Linux**

* If you are on Linux with systemd:

  * 1. Remove the Nix daemon service:
```bash
sudo systemctl stop nix-daemon.service
sudo systemctl disable nix-daemon.socket nix-daemon.service
sudo systemctl daemon-reload
```

* Remove files created by Nix:
```bash
sudo rm -rf /etc/nix /etc/profile.d/nix.sh /etc/tmpfiles.d/nix-daemon.conf /nix ~root/.nix-channels ~root/.nix-defexpr ~root/.nix-profile
```

* Remove build users and their group:
```bash
for i in $(seq 1 32); do
  sudo userdel nixbld$i
done
sudo groupdel nixbld
```

* There may also be references to Nix in
  * `/etc/bash.bashrc`
  * `/etc/bashrc`
  * `/etc/profile`
  * `/etc/zsh/zshrc`
  * `/etc/zshrc`
* which you may remove. Just remove Nix related lines enclosed with `# Nix` comment block. Do not remove whole file.

# References

* next-sl: {9}

## Guides

* General
  * {1} [Nix Official Packages](https://search.nixos.org/packages)
  
* NixOS/Nix Package Manager
  * {2} [NixOS Basics](https://itsfoss.com/tag/nix-os/)
  * {3} [Install and Use Nix Package Manager on non-Nix OS like Ubuntu](https://itsfoss.com/ubuntu-install-nix-package-manager/)
  * {7} [Nix : the package manager](https://nixos.org/download/)
  * {8} [Uninstalling Nix](https://nix.dev/manual/nix/2.21/installation/uninstall)

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
