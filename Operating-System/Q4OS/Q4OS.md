# Commands/Usage

* `ip address` : Shows current device's IP Address
* `sudo apt install ssh` : Install ssh client and server (sshd)
* `systemctl status sshd` : Check ssh service is running or not

# Q4OS.md

## Websites

## Notes

* PATHs
  * Installed software launcher path: `/usr/share/applications`

* Flatpak is built-in inside of Q4OS.

## Create App/Menu Launcher

* Manually create Menu for software with following steps:
  * ".desktop"/Menu file is located at: `usr/share/applications`
  * Duplicate any ".desktop" file and edit following fields
    * Name
    * Comment
    * Keywords [Used to search programs from start-menu]
    * Exec [Software path, that will be launched]
    * Icon
    * Categories
    * Skip editing of following fields
      * Terminal
      * Type
      * StartupNotify

# References

* next-sl: {2}

* Guides

  * General

  * Commands

