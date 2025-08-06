#!/bin/bash

# Tested On OS: Fedora-42-LXDE

#--------------------------Start: General-Information---------------------------
# https://packages.fedoraproject.org/
# https://repology.org/repository/fedora_42
# **[How to Keep ‘sudo’ Password Timeout Session Longer in Linux](https://www.tecmint.com/set-sudo-password-timeout-session-longer-linux/)**
# * `sudo visudo` : Open the `/etc/sudoers` file with super user privileges
# * "Defaults        env_reset,timestamp_timeout=20" [time out after 20 minutes]
# * Also set time to `0` if you want a password prompt for every sudo command you execute, or disable password prompt forever by setting the value `-1`.
#---------------------------End: General-Information----------------------------

#--------------------------Start: Snap-Package-Manger---------------------------
# https://snapcraft.io/
# ERROR: "Fetch and check assertions for snap "rclone" (525) (cannot verify snap "rclone", no matching signatures found)" [This happens after pc sleep, restart solves it.]
# **[How to remove uninstalled snaps from cache?](https://askubuntu.com/questions/1075050/how-to-remove-uninstalled-snaps-from-cache)**
# * You can remove the files in `/var/lib/snapd/cache` without issue. Also there is no need to stop snapd before.
# * Here the command to do that: `sudo sh -c 'rm -rf /var/lib/snapd/cache/*'`
#--------------------------End: Snap-Package-Manger-----------------------------

#--------------------------Start: Flatpak-Package-Manger------------------------
# https://flathub.org/
#--------------------------End: Flatpak-Package-Manger--------------------------

#--------------------------Start: Nix-Package-Manger----------------------------
# https://search.nixos.org/packages
# ERROR: "Nix does not work with selinux enabled yet!"
# see https://github.com/NixOS/nix/issues/2374
# **[How to Disable SELinux Temporarily or Permanently](https://www.tecmint.com/disable-selinux-in-centos-rhel-fedora/)**
#  * Disable SELinux Permanently
#  * To permanently disable SELinux, use your favorite text editor to open the file `/etc/sysconfig/selinux` as follows: `# vi /etc/sysconfig/selinux`
#  * Then change the directive `SELinux=enforcing` to `SELinux=disabled` as shown in the below image. `SELINUX=disabled`
#  * Then, save and exit the file, for the changes to take effect, you need to reboot your system and then check the status of SELinux using sestatus command as shown: `sestatus`
#---------------------------End: Nix-Package-Manger-------------------------------

#---------------------------End: Homebrew-Package-Manger--------------------------
# https://brew.sh/
# Homebrew works for Terminal software. Graphical software has some issues.
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
# Note (Nix-Package): When using `nix shell`, `nix build`, `nix develop`, etc with a flake, then pass `--impure` in order to allow use of environment variables.

snap_office_softwares=(
    # ["Name"]="Snap Identifier" # `snap list`
    ["yazi"]="yazi --classic"
    ["opera"]="opera"
    ["chezmoi"]="chezmoi --classic"
    ["code"]="code --classic" # Visual Studio Code
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
    ["notepadnext"]="notepadnext --classic"
    ["sqlitebrowser"]="sqlitebrowser"
)

snap_home_softwares=(
    # ["Name"]="Snap Identifier" # `snap list`
    ["spotify"]="spotify"
    ["spt"]="spt --edge" # [Spotify TUI](https://github.com/Rigellute/spotify-tui)
    ["scrcpy"]="scrcpy"
    ["guiscrcpy"]="guiscrcpy"
    ["gallery-dl"]="gallery-dl"
    ["audiotube"]="audiotube"
    ["varia"]="varia"
    ["qbittorrent-desktop-tak"]="qbittorrent-desktop-tak" # Media Server
    ["qbittorrent-tak"]="qbittorrent-tak" # Media Server
    ["prowlarr-tak"]="prowlarr-tak" # Media Server
    ["lidarr-tak"]="lidarr-tak" # Media Server
    ["radarr-tak"]="radarr-tak" # Media Server
    ["sonarr-tak"]="sonarr-tak" # Media Server
    ["readarr-tak"]="readarr-tak" # Media Server
    ["bazarr-tak"]="bazarr-tak" # Media Server
)

