#!/bin/bash

# Do Not Run This Script Using `sudo`

# Issue: `sudo` timeout after 15 minutes. Make it longer.
# Issue: Error: Unmet dependencies. Try 'apt --fix-broken install' with no packages (or specify a solution).

# In SparkyLinux Testing Branch / (Semi-)Rolling
# Snap does not add software to $PATH and Menu.
# Add Snap to PATH: `echo 'export PATH="/snap/bin:$PATH"' >> ~/.bashrc` --OR-- `echo 'export PATH="/snap/bin:$PATH"' >> ~/.profile`
# Reload "~/.bashrc" OR "~/.profile": `source ~/.bashrc` --OR-- `source ~/.profile`
# Flatpak does not add software to $PATH, but adds to Menu. 
# Nix adds software to $PATH (instant) and Menu (after logout/restart).
# Clear Snap Cache: sudo sh -c 'rm -rf /var/lib/snapd/cache/*'
# Clear Flatpak Cache: flatpak remove --unused
# Clear Nix Cache: nix-collect-garbage

declare -A snap_softwares_all
declare -A snap_office_softwares
declare -A snap_home_softwares
declare -A flatpak_softwares_all
declare -A flatpak_office_softwares
declare -A flatpak_home_softwares
declare -A nix_softwares_all
declare -A nix_office_softwares
declare -A nix_home_softwares
declare -A brew_softwares_all
declare -A brew_office_softwares
declare -A brew_home_softwares
declare -A apt_softwares_all
declare -A apt_office_softwares
declare -A apt_home_softwares
declare -A deb_softwares_all
declare -A deb_office_softwares
declare -A deb_home_softwares
declare -a appimage_softwares_all
declare -a tar_softwares_all
download_path="/home/$USER/Downloads/Debian_Software"

snap_office_softwares=(
    ["chezmoi"]="chezmoi --classic"
    ["sublime-text"]="sublime-text --classic"
    # ["postman"]="postman"
    # ["dbeaver-ce"]="dbeaver-ce"
    # ["sublime-merge"]="sublime-merge --classic"
    # ["powershell"]="powershell --classic"
    # ["dvc"]="dvc --classic"
    # ["lepton"]="lepton"
    # ["trello-desktop"]="trello-desktop"
    # ["clipboard"]="clipboard --edge"
    # ["mysql-workbench-community"]="mysql-workbench-community"
    # ["ngrok"]="ngrok"
    # ["android-studio"]="android-studio --classic"
    # ["dive"]="dive" # Docker
)

snap_home_softwares=(
    # ["spotify"]="spotify"
    # ["spt"]="spt --edge" # Spotify TUI: https://github.com/Rigellute/spotify-tui
    # ["scrcpy"]="scrcpy"
    # ["guiscrcpy"]="guiscrcpy"
)

flatpak_office_softwares=(
    ["wezterm"]="org.wezfurlong.wezterm"
    # ["FreeFileSync"]="org.freefilesync.FreeFileSync"
    # ["anydesk"]="com.anydesk.Anydesk"
    # ["podman_desktop"]="io.podman_desktop.PodmanDesktop"
    # ["boxbuddyrs"]="io.github.dvlv.boxbuddyrs"
    # ["smartgit"]="com.syntevo.SmartGit"
    ["NotepadNext"]="com.github.dail8859.NotepadNext"
)

flatpak_home_softwares=(
    # ["spotube"]="com.github.KRTirtho.Spotube"
)

nix_office_softwares=(
    ["yazi"]="yazi"
    ["lazygit"]="lazygit" # For Lunarvim
    ["unison"]="unison"
    ["termscp"]="termscp"
    ["dasel"]="dasel"
    ["gum"]="gum"
    # ["nerdfonts"]="nerdfonts" # For Lunarvim, Yazi
    # ["lazydocker"]="lazydocker"
    # ["beebeep"]="beebeep"
    # ["backrest"]="backrest"
    # ["frogmouth"]="frogmouth"
    # ["httpie-desktop"]="httpie-desktop"
    # ["czkawka"]="czkawka"
    # ["piknik"]="piknik"
)

nix_home_softwares=(
    # ["rclone-browser"]="rclone-browser"
    # ["musikcube"]="musikcube"
    # ["sniffnet"]="sniffnet"
    # ["ventoy-full"]="ventoy-full"
    # ["veracrypt"]="veracrypt"
)

brew_office_softwares=(
    # ["neovim"]="neovim"
)

