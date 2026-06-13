# Docker/Docker.md

## Performance

* Docker Or Docker-Desktop (which uses WSL2), Inside Windows-Subsystem-For-Linux-2 (WSL2) Is Extremely Slow, Specially When Creating Containers From Images On Hard-Disk-Drive.
  * Instead Use Docker Inside VirtualBox Debian-Server (Debian Standard Edition) VM, Which Is Much Faster.

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

## Debian

### [Docker From Official Repository](https://docs.docker.com/engine/install/debian/)

### Unofficial (From Debian Repo) On Debian (Like Anix-OS)

* `sudo apt update`

* `sudo apt install docker.io docker-compose`

**Concept**

> ChatGPT Question:
> 
> install docker, docker-compose from debian repo, not from docker official repo

If you want to install Docker **from Debian's repositories** (not Docker's official repository), use:

```bash
sudo apt update
sudo apt install -y docker.io docker-compose
```

Or, on newer Debian releases where the Compose plugin is available:

```bash
sudo apt update
sudo apt install -y docker.io docker-compose-plugin
```

Start and enable Docker:

```bash
sudo systemctl enable --now docker
```

Add your user to the Docker group (optional):

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Verify:

```bash
docker --version
docker compose version    # for compose plugin
```

or

```bash
docker-compose --version  # for standalone docker-compose package
```

Check which packages are available in your Debian version:

```bash
apt search docker-compose
apt policy docker.io docker-compose docker-compose-plugin
```

The Debian-packaged `docker.io` is usually older than Docker's official packages but is integrated with Debian's package management and security updates.

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

> Install Instruction: 
> 
> [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

* Set up Docker's apt repository.
```shell
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
```

* Install the Docker packages. To install the latest version, run:
```shell
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

* Note
  * After installation, verify that Docker is running: `sudo systemctl status docker` || `sudo service docker status`
  * If Docker is not running, start it manually: `sudo systemctl start docker` || `sudo service docker start`

* Verify that the installation is successful by running the hello-world image: `sudo docker run hello-world`

> ChatGPT Question:
> 
> Docker is only compatible with iptables-nft and iptables-legacy.
> Firewall rules created with nft are not supported on a system with Docker installed.
> Make sure that any firewall rulesets you use are created with iptables or ip6tables, 
> and that you add them to the DOCKER-USER chain, see Packet filtering and firewalls.
> 
> What is solution for Ubunut-24.04 WSL. Keep it short and workable.

On **Ubuntu 24.04 in WSL**, your issue is coming from the **nftables backend being active**, which breaks Docker networking.

You need to force **iptables-legacy** (not nft).

---

***# ✅ Working fix (short & reliable)***

***## 1. Switch iptables to legacy***

```bash
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
```

---

***## 2. Verify (must NOT show nft)***

```bash
iptables --version
```

✔ Should show: `legacy`
❌ If it shows `nf_tables`, Docker will break

---

***## 3. Restart WSL completely (important)***

From Windows PowerShell:

```powershell
wsl --shutdown
```

Reopen Ubuntu.

---

***## 4. Start Docker again***

```bash
sudo dockerd
```

---

***# 🚀 If still broken (fast fallback)***

Use Docker Desktop (recommended for WSL):

Docker Desktop
Enable:

* Settings → WSL Integration → Ubuntu 24.04

Then just run:

```bash
docker ps
```

---

***# 🧠 One-line root cause***

Ubuntu 24.04 uses **nftables by default**, but Docker in WSL requires **legacy iptables**.

---

If you want, I can give you a **one-command permanent fix script** that locks this setting forever in WSL.

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

**Docker Tutorial Series**

* [Install Docker and Learn Basic Container Manipulation in CentOS and RHEL 8/7 – Part 1](https://www.tecmint.com/install-docker-and-learn-containers-in-centos-rhel-7-6/)
* [How to Install, Run and Delete Applications Inside Docker Containers – Part 2](https://www.tecmint.com/install-run-and-delete-applications-inside-docker-containers/)
* [How to Automatically Build and Configure Custom Docker Images with Dockerfile – Part 3](https://www.tecmint.com/build-and-configure-docker-container-images-with-dockerfile/)
* [ctop – Top-like Interface for Monitoring Docker Containers](https://www.tecmint.com/ctop-monitor-docker-containers/)

## Guides

**Install Docker On Windows-WSL**

* [How to use Docker on Windows 10 (without Docker Desktop)](https://medium.com/@pawelmarcinkiewicz/how-to-use-docker-on-windows-10-without-docker-desktop-548b39738268)
* [Install Docker in WSL 2 without Docker Desktop](https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop)
* [How To Live Without Docker Desktop — A Developer’s Perspective](https://www.objectivity.co.uk/blog/how-to-live-without-docker-desktop-developers-perspective/)

## YouTube Tutorials

* [Best Docker Container Monitoring Tools - Free and open source BY VirtualizationHowto](https://www.youtube.com/watch?v=zxAmqY63eJE)
  