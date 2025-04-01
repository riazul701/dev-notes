<#
.SYNOPSIS
    Script to Initialize custom powershell setup.
.DESCRIPTION
    Script uses scoop
.NOTES
    **NOTE** Will configure the Execution Policy for the "CurrentUser" to Unrestricted.
    Author: Mike Pruett
    Date: October 18th, 2018
#>
# [Original-Script => Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)

# Download powershell and install from this url: https://github.com/PowerShell/PowerShell
# Start powershell in admin mode -> right click -> "Run as administrator"
# Execute this script using command: .\all-windows-soft.ps1

$VerbosePreference = "Continue"

$scoop_office_softwares = @(
    #-------CLI (Start)---------
    #"main/pwsh" # PowerShell
    #"extras/wezterm"
    #"extras/windows-terminal"
    #"main/git-lfs"
    #"extras/git-credential-manager"
    #"main/gh"
    #"main/dvc"
    #"main/chezmoi"
    #"extras/keepassxc"
    #"extras/lazygit" # For Lunarvim
    #"extras/vcredist2022" # For "main/neovim"
    #"main/neovim" # For Lunarvim
    #"main/make" # For Lunarvim
    #"main/python" # For Lunarvim
    #"main/nodejs" # For Lunarvim
    #"main/rust" # For Lunarvim
    #"main/gcc" # For Lunarvim
    #"main/ripgrep" # For Lunarvim
    #"main/php" # For Lunarvim
    #"main/composer" # For Lunarvim (Optional)
    #"main/lua" # For Lunarvim (Optional)
    #"main/fd" # For Lunarvim, Yazi
    #"nerd-fonts/Hack-NF" # For Lunarvim, Yazi
    #"main/ffmpeg" # For Yazi
    #"main/7zip" # For Yazi
    #"main/jq" # For Yazi
    #"main/poppler" # For Yazi
    #"main/fzf" # For Yazi
    #"main/zoxide" # For Yazi
    #"main/imagemagick" # For Yazi
    #"main/yazi"
    #"main/vim"
    #"extras/vifm"
    #"main/rclone"
    #"main/restic"
    #"main/unison"
    #"main/termscp"
    #"main/charm-gum"
    #"extras/dasel"
    #"main/cwrsync"
    #"main/ntop"
    #"main/jira"
    #"main/glow"
    #"main/ngrok"
    #"main/lynx"
    #"main/lftp"
    #"main/wget"
    #-------CLI (End)---------

    #-------GUI (Start)-------
    #"extras/komorebi"
    #"extras/whkd" # Keybindings for Komorebi
    #LucasOe_scoop-lucasoe/yasb
    #"extras/googlechrome"
    #"extras/firefox"
    #"extras/chromium"
    #"extras/opera"
    #"extras/thunderbird"
    #"extras/vscode"
    #"extras/sublime-text"
    #"extras/notepadplusplus"
    #"extras/postman"
    #"extras/dbeaver"
    #"extras/anydesk"
    #"extras/teamviewer"
    #"extras/libreoffice"
    "extras/filezilla"
    #"extras/gimp"
    #"extras/vlc"
    #"extras/foxit-reader"
    #"extras/flow-launcher"
    #"extras/twinkle-tray"
    #"extras/lepton"
    #"main/clipboard"
    #"main/mysql-workbench"
    #"extras/sqlitebrowser"
    #"extras/android-studio"
    #"extras/notepadnext"
    #"extras/backrest"
    #"main/czkawka"
    "extras/peazip"
    #"extras/qimgv"
    #"extras/flameshot"
    #"extras/freedownloadmanager"
    #-------GUI (End)-------
    
    #-------Optional (Start)---------
    #"main/nvm" # Node Version Manager (Alternative of "main/nodejs")
    #"main/docker" # Windows containers
    #"main/docker-machine" # Windows containers
    #"main/docker-compose" # Windows containers
    #"main/dive" # Windows containers
    #"main/lazydocker" # Windows containers
    #"main/podman" # Windows containers
    #"extras/podman-desktop" # Windows containers
    #"extras/filezilla-server"
    #"main/vagrant"
    #"extras/winscp"
    #"main/cmder-full"
    #"extras/beebeep"
    #"extras/sublime-merge"
    #"extras/smartgit"
    #-------Optional (End)---------

    #--------Remove (Start)--------
    #"main/gzip"
    #"main/ruby" # For Lunarvim (Optional)
    #"main/go" # For Lunarvim (Optional)
    #"java/openjdk" # For Lunarvim (Optional)
    #"main/julia" # For Lunarvim (Optional)
    #--------Remove (End)----------

    # Add: "kkzzhizhou_scoop-apps/FreeFileSync_cc713"
    # Add: Git GUI
    # Add: Git Cola
    # Add: Glances (Python Based)
    # Add: HTTPie (Python Based)
    # Add: VirtualBox
)