brew_home_softwares=(
    # ["lazydocker"]="lazydocker"
)

apt_office_softwares=(
    ["kitty"]="kitty"
    ["keepassxc"]="keepassxc-full"
    ["firefox-sparky"]="firefox-sparky"
    # ["chromium"]="chromium"
    # ["opera"]="opera-stable"
    # ["thunderbird"]="thunderbird"
    # ["ibus-avro"]="ibus-avro"
    # ["libreoffice"]="libreoffice"
    # ["docker"]="docker"
    # ["docker.io"]="docker.io"
    # ["docker-compose"]="docker-compose"
    # ["podman"]="podman"
    ["git"]="git" # For Lunarvim
    ["git-lfs"]="git-lfs" # https://github.com/git-lfs/git-lfs
    ["git-gui"]="git-gui" # https://git-scm.com/docs/git-gui
    ["gitk"]="gitk" # https://git-scm.com/docs/gitk
    ["git-cola"]="git-cola"
    ["gh"]="gh" # https://cli.github.com/
    ["gpg"]="gpg" # For "git-credential-manager"
    ["pass"]="pass" # For "git-credential-manager"
    ["i3"]="i3" # Includes: `i3-wm`, `i3bar`, `i3status`, `i3lock`, `dunst`, `dmenu`
    ["pactl"]="pulseaudio-utils" # Includes: `paplay`, `pacat`, `parec`, `pacmd`, `pactl`, `padsp`, `pax11publish`
    ["polybar"]="polybar"
    ["fonts-font-awesome"]="fonts-font-awesome" # Icon for "polybar"
    ["rofi"]="rofi"
    #Freeze during install: ["papirus-icon-theme"]="papirus-icon-theme" # Icon theme for "rofi"
    ["feh"]="feh"
    ["nitrogen"]="nitrogen"
    ["conky"]="conky-all"
    ["jgmenu"]="jgmenu"
    ["vim"]="vim"
    ["nvim"]="neovim" # For Lunarvim
    ["python3"]="python3" # For Lunarvim: `python3 --version`
    ["pip3"]="python3-pip" # For Lunarvim: `pip --version` || `pip3 --version`
    ["python3-pynvim"]="python3-pynvim" # For Lunarvim: [Skip python dependencies during install](https://github.com/LunarVim/LunarVim/issues/4050)
    ["node"]="nodejs" # For Lunarvim: `node --version`
    ["npm"]="npm" # For Lunarvim: `npm --version`
    ["rustc"]="rustc" # For Lunarvim: `rustc --version`
    ["cargo"]="cargo" # For Lunarvim: `cargo --version`
    ["make"]="make" # For Lunarvim: `make --version`
    ["gcc"]="gcc" # For Lunarvim: `gcc --version`
    ["rg"]="ripgrep" # For Lunarvim: `rg --version`
    ["xclip"]="xclip" # For Lunarvim, Yazi
    ["fzf"]="fzf"
    ["code"]="code"
    ["vifm"]="vifm"
    # ["filezilla"]="filezilla"
    # ["rsync"]="rsync"
    ["rclone"]="rclone"
    ["restic"]="restic"
    ["dropbox"]="dropbox"
    # ["copyq"]="copyq"
    # ["glow"]="glow"
    # ["mycli"]="mycli"
    # ["sqlitebrowser"]="sqlitebrowser"
    # ["gimp"]="gimp"
    # ["vlc"]="vlc"
    ["pcmanfm"]="pcmanfm"
    # ["thunar"]="thunar"
    ["7zip"]="7zip"
    ["htop"]="htop"
    ["pulseaudio"]="pulseaudio"
    ["pavucontrol"]="pavucontrol"
    ["jq"]="jq"
    ["distrobox"]="distrobox"
    ["tmux"]="tmux"
    ["lynx"]="lynx"
    # ["httpie"]="httpie"
    ["lftp"]="lftp"
    ["qimgv"]="qimgv"
    # ["audacity"]=["audacity"]
    # ["smplayer"]="smplayer"
    # ["mpv"]="mpv"
    # ["shotcut"]="shotcut"
    # ["handbrake"]="handbrake"
    # ["handbrake-cli"]="handbrake-cli"
    # ["flameshot"]="flameshot"
    # ["obs-studio"]="obs-studio"
    # ["stacer"]="stacer"
    ["peazip"]="peazip"

    # Add: Glances
)

