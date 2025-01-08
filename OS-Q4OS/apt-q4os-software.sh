#!/bin/bash

# In Q4OS, Snap adds software to $PATH and Menu. Flatpak does not add software to $PATH, but adds to Menu. Nix adds software to $PATH (instant) and Menu (after logout/restart).
# Clear Snap Cache: sudo sh -c 'rm -rf /var/lib/snapd/cache/*'
# Clear Flatpak Cache: flatpak remove --unused
# Clear Nix Cache: nix-collect-garbage

if [[ "$USER" == "root" ]]
then
    echo -e '\033[1;31m Do not run this script with "sudo" prefix. "sudo" will be used internally when necessary! \033[0m'
    exit
fi
download_path="/home/$USER/Downloads/Debian_Software"
nix_env_path=$(command -v nix-env)
apt_list_installed=$(apt list --installed)

declare -A snap_softwares_all
declare -A snap_office_softwares
declare -A snap_home_softwares
declare -A flatpak_softwares_all
declare -A flatpak_office_softwares
declare -A flatpak_home_softwares
declare -A nix_softwares_all
declare -A nix_office_softwares
declare -A nix_home_softwares
declare -a apt_softwares_all
declare -a apt_office_softwares
declare -a apt_home_softwares
declare -A deb_softwares_all
declare -A deb_office_softwares
declare -A deb_home_softwares
declare -a appimage_softwares_all
declare -a tar_softwares_all

snap_office_softwares=(
    # ["firefox"]="firefox"
    # ["chromium"]="chromium"
    # ["opera"]="opera"
    # ["thunderbird"]="thunderbird"
    # ["code"]="code --classic"
    # ["nvim"]="nvim --classic"
    # ["sublime-text"]="sublime-text --classic"
    # ["sublime-merge"]="sublime-merge --classic"
    # ["powershell"]="powershell --classic"
    # ["skype"]="skype"
    # ["dvc"]="dvc --classic"
    # ["lepton"]="lepton"
    # ["trello-desktop"]="trello-desktop"
    # ["rclone"]="rclone"
    # ["restic"]="restic --edge --classic"
    # ["syncthing-gael"]="syncthing-gael"
    # ["clipboard"]="clipboard --edge"
    # ["glow"]="glow"
    # ["dbeaver-ce"]="dbeaver-ce"
    # ["mysql-workbench-community"]="mysql-workbench-community"
    # ["sqlitebrowser"]="sqlitebrowser"
    # ["ngrok"]="ngrok"
    # ["node"]="node --channel=22/stable --classic"
    # ["android-studio"]="android-studio --classic"
    # ["postman"]="postman"
    # ["termius-app"]="termius-app"
    # ["glances"]="glances"
    # ["keepassxc"]="keepassxc"
    # ["dive"]="dive"
)

snap_home_softwares=(
    # ["spotify"]="spotify"
    # ["spt"]="spt --edge" # Spotify TUI: https://github.com/Rigellute/spotify-tui
    # ["scrcpy"]="scrcpy"
    # ["guiscrcpy"]="guiscrcpy"
)

flatpak_office_softwares=(
    # ["wezterm"]="org.wezfurlong.wezterm"
    # ["smartgit"]="com.syntevo.SmartGit"
    # ["FreeFileSync"]="org.freefilesync.FreeFileSync"
    # ["NotepadNext"]="com.github.dail8859.NotepadNext"
    # ["anydesk"]="com.anydesk.Anydesk"
    # ["podman_desktop"]="io.podman_desktop.PodmanDesktop"
    # ["boxbuddyrs"]="io.github.dvlv.boxbuddyrs"
)

flatpak_home_softwares=(
    # ["spotube"]="com.github.KRTirtho.Spotube"
)

nix_office_softwares=(
    # ["unison"]="unison"
    # ["lazygit"]="lazygit"
    # ["lazydocker"]="lazydocker"
    # ["sniffnet"]="sniffnet"
    # ["rclone-browser"]="rclone-browser"
    # ["backrest"]="backrest"
    # ["frogmouth"]="frogmouth"
    # ["httpie-desktop"]="httpie-desktop"
    # ["termscp"]="termscp"
    # ["czkawka"]="czkawka"
    # ["musikcube"]="musikcube"
    # ["beebeep"]="beebeep"
    # ["dasel"]="dasel"
    # ["jq"]="jq"
    # ["gum"]="gum"
)

nix_home_softwares=(
    # ["piknik"]="piknik"
    # ["veracrypt"]="veracrypt"
    # ["ventoy-full"]="ventoy-full"
)