$scoop_home_softwares = @(
    #"extras/skype"
    #"main/syncthing"
    #"extras/spotify"
    #"main/spotify-tui"
    #"extras/spotube"
    #"main/scrcpy"
    #"extras/guiscrcpy"
    #"extras/musikcube"
    #"extras/sniffnet"
    #"extras/rclone-browser"
    #"main/yt-dlp"
    #"main/youtube-dl"
    #"main/gallery-dl"
    #"extras/digikam"
    #"extras/clementine"
    #"extras/audacity"
    #"extras/smplayer"
    #"extras/mpv"
    #"extras/shotcut"
    #"extras/handbrake"
    #"main/handbrake-cli"
    #"extras/format-factory"
    #"extras/obs-studio"
    #"extras/ventoy"
    #"extras/rufus"
    #"extras/crystaldiskinfo"
    #"extras/crystaldiskmark"
    
    # Add: "kkzzhizhou_scoop-apps/4kvideodownloader"
    # Add: "kkzzhizhou_scoop-apps/fxsound-np"
    # Add: "kkzzhizhou_scoop-apps/open-video-downloader" # youtubedl-gui
    # Add: Httpie Desktop
    # Add: Piknik
    # Add: Veracrypt
    # Add: Avro Bangla Keyboard
)

$chocolatey_office_softwares = @(
    "vlc"
    "smplayer"
)

$chocolatey_home_softwares = @(
    #"sublimetext3"
    #"notepadplusplus"
)

$winget_office_softwares = @(
    "pbek.QOwnNotes"
    "Audacity.Audacity"
)

$winget_home_softwares = @(
    #"vlc"
)

# Install Scoop, if not already installed
if ( !(Get-Command -Name "scoop" -CommandType Application -ErrorAction SilentlyContinue) ) {
    Write-Verbose -Message "Installing Scoop..."
    iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
    scoop install git --global # For adding scoop bucket
}

# Install Chocolatey, if not already installed (Restart terminal optionally)
if (! (Get-Command -Name "choco" -CommandType Application -ErrorAction SilentlyContinue) ) {
    Write-Verbose -Message "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function Install-ScoopApp {
    param (
        [string]$Package
    )
    # Write-Verbose -Message "Scoop => Preparing to install $Package"
    if (! (scoop info $Package).Installed ) {
        Write-Verbose -Message "Scoop => Installing $Package"
        scoop install $Package --global
    } else {
        Write-Verbose -Message "Scoop => Package $Package already installed! Skipping..."
    }
}

function Enable-Bucket {
    param (
        [string]$Bucket
    )
    if (!($(scoop bucket list).Name -eq "$Bucket")) {
        Write-Verbose -Message "Adding Bucket $Bucket to scoop..."
        scoop bucket add $Bucket
    } else {
        Write-Verbose -Message "Bucket $Bucket already added! Skipping..."
    }
}

function Install-ChocoApp {
    param (
        [string]$Package
    )
    # Write-Verbose -Message "Choco => Preparing to install $Package"
    $listApp = choco list $Package
    if ($listApp -like "0 packages installed.") {
        Write-Verbose -Message "Choco => Installing $Package"
        choco install $Package -y
    } else {
        Write-Verbose -Message "Choco => Package $Package already installed! Skipping..."
    }
}

function Install-WinGetApp {
    param (
        [string]$PackageID
    )
    # Write-Verbose -Message "Winget => Preparing to install $PackageID"
    Write-Verbose -Message "Winget => Installing $PackageID"
    winget install --silent --id "$PackageID" --accept-source-agreements --accept-package-agreements --exact --source=winget
}

# Check if Home Workstation
if ($(Read-Host -Prompt "Is this a workstation for Home use (y/n)?") -eq "y") {
    $HomeWorkstation = $True
} else {
    $HomeWorkstation = $False
}

# Add Scoop Buckets
Enable-Bucket -Bucket "main"
Enable-Bucket -Bucket "extras"
Enable-Bucket -Bucket "java"
Enable-Bucket -Bucket "nerd-fonts"
scoop bucket add LucasOe_scoop-lucasoe https://github.com/LucasOe/scoop-lucasoe

foreach ($software_name in $scoop_office_softwares) {
    Install-ScoopApp -Package "$software_name"
}

foreach ($software_name in $chocolatey_office_softwares) {
    Install-ChocoApp -Package "$software_name"
}

foreach ($software_name in $winget_office_softwares) {
    Install-WinGetApp -PackageID "$software_name"
}

# Install Scoop Packages, if Home Workstation
if ($HomeWorkstation) {
    foreach ($software_name in $scoop_home_softwares) {
        Install-ScoopApp -Package "$software_name"
    }

    foreach ($software_name in $chocolatey_home_softwares) {
        Install-ChocoApp -Package "$software_name"
    }

    foreach ($software_name in $winget_home_softwares) {
        Install-WinGetApp -PackageID "$software_name"
    }
}
