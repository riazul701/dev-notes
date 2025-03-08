# Do Not Run This Script In Administrator Mode

# Author: Mike Pruett (GitHub Gist)
# [Original-Script => Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7)

# Scoop Website: https://scoop.sh/
# Scoop GitHub: https://github.com/ScoopInstaller/Scoop
# Download powershell and install from this url: https://github.com/PowerShell/PowerShell
# gsudo => sudo for Windows: https://github.com/gerardog/gsudo
# (OR use "gsudo") To install global app start powershell in admin mode -> right click -> "Run as administrator"
# Execute this script using command: .\install-software.ps1
# On Windows-X-Lite Micro-10, `gsudo` prompt for every software installation: Go to "Control Panel" -> "Security and Maintenance" -> "Change User Account Control settings" -> Change this to: "Notify me only when apps try to make changes to my computer (default)". Check this by opening `Task Manger` from right clicking on `Taskbar`

$scoop_office_softwares = @(
    #-------CLI (Start)---------
    "main/pwsh" # PowerShell
    "extras/wezterm"
    "extras/windows-terminal"
    "main/git-lfs"
    "extras/git-credential-manager"
    "main/gh"
    #"main/dvc"
    "main/chezmoi"
    "extras/keepassxc"
    "extras/lazygit" # For Lunarvim
    "extras/vcredist2022" # For "main/neovim"
    "main/neovim" # For Lunarvim
    "main/make" # For Lunarvim
    "main/python" # For Lunarvim
    "main/nodejs" # For Lunarvim
    "main/rust" # For Lunarvim
    "main/gcc" # For Lunarvim
    "main/ripgrep" # For Lunarvim
    "main/php" # For Lunarvim
    #"main/composer" # For Lunarvim (Optional)
    #"main/lua" # For Lunarvim (Optional)
    "main/fd" # For Lunarvim, Yazi
    "nerd-fonts/Hack-NF" # For Lunarvim, Yazi
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
    "TheRandomLabs_Scoop-Python/httpie-py" # github.com/httpie/cli
    "main/cwrsync"
    "main/ntop"
    #"main/jira"
    #"main/glow"
    #"main/ngrok"
    #"main/lynx"
    #"main/lftp"
    "main/wget"
    #-------CLI (End)---------

    #-------GUI (Start)-------
    "extras/glazewm"
    "extras/zebar"
    "extras/googlechrome"
    "extras/firefox"
    #"extras/chromium"
    #"extras/opera"
    #"extras/thunderbird"
    "extras/vscode"
    "extras/sublime-text"
    #"extras/notepadplusplus"
    #"extras/postman"
    #"extras/dbeaver"
    #"kkzzhizhou_scoop-apps/FreeFileSync_cc713"
    #"extras/anydesk"
    #"extras/teamviewer"
    #"extras/libreoffice"
    #"extras/filezilla"
    #"extras/gimp"
    "extras/vlc"
    #"extras/foxit-reader"
    "extras/flow-launcher"
    #"extras/twinkle-tray"
    #"extras/lepton"
    #"main/clipboard"
    #"main/mysql-workbench"
    #"extras/sqlitebrowser"
    #"extras/android-studio"
    "extras/notepadnext"
    #"extras/backrest"
    #"main/czkawka"
    "extras/peazip"
    "extras/qimgv"
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

    # Add: Git GUI
    # Add: Git Cola
    # Add: Glances
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
    #"kkzzhizhou_scoop-apps/open-video-downloader" # youtubedl-gui
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
    #"kkzzhizhou_scoop-apps/4kvideodownloader"
    #"extras/crystaldiskinfo"
    #"extras/crystaldiskmark"
    #"kkzzhizhou_scoop-apps/fxsound-np"
    
    # Add: Httpie Desktop
    # Add: Piknik
    # Add: Veracrypt
    # Add: Avro Bangla Keyboard
)

$VerbosePreference = "Continue"

function Install-ScoopApp {
    param (
        [string]$Package
    )
    Write-Verbose -Message "Preparing to install $Package"
    if (! (scoop info $Package).Installed ) {
        Write-Verbose -Message "Installing $Package"
        sudo scoop install $Package --global
    } else {
        Write-Verbose -Message "Package $Package already installed! Skipping..."
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

# Check if Home Workstation
if ($(Read-Host -Prompt "Is this a workstation for Home use (y/n)?") -eq "y") {
    $HomeWorkstation = $True
} else {
    $HomeWorkstation = $False
}

# Install Scoop, if not already installed
#$scoopInstalled = Get-Command "scoop"
if ( !(Get-Command -Name "scoop" -CommandType Application -ErrorAction SilentlyContinue) ) {
    Write-Verbose -Message "Installing Scoop..."
    #iex ((New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh'))
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

if (! (scoop info gsudo).Installed ) {
        Write-Verbose -Message "Installing gsudo"
        scoop install gsudo
} else {
    Write-Verbose -Message "Package gsudo already installed! Skipping..."
}

# Configure Aria2 Download Manager
Install-ScoopApp -Package "aria2"
if (!$(scoop config aria2-enabled) -eq $True) {
    scoop config aria2-enabled true
}
if (!$(scoop config aria2-warning-enabled) -eq $False) {
    scoop config aria2-warning-enabled false
}

if (! (scoop info git).Installed ) {
        Write-Verbose -Message "Installing git"
        sudo scoop install git --global
} else {
    Write-Verbose -Message "Package git already installed! Skipping..."
}

## Add Buckets
Enable-Bucket -Bucket "main"
Enable-Bucket -Bucket "extras"
Enable-Bucket -Bucket "java"
Enable-Bucket -Bucket "nerd-fonts"
scoop bucket add kkzzhizhou_scoop-apps https://github.com/kkzzhizhou/scoop-apps
scoop bucket add TheRandomLabs_Scoop-Python https://github.com/TheRandomLabs/Scoop-Python

# Install Scoop Packages

gsudo config CacheDuration -1 # Use '-1' to keep open until logoff (or until `cache off`, or `-k`)
gsudo cache on # The default `CacheDuration` is 5 minutes

foreach ($software_name in $scoop_office_softwares) {
    Install-ScoopApp -Package "$software_name"
}

# Install Scoop Packages, if Home Workstation
if ($HomeWorkstation) {
    foreach ($software_name in $scoop_home_softwares) {
        Install-ScoopApp -Package "$software_name"
    }
}

gsudo cache off # The default `CacheDuration` is 5 minutes
# gsudo -k # Stop all `Administrator` cache sessions

# Install Lunvarvim, if not already installed
if ( !(Get-Command -Name "lvim" -CommandType Alias -ErrorAction SilentlyContinue) ) {
    Write-Verbose -Message "Installing Lunarvim..."
    $LV_BRANCH='release-1.4/neovim-0.9';
    iwr https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.ps1 -UseBasicParsing | iex
    . $PROFILE
} else {
    Write-Verbose -Message "Lunarvim already installed! Skipping..."
}