apt_home_softwares=(
    # ["syncthing"]="syncthing"
    # ["yt-dlp"]="yt-dlp"
    # ["youtube-dl"]="youtube-dl"
    # ["youtubedl-gui"]="youtubedl-gui"
    # ["gallery-dl"]="gallery-dl"
    # ["linssid"]="linssid"
    # ["wavemon"]="wavemon"
    # ["digikam"]="digikam"
    # ["clementine"]="clementine"
)

deb_office_softwares=(
    ["google-chrome"]="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    ["git-credential-manager"]="https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb"
    # ["fdm"]="https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb"
)

deb_home_softwares=(
    # ["4kvideodownloader"]="https://dl.4kdownload.com/app/4kvideodownloaderplus_1.10.4-1_amd64.deb"
    # ["mindforger"]="https://github.com/dvorka/mindforger/releases/download/2.0.0/debian-12-bookworm--mindforger_2.0.0-1_amd64.deb"
)
	 
appimage_office_softwares=(
    # "https://github.com/pbek/QOwnNotes/releases/download/v23.3.7/QOwnNotes-x86_64.AppImage"
)

appimage_home_softwares=(
    # "https://github.com/mhoeher/opentodolist/releases/download/3.42.0/OpenTodoList-3.42.0-x86_64.AppImage"
)

tar_office_softwares=(
    # "https://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.5.0727.x64.run.tar.gz"
)

tar_home_softwares=(
    # "https://releases.hashicorp.com/vagrant/2.3.4/vagrant_2.3.4_linux_amd64.zip"
)

if [[ "$USER" == "root" ]]
then
    echo -e '\033[1;31m Do not run this script with "sudo" prefix. "sudo" will be used internally when necessary! \033[0m'
    exit
fi

apt_list_installed=$(apt list --installed)
nix_env_path=$(command -v nix-env)

#--------------------START: Install Package Managers & Directories---------------
sudo apt update

