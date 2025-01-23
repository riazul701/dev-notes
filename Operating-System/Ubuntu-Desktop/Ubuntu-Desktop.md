# Commands

* `sudo su -` : Switch to "root" user.
* `ifconfig` : Get computer's IP address.
* `sudo gedit &` : Open GUI-App in Background without blocking Terminal.
* `sudo dpkg --install {{package-name}}.deb` : Install "deb" file using "dpkg".

* Ubuntu Hotspot Create AP
  * `sudo lshw -C network`
  * Wifi Adapter Logical Name: wlxf428531808c3

# Contents of Ubuntu Desktop

## Website
* [Easy Ubuntu Learning: সহজ উবুন্টু শিক্ষা](https://adnan.quaium.com/ubuntu)
* [Ubuntu and Derivatives Download](https://cdimage.ubuntu.com/)
* [repology.org => The packaging hub](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)
* [OSBoxes => VirtualBox Image Download](https://www.osboxes.org/)
* [LinuxVMImages => VirtualBox Image Download](https://www.linuxvmimages.com/)

# Software Installation

## Install AppImage as Regular Software

* [Neovim Installation Details](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)
  * Remove the current version of NeoVim: `sudo apt remove neovim`
  * Download [this](https://github.com/neovim/neovim/releases/download/stable/nvim.appimage) (latest version - 0.5.0 appimage from github)
  * cd into the directory it was downloaded to e.g. cd ~/Downloads
  * Make it executable for your user chmod u+x ./nvim.appimage
  * Move it to a folder that's indexed in your PATH env var so your computer knows what you mean when you type nvim. You can check the folders in your current path by typing echo $PATH which will show you something like this: /usr/local/bin:/usr/bin. Notice there are 2 folders here in this case separated by a colon (:). You will likely have more than two. /usr/local/bin is a common place to stick it. To move it there you'll need to use sudo: sudo mv nvim.appimage /usr/local/bin/nvim
  * When you type nvim it should "just work"
  * Bonus: add this to ~/.bashrc/~/.zshrc etc to create an alias in case you accidentally type vi (I always type it by mistake): alias vi=nvim
  * Bonus #2: Also in your bashrc/zshrc etc set your EDITOR env var so various programs know what editor you prefer to use: EDITOR=/usr/local/bin/nvim
  
## ".deb" File Installation

### GDebi

* [Gdebi](https://launchpad.net/gdebi)
* Install ".deb" file using GDebi
  * Install GDebi: `sudo apt install gdebi`
  * Launch GDebi: `sudo gdebi-gtk`

### Dpkg

* Install ".deb" file: `sudo dpkg -i file-name.deb`

### Error and Solution (".deb" File)

* [zst compression not supported by apt/dpkg](https://unix.stackexchange.com/questions/669004/zst-compression-not-supported-by-apt-dpkg)
  * sudo apt upgrade dpkg

## Synaptic

# Boot Repair

## Guides (Boot Repiar)
* [How to repair the GRUB bootloader using a Ubuntu Live USB drive](https://www.fosslinux.com/4477/how-to-repair-the-grub-bootloader-using-a-ubuntu-live-usb-drive.htm)
* [‘Boot Repair’ for Ubuntu, Linux Mint, and elementary OS can fix Bootloader issues](https://www.fosslinux.com/1521/boot-repair-for-ubuntu-linux-mint-and-elementary-os-can-fix-bootloader-issues.htm)

# Resource Management

## Definitions
* "systemd": This daemon/background service loads entire ubuntu operating system. Some linux operating system may use different service. "systemctl" command controls "systemd" service.
* "journald": It is a error logging service. "journalctl" command controls "journald" service.
* "rsyslogd": It is a error logging service.

## Notes
* In Linux error logging causes high cpu, ram and disk usage. Disable them to save resource. Some error loggin services are "journald", "rsyslogd".
* In Linux log files consume lot of storage (may be 50GB or higher). Empty them to save hard disk space.

## Guides (Resource Management)
* [Ubuntu Running Slow? 8 Tips to Speed Up Your Linux PC](https://www.makeuseof.com/tag/ubuntu-running-slow-5-tips-speed-linux-pc/#improving-ubuntu-39-s-performance)
* [How to Fix High CPU Usage in Linux](https://www.maketecheasier.com/fix-high-cpu-usage-linux/?amp)
* [how-to-permanently-disable-systemd-journald-service](https://forums.fedoraforum.org/showthread.php?292543-how-to-permanently-disable-systemd-journald-service)

## Commands (Resource Management)
* Show resource usage: `top`
* Disable "journald" logging: `systemctl mask systemd-journald.service` [Shows a response telling that the service has been linked to /dev/null, which will make sure that it doesn't start at boot until you reverse the process by using unmask instead of mask.]

# Problem and Solution

*** Problem: When mouting external HDD Drive they are read-only (Both same HDD of Ubuntu or Other HDD) and can not write to them.
  Solution: This happens when you are running Windows OS alongside with Ubuntu. Startup Windows 8 -> Access Control Panel -> Power Option -> Click "Choose what the power buttons do" -> Click "Change settings that are currently unavailable" -> Uncheck "Turn on fast startup" -> Reboot and log in Ubuntu.
Guide: https://askubuntu.com/questions/963944/you-are-trying-to-save-the-file-on-a-read-only-disk-when-trying-to-save-a-file

1. Mount "htdocs" and "mysql" folder
https://askubuntu.com/questions/205841/how-do-i-mount-a-folder-from-another-partition

"sudo mount --bind some/where else/where"



2. Xampp - Move "htdocs" folder

https://stackoverflow.com/questions/18902887/how-to-configuring-a-xampp-web-server-for-different-root-directory



3. Xampp - Move "mysql/data" folder

https://stackoverflow.com/questions/19199039/xampp-change-mysql-data-dir-not-working

4. Xampp Application Log Solve:

Stderr:
/opt/lampp_5.6.15/proftpd/scripts/ctl.sh: 50: /opt/lampp_5.6.15/proftpd/scripts/ctl.sh: /opt/lampp/sbin/proftpd: not found

Stderr:
/opt/lampp_5.6.15/apache2/scripts/ctl.sh: 50: /opt/lampp_5.6.15/apache2/scripts/ctl.sh: /opt/lampp/bin/httpd: not found

5. Laradock Nginx "http://localhost" not found 404 (FOR Multiple Project Installation. For single project it will be ok.)
https://github.com/laradock/laradock/issues/86#issuecomment-264181045

Create docker containers using command "docker-compose up -d nginx mysql phpmyadmin redis workspace"

Note: Laradock assumes laravel source code is at "/var/www" directory in "workspace" container. So it finds for index.php file in "/var/www/public/index.php" directory.
Open file "laradock/nginx/sites/default.conf" and change line from "root /var/www/public" to "root /var/www".
Rebuild (configuration change) docker container using command "sudo docker-compose build nginx"
Configuration change for all docker container "sudo docker-compose build"

For Windows OS change path separator from ":" to ";" in ".env" file.

PhpMyAdmin Access:
Hostname: mysql
User Name: root
Password: root

Database Configuration for Laravel:
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=test_lara_1
DB_USERNAME=root
DB_PASSWORD=root

Run Laravel Command: "php artisan cache:clear" and "php artisan migrate"
Enter docker container using command: "docker container exec -it <container name/id> bash"
Start and Stop container by using command: "docker-compose start" and "docker-compose stop" (Current directory must be laradock directory)

PHP 7.4.30 (cli) (built: Jun 27 2022 08:20:35) ( NTS )


6. (On Windows Docker ToolBox) Docker compose throws - adduser: group 'www-data' in use
https://stackoverflow.com/questions/56960355/docker-compose-throws-adduser-group-www-data-in-use

You can find the DockerFile inside laradock/nginx folder. Just change the line

&& adduser -D -H -u 1000 -s /bin/bash www-data
to
&& adduser -D -H -u 1000 -s /bin/bash www-data -G www-data

This specifies the group that the user is a member of. Once done, build and bring your containers up with

docker-compose build --no-cache nginx
docker-compose up -d

7. Windows Docker ToolBox only works if Laradock folder is located at "C:\Users" directory. Otherwise source code and config files are not mounted to docker containers.
https://stackoverflow.com/questions/33126271/how-to-use-volume-option-with-docker-toolbox-on-windows

Docker Machine commands: "docker-machine start", "docker-machine stop", "docker-machine restart", "docker-machine env", "docker-machine ssh"

8. mysql docker container exited with code 1
https://stackoverflow.com/questions/52698909/mysql-docker-container-exited-with-code-1

# References

* Installation
  * {1}

* Configuration
  * {51} [Switching to i3 in 18.04](https://askubuntu.com/questions/1044026/switching-to-i3-in-18-04)
  * {52} [Removing GNOME and only use I3](https://www.reddit.com/r/i3wm/comments/f1dhar/removing_gnome_and_only_use_i3/)

* Tutorial Article
  * {101} [Systemd Units Explained with Types and States](https://www.computernetworkingnotes.com/linux-tutorials/systemd-units-explained-with-types-and-states.html)

* YouTube Tutorial
  * {151} [Systemd Deep-Dive: A Complete, Easy to Understand Guide for Everyone](https://www.youtube.com/watch?v=Kzpm-rGAXos)
  * {152} [Learn CentOS 21 - journalctl](https://www.youtube.com/watch?v=j-nINFGrA_Q)
