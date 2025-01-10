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
# To install global app start powershell in admin mode -> right click "Run as administrator"
# Execute this script using command: ./install-software.ps1

$VerbosePreference = "Continue"

function Install-ScoopApp {
    param (
        [string]$Package
    )
    Write-Verbose -Message "Preparing to install $Package"
    if (! (scoop info $Package).Installed ) {
        Write-Verbose -Message "Installing $Package"
        scoop install $Package --global
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

# Install Scoop, if not already installed
#$scoopInstalled = Get-Command "scoop"
#if ( !(Get-Command -Name "scoop" -CommandType Application -ErrorAction SilentlyContinue | Out-Null) ) {
#    Write-Verbose -Message "Installing Scoop..."
#    iex ((New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh'))
#}

if (! (scoop info git).Installed ) {
        Write-Verbose -Message "Installing git"
        scoop install git --global
} else {
    Write-Verbose -Message "Package git already installed! Skipping..."
}

# Configure Aria2 Download Manager
Install-ScoopApp -Package "aria2"
if (!$(scoop config aria2-enabled) -eq $True) {
    scoop config aria2-enabled true
}
if (!$(scoop config aria2-warning-enabled) -eq $False) {
    scoop config aria2-warning-enabled false
}

## Add Buckets
Enable-Bucket -Bucket "main"
Enable-Bucket -Bucket "extras"
Enable-Bucket -Bucket "java"
Enable-Bucket -Bucket "nerd-fonts"
#Enable-Bucket -Bucket "nonportable"
#scoop bucket add foosel https://github.com/foosel/scoop-bucket

# Check if Home Workstation
if ($(Read-Host -Prompt "Is this a workstation for Home use (y/n)?") -eq "y") {
    $HomeWorkstation = $True
} else {
    $HomeWorkstation = $False
}

# Install Scoop Packages

$scoop_office_softwares = @(
    "extras/vcredist2022" # For Lunarvim
    "main/neovim" # For Lunarvim
    "main/make" # For Lunarvim
    "main/python" # For Lunarvim
    "nodejs" # For Lunarvim
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
    "main/fd" # For Lunarvim
    "nerd-fonts/Hack-NF" # For Lunarvim
    #"extras/vscode"
    #"lazygit"
	#"dvc"
    #"firefox"
    #"googlechrome"
    #"opera"
    #"skype"
    #"whatsapp"
    #"gh"
    #"smartgit"
    #"lepton"
    #"jira"
    #"rclone"
    #"restic"
    #"cwrsync"
    #"sublime-text"
    #"sublime-merge"
    #"vim"
    #"notepadplusplus"
    #"notepadnext"
    #"mysql-workbench"
    #"dbeaver"
    #"sqlitebrowser"
    #"docker"
	#"docker-machine"
	#"docker-compose"
	#"lazydocker"
    #"vagrant"
	#"virtualbox-np"
    #"ngrok"
    #"nvm"
    #"postman"
    #"cmder-full"
    #"filezilla"
    #"filezilla-server"
    #"winscp"
    #"teamviewer"
    #"anydesk"
    #"libreoffice"
    #"foxit-reader"
    #"gimp"
    #"geany"
    #"flow-launcher"
    #"charm-gum"
    #"dasel"
    #"flameshot"
    #"vifm"
    #"7zip"
)

$scoop_home_softwares = @(
    #"rclone-browser"
    #"freedownloadmanager"
    #"shotcut"
    #"audacity"
    #"rufus"
    #"vlc"
    #"format-factory"
    "handbrake"
)

foreach ($software_name in $scoop_office_softwares) {
    Install-ScoopApp -Package "$software_name"
}

# Install Scoop Packages, if Home Workstation
if ($HomeWorkstation) {
    foreach ($software_name in $scoop_home_softwares) {
        Install-ScoopApp -Package "$software_name"
    }
}