flatpak_office_softwares=(
    # ["Bash Alias Command"]="Application" # `flatpak list --columns=name,application`
    ["flatseal"]="com.github.tchx84.Flatseal" # Manage Flatpak Permissions Graphically
    ["wezterm"]="org.wezfurlong.wezterm"
    ["free-file-sync"]="org.freefilesync.FreeFileSync"
    ["anydesk"]="com.anydesk.Anydesk"
    ["podman-desktop"]="io.podman_desktop.PodmanDesktop"
    ["boxbuddyrs"]="io.github.dvlv.boxbuddyrs" # Graphical Distrobox Manager
    ["smartgit"]="com.syntevo.SmartGit"
    ["handbrake"]="fr.handbrake.ghb"
    ["fdm"]="org.freedownloadmanager.Manager"
    ["peazip"]="io.github.peazip.PeaZip"
    ["cpu-x"]="io.github.thetumultuousunicornofdarkness.cpu-x"
)

flatpak_home_softwares=(
    # ["Bash Alias Command"]="Application" # `flatpak list --columns=name,application`
    ["dropbox"]="com.dropbox.Client"
    ["rclone-shuttle"]="io.github.pieterdd.RcloneShuttle"
    ["jellyfin-player"]="com.github.iwalton3.jellyfin-media-player"
)

nix_office_softwares=(
    # ["Command"]="Command" # `nix-env --query`
    ["lazygit"]="lazygit" # For Lunarvim
    ["termscp"]="termscp"
    ["dasel"]="dasel"
    ["nerdfetch"]="nerdfetch" # `nerdfonts`, For Lunarvim, Yazi
    ["lazydocker"]="lazydocker"
    ["beebeep"]="beebeep"
    ["backrest"]="backrest" # Restic GUI
    ["frogmouth"]="frogmouth"
    ["httpie-desktop"]="httpie-desktop"
    ["czkawka"]="czkawka"
    ["piknik"]="piknik"
)

nix_home_softwares=(
    # ["Command"]="Command" # `nix-env --query`
    ["rclone-browser"]="rclone-browser"
    ["musikcube"]="musikcube"
    ["ytfzf"]="ytfzf"
    ["sniffnet"]="sniffnet"
    ["ventoy-gtk"]="ventoy-full-gtk" # Alternative: `ventoy-full-qt`
    ["veracrypt"]="veracrypt"
    ["linssid"]="linssid"
)

brew_office_softwares=(
    # ["Command"]="Command" # `brew list`
    ["lazydocker"]="lazydocker"   
)

brew_home_softwares=(
    # ["Command"]="Command" # `brew list`
    ["micro"]="micro" # Editor
)

