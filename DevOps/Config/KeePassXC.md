# KeePassXC.md

## Websites

* [keepassxreboot/keepassxc](https://github.com/keepassxreboot/keepassxc)
* [KeePassXC Site](https://keepassxc.org/)
* [KeePassXC CLI](https://wiki.gentoo.org/wiki/KeePassXC/cli)

# Install KeePassXC

## Install using Snap

* [keepassxc BY Jonathan White (keepassxreboot) => snapcraft.io/keepassxc](https://snapcraft.io/keepassxc)
  * Install KeePassXC: `sudo snap install keepassxc`

## Install Using Nix

* On Non NixOS, without flakes : `nix-env -iA nixpkgs.keepassxc`
  * Check KeePassXC GUI Path : `which keepassxc`
  * Check KeePassXC CLI Path : `which keepassxc-cli`

# Error and Solution

## VCRUNTIME140_1.dll was not found

* Error Message_1:
  * The code execution cannot proceed because VCRUNTIME140_1.dll was not found. Reinstalling the program may fix this problem.
  * "KeePassXC" is installed using Scoop.

* Solution_1:
  * [System Error: VCRUNTIME140_1.dll was not found #7564](https://github.com/keepassxreboot/keepassxc/issues/7564)
  * [Visual Studio 2015, 2017, 2019, and 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2015-2017-2019-and-2022)
  * Download and install [vc_redist.x64.exe](https://aka.ms/vs/17/release/vc_redist.x64.exe) from previous link.

# References

## YouTube Tutorials

* [KeePassXC TOTP (2-Factor Autofill) | Complete Crash Course BY TroubleChute](https://www.youtube.com/watch?v=VEfkt29moE8)
* [How to SAFELY store PASSWORDS & 2FA ENCRYPTED? KeePassXC + synchronizing with mobile device BY Crypton [EN]](https://www.youtube.com/watch?v=FE6rr-qxllA)
* [How To Sync KeePass Across Devices with Dropbox, Google Drive or Other Cloud Storage - Helpful Guide BY Valentin Kossenko](https://www.youtube.com/watch?v=mbZU_NEtXNU)
