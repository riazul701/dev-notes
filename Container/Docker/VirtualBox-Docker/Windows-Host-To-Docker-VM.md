# Commands/Usage

## Performance

* Docker Or Docker-Desktop (which uses WSL2), Inside Windows-Subsystem-For-Linux-2 (WSL2) Is Extremely Slow, Specially When Creating Containers From Images On Hard-Disk-Drive.
  * Instead Use Docker Inside VirtualBox Debian-Server (Debian Standard Edition) VM, Which Is Much Faster.

## Setup Windows Host To Docker-VM

* `scoop install main/docker --global` (windows-host) : Install docker client on windows host. Open terminal with Administrator privileges.

* `scoop install main/docker-compose` (windows-host) : Install docker-compose client on windows host. Open terminal with Administrator privileges.

* `sudo find /usr -name dockerd 2>/dev/null` (linux-vm) : Find `dockerd` PATH and using this in `/etc/systemd/system/docker.service.d/override.conf` file.

* On Linux-VM do this steps:

For systems using systemd, edit Docker's service configuration, for example:

```bash
sudo mkdir -p /etc/systemd/system/docker.service.d

sudo nano /etc/systemd/system/docker.service.d/override.conf
```

Add:

```ini
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd \
  -H unix:///var/run/docker.sock \
  -H tcp://0.0.0.0:2375
```

Then:

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

Verify:

```bash
ss -tlnp | grep 2375
```

* (windows-host) On VirtualBox Settings -> Network

  * Adapter 1
    * Tick "Enable Network Adapter"
    * Attached To: NAT
    * Name (Not Editable): <empty>
    * Adapter Type: Intel PRO/1000 MT Desktop (<some-random-number>)
    * Promiscuous Mode (Not Editable): Deny
    * MAC Address: <some-random-number>
    * Tick "Virtual Cable Connected"
    * Port Forwarding
      * Name: Docker
      * Protocol: TCP
      * Host IP: <empty>
      * Host Port: 2375
      * Guest IP: <empty>
      * Guest Port: 2375

  * Adapter 2
    * Tick "Enable Network Adapter"
    * Attached To: Host-only Adapter
    * Name: VirtualBox Host-Only Ethernet Adapter
    * Adapter Type: Intel PRO/1000 MT Desktop (<some-random-number>)
    * Promiscuous Mode: Deny
    * MAC Address: <some-random-number>
    * Tick "Virtual Cable Connected"

* `$env:DOCKER_HOST="tcp://localhost:2375"` (windows-host powershell) : Set docker-engine server on windows-host.

* `docker info` (windows-host powershell) : Check docker information both client and server.

* `docker ps` (windows-host powershell) : Check running docker containers.

* `lazydocker` (windows-host powershell) : Launch lazydocker on windows-host.
  * Note: Lazydocker's 1st (projects) and 2nd (services) panels are dependent on current directory's docker-compose.yml file. Therefore these 2 panels do not work.

* `$env:COMPOSE_PROJECT_NAME="myproject"` (windows-host powershell) : Set docker-compose's project name from it's `.env` file.

* `docker-compose ls` (windows-host powershell) : List running compose projects.

* `docker-compose ps` (windows-host powershell) : List containers from project, that is set via `$env:COMPOSE_PROJECT_NAME="myproject"` command.

# Windows-Host-To-Docker-VM.md

# Concept: Access Docker Inside VirtualBox From Windows Host

> ChatGPT Question:
> 
> lazydocker connects from windows host to docker inside virtualbox

Yes, you can use **LazyDocker on your Windows host to manage Docker running inside a VirtualBox VM**, but Docker must be reachable from Windows.

***### Option 1: Connect via Docker TCP Socket (Most Common)***

Docker runs in the VirtualBox Linux VM, and LazyDocker on Windows connects through Docker's remote API.

***#### Inside the VM***

Configure Docker to listen on a TCP port (typically 2375 or 2376).