dnf_office_softwares=(
    # ["Command"]="Package-Name" # `dnf list --installed`
    ["tailscale"]="tailscale"
    ["kitty"]="kitty"
    ["keepassxc"]="keepassxc"
    ["firefox"]="firefox"
    ["chromium"]="chromium"
    ["liberation-fonts-all"]="liberation-fonts-all" # Dependency of Google-Chrome
    ["thunderbird"]="thunderbird"
    # ["ibus-avro"]="ibus-avro"
    ["libreoffice"]="libreoffice"
    ["docker-ce"]="docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin" # [Install Docker Engine on Fedora](https://docs.docker.com/engine/install/fedora/)
    ["podman"]="podman"
    ["git"]="git" # For Lunarvim
    ["git-lfs"]="git-lfs" # (https://github.com/git-lfs/git-lfs)
    ["git-gui"]="git-gui" # (https://git-scm.com/docs/git-gui)
    ["gitk"]="gitk" # (https://git-scm.com/docs/gitk)
    ["git-cola"]="git-cola"
    ["gh"]="gh" # (https://cli.github.com/)
    ["gnupg2"]="gnupg2" # `gpg` command, For "git-credential-manager"
    ["pass"]="pass" # For "git-credential-manager"
    ["i3"]="i3" # Includes: `i3-wm`, `i3bar`, `i3status`, `i3lock`, `dunst`, `dmenu`
    ["pulseaudio-utils"]="pulseaudio-utils" # `pactl` command, Includes: `paplay`, `pacat`, `parec`, `pacmd`, `pactl`, `padsp`, `pax11publish`
    ["polybar"]="polybar"
    ["fontawesome-fonts-all"]="fontawesome-fonts-all" # Icon for "polybar"
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
    ["nodejs"]="nodejs" # `node` command, For Lunarvim: `node --version`
    ["nodejs-npm"]="nodejs-npm" # `npm` command, For Lunarvim: `npm --version`
    ["rust"]="rust" # `rustc` command, For Lunarvim: `rustc --version`
    ["cargo"]="cargo" # For Lunarvim: `cargo --version`
    ["make"]="make" # For Lunarvim: `make --version`
    ["gcc"]="gcc" # For Lunarvim: `gcc --version`
    ["ripgrep"]="ripgrep" # `rg` command, For Lunarvim: `rg --version`
    ["xclip"]="xclip" # For Lunarvim, Yazi
    ["fzf"]="fzf"
    ["vifm"]="vifm"
    ["filezilla"]="filezilla"
    ["rsync"]="rsync" # For: backup-n-sync
    ["rclone"]="rclone" # For: backup-n-sync
    ["restic"]="restic" # For: backup-n-sync
    ["copyq"]="copyq"
    ["glow"]="glow"
    ["mycli"]="mycli"
    ["gimp"]="gimp"
    ["pcmanfm"]="pcmanfm" # Alternative: `pcmanfm-qt`
    ["Thunar"]="thunar" # `thunar` command
    ["doublecmd-gtk"]="doublecmd-gtk" # Alternative: `doublecmd-qt`, `doublecmd-qt6`
    ["p7zip"]="p7zip" # `7za` command, "7zip" package
    ["htop"]="htop"
    ["pipewire-pulseaudio"]="pipewire-pulseaudio" # Built-in inside Fedora-42-LXDE, originally "pulseaudio"
    ["pavucontrol"]="pavucontrol" # "pulseaudio" volume control
    ["jq"]="jq" # For: backup-n-sync
    ["distrobox"]="distrobox"
    ["tmux"]="tmux"
    ["lynx"]="lynx"
    ["httpie"]="httpie"
    ["lftp"]="lftp"
    ["qimgv"]="qimgv"
    ["audacity"]="audacity"
    ["vlc"]="vlc"
    ["smplayer"]="smplayer"
    ["mpv"]="mpv"
    ["shotcut"]="shotcut"
    ["flameshot"]="flameshot"
    ["obs-studio"]="obs-studio"
    ["stacer"]="stacer"
    ["glances"]="glances"
    ["gum"]="gum" # For: backup-n-sync
    ["unison"]="unison" # For: backup-n-sync
    ["unison-gtk"]="unison-gtk" # For: backup-n-sync
    ["progress"]="progress" # For: backup-n-sync

    # Add: AB Download Manager
    # Add: Backup-N-Sync Project Dependencies
    # Add: yt-x (youtube terminal)
    # Add: Git Credential Manager
    # Add: HTTrack Website Copier
)

dnf_home_softwares=(
    # ["Command"]="Package-Name" # `dnf list --installed`
    ["trayscale"]="trayscale" # Tailscale GUI
    ["jellyfin"]="jellyfin --allowerasing" # Prefer RPM-Fusion over Fedora repository, because dependency version is conflicted, like `ffmpeg`
    ["syncthing"]="syncthing"
    ["yt-dlp"]="yt-dlp"
    ["wavemon"]="wavemon"
    ["digikam"]="digikam"
    ["clementine"]="clementine"
    ["waydroid"]="waydroid" # Android App
    ["weston"]="weston" # Android App, Wayland inside X11
)

rpm_office_softwares=(
    # ["Command"]="URL Address"
    ["rustdesk"]="https://github.com/rustdesk/rustdesk/releases/download/1.4.0/rustdesk-1.4.0-0.x86_64.rpm"
    ["google-chrome"]="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
    #["git-credential-manager"]="https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb"
)

rpm_home_softwares=(
    # ["Command"]="URL Address"
    ["musikcube"]="https://github.com/clangen/musikcube/releases/download/3.0.4/musikcube_3.0.4_linux_x86_64.rpm"
    # ["4kvideodownloader"]="https://dl.4kdownload.com/app/4kvideodownloaderplus_1.10.4-1_amd64.deb"
    # ["mindforger"]="https://github.com/dvorka/mindforger/releases/download/2.0.0/debian-12-bookworm--mindforger_2.0.0-1_amd64.deb"
)

