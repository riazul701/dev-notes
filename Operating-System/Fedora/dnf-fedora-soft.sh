#!/bin/bash

#--------------------------Start: General-Information----------------------
# Fedora-42-LXDE
# https://packages.fedoraproject.org/
# https://repology.org/repository/fedora_42
#---------------------------End: General-Information------------------------
#--------------------------Start: Nix-Package-Manger------------------------
# Nix does not work with selinux enabled yet!
# see https://github.com/NixOS/nix/issues/2374
# [How to Disable SELinux Temporarily or Permanently](https://www.tecmint.com/disable-selinux-in-centos-rhel-fedora/)
#  * Disable SELinux Permanently
#  * To permanently disable SELinux, use your favorite text editor to open the file `/etc/sysconfig/selinux` as follows: `# vi /etc/sysconfig/selinux`
#  * Then change the directive `SELinux=enforcing` to `SELinux=disabled` as shown in the below image. `SELINUX=disabled`
#  * Then, save and exit the file, for the changes to take effect, you need to reboot your system and then check the status of SELinux using sestatus command as shown: `sestatus`
#---------------------------End: Nix-Package-Manger--------------------------
#---------------------------End: Homebrew-Package-Manger--------------------------
# Homebrew works for Terminal software
#---------------------------End: Homebrew-Package-Manger--------------------------

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
declare -A dnf_softwares_all
declare -A dnf_office_softwares
declare -A dnf_home_softwares
declare -A rpm_softwares_all
declare -A rpm_office_softwares
declare -A rpm_home_softwares
declare -a appimage_softwares_all
declare -a tar_softwares_all
download_path="/home/$USER/Downloads/Fedora_Software"

export NIXPKGS_ALLOW_UNFREE=1 # To temporarily allow unfree packages, use environment variable
export NIXPKGS_ALLOW_INSECURE=1 # To temporarily allow all insecure packages, use environment variable
# Note (Nix): When using `nix shell`, `nix build`, `nix develop`, etc with a flake, then pass `--impure` in order to allow use of environment variables.

snap_office_softwares=(
    ["opera"]="opera"
    ["chezmoi"]="chezmoi --classic"
    ["sublime-text"]="sublime-text --classic"
    ["postman"]="postman"
    ["dbeaver-ce"]="dbeaver-ce"
    ["sublime-merge"]="sublime-merge --classic"
    ["powershell"]="powershell --classic"
    ["dvc"]="dvc --classic"
    ["lepton"]="lepton"
    ["trello-desktop"]="trello-desktop"
    ["clipboard"]="clipboard --edge"
    ["mysql-workbench-community"]="mysql-workbench-community"
    ["ngrok"]="ngrok"
    ["android-studio"]="android-studio --classic"
    ["dive"]="dive" # Docker
)

snap_home_softwares=(
    ["spotify"]="spotify"
    ["spt"]="spt --edge" # Spotify TUI: https://github.com/Rigellute/spotify-tui
    ["scrcpy"]="scrcpy"
    ["guiscrcpy"]="guiscrcpy"
)

flatpak_office_softwares=(
    ["wezterm"]="org.wezfurlong.wezterm"
    ["FreeFileSync"]="org.freefilesync.FreeFileSync"
    ["anydesk"]="com.anydesk.Anydesk"
    ["podman_desktop"]="io.podman_desktop.PodmanDesktop"
    ["boxbuddyrs"]="io.github.dvlv.boxbuddyrs"
    ["smartgit"]="com.syntevo.SmartGit"
    ["NotepadNext"]="com.github.dail8859.NotepadNext"
)

flatpak_home_softwares=(
    ["spotube"]="com.github.KRTirtho.Spotube"
)

nix_office_softwares=(
    ["yazi"]="yazi"
    ["lazygit"]="lazygit" # For Lunarvim
    ["unison"]="unison"
    ["termscp"]="termscp"
    ["dasel"]="dasel"
    ["gum"]="gum"
    ["nerdfetch"]="nerdfetch" # `nerdfonts`, For Lunarvim, Yazi
    ["lazydocker"]="lazydocker"
    ["beebeep"]="beebeep"
    ["backrest"]="backrest"
    ["frogmouth"]="frogmouth"
    ["httpie-desktop"]="httpie-desktop"
    ["czkawka"]="czkawka"
    ["piknik"]="piknik"
)

nix_home_softwares=(
    ["rclone-browser"]="rclone-browser"
    ["musikcube"]="musikcube"
    ["sniffnet"]="sniffnet"
    ["ventoy-gtk"]="ventoy-full-gtk" # Alternative: `ventoy-full-qt`
    ["veracrypt"]="veracrypt"
)

brew_office_softwares=(
    # ["command"]="software-name"
)

