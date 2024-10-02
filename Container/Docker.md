# Commands/Usage

## Linux Commands

* sudo su
* sudo service docker start
* sudo service docker stop

## General Commands

## Storage Cleanup

* [Is it safe to clean docker/overlay2/](https://stackoverflow.com/questions/46672001/is-it-safe-to-clean-docker-overlay2)

* Docker uses /var/lib/docker to store your images, containers, and local named volumes. Deleting this can result in data loss and possibly stop the engine from running. The overlay2 subdirectory specifically contains the various filesystem layers for images and containers.
* To cleanup unused containers and images, see docker system prune. There are also options to remove volumes and even tagged images, but they aren't enabled by default due to the possibility of data loss:
```shell
$ docker system prune --help

Usage:  docker system prune [OPTIONS]

Remove unused data

Options:
  -a, --all             Remove all unused images not just dangling ones
      --filter filter   Provide filter values (e.g. 'label=<key>=<value>')
  -f, --force           Do not prompt for confirmation
      --volumes         Prune volumes
```
* What a prune will never delete includes:
  * running containers (list them with docker ps)
  * logs on those containers (see this post for details on limiting the size of logs)
  * filesystem changes made by those containers (visible with docker diff)
* Additionally, anything created outside of the normal docker folders may not be seen by docker during this garbage collection. This could be from some other app writing to this directory, or a previous configuration of the docker engine (e.g. switching from AUFS to overlay2, or possibly after enabling user namespaces).
* What would happen if this advice is ignored and you deleted a single folder like overlay2 out from this filesystem? The container filesystems are assembled from a collection of filesystem layers, and the overlay2 folder is where docker is performing some of these mounts (you'll see them in the output of mount when a container is running). Deleting some of these when they are in use would delete chunks of the filesystem out from a running container, and likely break the ability to start a new container from an impacted image. See [this question](https://stackoverflow.com/questions/67591341/oci-runtime-create-failed-container-linux-go345-starting-container-process-ca) for one of many possible results.
* To completely refresh docker to a clean state, you can delete the entire directory, not just sub-directories like overlay2:
```shell
# danger, read the entire text around this code before running
# you will lose data
sudo -s
systemctl stop docker
rm -rf /var/lib/docker
systemctl start docker
exit
```
* The engine will restart in a completely empty state, which means you will lose all:
  * images
  * containers
  * named volumes
  * user created networks
  * swarm state

# Docker/Docker.md

## Websites

* [labs.play-with-docker.com](https://labs.play-with-docker.com/)
* [Docker Samples => Official Docker Samples](https://github.com/dockersamples)
* [dockersamples/example-voting-app](https://github.com/dockersamples/example-voting-app)
* [Docker Samples => Docker Hub](https://hub.docker.com/u/dockersamples)
* [dockersamples/docker-swarm-visualizer](https://github.com/dockersamples/docker-swarm-visualizer)
* [Docker Kubernetes MasterClass: DevOps from Scratch - 2024](https://www.udemy.com/course/kubernetes-online-training/?couponCode=ST15MT100124B)

## Notes

* Switch to "root" user inside container: `su -`
* "docker compose" and "docker-compose" are two different programs. "docker compose" is buit-in inside Docker and "docker-compose" is separate project.
* Use docker without "sudo"
  * [Remote Development BY Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
  * Add your user to the docker group by using a terminal to run: `sudo usermod -aG docker $USER` Sign out and back in again so this setting takes effect.
* If any database (mysql/mariadb) configuration is changed, then existing database (volume-mount) must be deleted and recreated to apply new configuration change. Otherwise new configuration change will not be effective.
* After starting database container in background mode, if database (mysql/mariadb) connection refused then try command `sudo docker logs <database-container-name>` and `sudo docker exec -it <database-container-name> bash`

* Docker content storage path: `/var/lib/docker`
* `/var/lib/docker/overlay2` directory consumes most of docker storage on host machine.

## Error and Solution

* Error: Docker: Temporary failure resolving 'deb.debian.org'
  * [Docker: Temporary failure resolving 'deb.debian.org'](https://stackoverflow.com/questions/61567404/docker-temporary-failure-resolving-deb-debian-org)
  * Restart Docker: `sudo service docker restart`

# Installation

## Windows-OS Setup

### Setup using WSL

#### Guides
* [How to use Docker on Windows 10 (without Docker Desktop) - Worked](https://medium.com/@pawelmarcinkiewicz/how-to-use-docker-on-windows-10-without-docker-desktop-548b39738268)
* [Install Docker in WSL 2 without Docker Desktop](https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop)
* [How To Live Without Docker Desktop — A Developer’s Perspective](https://www.objectivity.co.uk/blog/how-to-live-without-docker-desktop-developers-perspective/)

## Linux-OS Setup

# Error and Solution

## Conflicts with WiFi

### Docker Antix-OS WiFi Conflict

* Problem: Docker wired network conflicts with WiFi, as a result internet connection does not work.
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

## WSL Docker Pull Takes Long Time

* [Docker on WSL2 very slow](https://stackoverflow.com/questions/62154016/docker-on-wsl2-very-slow)

# References

* YouTube Tutorials
  * [Best Docker Container Monitoring Tools - Free and open source BY VirtualizationHowto](https://www.youtube.com/watch?v=zxAmqY63eJE)
  