For systems using systemd, edit Docker's service configuration, for example:

```bash
sudo mkdir -p /etc/systemd/system/docker.service.d

sudo nano /etc/systemd/system/docker.service.d/override.conf
```

Add:

```ini
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd \
  -H unix:///var/run/docker.sock \
  -H tcp://0.0.0.0:2375
```

Then:

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

Verify:

```bash
ss -tlnp | grep 2375
```

***#### VirtualBox Networking***

Either:

* Use a **Bridged Adapter** so the VM gets an IP on your LAN.
* Or use **NAT + Port Forwarding** to expose port 2375 to Windows.

Find the VM IP:

```bash
ip addr
```

Example:

```text
192.168.1.150
```

***#### On Windows***

Set:

```powershell
$env:DOCKER_HOST="tcp://192.168.1.150:2375"
```

Test:

```powershell
docker ps
```

If that works, start:

```powershell
lazydocker
```

LazyDocker uses the Docker CLI/API, so it should connect automatically.

---

***### Option 2: SSH Connection (More Secure)***

Instead of exposing Docker over TCP:

```powershell
$env:DOCKER_HOST="ssh://user@192.168.1.150"
```

Test:

```powershell
docker ps
```

Then:

```powershell
lazydocker
```

This is generally preferable because port 2375 is unencrypted and unauthenticated by default.

---

***### Option 3: Run LazyDocker Inside the VM***

Install LazyDocker directly in the VM:

```bash
lazydocker
```

Then access the VM through:

```powershell
ssh user@vm-ip
```

This avoids remote Docker configuration entirely.

---

***### Troubleshooting***

If `docker ps` works from Windows but LazyDocker doesn't:

1. Check what `DOCKER_HOST` is set to:

```powershell
echo $env:DOCKER_HOST
```

2. Verify Docker connectivity:

```powershell
docker info
```

3. Check LazyDocker version:

```powershell
lazydocker --version
```

4. If using SSH, ensure key-based authentication works:

```powershell
ssh user@vm-ip
```

before trying Docker.

Could you tell me:

* What OS is inside the VirtualBox VM (Ubuntu, Debian, etc.)?
* Is Docker already installed in the VM?
* Are you using native Windows, WSL2, or Git Bash to run LazyDocker?

With that information, I can give exact commands for your setup.

===============================================================================

> ChatGPT Question: 
> 
> access docker from windows host, while docker is running inside virtualbox

To access **Docker running inside a VirtualBox VM from your Windows host**, you need to make the Docker daemon reachable from Windows.

***## Recommended: Use Docker over SSH***

If your VM has SSH enabled and Docker installed:

***### On Windows***

Set:

```powershell
$env:DOCKER_HOST="ssh://username@VM_IP"
```

Example:

```powershell
$env:DOCKER_HOST="ssh://ubuntu@192.168.1.100"
```

Then test:

```powershell
docker ps
```

If it shows the containers running in the VM, you're connected.

This method is secure and doesn't require exposing Docker's TCP port.

---

***## Alternative: Expose Docker TCP API***

***### 1. Configure Docker in the VM***

Edit Docker's daemon configuration:

```json
{
  "hosts": [
    "unix:///var/run/docker.sock",
    "tcp://0.0.0.0:2375"
  ]
}
```

Typically this goes in:

```text
/etc/docker/daemon.json
```

Restart Docker:

```bash
sudo systemctl restart docker
```

Verify:

```bash
sudo ss -tlnp | grep 2375
```

---

***### 2. Configure VirtualBox Networking***

***#### Bridged Adapter (easiest)***

In VirtualBox:

* Settings → Network
* Adapter 1 → Bridged Adapter

The VM gets a LAN IP such as:

```text
192.168.1.100
```

Find it with:

```bash
ip addr
```

---

***#### NAT + Port Forwarding***

If using NAT:

* Settings → Network → Advanced → Port Forwarding

Example rule:

