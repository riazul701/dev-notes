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

# Scoop Website: https://scoop.sh/
# Scoop GitHub: https://github.com/ScoopInstaller/Scoop
# Download powershell and install from this url: https://github.com/PowerShell/PowerShell
* gsudo => sudo for Windows: https://github.com/gerardog/gsudo
# (OR use "gsudo") To install global app start powershell in admin mode -> right click -> "Run as administrator"
# Execute this script using command: .\install-software.ps1

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
        Install-ScoopApp -Package "gsudo"
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

$scoop_office_softwares = @(
    "main/pwsh" # PowerShell
    "extras/wezterm"
    "extras/googlechrome"
    "extras/firefox"
    "main/git-lfs"
    "main/gh"
    "extras/lazygit" # For Lunarvim
    "extras/vcredist2022" # For "main/neovim"
    "main/neovim" # For Lunarvim
    "main/make" # For Lunarvim
    "main/python" # For Lunarvim
    "main/nodejs" # For Lunarvim
    "main/rust" # For Lunarvim
    "main/gcc" # For Lunarvim
    "main/go" # For Lunarvim
    "main/lua" # For Lunarvim
    "main/ruby" # For Lunarvim
    "main/php" # For Lunarvim
    "main/composer" # For Lunarvim
    "java/openjdk" # For Lunarvim
    "main/julia" # For Lunarvim
    "main/wget" # For Lunarvim
    "main/gzip" # For Lunarvim
    "main/ripgrep" # For Lunarvim
    "main/fd" # For Lunarvim, Yazi
    "nerd-fonts/Hack-NF" # For Lunarvim
    "main/ffmpeg" # For Yazi
    "main/7zip" # For Yazi
    "main/jq" # For Yazi
    "main/poppler" # For Yazi
    "main/fzf" # For Yazi
    "main/zoxide" # For Yazi
    "main/imagemagick" # For Yazi
    "main/yazi"
    "main/nvm" # Node Version Manager
    "main/vim"
    "extras/vifm"
    "extras/vscode"
    "extras/sublime-text"
    "extras/notepadplusplus"
    "main/rclone"
    "main/restic"
    "extras/postman"
    "extras/dbeaver"
    "kkzzhizhou_scoop-apps/FreeFileSync_cc713"
    "extras/anydesk"
    #"extras/teamviewer"
    #"main/docker"
    #"main/docker-machine"
    #"main/docker-compose"
    #"main/podman"
    #"extras/podman-desktop"
    "main/unison"
    "main/termscp"
    "main/charm-gum"
    "extras/dasel"
    "TheRandomLabs_Scoop-Python/httpie-py" # github.com/httpie/cli
    "extras/libreoffice"
	"extras/filezilla"
    #"extras/filezilla-server"
    "main/cwrsync"
    "extras/gimp"
    "extras/vlc"
    "main/ntop"
    "extras/foxit-reader"
    "extras/flow-launcher"
    #"main/jira"
    #"main/vagrant"
    #"extras/twinkle-tray"
	
    # Add: Git GUI
    # Add: Glances
    # Add: VirtualBox
)

$scoop_home_softwares = @(
    #"extras/chromium"
    #"extras/opera"
    #"extras/thunderbird"
    #"extras/sublime-merge"
    #"extras/skype"
    #"main/dvc"
    #"extras/lepton"
    #"main/syncthing"
    #"main/clipboard"
    #"main/glow"
    #"main/mysql-workbench"
    #"extras/sqlitebrowser"
    #"main/ngrok"
    #"extras/android-studio"
    #"extras/keepassxc"
    #"main/dive"
    #"extras/spotify"
    #"main/spotify-tui"
    #"extras/spotube"
    #"main/scrcpy"
    #"extras/guiscrcpy"
    #"extras/smartgit"
    #"extras/notepadnext"
    #"main/lazydocker"
    #"extras/beebeep"
    #"extras/musikcube"
    #"extras/sniffnet"
    #"extras/rclone-browser"
    #"extras/backrest"
    #"main/czkawka"
    #"extras/ventoy"
    #"main/lynx"
    #"main/yt-dlp"
    #"main/youtube-dl"
    #"kkzzhizhou_scoop-apps/open-video-downloader" # youtubedl-gui
    #"main/gallery-dl"
    #"main/lftp"
    #"extras/qimgv"
    #"extras/digikam"
    #"extras/clementine"
    #"extras/audacity"
    #"extras/smplayer"
    #"extras/mpv"
    #"extras/shotcut"
    #"extras/handbrake"
    #"main/handbrake-cli"
    #"extras/format-factory"
    #"extras/flameshot"
    #"extras/obs-studio"
    #"extras/freedownloadmanager"
    #"extras/rufus"
    #"kkzzhizhou_scoop-apps/4kvideodownloader"
    #"extras/winscp"
    #"main/cmder-full"
    #"extras/crystaldiskinfo"
    #"extras/crystaldiskmark"
    #"kkzzhizhou_scoop-apps/fxsound-np"
    #"extras/peazip"
    
    # Add: Httpie Desktop
    # Add: Piknik
    # Add: Veracrypt
    # Add: Avro Bangla Keyboard
)

gsudo cache on
foreach ($software_name in $scoop_office_softwares) {
    Install-ScoopApp -Package "$software_name"
}

# Install Scoop Packages, if Home Workstation
if ($HomeWorkstation) {
    foreach ($software_name in $scoop_home_softwares) {
        Install-ScoopApp -Package "$software_name"
    }
}
gsudo cache off
# gsudo -k # Stop all Admin cache sessions

# Install Lunvarvim, if not already installed
if ( !(Get-Command -Name "lvim" -CommandType Alias -ErrorAction SilentlyContinue) ) {
    Write-Verbose -Message "Installing Lunarvim..."
    $LV_BRANCH='release-1.4/neovim-0.9';
    iwr https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.ps1 -UseBasicParsing | iex
    . $PROFILE
} else {
    Write-Verbose -Message "Lunarvim already installed! Skipping..."
}