appimage_office_softwares=(
    # "URL Address"
    # "https://github.com/pbek/QOwnNotes/releases/download/v23.3.7/QOwnNotes-x86_64.AppImage"
)

appimage_home_softwares=(
    # "URL Address"
    # "https://github.com/mhoeher/opentodolist/releases/download/3.42.0/OpenTodoList-3.42.0-x86_64.AppImage"
)

tar_office_softwares=(
    # "URL Address"
    # "https://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.5.0727.x64.run.tar.gz"
    # "https://releases.hashicorp.com/vagrant/2.3.4/vagrant_2.3.4_linux_amd64.zip"
)

tar_home_softwares=(
    # "URL Address"
    # https://github.com/amir1376/ab-download-manager/releases/download/v1.6.4/ABDownloadManager_1.6.4_linux_x64.tar.gz
    https://github.com/Tyrrrz/YoutubeDownloader/releases/download/1.15/YoutubeDownloader.linux-x64.zip
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
    is_pkg_manager_exist_x86_64=$(echo "$dnf_list_installed" | awk '{print $1}' | grep "^${pkg_manager}.x86_64\$")
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

#--------------------START: Collect Packages To Install-------------------
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
#--------------------END: Collect Packages To Install------------------

#-------------------------START: Add RPM Repository-------------------------
is_rpmfusion_repo_exist=$(dnf repo list | awk '{print $1}' | grep "rpmfusion-free")
if [[ "$is_rpmfusion_repo_exist" != '' ]]
then
    echo -e "\033[1;32m Repo => RPM Fusion repo is already added, skipping... \033[0m"
else
    sudo dnf --assumeyes install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf --assumeyes config-manager setopt fedora-cisco-openh264.enabled=1
fi
is_docker_repo_exist=$(dnf repo list | awk '{print $1}' | grep "docker-ce-stable")
if [[ "$is_docker_repo_exist" != '' ]]
then
    echo -e "\033[1;32m Repo => Docker repo is already added, skipping... \033[0m"
else
    sudo dnf -y install dnf-plugins-core
    sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
fi
#-------------------------END: Add RPM Repository-------------------------

#-------------------------START: Install Snap Softwares-------------------------
for snap_cmd in "${!snap_softwares_all[@]}"; do
    snap_software="${snap_softwares_all[$snap_cmd]}"
    is_snap_soft_installed=$(snap list | awk '{print $1}' | grep "^${snap_cmd}\$")
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
    is_flatpak_soft_installed=$(flatpak list --columns=application | grep "^${flatpak_software}\$")
    if [[ "$flatpak_software" == "$is_flatpak_soft_installed" ]]
    then
        echo -e "\033[1;32m Flatpak => $flatpak_software is already installed, skipping... \033[0m"
    else
        flatpak install --assumeyes flathub $flatpak_software
        is_flatpak_soft_installed=$(flatpak list --columns=application | grep "^${flatpak_software}\$")
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
    is_nix_soft_installed=$(nix-env --query | grep "${nix_cmd}") # Do not use `^` and `\$` because there is package version at end
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
    is_brew_soft_installed=$(brew list | grep "^${brew_cmd}\$")
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
    is_dnf_soft_installed_x86_64=$(echo "$dnf_list_installed" | awk '{print $1}' | grep "^${dnf_cmd}.x86_64\$")
    is_dnf_soft_installed_noarch=$(echo "$dnf_list_installed" | awk '{print $1}' | grep "^${dnf_cmd}.noarch\$")
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
    is_rpm_soft_installed=$(echo "$dnf_list_installed" | grep "^${rpm_cmd}\$")
    rpm_soft_path=$(command -v "$rpm_cmd")
    if [[ ("$is_rpm_soft_installed" != '') || ("$rpm_soft_path" != '') ]]
    then
        echo -e "\033[1;32m RPM => $rpm_cmd ($rpm_file_name) is already installed, skipping... \033[0m"
    else
        if [[ -f "$download_path/rpm/$rpm_file_name" ]]
        then
            sudo dnf --assumeyes install "$download_path/rpm/$rpm_file_name"
        else
            aria2c --dir="$download_path/rpm" "$rpm_url_string"
            sudo dnf --assumeyes install "$download_path/rpm/$rpm_file_name"
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

#-------------------------START: Install Other Softwares-------------------------

#-------------------------END: Install Other Softwares-------------------------