| Name   | Protocol | Host Port | Guest Port |
| ------ | -------- | --------- | ---------- |
| Docker | TCP      | 2375      | 2375       |

Then Windows connects to:

```text
localhost:2375
```

---

***### 3. Tell Windows Docker CLI Where Docker Is***

For a bridged VM:

```powershell
$env:DOCKER_HOST="tcp://192.168.1.100:2375"
```

For NAT + forwarding:

```powershell
$env:DOCKER_HOST="tcp://localhost:2375"
```

Test:

```powershell
docker version
docker ps
```

---

***## Make It Permanent (Windows)***

PowerShell profile:

```powershell
[Environment]::SetEnvironmentVariable(
    "DOCKER_HOST",
    "ssh://ubuntu@192.168.1.100",
    "User"
)
```

or

```powershell
[Environment]::SetEnvironmentVariable(
    "DOCKER_HOST",
    "tcp://192.168.1.100:2375",
    "User"
)
```

---

***## Verify the Connection***

Run:

```powershell
docker info
```

Look at:

```text
Server:
 Containers: ...
 Operating System: Ubuntu ...
```

If you see the VM's Linux information, Windows is controlling Docker inside VirtualBox.

***### Common Pitfall***

If you have **Docker Desktop installed on Windows**, it may be using its own local Docker engine. Check the current target:

```powershell
docker context ls
```

You can create a dedicated context for the VM:

```powershell
docker context create vbox \
  --docker "host=ssh://ubuntu@192.168.1.100"

docker context use vbox
```

Then all Docker commands (and tools like LazyDocker) will operate on the Docker engine running inside the VirtualBox VM.

==================================================================================

> ChatGPT Question: 
> 
> docker is not installed on windows host

If **Docker is not installed on the Windows host**, that's completely fine. You only need a **Docker client** on Windows to talk to the Docker daemon running inside the VirtualBox VM.

***### Option 1: Install Docker CLI Only on Windows***

Install just the Docker CLI (not Docker Desktop).

Then point it to the VM:

```powershell
$env:DOCKER_HOST="ssh://user@VM_IP"
docker ps
```

or

```powershell
$env:DOCKER_HOST="tcp://VM_IP:2375"
docker ps
```

Tools like LazyDocker will then work because they use the Docker CLI/API.

---

***### Option 2: Use LazyDocker Through SSH***

Instead of running LazyDocker locally, run it inside the VM:

```bash
ssh user@VM_IP
lazydocker
```

This is often the simplest setup if you don't want any Docker-related software on Windows.

---

***### Option 3: Use SSH Tunneling (No Docker Client Required)***

If your goal is simply to access containers, you can SSH into the VM and manage Docker there:

```bash
ssh user@VM_IP
docker ps
docker logs <container>
docker exec -it <container> bash
```

No Docker installation on Windows is needed.

---

***### For LazyDocker Specifically***

LazyDocker itself does **not contain a Docker engine**. It needs access to:

* a local Docker socket, or
* a remote Docker daemon via `DOCKER_HOST`.

Therefore you generally need:

1. Docker daemon running in the VM ✅
2. Docker CLI available where LazyDocker runs (Windows or VM)

A common setup is:

```text
Windows
 ├─ Docker CLI
 ├─ LazyDocker
 └─ SSH → Ubuntu VM (VirtualBox)

Ubuntu VM
 └─ Docker Engine
```

If your goal is specifically **"run LazyDocker on Windows and control Docker in the VM"**, tell me:

* Which VM OS you're using (Ubuntu, Debian, etc.)
* Whether SSH is enabled on the VM
* Whether LazyDocker is already installed on Windows

and I can give the exact setup commands.

=================================================================================

> ChatGPT Question: 
> 
> docker tcp expose enabled by default or not

No. **Docker does not expose container ports over TCP by default.**

By default:

