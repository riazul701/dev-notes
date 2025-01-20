#!/bin/bash

#declare -a snap_softwares
declare -a apt_softwares
declare -A deb_softwares
declare -A deb_office_softwares
declare -A deb_home_softwares
declare -a appimage_softwares
declare -a tar_softwares

#snap_office_softwares=(
    # "firefox"
    # "opera"
    # "code --classic"
)

#snap_home_softwares=(
    # "vlc"
    # "shotcut --classic"
    # "audacity"
# )

apt_office_softwares=(
    "git"
    "git-lfs"
    "gh"
    "vim"
    "restic"
    "rsync"
    "sqlite3"
    "sqlitebrowser"
    "docker"
    "docker-compose"
    "docker.io"
    "vagrant"
    "nodejs"
    "npm"
    # "libreoffice"
    "p7zip"
    "p7zip-full"
    "p7zip-rar"
    "filezilla"
    "gimp"
    "rofi"
    "virtualbox"
    "vifm"
    "pulseaudio"
    "pavucontrol"
    "pcmanfm"
    "gum"
    "flameshot"
    "trash-cli"
)

apt_home_softwares=(
    "vlc"
    "rclone-browser"
    "smplayer"
    "smtube"
    "shotcut"
    "audacity"
    "handbrake"
    "handbrake-cli"
    "scrcpy"
    "scrcpy-server"
)

deb_office_softwares=( 
    ["google-chrome"]="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    ["microsoft-edge"]="https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-beta/microsoft-edge-beta_109.0.1518.23-1_amd64.deb"
	["github-cli"]="https://github.com/cli/cli/releases/download/v2.20.2/gh_2.20.2_linux_amd64.deb"
	["smart-git"]="https://www.syntevo.com/downloads/smartgit/smartgit-22_1_1.deb"
	["rclone"]="https://github.com/rclone/rclone/releases/download/v1.62.2/rclone-v1.62.2-linux-amd64.deb"
	["teamviewer"]="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
	["anydesk"]="https://download.anydesk.com/linux/anydesk_6.2.1-1_amd64.deb"
    ["code"]="https://az764295.vo.msecnd.net/stable/441438abd1ac652551dbe4d408dfcec8a499b8bf/code_1.75.1-1675893397_amd64.deb"
    ["sublime-text"]="https://download.sublimetext.com/sublime-text_build-4143_amd64.deb"
    ["sublime-merge"]="https://download.sublimetext.com/sublime-merge_build-2083_amd64.deb"
    ["mindforger"]="https://github.com/dvorka/mindforger/releases/download/1.54.0/debian-bullseye-mindforger_1.54.0-1_amd64.deb"
    # ["virtualbox"]="https://download.virtualbox.org/virtualbox/7.0.4/virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb"
)

deb_home_softwares=( 
    ["fdm"]="https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb" 
    ["4kdownload"]="https://dl.4kdownload.com/app/4kvideodownloader_4.22.2-1_amd64.deb"
)
	 
appimage_office_softwares=(
    "https://github.com/dail8859/NotepadNext/releases/download/v0.5.6/NotepadNext-x86_64.AppImage"
    "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
    "https://github.com/pbek/QOwnNotes/releases/download/v23.3.7/QOwnNotes-x86_64.AppImage"
)

appimage_home_softwares=(
    "https://github.com/mhoeher/opentodolist/releases/download/3.42.0/OpenTodoList-3.42.0-x86_64.AppImage"
)

tar_office_softwares=(
    "https://releases.hashicorp.com/vagrant/2.3.4/vagrant_2.3.4_linux_amd64.zip"
    "https://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.5.0727.x64.run.tar.gz"
)

tar_home_softwares=(
    "https://github.com/emuell/restic-browser/releases/download/v0.2.5/Restic-Browser-v0.2.5-linux.tar.gz"
    "https://freefilesync.org/download/FreeFileSync_12.1_Linux.tar.gz"
)

#snap_softwares+=("${snap_office_softwares[@]}")
apt_softwares+=("${apt_office_softwares[@]}")
for deb_office_soft_key in "${!deb_office_softwares[@]}"; do
    deb_softwares[${deb_office_soft_key}]=${deb_office_softwares[$deb_office_soft_key]}
done
appimage_softwares+=("${appimage_office_softwares[@]}")
tar_softwares+=("${tar_office_softwares[@]}")

echo -n "Is this a workstation for Home use [yes/no(default)]?"
read workstation_response

if [ "$workstation_response" == "yes" ]
then
    #snap_softwares+=("${snap_home_softwares[@]}")
    apt_softwares+=("${apt_home_softwares[@]}")
    for deb_home_soft_key in "${!deb_home_softwares[@]}"; do
        deb_softwares[${deb_home_soft_key}]=${deb_home_softwares[$deb_home_soft_key]}
    done
    appimage_softwares+=("${appimage_home_softwares[@]}")
    tar_softwares+=("${tar_home_softwares[@]}")	
fi

# Install Required Packages

#is_appimagelauncher_pkg_exist=$(dpkg -s appimagelauncher | grep 'Status' | awk '{print $4}')
#if [ "$is_appimagelauncher_pkg_exist" != "installed" ]
#then
#    sudo apt --yes install software-properties-common
#	sudo add-apt-repository --yes ppa:appimagelauncher-team/stable
#	sudo apt update
#	sudo apt --yes install appimagelauncher
#else
#    sudo apt update
#fi

is_aria2_pkg_exist=$(dpkg -s aria2 | grep 'Status' | awk '{print $4}')
if [ "$is_aria2_pkg_exist" != "installed" ]
then
    sudo apt --yes install aria2