pkg_managers_all=("snapd" "flatpak" "appimagelauncher" "git" "aria2" "gdebi")
for ((i = 0; i < ${#pkg_managers_all[@]}; i++))
do
    pkg_manager="${pkg_managers_all[$i]}"
    is_pkg_manager_exist=$(echo "$apt_list_installed" | grep "$pkg_manager" | awk '{print $4}')
    if [[ "$is_pkg_manager_exist" != 'installed' ]]
    then
        sudo apt --yes install $pkg_manager
    fi
    if [[ "$pkg_manager" == 'flatpak' ]]
    then
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    fi
done

if [[ ("$nix_env_path" != '/nix/var/nix/profiles/default/bin/nix-env') || (! -f "/home/linuxbrew/.linuxbrew/bin/brew") ]]
then
    if [[ "$nix_env_path" != '/nix/var/nix/profiles/default/bin/nix-env' ]]
    then    
        echo -e "\033[1;31m Install Nix Package Manager with Following Command and Restart Terminal! \033[0m"
        sh <(curl -L https://nixos.org/nix/install) --daemon
    fi

    if [[ ! -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]
    then
        echo -e "\033[1;31m Install Homebrew Package Manager with Following Command and Restart Terminal! \033[0m"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.bashrc
    fi
    echo -e '\033[1;32m Restart Terminal Now. Nix and Homebrew Package Manager Installed. \033[0m'
    exit
fi

# Making Directories
if [[ ! -d "$download_path/deb" ]]
then
    mkdir --parents "$download_path/deb"
fi
if [[ ! -d "$download_path/appimage" ]]
then
    mkdir --parents "$download_path/appimage"
fi
if [[ ! -d "$download_path/tar" ]]
then
    mkdir --parents "$download_path/tar"
fi
#--------------------END: Install Package Managers & Directories----------------

#--------------------START: Collect Packages To Install----------------
for snap_cmd in "${!snap_office_softwares[@]}"; do
    snap_softwares_all[$snap_cmd]=${snap_office_softwares[$snap_cmd]}
done
for flatpak_cmd in "${!flatpak_office_softwares[@]}"; do
    flatpak_softwares_all[$flatpak_cmd]=${flatpak_office_softwares[$flatpak_cmd]}
done
for nix_cmd in "${!nix_office_softwares[@]}"; do
    nix_softwares_all[$nix_cmd]=${nix_office_softwares[$nix_cmd]}
done
for brew_cmd in "${!brew_office_softwares[@]}"; do
    brew_softwares_all[$brew_cmd]=${brew_office_softwares[$brew_cmd]}
done
for apt_cmd in "${!apt_office_softwares[@]}"; do
    apt_softwares_all[$apt_cmd]=${apt_office_softwares[$apt_cmd]}
done
for deb_cmd in "${!deb_office_softwares[@]}"; do
    deb_softwares_all[$deb_cmd]=${deb_office_softwares[$deb_cmd]}
done
appimage_softwares_all+=("${appimage_office_softwares[@]}")
tar_softwares_all+=("${tar_office_softwares[@]}")

echo -n "Is this a workstation for Home use [y[es]/n[o](default)]? "
read workstation_response

if [[ ("$workstation_response" == "y") || ("$workstation_response" == "yes") ]]
then
    for snap_cmd in "${!snap_home_softwares[@]}"; do
        snap_softwares_all[$snap_cmd]=${snap_home_softwares[$snap_cmd]}
    done
    for flatpak_cmd in "${!flatpak_home_softwares[@]}"; do
        flatpak_softwares_all[$flatpak_cmd]=${flatpak_home_softwares[$flatpak_cmd]}
    done
    for nix_cmd in "${!nix_home_softwares[@]}"; do
        nix_softwares_all[$nix_cmd]=${nix_home_softwares[$nix_cmd]}
    done
    for brew_cmd in "${!brew_home_softwares[@]}"; do
        brew_softwares_all[$brew_cmd]=${brew_home_softwares[$brew_cmd]}
    done
    for apt_cmd in "${!apt_home_softwares[@]}"; do
        apt_softwares_all[$apt_cmd]=${apt_home_softwares[$apt_cmd]}
    done
    for deb_cmd in "${!deb_home_softwares[@]}"; do
        deb_softwares_all[$deb_cmd]=${deb_home_softwares[$deb_cmd]}
    done
    appimage_softwares_all+=("${appimage_home_softwares[@]}")
    tar_softwares_all+=("${tar_home_softwares[@]}")	
fi
#--------------------START: Collect Packages To Install----------------

#-------------------------START: Install Snap Softwares-------------------------
for snap_cmd in "${!snap_softwares_all[@]}"; do
    snap_software="${snap_softwares_all[$snap_cmd]}"
    is_snap_soft_installed=$(snap list | awk '{print $1}' | grep "$snap_cmd")
    if [[ "$is_snap_soft_installed" != '' ]]
    then
        echo -e "\033[1;32m Snap => $snap_software is already installed, skipping... \033[0m"
    else
        sudo snap install $snap_software
   fi
done

echo -e '\033[1;32m Snap => All Softwares Installed. \033[0m'	
#-------------------------END: Install Snap Softwares-------------------------

#-------------------------START: Install Flatpak Softwares-------------------------
for flatpak_cmd in "${!flatpak_softwares_all[@]}"; do
    flatpak_software="${flatpak_softwares_all[$flatpak_cmd]}"
    is_flatpak_soft_installed=$(flatpak list --columns=application | grep "$flatpak_software")
    if [[ "$flatpak_software" == "$is_flatpak_soft_installed" ]]
    then
        echo -e "\033[1;32m Flatpak => $flatpak_software is already installed, skipping... \033[0m"
    else
        flatpak install --assumeyes flathub $flatpak_software
        is_flatpak_soft_installed=$(flatpak list --columns=application | grep "$flatpak_software")
        if [[ "$is_flatpak_soft_installed" != '' ]]
        then
            echo "alias $flatpak_cmd=\"flatpak run $flatpak_software\"" >> ~/.bashrc
            source ~/.bashrc
        fi
   fi
done

echo -e '\033[1;32m Flatpak => All Softwares Installed. \033[0m'    
#-------------------------END: Install Flatpak Softwares-------------------------

#-------------------------START: Install Nix Softwares-------------------------
for nix_cmd in "${!nix_softwares_all[@]}"; do
    nix_software="${nix_softwares_all[$nix_cmd]}"
    is_nix_soft_installed=$(nix-env --query | grep "$nix_cmd")
    if [[ "$is_nix_soft_installed" != '' ]]
    then
        echo -e "\033[1;32m Nix => $nix_software is already installed, skipping... \033[0m"
    else
        nix-env -iA nixpkgs.$nix_software
   fi
done

echo -e '\033[1;32m Nix => All Softwares Installed. \033[0m'
#-------------------------END: Install Nix Softwares-------------------------

#-------------------------START: Install Homebrew Softwares------------------
for brew_cmd in "${!brew_softwares_all[@]}"; do
    brew_software="${brew_softwares_all[$brew_cmd]}"
    is_brew_soft_installed=$(brew list | grep "$brew_cmd")
    if [[ "$is_brew_soft_installed" != '' ]]
    then
        echo -e "\033[1;32m Homebrew => $brew_software is already installed, skipping... \033[0m"
    else
        brew install $brew_software
   fi
done

echo -e '\033[1;32m Homebrew => All Softwares Installed. \033[0m'
#-------------------------END: Install Homebrew Softwares---------------------

#-------------------------START: Install APT Softwares-------------------------
for apt_cmd in "${!apt_softwares_all[@]}"; do
    apt_software="${apt_softwares_all[$apt_cmd]}"
    is_apt_soft_installed=$(echo "$apt_list_installed" | grep "$apt_cmd" | awk '{print $4}')
    if [[ "$is_apt_soft_installed" != '' ]]
    then
        echo -e "\033[1;32m APT => $apt_software is already installed, skipping... \033[0m"
    else
        sudo apt --yes install $apt_software
   fi
done

echo -e '\033[1;32m APT => All Softwares Installed. \033[0m'
#-------------------------END: Install APT Softwares-------------------------

#-------------------------START: Install DEB Softwares-------------------------
for deb_cmd in "${!deb_softwares_all[@]}"; do
    deb_url_string=${deb_softwares_all[$deb_cmd]}
    IFS='/' read -r -a deb_url_array <<< "$deb_url_string"
	unset IFS
	deb_file_name=${deb_url_array[-1]}
	is_deb_soft_installed=$(echo "$apt_list_installed" | grep "$deb_cmd" | awk '{print $4}')
    deb_soft_path=$(command -v "$deb_cmd")
	if [[ ("$is_deb_soft_installed" != '') || ("$deb_soft_path" != '') ]]
	then
	    echo -e "\033[1;32m DEB => $deb_cmd ($deb_file_name) is already installed, skipping... \033[0m"
	else
	    if [[ -f "$download_path/deb/$deb_file_name" ]]
        then
		    sudo gdebi --non-interactive "$download_path/deb/$deb_file_name"
        else
		    aria2c --dir="$download_path/deb" "$deb_url_string"
			sudo gdebi --non-interactive "$download_path/deb/$deb_file_name"
        fi    
	fi	
done

echo -e '\033[1;32m DEB => All Softwares Installed. \033[0m'
#-------------------------END: Install DEB Softwares-------------------------

#-------------------------START: Download AppImage Softwares-----------------
for ((i = 0; i < ${#appimage_softwares_all[@]}; i++))
do
    appimage_url_string="${appimage_softwares_all[$i]}"
    IFS='/' read -r -a appimage_url_array <<< "$appimage_url_string"
    unset IFS
	appimage_file_name=${appimage_url_array[-1]}
	if [[ -f "$download_path/appimage/$appimage_file_name" ]]
    then
	    echo -e "\033[1;32m AppImage => File Exists: $appimage_file_name \033[0m"
    else
		aria2c --dir="$download_path/appimage" "$appimage_url_string"
    fi
done

echo -e '\033[1;32m AppImage => All Softwares Downloaded. \033[0m'
#-------------------------END: Download AppImage Softwares--------------------

#-------------------------START: Download TAR Softwares-------------------------
for ((i = 0; i < ${#tar_softwares_all[@]}; i++))
do
    tar_url_string="${tar_softwares_all[$i]}"
    IFS='/' read -r -a tar_url_array <<< "$tar_url_string"
    unset IFS
	tar_file_name=${tar_url_array[-1]}
	if [[ -f "$download_path/tar/$tar_file_name" ]]
    then
	    echo -e "\033[1;32m TAR => File Exists: $tar_file_name \033[0m"
    else
		aria2c --dir="$download_path/tar" "$tar_url_string"
    fi
done

echo -e '\033[1;32m TAR => All Softwares Downloaded. \033[0m'
#-------------------------END: Download TAR Softwares-------------------------

# Install Lunvarvim, if not already installed

if [[ "$(command -v lvim)" != '' ]]
then
    echo -e "\033[1;32m Lunarvim is already installed, skipping... \033[0m"
else
    # Nodejs/NPM Error: [WARN]: skipping installing optional nodejs dependencies due to insufficient permissions.
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.profile
    source ~/.profile

    # Python Error: This environment is externally managed
    # [Skip python dependencies during install](https://github.com/LunarVim/LunarVim/issues/4050)
    # Just install pynvim using apt `sudo apt install python3-pynvim`. No plugins from lunarvim require it.

    LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
    echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
fi