* A container can communicate with other containers on the same Docker network.
* Services running inside a container are **not accessible from the host or external network** unless you explicitly publish ports.
* Docker does **not** automatically create host TCP listeners for container ports.

Example:

```bash
docker run nginx
```

The Nginx container listens on port 80 **inside the container only**. Nothing is exposed on the host.

To expose it:

```bash
docker run -p 8080:80 nginx
```

Now:

* Host TCP port `8080` → Container TCP port `80`
* Accessible as `http://localhost:8080`

You can verify published ports:

```bash
docker ps
```

or

```bash
docker port <container_name>
```

***### Docker daemon TCP API***

If you're asking about the **Docker Engine API** (`dockerd` listening on TCP such as `tcp://0.0.0.0:2375`), that is also **disabled by default**. Docker normally listens only on a local Unix socket:

```bash
unix:///var/run/docker.sock
```

You must explicitly configure TCP listening, for example:

```bash
dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
```

and secure it with TLS if exposed over a network.

So whether you mean **container ports** or the **Docker daemon API**, TCP exposure is **not enabled by default**.

=================================================================================

> ChatGPT Question: 
> 
> dockerd command not found. Docker is installed using command "sudo apt install docker.io docker-compose".

If you installed Docker from Ubuntu's `docker.io` package, `dockerd` is usually present but may not be in your shell's PATH.

Check where it is:

```bash
which dockerd
```

or

```bash
sudo find /usr -name dockerd 2>/dev/null
```

Common locations:

```bash
/usr/bin/dockerd
```

or

```bash
/usr/sbin/dockerd
```

You can also inspect the systemd service:

```bash
systemctl cat docker
```

or

```bash
ps aux | grep dockerd
```

If you want to see the Docker daemon configuration, it's often easier to use:

```bash
sudo systemctl status docker
```

and:

```bash
sudo cat /etc/docker/daemon.json
```

To verify exactly what was installed:

```bash
dpkg -L docker.io | grep dockerd
```

If that command returns nothing, your installation may be incomplete. Try:

```bash
sudo apt update
sudo apt install --reinstall docker.io
```

Please paste the output of:

```bash
docker --version
which docker
which dockerd
dpkg -L docker.io | grep dockerd
```

and I can tell you exactly what's happening.

=================================================================================

> ChatGPT Question: 
> 
> Reply: dockerd \-H unix:///var/run/docker.sock \-H tcp://0.0.0.0:2375
> 
> Shows Output:
> invalid userland-proxy-path: userland-proxy is enabled, but userland-proxy-path 
> is not set

That error usually appears when you try to start `dockerd` manually while the Ubuntu `docker.io` package expects the **docker-proxy** binary to be configured by systemd/package defaults.

Instead of launching `dockerd` directly, check the current daemon configuration:

```bash
sudo systemctl status docker
```

and:

```bash
sudo cat /etc/docker/daemon.json
```

If your goal is to expose the Docker API on TCP port 2375, the recommended way on Ubuntu is via a systemd override:

```bash
sudo systemctl edit docker
```

Add:

```ini
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
```

Then:

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

Verify:

```bash
sudo ss -lntp | grep 2375
```

If you insist on running `dockerd` manually, first find the proxy binary:

```bash
dpkg -L docker.io | grep docker-proxy
```

Typical result:

```bash
/usr/libexec/docker/docker-proxy
```

Then start:

```bash
sudo dockerd \
  --userland-proxy-path=/usr/libexec/docker/docker-proxy \
  -H unix:///var/run/docker.sock \
  -H tcp://0.0.0.0:2375
```

Also note that **port 2375 is unencrypted and unauthenticated**. If it's reachable from other machines, anyone who can connect effectively gains root-level control over the host through Docker. Restrict access with a firewall or use TLS on port 2376.

=================================================================================