brew_home_softwares=(
    ["lazydocker"]="lazydocker"
)

dnf_office_softwares=(
    ["kitty"]="kitty"
    ["keepassxc"]="keepassxc"
    ["firefox"]="firefox"
    ["chromium"]="chromium"
    ["thunderbird"]="thunderbird"
    # ["ibus-avro"]="ibus-avro"
    ["libreoffice"]="libreoffice"
    # ["docker"]="docker"
    # ["docker.io"]="docker.io"
    # ["docker-compose"]="docker-compose"
    ["podman"]="podman"
    ["git"]="git" # For Lunarvim
    ["git-lfs"]="git-lfs" # https://github.com/git-lfs/git-lfs
    ["git-gui"]="git-gui" # https://git-scm.com/docs/git-gui
    ["gitk"]="gitk" # https://git-scm.com/docs/gitk
    ["git-cola"]="git-cola"
    ["gh"]="gh" # https://cli.github.com/
    ["gnupg2"]="gnupg2" # `gpg` command, For "git-credential-manager"
    ["pass"]="pass" # For "git-credential-manager"
    ["i3"]="i3" # Includes: `i3-wm`, `i3bar`, `i3status`, `i3lock`, `dunst`, `dmenu`
    ["pulseaudio-utils"]="pulseaudio-utils" # `pactl` command, Includes: `paplay`, `pacat`, `parec`, `pacmd`, `pactl`, `padsp`, `pax11publish`
    ["polybar"]="polybar"
    #["fonts-font-awesome"]="fonts-font-awesome" # Icon for "polybar"
    ["rofi"]="rofi"
    ["papirus-icon-theme"]="papirus-icon-theme" # Icon theme for "rofi" (Freezes during install on Debian/Sparky-Testing OS)
    ["feh"]="feh"
    ["nitrogen"]="nitrogen"
    ["conky"]="conky"
    ["jgmenu"]="jgmenu"
    ["vim-enhanced"]="vim-enhanced" # `vim` editor
    ["neovim"]="neovim" # `nvim` command, For Lunarvim
    ["python3"]="python3" # For Lunarvim: `python3 --version`
    ["python3-pip"]="python3-pip" # `pip3` command, For Lunarvim: `pip --version` || `pip3 --version`
    #["python3-pynvim"]="python3-pynvim" # For Lunarvim: [Skip python dependencies during install](https://github.com/LunarVim/LunarVim/issues/4050)
    ["node"]="nodejs" # For Lunarvim: `node --version`
    ["npm"]="nodejs-npm" # For Lunarvim: `npm --version`
    #["rustc"]="rustc" # For Lunarvim: `rustc --version`
    #["cargo"]="cargo" # For Lunarvim: `cargo --version`
    #["make"]="make" # For Lunarvim: `make --version`
    #["gcc"]="gcc" # For Lunarvim: `gcc --version`
    #["rg"]="ripgrep" # For Lunarvim: `rg --version`
    #["xclip"]="xclip" # For Lunarvim, Yazi
    #["fzf"]="fzf"
    #["code"]="code"
    #["vifm"]="vifm"
    # ["filezilla"]="filezilla"
    # ["rsync"]="rsync"
    #["rclone"]="rclone"
    #["restic"]="restic"
    #["dropbox"]="dropbox"
    # ["copyq"]="copyq"
    # ["glow"]="glow"
    # ["mycli"]="mycli"
    # ["sqlitebrowser"]="sqlitebrowser"
    # ["gimp"]="gimp"
    ["vlc"]="vlc"
    #["pcmanfm"]="pcmanfm"
    # ["thunar"]="thunar"
    #["7zip"]="7zip"
    #["htop"]="htop"
    #["pulseaudio"]="pulseaudio"
    #["pavucontrol"]="pavucontrol"
    #["jq"]="jq"
    #["distrobox"]="distrobox"
    #["tmux"]="tmux"
    #["lynx"]="lynx"
    # ["httpie"]="httpie"
    #["lftp"]="lftp"
    #["qimgv"]="qimgv"
    # ["audacity"]=["audacity"]
    # ["smplayer"]="smplayer"
    # ["mpv"]="mpv"
    # ["shotcut"]="shotcut"
    # ["handbrake"]="handbrake"
    # ["handbrake-cli"]="handbrake-cli"
    # ["flameshot"]="flameshot"
    # ["obs-studio"]="obs-studio"
    # ["stacer"]="stacer"
    #["peazip"]="peazip"

    # Add: Glances
)

