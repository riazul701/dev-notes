# broot-cmd.md

## Notes

* Execute custom commands like "zip", "rclone" on selected files.

* Config Reset: The simplest solution is to remove your old configuration directory (or rename if you want to keep things) so that broot recreates it.

## PATH

* On Windows-OS, broot config folder : `C:\Users\{{user-name}}\AppData\Roaming\dystroy\broot\config`

## Install `br` Command

* If Broot is launched using `broot` command instead of `br`, then `:cd` verb/command and other shell integration features will not work.

**On Windows-OS**

* Launch terminal in Administrator mode, otherwise error is displayed.

* Install `br` command, for both git-bash and powershell.

* Error: Installation check resulted in Permission Denied. Please relaunch with elevated privilege. This is typically only needed once.

* `broot --install` : Install `br` command, for shell integration. Supports `:cd` verb/command.

* Open `~/.bashrc` file and correct path from `source C:\Users\{{user-name}}\AppData\Roaming\dystroy\broot\config\launcher\bash\br` to `source /C/Users/{{user-name}}/AppData/Roaming/dystroy/broot/config/launcher/bash/br`

* `which br` command will not work, just call `br` command, because it is a shell function and not added to PATH. `br` command will only work inside shell.

# Installation

## Debian

* Install Broot using Nix package manager
  * On Non NixOS (without flakes): `nix-env -iA nixpkgs.broot`

* Install LibreOffice for office file preview <sup>{14}</sup>
  * `sudo apt install libreoffice`

* Install "mutool" for PDF file preview <sup>{15}</sup>
  * `sudo apt install mupdf-tools`
  * `which mutool` : Check "mutool" installed path

# References

* next-sl: {16}

## Websites

* General
  * {1} [dystroy.org/broot => Better way to navigate directories, find files, and launch commands](https://dystroy.org/broot/)
  * {2} [Canop/broot GitHub](https://github.com/Canop/broot)
  * {3} [lstwn/broot.vim GitHub => Plugin that integrates broot with neovim/vim](https://github.com/lstwn/broot.vim)
  * {4} [trishume/syntect GitHub](https://github.com/trishume/syntect)
  * [Canop/print_key => Print available key bindings that can be used in broot](https://github.com/Canop/print_key)

* Config
  * {5} [Broot Default Config](https://github.com/Canop/broot/blob/main/resources/default-conf/conf.hjson)
  * {6} [Broot Default Verb](https://github.com/Canop/broot/blob/main/resources/default-conf/verbs.hjson)

* Office File Preview
  * {14} [LibreOffice](https://www.libreoffice.org/)

* PDF File Preview
  * {15} [mutool - all purpose tool for dealing with PDF files => Debian](https://manpages.debian.org/jessie/mupdf-tools/mutool.1)

* Theme
  * {7} [Broot Theme](https://github.com/Canop/broot/tree/main/resources/default-conf/skins)

* Font
  * {8} [Nerd Font](https://github.com/ryanoasis/nerd-fonts)
  * {9} [VSCode Font](https://github.com/Canop/broot/blob/main/resources/icons/vscode/vscode.ttf)

## Tutorials

* {10} [Broot content search](https://dystroy.org/blog/broot-c-search/)
* {11} [Use broot and meld to diff before commit](https://dystroy.org/blog/gg/)

## YouTube Tutorials
  
* {12} [Broot Is A Better Way To Navigate Directories BY DistroTube](https://www.youtube.com/watch?v=lGD-wsQO_lI)
* {13} [Broot: An Innovative Way To View Your Linux File System BY Brodie Robertson](https://www.youtube.com/watch?v=eTtarjSJ0yU)
