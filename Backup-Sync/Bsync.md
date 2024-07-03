# Bsync.md

## Websites
* [dooblem/bsync](https://github.com/dooblem/bsync)

## Notes
* Install "which" command in Termux-Android `pkg install which`, otherwise "bsync" reports "rsync" is not installed.
* Python not needed on remote side (just GNU find and rsync)
* Exclude some subdirectories from sync (just create a .bsync-ignore file)

# Commands

## Basic usage
* Bisync on same computer: `bsync /home/DIRECTORY1 /c/DIRECTORY2`
* Bisync using ssh (port: 22): `bsync /home/ALICE_DIR  bob@sshserver:/c/BOB_DIR`
* Bisync using ssh (port: 8022): `bsync -p 8022 /home/ALICE_DIR  bob@sshserver:/c/BOB_DIR`

# Installation

## Antix-OS Setup
* Download "bsync" script: `wget https://raw.github.com/dooblem/bsync/master/bsync`
* Make script executable: `chmod +x bsync`
* Move script to path: `sudo mv bsync /usr/local/bin/bsync`
* Check "bsync" is in path: `which bsync`
* Get help: `bsync --help`
