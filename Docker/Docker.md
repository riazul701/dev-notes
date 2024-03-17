# Docker/Docker.md

## Conflicts with WiFi

### Docker Antix-OS WiFi Conflict
* Problem: Docker wired network conflicts with WiFi, as result internet connection does not work.
* Solution 1
  * Open "Connman System Tray"
  * Goto "Status" tab
  * Goto "Services" section
  * Move WiFi connection at first position.
* Solution 2
  * Open "Connman System Tray"
  * Goto "Details" tab
  * Select "Service" (Docker Services)
  * Goto "Configuration"
  * Turn Off "General -> AutoConnect"
  * Do same work for all Docker Services.
* Solution Check
  * Open "Connman System Tray"
  * Goto "Status" tab
  * Goto "Technologies" section
  * Check "Wired -> Connected: No"
  * Check "WiFi -> Connected: Yes"

## Notes
* Switch to "root" user inside container: `su -`
* "docker compose" and "docker-compose" are two different programs. "docker compose" is buit-in inside Docker and "docker-compose" is separate project.
* Use docker without "sudo"
  * [Remote Development BY Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
  * Add your user to the docker group by using a terminal to run: `sudo usermod -aG docker $USER` Sign out and back in again so this setting takes effect.
* If any database (mysql/mariadb) configuration is changed, then existing database (volume-mount) must be deleted and recreated to apply new configuration change. Otherwise new configuration change will not be effective.
* After starting database container in background mode, if database (mysql/mariadb) connection refused then try command `sudo docker logs <database-container-name>` and `sudo docker exec -it <database-container-name> bash`

## Error and Solution

* Error: Docker: Temporary failure resolving 'deb.debian.org'
  * [Docker: Temporary failure resolving 'deb.debian.org'](https://stackoverflow.com/questions/61567404/docker-temporary-failure-resolving-deb-debian-org)
  * Restart Docker: `sudo service docker restart`

# Setup

## Windows-OS Setup

### Setup using WSL

#### Guides
* [How to use Docker on Windows 10 (without Docker Desktop) - Worked](https://medium.com/@pawelmarcinkiewicz/how-to-use-docker-on-windows-10-without-docker-desktop-548b39738268)
* [Install Docker in WSL 2 without Docker Desktop](https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop)
* [How To Live Without Docker Desktop — A Developer’s Perspective](https://www.objectivity.co.uk/blog/how-to-live-without-docker-desktop-developers-perspective/)

## Linux-OS Setup

# Commands

## Linux Commands
* sudo su
* sudo service docker start
* sudo service docker stop

## General Commands
