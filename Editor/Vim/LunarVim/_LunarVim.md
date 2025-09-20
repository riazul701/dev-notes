# Contents of LunarVim

## Websites

* [lunarvim.org](https://www.lunarvim.org/)
* [LunarVim/LunarVim](https://github.com/lunarvim/lunarvim)
* [nerdfonts.com](https://www.nerdfonts.com/) || [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
* [getnf/getnf](https://github.com/getnf/getnf)

* Debug
  * [LunarVim/starter.lvim GitHub => Check git branches for various IDE setup for debugging](https://github.com/LunarVim/starter.lvim) <sup>{52}</sup>

* LunarVim-VSCode
  * {Selected} [LunarVim/vscode/settings.vim](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/vscode/settings.vim) <sup>{36}</sup>
  * {Selected} [LunarVim/utils/vscode_config/](https://github.com/LunarVim/LunarVim/tree/4625145d0278d4a039e55c433af9916d93e7846a/utils/vscode_config) <sup>{36}</sup>
  * [MohamedIrfanAM/neovim-windows GitHub](https://github.com/MohamedIrfanAM/neovim-windows) <sup>{36}: Comment: @mohamedirfan2816</sup>
  * {Selected} [vscode-neovim/vscode-neovim](https://github.com/vscode-neovim/vscode-neovim) || [VSCode Neovim BY Alexey Svetliakov](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) <sup>{36}</sup>
  * {Selected} [VSpaceCode/vscode-which-key](https://github.com/VSpaceCode/vscode-which-key) || [Which Key BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey) <sup>{36}</sup>
  * Reference
    * [fathulfahmy/lunarkeymap](https://github.com/fathulfahmy/lunarkeymap) || [LunarKeymap BY Patui](https://marketplace.visualstudio.com/items?itemName=fathulfahmy.lunarkeymap)
    * [LunarVim VSCode Config: colinaaa/keybindings.json](https://gist.github.com/colinaaa/3376dc543f1ca9b10ee3f99b98c4fe0e)
    * [JrSchmidtt/lunar-vscode-theme](https://github.com/JrSchmidtt/lunar-vscode-theme) || [LunarVim Dark Theme BY Junior Schmidt](https://marketplace.visualstudio.com/items?itemName=JuniorSchmidt.lunar-vscode-theme)

## Notes

* `:checkhealth` : Shows installation is ok or not

* Keyboard
  * Press "TAB" key after ":" to auto-complete commands.

* Conflicts
  * (Windows-OS) Scoop installed "ruby, gem" conflicts with Git-Bash installed "ruby, gem". For this reason "tmuxinator" does not work. So intall "ruby" only inside Git-Bash. And use LunarVim inside Bash.

## PATH

**Windows-OS**

* Configuration(plugins) file: C:\Users\<user-name>\AppData\Local\lvim
* Installed plugins: C:\Users\<user-name>\AppData\Roaming\lunarvim
* LunarVim binary: C:\Users\<user-name>\.local\bin\lvim.ps1
* PowerShell profile: C:\Users\<user-name>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

**Linux-OS**

* LunarVim executable file: `/home/<user-name>/.local/bin`
  * [Using "${a:-b}" for variable assignment in scripts](https://unix.stackexchange.com/questions/122845/using-a-b-for-variable-assignment-in-scripts)
  * [What does $@ mean in a shell script?](https://stackoverflow.com/questions/9994295/what-does-mean-in-a-shell-script)
  
* User configuration file: `/home/<user-name>/.config/lvim/config.lua` [On LunarVim dashboard, press "c" to edit this file]
* Installed plugins folder: `/home/<user-name>/.local/share/lunarvim/site/pack/lazy/opt/`
* Plugins doc files: `/home/<user-name>/.local/share/lunarvim/lazy/readme/doc/`
* LunarVim GitHub repository: `/home/<user-name>/.local/share/lunarvim/lvim/`
* Cache folder: `/home/<user-name>/.cache/lvim/`
* Fonts folder: `/home/<user-name>/.local/share/fonts/`
* "mason" language server: `/home/<user-name>/.local/share/lvim/mason/packages`
* Node.js packages path (using Node-Version-Manager): `/home/<user-name>/.npm-global/lib/node_modules/neovim/`

**Nix-Lunarvim**

* If Lunvarvim is installed using Nix package manager, Lunarvim github repo is stored in "/nix/store/{{get folder name from file's last line: /home/user-name/.nix-profile/bin/lvim}}" path.

# Installation

## General/Common

### {7} [Resolve EACCES permissions when installing packages globally](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)

* {8} [Downloading and installing Node.js and npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

* Reinstall npm with a node version manager (recommended)
    * OSX or Linux Node version managers: [nvm-sh/nvm](https://github.com/nvm-sh/nvm)
    * Windows Node version managers: [coreybutler/nvm-windows](https://github.com/coreybutler/nvm-windows)

* Manually change npm's default directory
  * If you are unable to use a Node version manager, you can use a Node installer to install both Node.js and npm on your system.
  * [Node.js installer](https://nodejs.org/en/download/package-manager)
  * [NodeSource installer](https://github.com/nodesource/distributions)

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

## Linux Installation

* Checked On Debian-Based Linux-OS: Ubuntu-24.04 Desktop, Lubuntu-24.04 Desktop, Ubuntu-22.04 Server, Ubuntu22.04-Vagrant, AntixOS-21, AntixOS-22

### Install Instruction (Ubuntu/Antix)

* Install "neovim"
  * [Neovim Installation Guide](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)
  * Using APT (Old Version)
    * `sudo apt install neovim`
  * Using AppImage (Latest Version)
    * `wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage` (Select required Neovim version)
    * Make it executable for all user `chmod a+x ./nvim.appimage`
    * Move to executable path: `sudo mv nvim.appimage /usr/bin/nvim`
    * **(Ubuntu-24.04)** Error_1: "dlopen(): error loading libfuse.so.2 AppImages require FUSE to run."
    * **(Ubuntu-24.04)** Solution_1: `sudo apt-get install fuse libfuse2` <sup>{13}</sup>
  * Using TAR (Latest Version) <sup>{14}</sup>
    * `wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz` [Select required Neovim version]
    * Extract: `tar xzvf nvim-linux64.tar.gz`
    * Move to path: `sudo mv nvim-linux64 /opt/`
    * Add to $PATH: `echo 'export PATH=/opt/nvim-linux64/bin:$PATH' >> ~/.bashrc`
    * Reload $PATH: `source ~/.bashrc`
  * Check version: `nvim --version`

* **(Ubuntu, Lubuntu)**: Install "git" latest version
  *  Using APT and PPA (latest version) <sup>{14}</sup>
    * `sudo add-apt-repository ppa:git-core/ppa`
    * `sudo apt update`
    * `sudo apt install git`
  * Using APT (old version)
    * `sudo apt install git`
  * Check version: `git --version`

* **(AntixOS-21, AntixOS-22)**: Install "git" latest version
  * [About Backports](https://backports.debian.org/Instructions/)
  * `sudo apt install git/bullseye-backports` [Check version: `git --version`]
  * For general-old version: `sudo apt install git`

* Install "lazygit"
  * [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)
  * `LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')`
  * `curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"`
  * `tar xf lazygit.tar.gz lazygit`
  * `sudo install lazygit /usr/local/bin`
  * Check version: `lazygit --version`

* Install "python3" and "python3-pip"
  * `sudo apt install python3 python3-pip`
  * Check python3 version: `python3 --version`
  * Check pip/pip3 version: `pip --version` || `pip3 --version`

* Install "nodejs" and "npm" <sup>{7} {8} {9}</sup>
  * {9} [nvm-sh/nvm](https://github.com/nvm-sh/nvm)
  * Install nvm: `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash` [Insert latest NVM version]
  * Reload $PATH: `source ~/.bashrc`
  * Check nvm is installed: `command -v nvm`
  * Check nvm version: `nvm --version`
  * Install nodejs-lts: `nvm install --lts`
  * Check nodejs version: `node --version`
  * Check npm version: `npm --version`

* Install "rustc" (rust language) and "cargo" (rust package manager)
  * {16} [Install Rust](https://www.rust-lang.org/tools/install)
  * Install Rust: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
    * Unattended Install: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y` <sup>{17} {18}</sup>
  * Reload $PATH: `source ~/.bashrc`
  * Check rustc version: `rustc --version` [`sudo` command does not work]
  * Check cargo version: `cargo --version`
  * Check rustup version: `rustup --version`
  * LunarVim installation shows error: Unable to find cargo. Make sure to install it to avoid problems. <sup>{19}</sup>
    * `sudo ln -s ~/.cargo/bin/rustc /usr/bin/rustc`
    * `sudo ln -s ~/.cargo/bin/cargo /usr/bin/cargo`
    * `sudo ln -s ~/.cargo/bin/rustup /usr/bin/rustup`
    * `sudo rustup default stable`

* Install other dependencies
  * `sudo apt install build-essential` <sup>{20}</sup>
  * Check build-essential version: `build-essential --version`
  * `sudo apt install gcc make ripgrep`
  * Check gcc version: `gcc --version`
  * Check make version: `make --version`
  * Check ripgrep version: `rg --version`

* Install nerd font on Host-PC<sup>{21}</sup>
  * Install fzf: `sudo apt install fzf`
  * `git clone https://github.com/ronniedroid/getnf.git`
  * `cd getnf`
  * Install fonts in "~/.local/share/fonts" directory.
  * ./install.sh [If it does not work, use command: `./getnf`] [Don't use "sudo", as it install fonts in "/root/.local/share/fonts" user directory] [If shows error, check line-endings are in Linux Line-Feed]
  * Choose "Hack" font.
  * Restart PC if font is not showing in xfce4-terminal settings.
  * Open xfce4-terminal -> Edit -> Preferences -> Appearance -> Font -> Select "Hack NF Regular"

* [LunarVim Installation](https://www.lunarvim.org/docs/installation)
  * Install LunarVim: `LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)` [Insert latest Neovim branch]
    * Add to PATH <sup>{22}</sup>
      * `echo 'export PATH=/home/<user-name>/.local/bin:$PATH' >> ~/.bashrc`
      * Relaod $PATH: `source ~/.bashrc`
    * Alternative Way: Create Symbolic Link<sup>{23}</sup>
      * sudo ln -s ~/.local/bin/lvim /usr/local/bin/lvim
  * Open `lvim` and enter command `:checkhealth` to check everything is properly installed.

### Error and Solution

**ERROR_1: This environment is externally managed** 

* Message_1:
> This environment is externally managed
> To install Python packages system-wide, try apt install
> python3-xyz, where xyz is the package you are trying to
> install.
>   
> If you wish to install a non-Debian-packaged Python package,
> create a virtual environment using python3 -m venv path/to/venv.
> Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
> sure you have python3-full installed.
>  
> If you wish to install a non-Debian packaged Python application,
> it may be easiest to use pipx install xyz, which will manage a
> virtual environment for you. Make sure you have pipx installed.
>  
> See /usr/share/doc/python3.12/README.venv for more information.

* Solution_1:
  * [instalation error: externally-managed-environment PEP 668 #4050](https://github.com/LunarVim/LunarVim/issues/4050)
    * Just install pynvim using apt `sudo apt install python3-pynvim`. No plugins from lunarvim require it.

* Solution_2:
  * [pip error on Ubuntu: externally-managed-environment × This environment is externally managed](https://askubuntu.com/questions/1465218/pip-error-on-ubuntu-externally-managed-environment-%c3%97-this-environment-is-extern)
  * [How do I solve "error: externally-managed-environment" every time I use pip 3? [closed]](https://stackoverflow.com/questions/75608323/how-do-i-solve-error-externally-managed-environment-every-time-i-use-pip-3)
  * This Issue started from Python-3.11+

* ERROR after enabling python virtual-env: `Can not perform a '--user' install. User site-packages are not visible in this virtualenv.`

**ERROR_2: Waiting for cache lock**

  * Message_2:
  > Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 3500 (unattended-upgr)...
  
  * Solution_2:
    * [How to Fix 'E: Could not get lock /var/lib/dpkg/lock' Error in Ubuntu Linux](https://itsfoss.com/could-not-get-lock-error/)
    * ps aux | grep <process-id>
    * sudo kill <process-id>
    * sudo kill -9 <process_id>
    * sudo killall apt apt-get

**ERROR_3: skipping installing optional nodejs dependencies due to insufficient permissions**

* Message_3:
  > [WARN]: skipping installing optional nodejs dependencies due to insufficient permissions.

* Solution_3:
  * [Permission denied when installing npm modules in OSX](https://stackoverflow.com/questions/47252451/permission-denied-when-installing-npm-modules-in-osx)
  * Make a directory for global installations: `mkdir ~/.npm-global`
  * Configure npm to use the new directory path: `npm config set prefix '~/.npm-global'`
  * Open or create a ~/.profile file and add this line: `export PATH=~/.npm-global/bin:$PATH`
  * Back on the command line, update your system variables: `source ~/.profile`
  
**ERROR_4: rustup could not choose a version of rustc to run**

* Message_4:
  > error: rustup could not choose a version of rustc to run, because one wasn't
  > specified explicitly, and no default is configured.
  > help: run 'rustup default stable' to download the latest stable release of 
  > Rust and set it as your default toolchain.

* Solution_4:
  * `rustup default stable` <sup>{19}</sup>

**ERROR_5**

* Message_5: 
  > bash ./utils/installer/install_bin.sh : invalid option nametall_bin.sh: line 2: set: pipefail
  > 
  > * Reason: this problem happens, when git line ending set to Windows-OS line endings (CR/LF).
  > * Problem Reason Git Settings: `git config --global core.autocrlf true`

* Solution_5:
  * [Git status ignore line endings / identical files / windows & linux environment / dropbox / meld](https://stackoverflow.com/questions/20496084/git-status-ignore-line-endings-identical-files-windows-linux-environment)
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

* next-sl: {54}

## Tutorials
  
* chris@machine - LunarVim Maintainer
  * {1} [YouTube - chris@machine](https://www.youtube.com/@chrisatmachine)
  * {2} [Odysee - chris@machine](https://odysee.com/@chrisatmachine:f)
  * {3} [Medium - chris@machine](https://medium.com/@chrisatmachine)
  * {4} [Website - chris@machine](https://www.chrisatmachine.com/)
  * {5} [GitHub - chris@machine](https://github.com/ChristianChiarulli)
  * {6} [TwitchTV - chris@machine](https://www.twitch.tv/chrisatmachine)

## Guides

* Configuration
  * {37} [How To Setup LunarVim in Windows](https://medium.com/@peterhaddad/how-to-setup-lunarvim-in-windows-9df9bd220889)

* Clipboard
  * {38} [How to support clipboard for NeoVim](https://discourse.nixos.org/t/how-to-support-clipboard-for-neovim/9534)
  * {39} [NeoVim Providers](https://neovim.io/doc/user/provider.html)
  * {40} [How to use the Windows clipboard from WSL?](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)
  * {41} [vim-system-copy](https://github.com/christoomey/vim-system-copy)
  * {42} [Copy("+y)/pasting("+p) to/from system clipboard not working.](https://www.reddit.com/r/neovim/comments/xajsgk/copyypastingp_tofrom_system_clipboard_not_working/)
  * {43} [How to install neovim with +clipboard extension?](https://vi.stackexchange.com/questions/29285/how-to-install-neovim-with-clipboard-extension)
  * {44} [vim + COPY + mac over SSH](https://stackoverflow.com/questions/10694516/vim-copy-mac-over-ssh)
  * {45} [How to copy and paste with a clipboard in Tmux](https://linuxhint.com/copy-paste-clipboard-tmux/)
  * {46} [Forwarding copy to clipboard from dev container to Windows Host](https://stuartleeks.com/posts/vscode-devcontainer-clipboard-forwarding/)
  * {47} [Accessing the system clipboard](https://vim.fandom.com/wiki/Accessing_the_system_clipboard)
  * {48} [How to x11 Forward with Putty on Windows](https://www.youtube.com/watch?v=-oanqpf0xak)
  * {49} [Clipboard over SSH with Vim](https://defuse.ca/blog/clipboard-over-ssh-with-vim.html)
  * {50} [jedisct1/piknik GitHub](https://github.com/jedisct1/piknik)
  * {51} [wincent/clipper GitHub](https://github.com/wincent/clipper)

## Installation

* General/Common
  * {7} [Resolve EACCES permissions when installing packages globally](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)
  * {8} [Downloading and installing Node.js and npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
  * {9} [nvm-sh/nvm](https://github.com/nvm-sh/nvm)
  * {10} [coreybutler/nvm-windows](https://github.com/coreybutler/nvm-windows)
  * {11} [Node.js installer](https://nodejs.org/en/download/package-manager)
  * {12} [NodeSource installer](https://github.com/nodesource/distributions)

* Lubuntu-24.04/Ubuntu-24.04 Installation
  * {13} [Can't run an AppImage on Ubuntu 20.04](https://askubuntu.com/questions/1363783/cant-run-an-appimage-on-ubuntu-20-04)
  * {14} [Neovim Releases v0.10.0](https://github.com/neovim/neovim/releases/tag/v0.10.0)
  * {15} [How to Install Latest Git Version on Ubuntu](https://itsfoss.com/install-git-ubuntu/)
  * {16} [Install Rust](https://www.rust-lang.org/tools/install)
  * {17} [run rustup's curl-fetched installer script non-interactively](https://stackoverflow.com/questions/57251508/run-rustups-curl-fetched-installer-script-non-interactively)
  * {18} [Pass args for script when going thru pipe](https://stackoverflow.com/questions/14693100/pass-args-for-script-when-going-thru-pipe)
  * {19} [Create Symlink](https://stackoverflow.com/questions/1951742/how-can-i-symlink-a-file-in-linux)
  * {20} [linking with `cc` failed: exit code: 1](https://www.reddit.com/r/rust/comments/i4jlbi/linking_with_cc_failed_exit_code_1/)
  * {21} [Configure nerd fonts](https://www.lunarvim.org/docs/configuration/nerd-fonts)
  * {22} [How to Add a Path Permanently in Linux](https://linuxhint.com/add-path-permanently-linux/)
  * {23} [How to create a symbolic link in Linux](https://linuxhint.com/create-symbolic-link-linux/)
  * {24} [Neovim Installation Guide](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)
  * {25} [How to install safely install fuse on Ubuntu 22.04?](https://askubuntu.com/questions/1409496/how-to-install-safely-install-fuse-on-ubuntu-22-04)
  * {26} [How to install the latest Node.js on Linux?](https://linuxhint.com/how-to-install-latest-node-js-on-linux/)
  * {27} [Permission denied when installing npm modules in OSX](https://stackoverflow.com/questions/47252451/permission-denied-when-installing-npm-modules-in-osx)

* Neovim
  * {28} [How do I enable the mouse in nvim please?](https://www.reddit.com/r/neovim/comments/yt5ejm/how_do_i_enable_the_mouse_in_nvim_please/)
  * {29} [Netrw Cheatsheet (Vim's File Browser)](https://gist.github.com/seanh/3c32f6d4f1e27669c4d8a1d3ce3c215b)

## YouTube Tutorials

* General
  * {30} [LunarVim BY chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6)
  * {31} [LunarVim (IDE for Neovim) BY chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6QoYP4bKw0krF4aEn_3_pfWA)
  * {32} [Neovim from Scratch BY chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
  * {33} [Neovim BY chris@machine](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg)
  * {34} [LunarVim/Neovim - Debugging Demo | Java, Python, Rust, Go, Javascript BY chris@machine](https://www.youtube.com/watch?v=5KQK2id3JtI)

* Plugings
  * {35} [indent-blankline - Weekly Neovim Plugin BY CantuCodes](https://www.youtube.com/watch?v=4iPiYljl2RY)

* VSCode Neovim
  * {36} [VSCode with embedded Neovim BY chris@machine](https://www.youtube.com/watch?v=g4dXZ0RQWdw)

* Debug
  * {52} [LunarVim/Neovim - Debugging Demo | Java, Python, Rust, Go, Javascript BY chris@machine](https://www.youtube.com/watch?v=5KQK2id3JtI)
  * {53} [LunarVim | Debugging & Testing Python Setup BY chris@machine](https://www.youtube.com/watch?v=onu_upaLKo4)
