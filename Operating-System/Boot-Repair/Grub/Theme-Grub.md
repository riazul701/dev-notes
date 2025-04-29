# Commands/Usage

# Theme-Grub.md

## Notes

* If any GRUB theme has install-script, that can be installed/uninstalled manually without using install-script.

* Setting GRUB theme, also changes resolution for windows-os. Change resolution by opening file `/etc/default/grub` and set line `GRUB_GFXMODE=1920x1080,auto` (Full HD Monitor 21.5 inch) --OR-- `GRUB_GFXMODE=1366x768,auto` (HD Monitor 18.5 inch) <sup>{14}</sup>

## Install GRUB Theme

**Prerequisite Instruction <sup>{9} {10}</sup>**

* Without this, GRUB theme is not detected, during execution of command
  * `grub2-mkconfig` (Fedora/Arch). Check command output: `Found theme: /boot/grub2/themes/{{theme-name}}/theme.txt`
  * ---OR---
  * `update-grub` (Debian/Ubuntu). Check command output: `Found theme: /boot/grub/themes/{{theme-name}}/theme.txt`

* `sudo nano /etc/default/grub` : Make changes to the GRUB config file.

* Change the line `GRUB_TERMINAL_OUTPUT=console` to this (comment it out) `#GRUB_TERMINAL_OUTPUT=console` <sup>{10}</sup>

* Alternatively, change `GRUB_TERMINAL_OUTPUT="console"` to `GRUB_TERMINAL_OUTPUT="gfxterm"` <sup>{9}</sup>

**Instructions: Install GRUB Theme <sup>{5} {15} {16}</sup>**

* How to install a grub theme:

* Extract the theme to folder
  * `/boot/grub2/themes/` (Fedora/Arch)
  * ---OR---
  * `/boot/grub/themes/` (Debian/Ubuntu)

* Edit `/etc/default/grub` file. Find the line starting with "#GRUB_THEME" and change it to "GRUB_THEME=/boot/grub/themes/[THEME_FOLDER]/[theme.txt]" (replace [THEME_FOLDER] ; [theme.txt] is probably OK ; remove "[]" brackets)
  * `sudo nano /etc/default/grub`
  * "GRUB_THEME=/boot/grub2/themes/[THEME_FOLDER]/[theme.txt]" (Fedora/Arch)
  * ---OR---
  * "GRUB_THEME=/boot/grub/themes/[THEME_FOLDER]/[theme.txt]" (Debian/Ubuntu)

* Then regenerate grub config file by executing command
  * `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` (Fedora/Arch)
  * ---OR---
  * `sudo update-grub` (Debian/Ubuntu).

* Restart PC.

**(Alternative) Instructions-2: Install GRUB Theme <sup>{9}</sup>**

* Pick a variant from [Pling](https://www.pling.com/p/2133341)

* After downloading the archive, copy the contents to: `/usr/share/grub/themes/fluent` (with `sudo` or `su`)

* Edit `/etc/default/grub` using (`nano`,`vi`,`vim`,`neovim`, or any text editor) with `sudo` or `su`.

* If required, change `GRUB_TERMINAL_OUTPUT="console"` to `GRUB_TERMINAL_OUTPUT="gfxterm"`

* Uncomment `# GRUB_THEME = "..."` and replace the path with `/usr/share/grub/themes/fluent/theme.txt`

* Run the appropriate command in the terminal to apply the above changes
```
sudo grub-mkconfig -o /boot/grub/grub.cfg #Debian/Ubuntu
sudo grub2-mkconfig -o /boot/grub2/grub.cfg #Fedora/CentOS/RHEL/SUSE
```

* Important: If you are using an Arch system that was installed manually, replace `/boot` with `/YOUR_ESP_PARTITION`. If you didn't change this, there is no need to change anything.

* Run `reboot` to reboot the system and test your new awesome-looking GRUB theme!

## Uninstall GRUB Theme

**Instructions: Uninstall GRUB Theme <sup>{5} {15} {16}</sup>**

* Restore original GRUB black screen by opening file `/etc/default/grub` and change (comment) line from `GRUB_THEME={{theme.txt-path}}` to `#GRUB_THEME={{theme.txt-path}}`

* Then regenerate grub config file by executing `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` (Fedora/Arch) --OR-- `sudo update-grub` (Debian/Ubuntu).

* Restart PC.

# References

* next-sl: {20}

## Websites

* {4} [KHLALA-Gh/grub-themes-manager GitHub](https://github.com/KHLALA-Gh/grub-themes-manager)
* [GNU GRUB Wikipedia](https://en.wikipedia.org/wiki/GNU_GRUB)

* Theme Store
  * {3} [GRUB Bootloader Themes](https://christitus.com/bootloader-themes/) <sup>{1}</sup>
  * {5} [gnome-look.org => GRUB Themes](https://www.gnome-look.org/browse?cat=109&ord=latest) <sup>{2}</sup>
  * {6} [pling.com => GRUB Themes](https://www.pling.com/browse?cat=109&ord=latest)
  * {7} [Jacksaur/Gorgeous-GRUB GitHub](https://github.com/Jacksaur/Gorgeous-GRUB)

* Specific Theme
  * {8} [vinceliuice/grub2-themes GitHub](https://github.com/vinceliuice/grub2-themes) <sup>{2}</sup>
  * {9} [Coopydood/HyperFluent-GRUB-Theme GitHub](https://github.com/Coopydood/HyperFluent-GRUB-Theme)
  * {10} [VandalByte/darkmatter-grub2-theme GitHub](https://github.com/VandalByte/darkmatter-grub2-theme)
  * {11} [AdisonCavani/distro-grub-themes GitHub](https://github.com/AdisonCavani/distro-grub-themes)
  * [vinceliuice/Elegant-grub2-themes GitHub](https://github.com/vinceliuice/Elegant-grub2-themes)

* Theme Collection-1 (Priority High)
  * {12} [Lxtharia/minegrub-theme GitHub](https://github.com/Lxtharia/minegrub-theme)
  * {13} [catppuccin/grub GitHub](https://github.com/catppuccin/grub)
  * {17} [Teraskull/bigsur-grub2-theme GitHub](https://github.com/Teraskull/bigsur-grub2-theme)
  * {18} [Anoop/Cyberpunk GRUB Theme GitLab](https://gitlab.com/anoopmsivadas/Cyberpunk-GRUB-Theme)
  * {19} [shvchk/fallout-grub-theme GitHub](https://github.com/shvchk/fallout-grub-theme)

* Theme Collection-2 (Priority Low)
  * [diegons490/cachy-grub-theme GitHub](https://github.com/diegons490/cachy-grub-theme)
  * [ForsetGump1952/FlatSense GitHub](https://github.com/ForsetGump1952/FlatSense)

## Tutorials

* Repair GRUB
  * {15} [Restoring the bootloader using the Live disk](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#_restoring_the_bootloader_using_the_live_disk)
  * {16} [GrubEFIReinstall](https://wiki.debian.org/GrubEFIReinstall)

## Guides

* {14} [Installation => AdisonCavani/distro-grub-themes GitHub](https://k1ng.dev/distro-grub-themes/installation) <sup>{11}</sup>

## YouTube Tutorials

* GRUB Theme
  * {1} [Bootloader Themes | Install & Configuration BY Chris Titus Tech](https://www.youtube.com/watch?v=BAyzHP1Cqb0)
  * {2} [AWESOME Boot Loader Themes for GRUB on Linux!! Learn How To Install Custom Themes on Linux (GRUB). BY SavvyNik](https://www.youtube.com/watch?v=nZu0rEgJcXA)
