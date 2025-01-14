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
# gsudo => sudo for Windows: https://github.com/gerardog/gsudo
# (OR use "gsudo") To install global app start powershell in admin mode -> right click -> "Run as administrator"
# Execute this script using command: .\install-software.ps1

$VerbosePreference = "Continue"

function Install-ChocoApp {
    param (
        [string]$Package
    )
    Write-Verbose -Message "Preparing to install $Package"
    $listApp = choco list $Package
    if ($listApp -like "0 packages installed.") {
        Write-Verbose -Message "Installing $Package"
        choco install $Package -y
    } else {
        Write-Verbose -Message "Package $Package already installed! Skipping..."
    }
}

# Install Chocolatey, if not already installed
#$chocoInstalled = Get-Command -Name "choco" -CommandType Application -ErrorAction SilentlyContinue | Out-Null
if (! (Get-Command -Name "choco" -CommandType Application -ErrorAction SilentlyContinue) ) {
    Write-Verbose -Message "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Check if Home Workstation
if ($(Read-Host -Prompt "Is this a workstation for Home use (y/n)?") -eq "y") {
    $HomeWorkstation = $True
} else {
    $HomeWorkstation = $False
}

# Install Chocolatey Packages

$chocolatey_office_softwares = @(
    "sublimetext3"
    "notepadplusplus"
)

$chocolatey_home_softwares = @(
    "vlc"
    "smplayer"
)

foreach ($software_name in $chocolatey_office_softwares) {
    Install-ChocoApp -Package "$software_name"
}

# Install Scoop Packages, if Home Workstation
if ($HomeWorkstation) {
    foreach ($software_name in $chocolatey_home_softwares) {
        Install-ChocoApp -Package "$software_name"
    }
}
