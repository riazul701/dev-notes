# Vim/AstroNvim.md

## Website

## Guides

# Installation

## Antix-OS AstroNvim Installation
* Install neovim latest version
  * [Neovim Installation Guide](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)
  * sudo apt install neovim [This installs neovim (0.4.4-1), which is not compatible with LunarVim]
  * Download latest Neovim from [Neovim GitHub Repo](https://github.com/neovim/neovim).
  * Download Neovim AppImage: `wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage`
  * Make it executable for all user `chmod a+x ./nvim.appimage`
  * `sudo mv nvim.appimage /usr/bin/nvim` [Check version: `nvim --version`]
  
* Install git latest version
  * [About Backports](https://backports.debian.org/Instructions/)
  * sudo apt install git/bullseye-backports [Check version: `git --version`]
  * For general-old version: sudo apt install git

* Install "fzf" for neovim telescope plugin
  * sudo apt install fzf

* [Install AstroNvim](https://astronvim.com/)
  * Make a backup of your current nvim folder
    * mv ~/.config/nvim ~/.config/nvim.bak
  * Clean neovim folders (Optional but recommended)
    * mv ~/.local/share/nvim ~/.local/share/nvim.bak
    * mv ~/.local/state/nvim ~/.local/state/nvim.bak
    * mv ~/.cache/nvim ~/.cache/nvim.bak
  * Clone the repository
    * git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
    * nvim
