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
# Original-Script: https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7

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
        scoop install git --global
} else {
    Write-Verbose -Message "Package git already installed! Skipping..."
}

## Add Buckets
Enable-Bucket -Bucket "extras"
#Enable-Bucket -Bucket "nonportable"
#Enable-Bucket -Bucket "java"
#Enable-Bucket -Bucket "nirsoft"
#scoop bucket add foosel https://github.com/foosel/scoop-bucket

# Check if Home Workstation
if ($(Read-Host -Prompt "Is this a workstation for Home use (y/n)?") -eq "y") {
    $HomeWorkstation = $True
} else {
    $HomeWorkstation = $False
}

# Home Workstation Configurations
if ($HomeWorkstation) {
    # Adding games bucket
    Enable-Bucket -Bucket "games"
    # Create $Env:UserProfile\bin, if not exist
    if (!(Test-Path -Path $Env:UserProfile\bin)) {
        Write-Verbose -Message "Creating bin directory in $Env:UserProfile"
        New-Item -Path $Env:UserProfile\bin -ItemType Directory | Out-Null
        #[System.Environment]::SetEnvironmentVariable("PATH", $Env:PATH + ";$Env:UserProfile\bin","USER")
    }
}

# Install Scoop Packages
$Scoop = @(
    "lazygit",
	"dvc",
    #"firefox",
    #"googlechrome",
    "opera",
    "skype",
    "whatsapp",
    "gh",
    "smartgit",
    "lepton",
    "jira",
    "rclone",
    "restic",
    "cwrsync",
    "vscode",
    "sublime-text",
    "sublime-merge",
    "vim",
    "notepadplusplus",
    "notepadnext",
    "mysql-workbench",
    "dbeaver",
    "sqlitebrowser",
    #"docker",
	#"docker-machine",
	"docker-compose",
	"lazydocker",
    "vagrant",
	#"virtualbox-np",
    "ngrok",
    "nodejs",
    "nvm",
    "postman",
    "cmder-full",
    "filezilla",
    "filezilla-server",
    "winscp",
    "teamviewer",
    "anydesk",
    "libreoffice",
    "foxit-reader",
    "gimp",
    #"geany",
    "flow-launcher",
    "charm-gum",
    "dasel",
    "flameshot",
    "vifm",
    "7zip")
foreach ($item in $Scoop) {
    Install-ScoopApp -Package "$item"
}

# Install Scoop Packages, if Home Workstation
if ($HomeWorkstation) {
    Remove-Variable -Name "Scoop"
    $Scoop = @(
        "rclone-browser",
		"freedownloadmanager",
        "shotcut",
        "audacity",
        "rufus",
        "vlc",
        #"format-factory",
        "handbrake")
    foreach ($item in $Scoop) {
        Install-ScoopApp -Package "$item"
    }
}