apt_office_softwares=(
    # ["libreoffice"]="libreoffice"
    # ["docker"]="docker"
    # ["docker.io"]="docker.io"
    # ["docker-compose"]="docker-compose"
    # ["podman"]="podman"
    # ["git"]="git"
    # ["git-gui"]="git-gui"
    # ["git-lfs"]="git-lfs"
    # ["gh"]="gh"
    # ["vim"]="vim"
    # ["lynx"]="lynx"
    # ["filezilla"]="filezilla"
    # ["yt-dlp"]="yt-dlp"
    # ["youtube-dl"]="youtube-dl"
    # ["youtubedl-gui"]="youtubedl-gui"
    # ["gallery-dl"]="gallery-dl"
    # ["linssid"]="linssid"
    # ["wavemon"]="wavemon"
    # ["rsync"]="rsync"
    # ["httpie"]="httpie"
    # ["lftp"]="lftp"
    # ["qimgv"]="qimgv"
    # ["digikam"]="digikam"
    # ["gimp"]="gimp"
    # ["clementine"]="clementine"
    # ["audacity"]=["audacity"]
    # ["vlc"]="vlc"
    # ["smplayer"]="smplayer"
    # ["mpv"]="mpv"
    # ["shotcut"]="shotcut"
    # ["handbrake"]="handbrake"
    # ["handbrake-cli"]="handbrake-cli"
    # ["ffmpeg"]="ffmpeg"
    # ["flameshot"]="flameshot"
    # ["obs-studio"]="obs-studio"
    # ["pcmanfm"]="pcmanfm"
    # ["thunar"]="thunar"
    # ["7zip"]="7zip"
    # ["htop"]="htop"
    # ["stacer"]="stacer"
    # ["rofi"]="rofi"
    # ["i3"]="i3"
    # ["polybar"]="polybar"
    # ["feh"]="feh"
    # ["pulseaudio"]="pulseaudio"
    # ["pavucontrol"]="pavucontrol"
)

apt_home_softwares=(
    # ["software-cmd"]="software-name"
)

deb_office_softwares=(
    # ["mindforger"]="https://github.com/dvorka/mindforger/releases/download/2.0.0/debian-12-bookworm--mindforger_2.0.0-1_amd64.deb"
)

deb_home_softwares=( 
    # ["fdm"]="https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb"
    # ["4kvideodownloader"]="https://dl.4kdownload.com/app/4kvideodownloaderplus_1.10.4-1_amd64.deb"
)
	 
appimage_office_softwares=(
    # "https://github.com/dail8859/NotepadNext/releases/download/v0.5.6/NotepadNext-x86_64.AppImage"
)

appimage_home_softwares=(
    # "https://github.com/mhoeher/opentodolist/releases/download/3.42.0/OpenTodoList-3.42.0-x86_64.AppImage"
)

tar_office_softwares=(
    # "https://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.5.0727.x64.run.tar.gz"
)

tar_home_softwares=(
    # "https://github.com/emuell/restic-browser/releases/download/v0.2.5/Restic-Browser-v0.2.5-linux.tar.gz"
)

for snap_cmd in "${!snap_office_softwares[@]}"; do
    snap_softwares_all[$snap_cmd]=${snap_office_softwares[$snap_cmd]}
done
for flatpak_cmd in "${!flatpak_office_softwares[@]}"; do
    flatpak_softwares_all[$flatpak_cmd]=${flatpak_office_softwares[$flatpak_cmd]}
done
for nix_cmd in "${!nix_office_softwares[@]}"; do
    nix_softwares_all[$nix_cmd]=${nix_office_softwares[$nix_cmd]}
done
for apt_cmd in "${!apt_office_softwares[@]}"; do
    apt_softwares_all[$apt_cmd]=${apt_office_softwares[$apt_cmd]}
done
for deb_cmd in "${!deb_office_softwares[@]}"; do
    deb_softwares_all[$deb_cmd]=${deb_office_softwares[$deb_cmd]}
done
appimage_softwares_all+=("${appimage_office_softwares[@]}")
tar_softwares_all+=("${tar_office_softwares[@]}")

echo -n "Is this a workstation for Home use [yes/no(default)]? "
read workstation_response

if [[ "$workstation_response" == "yes" ]]
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
    for apt_cmd in "${!apt_home_softwares[@]}"; do
        apt_softwares_all[$apt_cmd]=${apt_home_softwares[$apt_cmd]}
    done
    for deb_cmd in "${!deb_home_softwares[@]}"; do
        deb_softwares_all[$deb_cmd]=${deb_home_softwares[$deb_cmd]}
    done
    appimage_softwares_all+=("${appimage_home_softwares[@]}")
    tar_softwares_all+=("${tar_home_softwares[@]}")	
fi

#--------------------START: Install Package Managers & Directories--------------------

