<#
.SYNOPSIS
    Script to Initialize custom powershell setup.
.DESCRIPTION
    Script uses scoop, chocolatey, winget
.NOTES
    **NOTE** Will configure the Execution Policy for the "CurrentUser" to Unrestricted.
    Author: Mike Pruett
    Date: October 18th, 2018
#>
# [Original-Script => Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)

# Download powershell and install from this url: https://github.com/PowerShell/PowerShell
# Start powershell in admin mode -> Right click -> "Run as administrator"
# Execute this script using command: .\all-windows-soft.ps1
# If PowerShell prevents from executing script, then execute (from https://scoop.sh/):
# `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

$VerbosePreference = "Continue"

$scoop_office_softwares = @(
    # main/winget

    #-------Font (Start)---------
    "nerd-fonts/Hack-NF" # For Lunarvim, Yazi
    "nerd-fonts/JetBrains-Mono" # For Yasb
    #-------Font (End)---------

    #-------CLI (Start)---------
    "main/chezmoi"
    "extras/keepassxc"
    "main/pwsh" # PowerShell
    "main/git"
    "main/git-lfs"
    "extras/git-credential-manager"
    "main/gh"
    "main/dvc"
    "extras/lazygit" # For Lunarvim
    "main/delta"
    "main/difftastic"
    "extras/vcredist2022" # For "main/neovim"
    "main/neovim" # For Lunarvim
    "main/make" # For Lunarvim
    "main/python" # For Lunarvim
    "main/nodejs" # For Lunarvim
    "main/rust" # For Lunarvim
    "main/gcc" # For Lunarvim
    "main/ripgrep" # For Lunarvim
    "main/php" # For Lunarvim
    "main/composer" # For Lunarvim (Optional)
    "main/lua" # For Lunarvim (Optional)
    "main/fd" # For Lunarvim, Yazi
    "main/ffmpeg" # For Yazi
    "main/7zip" # For Yazi
    "main/jq" # For Yazi
    "main/poppler" # For Yazi
    "main/fzf" # For Yazi
    "main/zoxide" # For Yazi
    "main/imagemagick" # For Yazi
    "main/yazi"
    "main/vim"
    "extras/vifm"
    "main/rclone"
    "main/restic"
    "main/unison"
    "main/termscp"
    "main/charm-gum"
    "extras/dasel"
    "main/cwrsync"
    "main/ntop"
    "main/glow"
    "main/ngrok"
    "main/lynx"
    "main/lftp"
    "main/wget"
    "main/aria2"
    "main/clipboard"
    #-------CLI (End)---------

    #-------GUI (Start)-------
    "extras/twinkle-tray"
    "extras/komorebi"
    "extras/whkd" # Keybindings for Komorebi
    "LucasOe_scoop-lucasoe/yasb"
    "extras/flow-launcher"
    "extras/vscode"
    "extras/sublime-text"
    "extras/notepadplusplus"
    "extras/notepadnext"
    "extras/postman"
    "extras/dbeaver"
    "extras/meld"
    "extras/anydesk"
    "extras/teamviewer"
    "extras/libreoffice"
    "extras/filezilla"
    "extras/mobaxterm"
    "extras/gimp"
    "extras/vlc"
    "extras/foxit-reader"
    "extras/lepton"
    "main/mysql-workbench"
    "extras/sqlitebrowser"
    "extras/restic-browser"
    "extras/backrest"
    "main/czkawka"
    "extras/peazip"
    "extras/qimgv"
    "extras/flameshot"
    "extras/freedownloadmanager"
    "extras/transmission"
    "extras/persepolis" # GUI for aria2
    "extras/obs-studio"
    "extras/doublecmd"
    "extras/localsend"
    "extras/beebeep"
    #"extras/android-studio"
    #-------GUI (End)-------
    
    #-------Optional (Start)---------
    #"main/nvm" # Node Version Manager (Alternative of "main/nodejs")
    #-------Optional (End)---------

    # Add: "kkzzhizhou_scoop-apps/FreeFileSync_cc713"
    # Add: Glances (Python Based)
)

$scoop_home_softwares = @(
    #-------CLI (Start)---------
    "main/yt-dlp"
    "main/youtube-dl"
    "main/gallery-dl"
    "extras/musikcube"
    "main/spotify-tui"
    "extras/mpv"
    "main/handbrake-cli"
    "main/scrcpy"
    "extras/sniffnet"
    #-------CLI (End)---------

    #-------GUI (Start)-------
    "extras/youtube-dl-gui" # GUI for youtube-dl
    "extras/rclone-browser"
    "main/syncthing"
    "extras/sirikali"
    "extras/digikam"
    "extras/clementine"
    "extras/audacity"
    "extras/spotify"
    "extras/spotube"
    "extras/smplayer"
    "extras/shotcut"
    "extras/handbrake"
    "extras/guiscrcpy" # GUI for "main/scrcpy"
    "extras/ventoy"
    "extras/rufus"
    "extras/format-factory"
    #-------GUI (End)-------
        
    # Add: "kkzzhizhou_scoop-apps/4kvideodownloader"
    # Add: "kkzzhizhou_scoop-apps/open-video-downloader" # youtubedl-gui
    # Add: Piknik
)

$chocolatey_office_softwares = @(
    "git-cola"
    "files"
)

$chocolatey_home_softwares = @(
    "fxsound"
)

$winget_office_softwares = @(
    "OmicronLab.Avro"
    "Google.Chrome"
    "Mozilla.Firefox"
    "Opera.Opera"
    "Mozilla.Thunderbird"
    "wez.wezterm"
    "Microsoft.WindowsTerminal"
    "Oracle.VirtualBox"
    "Hashicorp.Vagrant"
    "HTTPie.HTTPie"
    "TwibrightLabs.Links"
    "Dropbox.Dropbox" 
)

$winget_home_softwares = @(
    "IDRIX.VeraCrypt"
    "CrystalDewWorld.CrystalDiskInfo"
    "CrystalDewWorld.CrystalDiskMark"
    #"BlueStack.BlueStacks"
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