> ChatGPT Question: 
> 
> In this file: /etc/systemd/system/docker.service.d/override.conf
> This configuration: 
> 
> [Service]
> ExecStart=
> ExecStart=/usr/bin/dockerd \
>   -H unix:///var/run/docker.sock \
>   -H tcp://0.0.0.0:2375
> 
> Shows error: Main PID: 1214 (code=exited, status=203/EXEC)

`status=203/EXEC` means **systemd could not execute the command specified in `ExecStart`**. The most common causes are:

1. Wrong path to `dockerd`
2. Invalid line continuation (`\`) in the unit file
3. File formatting issues

First, verify where `dockerd` actually is:

```bash
which dockerd
```

or

```bash
sudo find /usr -name dockerd 2>/dev/null
```

Then inspect the service logs:

```bash
sudo journalctl -u docker -n 50 --no-pager
```

### Fix 1: Put `ExecStart` on a single line

Systemd is picky about line continuations in override files. Try:

```ini
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
```

Then:

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### Fix 2: Confirm the path

If `which dockerd` returns something else, use that path instead. For example:

```ini
[Service]
ExecStart=
ExecStart=/usr/sbin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
```

### Fix 3: Check the final service definition

```bash
systemctl cat docker
```

This shows the complete unit after overrides are applied and often reveals formatting mistakes.

Please paste the outputs of:

```bash
which dockerd
systemctl cat docker
sudo journalctl -u docker -n 30 --no-pager
```

and I can pinpoint the exact problem.

=================================================================================

> ChatGPT Question: 
> 
> In docker-compose set project directory permanently, instead of moving to project 
> directory using "cd" command. So that "docker-compose ps" command shows services 
> and containers from any directory.

Docker Compose doesn’t work like a global “project directory switch”. By design, it scopes a project to the **directory where the Compose file lives** (or where you run the command). That’s why `docker compose ps` only shows containers for the “current project”.

But you *can achieve what you want* in a few correct ways.

---

***## Option 1 (Best): Set a fixed project name (recommended)***

Instead of relying on the folder path, force Compose to always use the same project name.

***### PowerShell (current session)***

```powershell
$env:COMPOSE_PROJECT_NAME="myproject"
```

Now:

```powershell
docker compose ps
```

will always show containers for `myproject`, regardless of directory.

***### Make it permanent (Windows)***

Set it as a user environment variable:

```powershell
[Environment]::SetEnvironmentVariable("COMPOSE_PROJECT_NAME", "myproject", "User")
```

Restart terminal.

---

***## Option 2: Always point to a fixed compose file***

You can run Compose from anywhere by explicitly giving the file path:

```powershell
docker compose -f C:\path\to\project\docker-compose.yml ps
```

You can even combine with project name:

```powershell
docker compose -f C:\path\to\project\docker-compose.yml -p myproject ps
```

---

***## Option 3: Use Docker Compose “profiles” via context (advanced)***

You can also define a context, but this is more for different Docker engines:

```powershell
docker context create myvm --docker "host=tcp://..."
docker context use myvm
```

But this still does NOT replace project directory behavior.

---

***## Important clarification***

What you’re asking for (“global project directory for Compose”) is intentionally not supported because:

* Compose uses folder name → project isolation
* prevents accidental mixing of unrelated stacks
* ensures `down` only affects that folder’s stack

So the real control mechanism is:

> **Project identity = `COMPOSE_PROJECT_NAME` + compose file**

---

***## Recommended setup for your case***

Since you’re using tools like LazyDocker:

```powershell
[Environment]::SetEnvironmentVariable("COMPOSE_PROJECT_NAME", "main", "User")
```

Then always manage stacks globally:

```powershell
docker compose ps
docker compose ls
```

---

If you want, I can also show you how to make LazyDocker always show *all projects across directories* cleanly (it has a couple of config tricks for that).

=================================================================================

> ChatGPT Question: 
> 
> but lazydocker's projects and services panel does not work from windows host's 
> docker client, where server is inside of virtualbox

This is expected behavior in your setup, and it’s not a LazyDocker bug.

You’re running into a **Docker context vs DOCKER_HOST conflict + VirtualBox Docker Engine split architecture**, which breaks how LazyDocker detects “projects” and “services”.

---

***# 🔴 Root cause (what’s actually happening)***

From your earlier error + setup:

> “DOCKER_HOST environment variable overrides the active context”

This means:

* Docker CLI is NOT using contexts (`docker context`)
* It is forced to a **fixed remote engine (VirtualBox VM)**
* LazyDocker relies heavily on:

  * Docker contexts
  * Compose project metadata (`com.docker.compose.project`)
  * local daemon API consistency

But in your case:

***### ❌ Problem chain***

* Docker Engine is inside **VirtualBox VM (Docker Machine style)**
* Windows Docker CLI is pointing via `DOCKER_HOST=tcp://...`
* That bypasses Docker contexts completely
* LazyDocker expects **context-aware Docker API**
* Result:
  👉 “Projects / Services panel missing or broken”

This is consistent with Docker CLI behavior:

> `DOCKER_HOST overrides context entirely` ([GitHub][1])

---

***# 🧠 Why LazyDocker breaks specifically***

LazyDocker builds its UI from:

* `docker context ls`
* Compose labels
* local API grouping

But when you use:

```
DOCKER_HOST=tcp://<virtualbox-ip>:2375
```

Then:

* ❌ no context metadata
* ❌ no Compose project grouping reliability
* ❌ sometimes missing labels entirely (depending on how Engine is exposed)
* ❌ LazyDocker “Projects” tab becomes empty or incomplete

Even though `docker ps` still works.

---

***# 🧨 Important insight***

You are effectively running:

> Windows Docker CLI → TCP → VirtualBox Docker Engine (legacy-style setup)

This is **not a modern Docker Desktop workflow**, so tools like LazyDocker degrade.

---

***# ✅ Fix options (choose one)***

***## 🥇 Option 1 (BEST): Remove DOCKER_HOST and use proper context***

If possible, switch to Docker contexts instead of VirtualBox host override:

```powershell
Remove-Item Env:DOCKER_HOST
```

Then use:

```powershell
docker context create vm --docker "host=tcp://<vm-ip>:2375"
docker context use vm
```

Now LazyDocker works properly again because:

* contexts are restored
* metadata is preserved

---

***## 🥈 Option 2: Accept limitation (current setup)***

If you must keep VirtualBox Docker Engine:

Then understand:

> LazyDocker will NEVER fully support Projects/Services properly in this mode

You can still use:

* `Containers` view ✔
* logs ✔
* stats ✔

But:

* ❌ Projects panel unreliable
* ❌ Compose grouping incomplete

---

***## 🥉 Option 3 (Recommended long-term fix)***

Move away from VirtualBox Docker Engine entirely:

Replace with one of:

* Docker Desktop (WSL2 backend)
* WSL2 native Docker Engine

Why:

* full context support
* correct Compose labeling
* LazyDocker works perfectly
* modern Docker CLI expectations met

---

***# 🔧 Quick diagnosis command (run this)***

```powershell
docker context ls
docker info
echo $env:DOCKER_HOST
```

If you see:

* `DOCKER_HOST` not empty → that is the problem
* context ignored → confirms root cause

---

***# 💡 Bottom line***

LazyDocker is not broken — your Docker setup is:

> VirtualBox Docker Engine + DOCKER_HOST override = no proper context system

That combination removes the metadata LazyDocker needs for Projects/Services.

---

If you want, I can help you migrate your current VirtualBox Docker setup into:

* WSL2 Docker Engine (cleanest on Windows), or
* Docker Desktop + LazyDocker (zero issues, full UI working)

That would permanently fix this class of problems.

[1]: https://github.com/docker/cli/issues/6151?utm_source=chatgpt.com "enhancement: show when context is overridden by \"DOCKER_HOST\" or other options · Issue #6151 · docker/cli · GitHub"

