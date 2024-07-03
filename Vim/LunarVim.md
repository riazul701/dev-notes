# Vim/LunarVim.md

## Notes
* Keyboard
  * Press "TAB" key after ":" to auto-complete commands.
* Paths
  * Windows-OS
    * Configuration(plugins) file: C:\Users\<user-name>\AppData\Local\lvim
    * Installed plugins: C:\Users\<user-name>\AppData\Roaming\lunarvim
    * LunarVim binary: C:\Users\<user-name>\.local\bin\lvim.ps1
    * PowerShell profile: C:\Users\<user-name>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
  * Linux-OS
    * Configuration(plugins) file: /home/<user-name>/.config/lvim
    * Installed plugins: /home/<user-name>/.local/share/lunarvim
* Conflicts
  * Scoop installed "ruby, gem" conflicts with Git-Bash installed "ruby, gem". For this reason "tmuxinator" does not work. So intall "ruby" only inside Git-Bash. And use LunarVim inside Bash.

## Tutorials
* chris@machine - LunarVim Maintainer
  * [YouTube - chris@machine](https://www.youtube.com/@chrisatmachine)
  * [Odysee - chris@machine](https://odysee.com/@chrisatmachine:f)
  * [Medium - chris@machine](https://medium.com/@chrisatmachine)
  * [Website - chris@machine](https://www.chrisatmachine.com/)
  * [GitHub - chris@machine](https://github.com/ChristianChiarulli)
  * [TwitchTV - chris@machine](https://www.twitch.tv/chrisatmachine)

## Commands (LunarVim)

### General Commands
* Shows installation is ok or not: `:checkhealth`
* Turn on mouse: `:set mouse=a`

## Error and Solution (LunarVim)

### ":checkhealth" command
* Clipboard (optional) -> WARNING: No clipboard tool found. Clipboard registers (`+` and `*`) will not work. -> ADVICE: `:help clipboard`

## Guides
* Configuration
  * [How To Setup LunarVim in Windows](https://medium.com/@peterhaddad/how-to-setup-lunarvim-in-windows-9df9bd220889)

* Clipboard
  * [How to support clipboard for NeoVim](https://discourse.nixos.org/t/how-to-support-clipboard-for-neovim/9534)
  * [NeoVim Providers](https://neovim.io/doc/user/provider.html)
  * [How to use the Windows clipboard from WSL?](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)
  * [vim-system-copy](https://github.com/christoomey/vim-system-copy)
  * [Copy("+y)/pasting("+p) to/from system clipboard not working.](https://www.reddit.com/r/neovim/comments/xajsgk/copyypastingp_tofrom_system_clipboard_not_working/)
  * [How to install neovim with +clipboard extension?](https://vi.stackexchange.com/questions/29285/how-to-install-neovim-with-clipboard-extension)
  * [vim + COPY + mac over SSH](https://stackoverflow.com/questions/10694516/vim-copy-mac-over-ssh)
  * [How to copy and paste with a clipboard in Tmux](https://linuxhint.com/copy-paste-clipboard-tmux/)
  * [Forwarding copy to clipboard from dev container to Windows Host](https://stuartleeks.com/posts/vscode-devcontainer-clipboard-forwarding/)
  * [Accessing the system clipboard](https://vim.fandom.com/wiki/Accessing_the_system_clipboard)
  * [How to x11 Forward with Putty on Windows](https://www.youtube.com/watch?v=-oanqpf0xak)
  * [Clipboard over SSH with Vim](https://defuse.ca/blog/clipboard-over-ssh-with-vim.html)
  * [jedisct1/piknik GitHub](https://github.com/jedisct1/piknik)
  * [wincent/clipper GitHub](https://github.com/wincent/clipper)

# Installation

## Windows Installation
* Mandatory packages
  * scoop install --global neovim [`nvim --version`]
    * 'neovim' suggests installing 'extras/vcredist2022'
    * scoop install --global vcredist2022
  * scoop install --global git [`git --version`]
  * scoop install --global make [`make --version`]
  * scoop install --global python [This installs python and pip(python package manager). `python --version`, `pip --version`]
  * scoop install --global nodejs [This installs node and npm(node package manager). `node --version`, `npm --version`]
  * scoop install --global rust [This installs rust and cargo(rust package manager). `rustc --version`, `cargo --version`]
  * scoop install --global gcc [Failed to install nvim-telescope/telescope-fzf-native.nvim (This git-package needs "gcc" c compiler)] [`gcc --version`]

* Scoop additional package installation to fix error and warning in ":checkhealth" LunarVim (NeoVim) command
  * scoop install --global go [`go version`]
  * scoop install --global lua [`lua -v`]
  * scoop install --global luarocks [`luarocks --version`]
  * scoop install --global ruby [Conflicts with "ruby" installed inside Git-Bash. Therefore "tmuxinator" does not work.] [`ruby --version`, `gem --version`]
  * Missing: rubygem
  * scoop install --global php [`php --version`]
  * scoop install --global composer [`composer --version`]
  * scoop bucket add java && scoop install --global openjdk [`java --version`]
  * scoop install --global julia [`julia --version`]
  * scoop install --global wget [`wget --version`]
  * scoop install --global gzip [`gzip --version`]
  * scoop install --global ripgrep [`rg --version`]
  * scoop install --global fd [`fd --version`]

* [Install Nerd Font](https://github.com/ryanoasis/nerd-fonts)
  * Using Scoop
    * Open PowerShell in Administrator mode
    * scoop bucket add nerd-fonts
    * scoop install --global Hack-NF
    * Check fonts are installed or not: Open Run by pressing "WindowsKey+R" -> Enter "fonts"
  * Alternative Way (Full repository cloning take longer time)
    * Install single font
    * Requires cloning the repo as of now: `git clone https://github.com/ryanoasis/nerd-fonts.git`
    * Install in Linux-OS: `./install.sh Hack`
    * Install in Powershell (Windows only): `./install.ps1 Hack`
  * Manual Install (Working)
    * Download font "Hack" zip file from [GitHub release page](https://github.com/ryanoasis/nerd-fonts)
    * Here are several fonts use long names. When installed then these names will automatically be shortened.
    * Open Run by pressing "WindowsKey+R" -> Enter "fonts"
    * Copy fonts from downloaded zip file and paste to windows "fonts" folder.
    * Set font in PowerShell settings.

* [LunarVim Installation](https://www.lunarvim.org/docs/installation)
  * `$LV_BRANCH='release-1.2/neovim-0.8'; Invoke-WebRequest https://raw.githubusercontent.com/LunarVim/LunarVim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.ps1 -UseBasicParsing | Invoke-Expression`
* Installing sample configuration
  * Make sure to run :Lazy sync at first launch
  * Would you like to create an alias inside your Powershell profile?
    * (This enables you to start lvim with the command 'lvim') [y]es or [n]o (default: no): y
    * Directory: C:\Users\<user-name>\Documents\PowerShell
  * To use the new alias in this window reload your profile with: `. $PROFILE`
  * You can start it by running: C:\Users\<user-name>\.local\bin\lvim.ps1
  * Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts]

* Inside Bash
  * LunarVim does not support installation inside Git-Bash (Message from LunarVim duing installation): "OS MINGW64_NT-10.0-19045 is not currently supported".
  * Check PowerShell version: `pwsh --version`
  * pwsh -c "C:\Users\<user-name>\.local\bin\lvim.ps1"
  * Create Bash Alias "lvim"
    * [How to Create Bash Aliases](https://linuxize.com/post/how-to-create-bash-aliases/)
    * [How to escape single quotes within single quoted strings](https://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings)
    * echo 'alias lvim="pwsh -c '\''C:\Users\riazul\.local\bin\lvim.ps1'\''"' >> ~/.bashrc
    * source ~/.bashrc
    * lvim

### Notes-Windows-LunarVim
* Message shows during installing LunarVim
  * To use the new alias in this window reload your profile with: `. $PROFILE` [Enter command `. $PROFILE` in powershell to enable "lvim" command]
  * Make sure to run :PackerSync at first launch

### Errors-Windows-LunarVim
* [packer.nvim] [ERROR 02:15:13] jobs.lua:83: Failed spawning command: pwsh.exe -NoLogo because ENOENT: no such file or directory
* packer.nvim: Error running config for nvim-treesitter: vim/_meta.lua:532: Vim:No C compiler found! "cc", "gcc", "clang", "cl", "zig" are not executable.
* Failed to install nvim-telescope/telescope-fzf-native.nvim [This git-package needs "gcc" c compiler]

## Antix-OS Installation

### Install Instruction (Antix-OS)
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
  
* Install python3 and python3-pip
  * sudo apt install python3 [Check version: `python3 --version`]
  * sudo apt install python3-pip [Check version: `pip --version`]
  
* Install nodejs and npm
  * ~~sudo apt install nodejs [Check version: `node --version`]~~
  * ~~sudo apt install npm [Check version: `npm --version`]~~
  * [How to install the latest Node.js on Linux?](https://linuxhint.com/how-to-install-latest-node-js-on-linux/) || [nodesource/distributions](https://github.com/nodesource/distributions)
  * curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash - && sudo apt-get install -y nodejs
  
* Install rustc (rust language) and cargo (rust package manager)
  * [Install Rust](https://www.rust-lang.org/tools/install)
  * curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    * [run rustup's curl-fetched installer script non-interactively](https://stackoverflow.com/questions/57251508/run-rustups-curl-fetched-installer-script-non-interactively)
    * [Pass args for script when going thru pipe](https://stackoverflow.com/questions/14693100/pass-args-for-script-when-going-thru-pipe)
    * Unattended Install: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  * Add to $PATH: `source "$HOME/.cargo/env"`
  * Check rustc version: `rustc --version`
  * Check cargo version: `cargo --version`
  * LunarVim installation shows error: Unable to find cargo. Make sure to install it to avoid problems.
  * [Create Symlink](https://stackoverflow.com/questions/1951742/how-can-i-symlink-a-file-in-linux)
    * sudo ln -s ~/.cargo/bin/rustc /usr/bin/rustc
    * sudo ln -s ~/.cargo/bin/cargo /usr/bin/cargo
    * sudo ln -s ~/.cargo/bin/rustup /usr/bin/rustup
    * sudo rustup default stable
  * `sudo apt install build-essential` [linking with `cc` failed: exit code: 1](https://www.reddit.com/r/rust/comments/i4jlbi/linking_with_cc_failed_exit_code_1/)

* Install dependencies: `sudo apt install gcc build-essential git make python3 python3-pip nodejs npm rustc cargo`

* [LunarVim Installation](https://www.lunarvim.org/docs/installation)
  * LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
    * Add to PATH
    * [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
      * echo 'export PATH=/home/<uer-name>/.local/bin:$PATH' >> ~/.bashrc
      * source ~/.bashrc
    * Alternative Way: [How to create a symbolic link in Linux](https://linuxhint.com/create-symbolic-link-linux/)
      * sudo ln -s ~/.local/bin/lvim /usr/bin/lvim

* Install nerd font
  * [Configure nerd fonts](https://www.lunarvim.org/docs/configuration/nerd-fonts)
  * git clone https://github.com/ronniedroid/getnf.git
  * cd getnf
  * Install fonts in "~/.local/share/fonts" directory.
  * ./install.sh [If it does not work, use command: `./getnf`] [Don't use "sudo", as it install fonts in "/root/.local/share/fonts" user directory] [If shows error, check line-endings are in Linux Line-Feed]
  * Error message: fzf: command not found
  * sudo apt install fzf
  * Choose "Hack" font.
  * Restart PC if font is not showing in xfce4-terminal settings.
  * Open xfce4-terminal -> Edit -> Preferences -> Appearance -> Font -> Select "Hack NF Regular"

### Error and Solution (Antix-OS)
* Error: this version of Cargo is older than the `2021` edition, and only supports `2015` and `2018` editions.
  * [How to fix "this version of Cargo is older than the `2021` edition" error?](https://stackoverflow.com/questions/74697023/how-to-fix-this-version-of-cargo-is-older-than-the-2021-edition-error)
  * The recommended way to install and maintain a Rust toolchain is with [Rustup](https://rustup.rs/).
  * sudo apt remove rust
  * sudo apt remove cargo
  * curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  * To configure your current shell, run: source "$HOME/.cargo/env"
  * rustc --version
  * cargo --version
  * Rust and Cargo not in path

* This command shows "Permission Denied Error": `LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)`
  * Install this way
  * export LV_BRANCH='release-1.2/neovim-0.8'
  * echo $LV_BRANCH
  * wget https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh
  * bash install.sh

* Error message: [WARN]: skipping installing optional nodejs dependencies due to insufficient permissions.
  * [Permission denied when installing npm modules in OSX](https://stackoverflow.com/questions/47252451/permission-denied-when-installing-npm-modules-in-osx)
  * Make a directory for global installations: `mkdir ~/.npm-global`
  * Configure npm to use the new directory path: `npm config set prefix '~/.npm-global'`
  * Open or create a ~/.profile file and add this line: `export PATH=~/.npm-global/bin:$PATH`
  * Back on the command line, update your system variables: `source ~/.profile`
  
* Error message: bash ./utils/installer/install_bin.sh : invalid option nametall_bin.sh: line 2: set: pipefail
  * Reason: this problem happens, when git line ending set to Windows-OS line endings (CR/LF).
  * Problem Reason Git Settings: `git config --global core.autocrlf true`
  * [Git status ignore line endings / identical files / windows & linux environment / dropbox / meld](https://stackoverflow.com/questions/20496084/git-status-ignore-line-endings-identical-files-windows-linux-environment)
  * Solution:
    * [Start up script fails with error "-e: invalid option", what is missing?](https://stackoverflow.com/questions/42095374/start-up-script-fails-with-error-e-invalid-option-what-is-missing)
    * Change line ending to Unix (LF) for this file: `~/.local/share/lunarvim/lvim/utils/installer/install.sh` using Geany editor.
    * Execute script: `bash ~/.local/share/lunarvim/lvim/utils/installer/install.sh`
  * Another Solution: Temporarily disable Windows-OS line endings during LunarVim installation: `git config --global core.autocrlf false`

## Ubuntu22.04-Vagrant-Installation

### Setup Vagrant
* vagrant init bento/ubuntu-22.04
* vagrant up
* vagrant ssh
* sudo apt update

### Install LunarVim Dependencies
* Install gcc, make, build-essential
  * sudo apt install gcc make build-essential
  * Check gcc version: `gcc --version`
  * Check make version: `make --version`
  * Check build-essential version: `build-essential --version`

* Install neovim latest version
  * ~~sudo apt install neovim [This installs neovim (NVIM v0.6.1), which is not compatible with LunarVim]~~
  * [Neovim Installation Guide](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)
  * Download latest Neovim from [Neovim GitHub Repo](https://github.com/neovim/neovim).
  * Download Neovim AppImage: `wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage`
  * Make it executable for all user `chmod a+x ./nvim.appimage`
  * `sudo mv nvim.appimage /usr/bin/nvim`
  * Error message: AppImages require FUSE to run.
  * [How to install safely install fuse on Ubuntu 22.04?](https://askubuntu.com/questions/1409496/how-to-install-safely-install-fuse-on-ubuntu-22-04)
  * sudo apt install fuse
  * Check version: `nvim --version`
  
* Install git
  * For general-old version: sudo apt install git
  
* Install python3 and python3-pip
  * sudo apt install python3 [Check version: `python3 --version`]
  * sudo apt install python3-pip [Check version: `pip --version`]
  
* Install nodejs and npm
  * ~~sudo apt install nodejs npm [Installs old version]~~
  * [How to install the latest Node.js on Linux?](https://linuxhint.com/how-to-install-latest-node-js-on-linux/) || [nodesource/distributions](https://github.com/nodesource/distributions)
  * curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs
  * Check node version: `node --version`
  * Check npm version: `npm --version`

* Install rustc (rust language) and cargo (rust package manager)
  * ~~sudo apt install rustc cargo [Installs old version]~~
  * [Install Rust](https://www.rust-lang.org/tools/install)
  * curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  * Check rustc version: `rustc --version`
  * Check cargo version: `cargo --version`
  * LunarVim installation shows error: Unable to find cargo. Make sure to install it to avoid problems.
  * [Create Symlink](https://stackoverflow.com/questions/1951742/how-can-i-symlink-a-file-in-linux)
  * sudo ln -s ~/.cargo/bin/rustc /usr/bin/rustc
  * sudo ln -s ~/.cargo/bin/cargo /usr/bin/cargo
  * sudo ln -s ~/.cargo/bin/rustup /usr/bin/rustup
  * sudo rustup default stable
  * `sudo apt install build-essential` [linking with `cc` failed: exit code: 1](https://www.reddit.com/r/rust/comments/i4jlbi/linking_with_cc_failed_exit_code_1/)

* ~~Install dependencies: `sudo apt install gcc make build-essential git python3 python3-pip nodejs npm rustc cargo`~~

* [LunarVim Installation](https://www.lunarvim.org/docs/installation)
  * This command shows "Permission Denied Error": `LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)`
  * Install this way
  * export LV_BRANCH='release-1.2/neovim-0.8'
  * echo $LV_BRANCH
  * wget https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh
  * bash install.sh
  * Error message: [WARN]: skipping installing optional nodejs dependencies due to insufficient permissions.
    * [Permission denied when installing npm modules in OSX](https://stackoverflow.com/questions/47252451/permission-denied-when-installing-npm-modules-in-osx)
    * Make a directory for global installations: `mkdir ~/.npm-global`
    * Configure npm to use the new directory path: `npm config set prefix '~/.npm-global'`
    * Open or create a ~/.profile file and add this line: `export PATH=~/.npm-global/bin:$PATH`
    * Back on the command line, update your system variables: `source ~/.profile`
  * sudo ln -s ~/.local/bin/lvim /usr/bin/lvim

* Install nerd font on Host PC
  * [Configure nerd fonts](https://www.lunarvim.org/docs/configuration/nerd-fonts)
  * git clone https://github.com/ronniedroid/getnf.git
  * cd getnf
  * Install fonts in "~/.local/share/fonts" directory.
  * ./install.sh [If it does not work, use command: `./getnf`] [Don't use "sudo", as it install fonts in "/root/.local/share/fonts" user directory] [If shows error, check line-endings are in Linux Line-Feed]
  * Error message: fzf: command not found
  * sudo apt install fzf
  * Choose "Hack" font.
  * Restart PC if font is not showing in xfce4-terminal settings.
  * Open xfce4-terminal -> Edit -> Preferences -> Appearance -> Font -> Select "Hack NF Regular"

## Alpine317-Vagrant-Installation

### Setup Vagrant
* Note: Choose latest version of Alpine-OS to install latest software versions. If required choose "EDGE" repository.
* vagrant init generic/alpine317
* vagrant up
* vagrant ssh
* sudo apk update

### Install LunarVim Dependencies
* Install gcc, make, build-base [Equivalents of "build-essential"]
  * sudo apk add gcc make build-base
  * Check gcc version: `gcc --version`
  * Cehck make version: `make --version`
  * [What is the equivalent packages build-essential and linux-headers-<xxxx> in alpine?](https://unix.stackexchange.com/questions/689899/what-is-the-equivalent-packages-build-essential-and-linux-headers-xxxx-in-alpi)

* Install neovim
  * sudo apk add neovim
  * Check neovim version: `nvim --version`

* Install git
  * sudo apk add git
  * Check git version: `git --version`

* Install python3 and py3-pip[Equivalents of "python3-pip"]
  * [How do I install python on alpine linux?](https://stackoverflow.com/questions/62554991/how-do-i-install-python-on-alpine-linux)
  * sudo apk add python3 py3-pip
  * Check python3 version: `python3 --version`
  * Check py3-pip version: `pip --version`

* Install nodejs and npm
  * [How to install npm in alpine linux](https://superuser.com/questions/1125969/how-to-install-npm-in-alpine-linux)
  * sudo apk add nodejs npm
  * Check nodejs version: `node --version`
  * Check npm version: `npm --version`

* Install rust (equivalent of "rustc") and cargo (rust package manager)
  * sudo apk add rust cargo
  * Check rustc version: `rustc --version`
  * Check cargo version: `cargo --version`

* [LunarVim Installation](https://www.lunarvim.org/docs/installation)
  * This command shows "Permission Denied Error": `LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)`
  * Install this way
  * export LV_BRANCH='release-1.2/neovim-0.8'
  * echo $LV_BRANCH
  * wget https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh
  * bash install.sh
  * Error message: [WARN]: skipping installing optional nodejs dependencies due to insufficient permissions.
    * [Permission denied when installing npm modules in OSX](https://stackoverflow.com/questions/47252451/permission-denied-when-installing-npm-modules-in-osx)
    * Make a directory for global installations: `mkdir ~/.npm-global`
    * Configure npm to use the new directory path: `npm config set prefix '~/.npm-global'`
    * Open or create a ~/.profile file and add this line: `export PATH=~/.npm-global/bin:$PATH`
    * Back on the command line, update your system variables: `source ~/.profile`
  * sudo ln -s ~/.local/bin/lvim /usr/bin/lvim

* Install nerd font on Host PC
  * [Configure nerd fonts](https://www.lunarvim.org/docs/configuration/nerd-fonts)
  * git clone https://github.com/ronniedroid/getnf.git
  * cd getnf
  * Install fonts in "~/.local/share/fonts" directory.
  * ./install.sh [If it does not work, use command: `./getnf`] [Don't use "sudo", as it install fonts in "/root/.local/share/fonts" user directory] [If shows error, check line-endings are in Linux Line-Feed]
  * Error message: fzf: command not found
  * sudo apt install fzf
  * Choose "Hack" font.
  * Restart PC if font is not showing in xfce4-terminal settings.
  * Open xfce4-terminal -> Edit -> Preferences -> Appearance -> Font -> Select "Hack NF Regular"

# Configuration

## UTF-8 Configure
* Error: Locale does not support UTF-8. Unicode characters may not display correctly.

* SCRIPT-WAY
* [How to install/change locale on Debian?](https://serverfault.com/questions/54591/how-to-install-change-locale-on-debian)
  * Shows all installed locales: `locale -a`
  * Install locales package: `apt-get install -y locales`
  * Uncomment en_US.UTF-8 for inclusion in generation: `sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen`
  * Generate locale: `locale-gen`
  * Export env vars
    * `echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc`
    * `echo "export LANG=en_US.UTF-8" >> ~/.bashrc`
    * `echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc`
  * For the env vars to take effect immediately: `source ~/.bashrc`

* INTERACTIVE-WAY
* [apt-get warning: No support for locale: en_US.utf8](https://askubuntu.com/questions/99651/apt-get-warning-no-support-for-locale-en-us-utf8)
* [How-to fix "Warning: No support for locale: en_US.utf"](https://gist.github.com/vordan/d8f2b1f5c39352b9ff40c61cc617da6d)
  * `apt install locales`
  * `dpkg-reconfigure locales`
  * `update-locale LANG=en_US.UTF-8`
* [UTF-8 character not showing properly in tmux](https://askubuntu.com/questions/410048/utf-8-character-not-showing-properly-in-tmux)
  * CONTINUE --
  * But we can also set the below to the profile rc (e.g. .zshrc or bashrc) file
    * `export LC_ALL=en_IN.UTF-8`
    * `export LANG=en_IN.UTF-8`
    * This works only if pasted above: `source ~/.bashrc`

## Guides (Configuration)
* UTF-8 Locale
  * [UTF-8 character not showing properly in tmux](https://askubuntu.com/questions/410048/utf-8-character-not-showing-properly-in-tmux)
  * [Tmux doesn't render some symbols properly](https://askubuntu.com/questions/1038351/tmux-doesnt-render-some-symbols-properly)

# References

* Neovim
  * [How do I enable the mouse in nvim please?](https://www.reddit.com/r/neovim/comments/yt5ejm/how_do_i_enable_the_mouse_in_nvim_please/)
  * [Netrw Cheatsheet (Vim's File Browser)](https://gist.github.com/seanh/3c32f6d4f1e27669c4d8a1d3ce3c215b)
