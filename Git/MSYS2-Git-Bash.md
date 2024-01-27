# MSYS2-Git-Bash.md

## Websites

# Pacman Package Manager

## Websites

## Notes
* Pacman does not come preinstalled with Git-Bash.

## Installation
* Install [PeaZip](https://github.com/peazip/PeaZip) to extract ".tar.zst" compressed file.
* [Installing pacman on git for windows](https://gist.github.com/AndreSteenveld/cb6662c93c8323795c5fd347defb8976)
  * Download the following packages from the [MSYS2 repository](https://repo.msys2.org/msys/x86_64/): pacman, pacman-mirrors, msys2-keyring.
  * Extract these files and copy files to respective folders. "/usr/bin" to "Git-Bash/usr/bin", "/etc" to "Git-Bash/etc" and so on.
* If [error: xxx: signature from "Christoph Reiter (MSYS2 master key) reiter.christoph@gmail.com" is unknown trust #2397](https://github.com/msys2/MSYS2-packages/issues/2397) is shown, then enter command:
  * `rm -r /etc/pacman.d/gnupg/`
  * `pacman-key --init`
  * `pacman-key --populate msys2`
* [Package Management using Pacman in Git-Bash](https://www.msys2.org/docs/package-management/)
  * Finding a package: `pacman -Ss <name or part of the name of the package>`
  * Installing a package: `pacman -S <name of the package>`
  * Uninstalling a package: `pacman -R <name of the package>`
* If [pacman "exists on filesystem" error](https://unix.stackexchange.com/questions/240252/pacman-exists-on-filesystem-error) is shown, then enter command
  * `sudo pacman -S --overwrite \* <package_name>` OR `sudo pacman -S --overwrite "*" <package_name>`
* Check package is installed or not: `<package_name> --help`

## Guides
* Installation Error
  * [MSYS2 on Windows 10 - cannot update the package database using pacman #2589](https://github.com/msys2/MSYS2-packages/issues/2589)
  * [Git For Windows (GitBash) Pacman Installation](https://gist.github.com/adojos/0abab00dd7e6bd84db39a760fb40a340)
