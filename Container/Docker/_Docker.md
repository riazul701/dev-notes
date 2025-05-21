# Docker/Docker.md

## Notes

* Switch to "root" user inside container: `su -`

* "docker compose" and "docker-compose" are two different programs. "docker compose" is buit-in inside Docker and "docker-compose" is separate project.

* If any database (mysql/mariadb) configuration is changed, then existing database (volume-mount) must be deleted and recreated to apply new configuration change. Otherwise new configuration change will not be effective.

* After starting database container in background mode, if database (mysql/mariadb) connection refused then try command `sudo docker logs <database-container-name>` and `sudo docker exec -it <database-container-name> bash`

* Docker content storage path: `/var/lib/docker`

* `/var/lib/docker/overlay2` directory consumes most of docker storage on host machine.

## Use docker without "sudo"
  
**[Remote Development BY Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)**

* Add your user to the docker group by using a terminal to run: `sudo usermod -aG docker $USER` Sign out and back in again so this setting takes effect.

# Installation

## Fedora

### [Install Docker Engine on Fedora](https://docs.docker.com/engine/install/fedora/)

**Install using the rpm repository**

* Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

**Set up the repository**
  
* Install the dnf-plugins-core package (which provides the commands to manage your DNF repositories) and set up the repository.
```
$ sudo dnf -y install dnf-plugins-core
$ sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
```

**Install Docker Engine**

* Install the Docker packages.

  * To install the latest version, run:
  ```
  $ sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```
  
  * If prompted to accept the GPG key, verify that the fingerprint matches `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35`, and if so, accept it.

  * This command installs Docker, but it doesn't start Docker. It also creates a `docker` group, however, it doesn't add any users to the group by default.

* Start Docker Engine.

  * `$ sudo systemctl enable --now docker`

  * This configures the Docker systemd service to start automatically when you boot your system. If you don't want Docker to start automatically, use `sudo systemctl start docker` instead.

  * Verify that the installation is successful by running the hello-world image:
  ```
  $ sudo docker run hello-world
  ```

  * This command downloads a test image and runs it in a container. When the container runs, it prints a confirmation message and exits.

* You have now successfully installed and started Docker Engine.

**Receiving errors when trying to run without root?**

* The docker user group exists but contains no users, which is why you’re required to use sudo to run Docker commands. Continue to [Linux postinstall](https://docs.docker.com/engine/install/linux-postinstall/) to allow non-privileged users to run Docker commands and for other optional configuration steps.

## Windows-OS WSL

### Guides
* [How to use Docker on Windows 10 (without Docker Desktop) - Worked](https://medium.com/@pawelmarcinkiewicz/how-to-use-docker-on-windows-10-without-docker-desktop-548b39738268)
* [Install Docker in WSL 2 without Docker Desktop](https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop)
* [How To Live Without Docker Desktop — A Developer’s Perspective](https://www.objectivity.co.uk/blog/how-to-live-without-docker-desktop-developers-perspective/)

# Configuration

## [Linux post-installation steps for Docker Engine](https://docs.docker.com/engine/install/linux-postinstall/)

* These optional post-installation procedures describe how to configure your Linux host machine to work better with Docker.

# Error and Solution

## Docker Antix-OS WiFi Conflict

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

## Temporary failure resolving

* Error: Docker: Temporary failure resolving 'deb.debian.org'
  * [Docker: Temporary failure resolving 'deb.debian.org'](https://stackoverflow.com/questions/61567404/docker-temporary-failure-resolving-deb-debian-org)
  * Restart Docker: `sudo service docker restart`

## WSL Docker Pull Takes Long Time

* [Docker on WSL2 very slow](https://stackoverflow.com/questions/62154016/docker-on-wsl2-very-slow)

# References

## Websites

* [docker.com](https://www.docker.com/)
* [hub.docker.com](https://hub.docker.com/)

* [labs.play-with-docker.com](https://labs.play-with-docker.com/)
* [Docker Samples => Official Docker Samples](https://github.com/dockersamples)
* [dockersamples/example-voting-app](https://github.com/dockersamples/example-voting-app)
* [Docker Samples => Docker Hub](https://hub.docker.com/u/dockersamples)
* [dockersamples/docker-swarm-visualizer](https://github.com/dockersamples/docker-swarm-visualizer)

* [Docker Kubernetes MasterClass: DevOps from Scratch - 2024](https://www.udemy.com/course/kubernetes-online-training/?couponCode=ST15MT100124B)
  * [anshulc55/Kubernetes_Devops](https://github.com/anshulc55/Kubernetes_Devops)
  * [anshuldevops => Docker Hub](https://hub.docker.com/u/anshuldevops)

* Docker Clients
  * [dockge.kuma.pet](https://dockge.kuma.pet/) || [louislam/dockge GitHub](https://github.com/louislam/dockge)

## Tutorials

* Docker Tutorial Series
  * [Install Docker and Learn Basic Container Manipulation in CentOS and RHEL 8/7 – Part 1](https://www.tecmint.com/install-docker-and-learn-containers-in-centos-rhel-7-6/)
  * [How to Install, Run and Delete Applications Inside Docker Containers – Part 2](https://www.tecmint.com/install-run-and-delete-applications-inside-docker-containers/)
  * [How to Automatically Build and Configure Custom Docker Images with Dockerfile – Part 3](https://www.tecmint.com/build-and-configure-docker-container-images-with-dockerfile/)
  * [ctop – Top-like Interface for Monitoring Docker Containers](https://www.tecmint.com/ctop-monitor-docker-containers/)

## YouTube Tutorials

* [Best Docker Container Monitoring Tools - Free and open source BY VirtualizationHowto](https://www.youtube.com/watch?v=zxAmqY63eJE)
  