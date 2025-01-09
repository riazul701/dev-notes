# Commands/Usage

* `su` : Switch to "root" user inside container.
* `distrobox-create --name CONTAINER-NAME --image OS-NAME:VERSION` : The syntax to create a new container <sup>{1}</sup>
* `distrobox-create --name fedoraonfoss --image fedora:36` : Create a new container for Fedora 36 with the name ‘fedoraonfoss‘ <sup>{1}</sup>
* `distrobox-create --name archondeb --image docker.io/library/archlinux:latest` : Create a new container for Arch latest with the name ‘archondeb‘ <sup>{2}</sup>
* `distrobox-enter CONTAINER-NAME` : The syntax to enter into container <sup>{1}</sup>
* `sudo dnf install foliate.noarch` : Install Foliate, since it is available in Fedora’s repositories but not in Ubuntu’s repositories. <sup>{1}</sup>
* `distrobox-export --app foliate` : Make the specified software available to the host operating system <sup>{1}</sup>
* `distrobox list` : Lists all the containers that are installed <sup>{1}</sup>
* `distrobox stop CONTAINER-NAME` : This command is used to stop a running container <sup>{1}</sup>
* `distrobox rm CONTAINER-NAME` : To delete any Distrobox container <sup>{1}</sup>

# Distrobox.md

## Websites

* [distrobox.it => Distrobox Site](https://distrobox.it/)
* [89luca89/distrobox](https://github.com/89luca89/distrobox)
* [phanirithvij/distrobox-tui => A TUI for DistroBox](https://github.com/phanirithvij/distrobox-tui)
* [Dvlv/BoxBuddyRS](https://github.com/Dvlv/BoxBuddyRS)
* [containers/toolbox](https://github.com/containers/toolbox)
* [toolbx-images/images](https://github.com/toolbx-images/images)
* [DavHau/nix-portable](https://github.com/DavHau/nix-portable)
* [anbox/anbox](https://github.com/anbox/anbox)
* [waydroid/waydroid](https://github.com/waydroid/waydroid)

## Distrobox as Native App

* `distrobox-export --app {{program-name}}` creates `{{container-name/guest-os-hostname}}-{{program-name}}.desktop` file in "/home/{{user-name}}/.local/share/applications" folder and shows as Menu in Host operating system.
* Open this ".desktop" file and copy line: `Exec=/usr/bin/distrobox-enter -n {{container-name/gust-os-hostname}} -- {{program-name}} %F`
* Open `/home/{{user-name}}/.bashrc` file in Host-OS and append line: `alias {{program-name}}='/usr/bin/distrobox-enter -n {{container-name/gust-os-hostname}} -- {{program-name}}'` [Remove `%F` at last]
* Reload "~/.bashrc": `source ~/.bashrc`
* When execute program with `{{program-name}}` from Host-OS terminal, then distrobox container will be started automatically and program will be launched.

# References

* next-sl: {3}

* Tutorials
  * {1} [Distrobox: Try Multiple Linux Distributions via the Terminal](https://itsfoss.com/distrobox/)
  * {2} [distrobox/docs/compatibility.md](https://github.com/89luca89/distrobox/blob/main/docs/compatibility.md)

* Guides

  * General
    * [Distrobox - how do you use it?](https://www.reddit.com/r/linux/comments/15q8b9j/distrobox_how_do_you_use_it/)
    * [Setting Root Password in Ubuntu (And Unset it Later)](https://itsfoss.com/ubuntu-set-root-password/)

  * Arch Linux
    * [Getting Started With Pacman Commands in Arch-based Linux Distributions](https://itsfoss.com/pacman-command/)

* YouTube Tutorials

  * General
    * [New to DistroBox? Start Here: Full Beginner's Tutorial! BY Learn Linux TV](https://www.youtube.com/watch?v=eiDt4O6UPRw)
    * [Turning Distrobox Into Your Entire Linux Desktop BY Brodie Robertson](https://www.youtube.com/watch?v=IIVv5NjyYl0)

  * Arch Linux
    * [Linux Crash Course - The Pacman Command BY Learn Linux TV](https://www.youtube.com/watch?v=HD7jJEh4ZaM)

  * Debian
    * [Linux Crash Course - The apt Command BY Learn Linux TV](https://www.youtube.com/watch?v=1kicKTbK768)