#is_appimagelauncher_pkg_exist=$(dpkg -s appimagelauncher | grep 'Status' | awk '{print $4}')
#if [[ "$is_appimagelauncher_pkg_exist" != 'installed' ]]
#then
#    sudo apt --yes install software-properties-common
#	sudo add-apt-repository --yes ppa:appimagelauncher-team/stable
#	sudo apt update
#	sudo apt --yes install appimagelauncher
#else
#    sudo apt update
#fi

pkg_managers_all=("snapd" "aria2" "gdebi")
for ((i = 0; i < ${#pkg_managers_all[@]}; i++))
do
    pkg_manager="${pkg_managers_all[$i]}"
    is_pkg_manager_exist=$(dpkg -s $pkg_manager | grep 'Status' | awk '{print $4}')
    if [[ "$is_pkg_manager_exist" != 'installed' ]]
    then
        sudo apt --yes install $pkg_manager
    fi
done

if [[ "$nix_env_path" != '/nix/var/nix/profiles/default/bin/nix-env' ]]
then    
    echo -e "\033[1;31m Install Nix Package Manager with Following Command and Restart Terminal! \033[0m"
    echo 'sh <(curl -L https://nixos.org/nix/install) --daemon'
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
#--------------------END: Install Package Managers & Directories--------------------

#-------------------------START: Install Snap Softwares-------------------------
for snap_cmd in "${!snap_softwares_all[@]}"; do
    snap_software="${snap_softwares_all[$snap_cmd]}"
    is_snap_soft_installed=$(snap list | awk '{print $1}' | grep "$snap_cmd")
    if [[ "$snap_cmd" == "$is_snap_soft_installed" ]]
    then
        echo -e "\033[1;32m Snap => $snap_software is already installed, skipping... \033[0m"
    else
        sudo snap install "$snap_software"
   fi
done

echo -e '\033[1;32m Snap => All Software Installed. \033[0m'	
#-------------------------END: Install Snap Softwares-------------------------

#-------------------------START: Install Flatpak Softwares-------------------------
for flatpak_cmd in "${!flatpak_softwares_all[@]}"; do
    flatpak_software="${flatpak_softwares_all[$flatpak_cmd]}"
    is_flatpak_soft_installed=$(flatpak list --columns=application | grep "$flatpak_software")
    if [[ "$flatpak_software" == "$is_flatpak_soft_installed" ]]
    then
        echo -e "\033[1;32m Flatpak => $flatpak_software is already installed, skipping... \033[0m"
    else
        flatpak install --assumeyes flathub "$flatpak_software"
        is_flatpak_soft_installed=$(flatpak list --columns=application | grep "$flatpak_software")
        if [[ "$flatpak_software" == "$is_flatpak_soft_installed" ]]
        then
            echo "alias $flatpak_cmd=\"flatpak run $flatpak_software\"" >> ~/.bashrc
            source ~/.bashrc
        fi
   fi
done

echo -e '\033[1;32m Flatpak => All Software Installed. \033[0m'    
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

echo -e '\033[1;32m Nix => All Software Installed. \033[0m'    
#-------------------------END: Install Nix Softwares-------------------------

#-------------------------START: Install APT Softwares-------------------------
for apt_cmd in "${!apt_softwares_all[@]}"; do
    apt_software="${apt_softwares_all[$apt_cmd]}"
    is_apt_soft_installed=$(echo "$apt_list_installed" | grep "$apt_cmd" | awk '{print $4}')
    if [[ "$is_apt_soft_installed" != '' ]]
    then
        echo -e "\033[1;32m APT => $apt_software is already installed, skipping... \033[0m"
    else
        sudo apt --yes install "$apt_software"
   fi
done

echo -e '\033[1;32m APT => All Software Installed. \033[0m'
#-------------------------END: Install APT Softwares-------------------------

#-------------------------START: Install DEB Softwares-------------------------
for deb_cmd in "${!deb_softwares_all[@]}"; do
    deb_url_string=${deb_softwares_all[$deb_cmd]}
    IFS='/' read -r -a deb_url_array <<< "$deb_url_string"
	unset IFS
	deb_file_name=${deb_url_array[-1]}
	is_deb_soft_installed=$(echo "$apt_list_installed" | grep "$deb_cmd" | awk '{print $4}')
	if [[ "$is_deb_soft_installed" != '' ]]
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

echo -e '\033[1;32m DEB => All Software Installed. \033[0m'
#-------------------------END: Install DEB Softwares-------------------------

#-------------------------START: Download AppImage Softwares-------------------------
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

echo -e '\033[1;32m AppImage => All Software Downloaded. \033[0m'
#-------------------------END: Download AppImage Softwares-------------------------

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

echo -e '\033[1;32m TAR => All Software Downloaded. \033[0m'
#-------------------------END: Download TAR Softwares-------------------------