dnf_home_softwares=(
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

rpm_office_softwares=(
    ["google-chrome"]="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
    #["git-credential-manager"]="https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb"
    # ["fdm"]="https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb"
)

rpm_home_softwares=(
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
    # https://github.com/amir1376/ab-download-manager/releases/download/v1.6.4/ABDownloadManager_1.6.4_linux_x64.tar.gz
)

tar_home_softwares=(
    # "https://releases.hashicorp.com/vagrant/2.3.4/vagrant_2.3.4_linux_amd64.zip"
)

if [[ "$USER" == "root" ]]
then
    echo -e '\033[1;31m Do not run this script with "sudo" prefix. "sudo" will be used internally when necessary! \033[0m'
    exit
fi

dnf_list_installed=$(dnf list --installed)
nix_env_path=$(command -v nix-env)

#--------------------START: Install Package Managers & Directories---------------
# sudo dnf check-update # DNF automatically updates package list

pkg_managers_all=("snapd" "flatpak" "git" "aria2")
for ((i = 0; i < ${#pkg_managers_all[@]}; i++))
do
    pkg_manager="${pkg_managers_all[$i]}"
    is_pkg_manager_exist_x86_64=$(echo "$dnf_list_installed" | grep "^${pkg_manager}.x86_64" | awk '{print $1}')
    if [[ "$is_pkg_manager_exist_x86_64" != "${pkg_manager}.x86_64" ]]
    then
        sudo dnf --assumeyes install $pkg_manager
        if [[ "$pkg_manager" == 'snapd' ]]
        then
            sudo ln -s /var/lib/snapd/snap /snap # To install snap "--classic" packages
        fi
    fi
    if [[ "$pkg_manager" == 'flatpak' ]]
    then
        sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
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
if [[ ! -d "$download_path/rpm" ]]
then
    mkdir --parents "$download_path/rpm"
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
for dnf_cmd in "${!dnf_office_softwares[@]}"; do
    dnf_softwares_all[$dnf_cmd]=${dnf_office_softwares[$dnf_cmd]}
done
for rpm_cmd in "${!rpm_office_softwares[@]}"; do
    rpm_softwares_all[$rpm_cmd]=${rpm_office_softwares[$rpm_cmd]}
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
    for dnf_cmd in "${!dnf_home_softwares[@]}"; do
        dnf_softwares_all[$dnf_cmd]=${dnf_home_softwares[$dnf_cmd]}
    done
    for rpm_cmd in "${!rpm_home_softwares[@]}"; do
        rpm_softwares_all[$rpm_cmd]=${rpm_home_softwares[$rpm_cmd]}
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

#-------------------------START: Install DNF Softwares-------------------------
for dnf_cmd in "${!dnf_softwares_all[@]}"; do
    dnf_software="${dnf_softwares_all[$dnf_cmd]}"
    is_dnf_soft_installed_x86_64=$(echo "$dnf_list_installed" | grep "^${dnf_cmd}.x86_64" | awk '{print $1}')
    is_dnf_soft_installed_noarch=$(echo "$dnf_list_installed" | grep "^${dnf_cmd}.noarch" | awk '{print $1}')
    if [[ ("$is_dnf_soft_installed_x86_64" == "${dnf_cmd}.x86_64") || ("$is_dnf_soft_installed_noarch" == "${dnf_cmd}.noarch") ]]
    then
        echo -e "\033[1;32m DNF => $dnf_software is already installed, skipping... \033[0m"
    else
        sudo dnf --assumeyes install $dnf_software
   fi
done

echo -e '\033[1;32m DNF => All Softwares Installed. \033[0m'
#-------------------------END: Install DNF Softwares-------------------------

#-------------------------START: Install RPM Softwares-------------------------
for rpm_cmd in "${!rpm_softwares_all[@]}"; do
    rpm_url_string=${rpm_softwares_all[$rpm_cmd]}
    IFS='/' read -r -a rpm_url_array <<< "$rpm_url_string"
    unset IFS
    rpm_file_name=${rpm_url_array[-1]}
    is_rpm_soft_installed=$(echo "$dnf_list_installed" | grep "$rpm_cmd")
    rpm_soft_path=$(command -v "$rpm_cmd")
    if [[ ("$is_rpm_soft_installed" != '') || ("$rpm_soft_path" != '') ]]
    then
        echo -e "\033[1;32m RPM => $rpm_cmd ($rpm_file_name) is already installed, skipping... \033[0m"
    else
        if [[ -f "$download_path/rpm/$rpm_file_name" ]]
        then
            sudo rpm -ivh "$download_path/rpm/$rpm_file_name"
        else
            aria2c --dir="$download_path/rpm" "$rpm_url_string"
            sudo rpm -ivh "$download_path/rpm/$rpm_file_name"
        fi    
    fi  
done

echo -e '\033[1;32m RPM => All Softwares Installed. \033[0m'
#-------------------------END: Install RPM Softwares-------------------------

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
