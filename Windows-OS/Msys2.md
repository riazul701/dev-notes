# Msys2.md

## Websites
* [Official Site](https://www.msys2.org/)
* [Msys2 Packages](https://packages.msys2.org/package/)
* [Msys2 Repo](https://repo.msys2.org/msys/x86_64/)
* [Git for Windows](https://gitforwindows.org/)

## Notes
* "Pacman" is package manager of MSYS2.

# Installation

## Msys2 via Scoop

* Open PowerShell in Administrator mode.
* Add Bucket: `scoop bucket add main`
* Install Msys2: `scoop install --global main/msys2`
* Setup Msys2: `msys2`

## Msys2 Packages

* Enter into Msys2: `msys2`
* Install Git: `pacman -S git`
* Install Python: `pacman -S python`
* Install PIP (python package manager): `pacman -S python-pip` <sup>{51}</sup>

## Setup Git

* Open PowerShell in Administrator mode.
* Add Bucket: `scoop bucket add main`
* Install Git: `scoop install --global main/git`
* Git installation output shows:
  * Set Git Credential Manager Core by running: "git config --global credential.helper manager"
  * To add context menu entries, run 'C:\ProgramData\scoop\apps\git\current\install-context.reg'
  * To create file-associations for .git* and .sh files, run 'C:\ProgramData\scoop\apps\git\current\install-file-associations.reg'

* Add Bucket: `scoop bucket add extras`
* Install Git-Credential-Manager: `scoop install --global extras/git-credential-manager`
* Check Git-Credential-Manager Version: `git-credential-manager --version`

# References

* Tutorial
  * {1} [Git For Windows (GitBash) Pacman Installation](https://gist.github.com/adojos/0abab00dd7e6bd84db39a760fb40a340)

* Install/Setup
  * {51} [MSYS2: pip is not in path after installation (command not found)](https://stackoverflow.com/questions/66040185/msys2-pip-is-not-in-path-after-installation-command-not-found)