fi
is_gdebi_pkg_exist=$(dpkg -s gdebi | grep 'Status' | awk '{print $4}')
if [ "$is_gdebi_pkg_exist" != "installed" ]
then
    sudo apt --yes install gdebi
fi

# Making Directories
if [ ! -d deb_file ]
then
    mkdir deb_file
fi
if [ ! -d appimage_file ]
then
    mkdir appimage_file
fi
if [ ! -d tar_file ]
then
    mkdir tar_file
fi

#------------------------------START: Install Snap Softwares------------------------------
#for ((i = 0; i < ${#snap_softwares[@]}; i++))
#do
#    snap_software="${snap_softwares[$i]}"
#	snap_split_software_name=($snap_software)
#	snap_software_base_name=${snap_split_software_name[0]}
#	
#	snap_installed_software=$(snap list | awk '{print $1}' | grep ${snap_software_base_name})
#	
#	if [ "$snap_software_base_name" == "$snap_installed_software" ]
#    then
#		echo -e "\033[1;32m Snap: ${snap_software_base_name} is already installed, skipping... \033[0m"
#    else
#	    snap_apt_installed_software=$(dpkg -s ${snap_software_base_name} | grep 'Status' | awk '{print $4}')
#	   
#	    if [ "$snap_apt_installed_software" == "installed" ]
#	    then
#	        echo -e "\033[1;32m Snap(APT): ${snap_software_base_name} is already installed, skipping... \033[0m"
#            continue		
#	    fi
#	
#	    sudo snap install ${snap_software}
#	    #echo Snap: "${snap_software_base_name} is going to be installed."
#    fi
#	
#done
#
#echo -e '\033[1;32m Snap: All Software Installed. \033[0m'
#------------------------------END: Install Snap Softwares------------------------------

# Install APT Softwares
for ((i = 0; i < ${#apt_softwares[@]}; i++))
do
    apt_software="${apt_softwares[$i]}"
	apt_split_software_name=($apt_software)
	apt_software_base_name=${apt_split_software_name[0]}
	
	apt_installed_software=$(dpkg -s ${apt_software_base_name} | grep 'Status' | awk '{print $4}')
	   
	if [ "$apt_installed_software" == "installed" ]
	then
	    echo -e "\033[1;32m APT: ${apt_software_base_name} is already installed, skipping... \033[0m"
    else
	    apt_snap_installed_software=$(snap list | awk '{print $1}' | grep ${apt_software_base_name})
	
	    if [ "$apt_software_base_name" == "$apt_snap_installed_software" ]
        then
		    echo -e "\033[1;32m APT(Snap): ${apt_software_base_name} is already installed, skipping... \033[0m"
            continue			
        fi
	
        sudo apt --yes install ${apt_software}
	    #echo APT: "${apt_software_base_name} is going to be installed."	
	fi
done

echo -e '\033[1;32m APT: All Software Installed. \033[0m'

# Install DEB Softwares
for deb_key in "${!deb_softwares[@]}"; do
    deb_file_url_string=${deb_softwares[$deb_key]}
    IFS='/' read -r -a deb_file_url_array <<< "$deb_file_url_string"
	unset IFS
	deb_file_name=${deb_file_url_array[-1]}
	deb_installed_software=$(apt list --installed | grep "${deb_key}" | awk '{print $4}')
	if [ "$deb_installed_software" == "[installed,local]" ]
	then
	    echo -e "\033[1;32m DEB: ${deb_key} [${deb_file_name}] is already installed, skipping... \033[0m"
	else
	    if [ -f "deb_file/${deb_file_name}" ]
        then
		    sudo gdebi --non-interactive "deb_file/${deb_file_name}"
            #echo "File Exists: ${deb_file_name}"
        else
		    aria2c --dir="deb_file" ${deb_file_url_string}
			sudo gdebi --non-interactive "deb_file/${deb_file_name}"
            #echo "File Does Not Exist"
        fi
	    
	fi
	
    #echo "Command Name: $deb_key and File Name: ${deb_softwares[$deb_key]}"	
done

echo -e '\033[1;32m DEB: All Software Installed. \033[0m'

# Download AppImage Softwares
for ((i = 0; i < ${#appimage_softwares[@]}; i++))
do
    appimage_file_url_string="${appimage_softwares[$i]}"
    IFS='/' read -r -a appimage_file_url_array <<< "$appimage_file_url_string"
    unset IFS
	appimage_file_name=${appimage_file_url_array[-1]}
	if [ -f "appimage_file/${appimage_file_name}" ]
    then
	    echo -e "\033[1;32m AppImage: File Exists: ${appimage_file_name} \033[0m"
    else
		aria2c --dir="appimage_file" ${appimage_file_url_string}
        #echo "File Does Not Exist: ${appimage_file_url_string}"
    fi
done

echo -e '\033[1;32m AppImage: All Software Downloaded. \033[0m'

# Download TAR Softwares
for ((i = 0; i < ${#tar_softwares[@]}; i++))
do
    tar_file_url_string="${tar_softwares[$i]}"
    IFS='/' read -r -a tar_file_url_array <<< "$tar_file_url_string"
    unset IFS
	tar_file_name=${tar_file_url_array[-1]}
	if [ -f "tar_file/${tar_file_name}" ]
    then
	    echo -e '\033[1;32m TAR: File Exists: ${tar_file_name} \033[0m'
    else
		aria2c --dir="tar_file" ${tar_file_url_string}
        #echo "File Does Not Exist: ${tar_file_name}"
    fi
done

echo -e '\033[1;32m TAR: All Software Downloaded. \033[0m'
