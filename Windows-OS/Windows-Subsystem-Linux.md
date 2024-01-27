# Windows Subsystem for Linux - WSL

# Commands

## WSL Commands

* Install/Uninstall
  * Install a distribution: `wsl --install --distribution Ubuntu-22.04`
  * Unregisters the distribution and deletes the root filesystem: `wsl --unregister Ubuntu-22.04`

* On/Off
  * Run the specified distribution: `wsl --distribution Ubuntu-22.04`
  * Terminates all running distributions and virtual machine: `wsl --shutdown`
  * Terminates the specified distribution: `wsl --terminate Ubuntu-22.04`

* Management
  * Show status of wsl: `wsl --status`
  * Update wsl: `wsl --update`
  * Sets the distribution as the default: `wsl --set-default Ubuntu-22.04`
  * Set distribution version to wsl2: `wsl --set-version Ubuntu-22.04 2`

* List
  * List all distributions, including distributions that are currently being installed or uninstalled: `wsl --list --all`
  * List only distributions that are currently running: `wsl --list --running`
  * Only show distribution names: `wsl --list --quiet`
  * Show detailed information about all distributions: `wsl --list --verbose`
  * Displays list of distributions for install with 'wsl --install': `wsl --list --online`

## Linux Commands

* Check Operating System Version: `cat /etc/os-release` <sup>{31}</sup>

# Elements of WSL

## Websites
* [Windows Subsystem for Linux Documentation](https://learn.microsoft.com/en-us/windows/wsl/)
* [Enable SystemD in WSL (High Resource Usage)](https://askubuntu.com/questions/1379425/system-has-not-been-booted-with-systemd-as-init-system-pid-1-cant-operate/1379567#1379567)

## Notes - WSL

* View all Linux distributions and their root file systems in Windows File explorer, in the address bar enter: `\\wsl$` <sup>{32}</sup>
* General
  * Difference between WSL-1 and WSL-2: WSL-1 uses native translation and WSL-2 uses Hypervisor virtual machine.
  * To install [Snap](https://snapcraft.io/) softwares, SystemD must be enabled in Ubuntu WSL. SystemD has high resource usage.
  
# WSL Install/Uninstall

## Installation Workflow - WSL

* [How to install WSL2 (Windows Subsystem for Linux 2) on Windows 10](https://pureinfotech.com/install-windows-subsystem-linux-2-windows-10/)
  * Install WSL2 on Windows 10
    * Open Start on Windows 10.
	* Search for Command Prompt, right-click the top result, and select the Run as administrator option.
	* Type the following command to install the WSL on Windows 10 and press Enter: `wsl --install`
	* Restart your computer to finish the WSL installation on Windows 10.
	* Continue with the Linux distro setup as necessary.
  * Install WSL with specific distro
    * Open Start.
	* Search for Command Prompt, right-click the top result, and select the Run as administrator option.
	* Type the following command to view a list of available WSL distros to install on Windows 10 and press Enter: `wsl --list --online`
	* Type the following command to install the WSL with a specific distro on Windows 10 and press Enter: `wsl --install -d DISTRO-NAME`
	* Remember to replace “DISTRO-NAME” in the command with the distro’s name to install, such as Debian.
	* Restart your computer.
	* Continue with the Linux distro setup as necessary.
  * Update WSL kernel
    * Open Start.
	* Search for Command Prompt, right-click the top result, and select the Run as administrator option.
	* Type the following command to update the WSL kernel and press Enter: `wsl --update`
	* If the update command doesn’t work, open Settings > Update & Security > Windows Update > Advanced options, and turn on the “Receive updates for other Microsoft products when you update Windows” toggle switch.
  * Install WSL2 on Windows 10 (older versions)
  * Enable Windows Subsystem for Linux
    * Open Start on Windows 10
	* Search for Turn Windows features on or off and click the top result to open the app.
	* Check the “Windows Subsystem for Linux” option.
	* Click the OK button
	* Click the Restart button.
  * Enable Virtual Machine Platform
    * Important: The motherboard and processor must support virtualization, and the option has to be enabled on the Basic Input/Output System (BIOS) or Unified Extensible Firmware Interface (UEFI).
	* Open Start.
	* Search for PowerShell, right-click the top result, and select the Run as administrator option.
	* Type the following command to enable the Virtual Machine Platform feature and press Enter: `Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform`
	* Restart your computer.
  * Enable Windows Subsystem for Linux 2
    * [Download this WSL 2 kernel update](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi) (required).
	* Double-click the wsl_update_x64.msi file and apply the update.
	* Open Start.
	* Search for PowerShell, right-click the top result, and select the Run as administrator option.
	* Type the following command to set Windows Subsystem for Linux 2 your default architecture for new distros that you install, and press Enter: `wsl --set-default-version 2`
	* (Optional) Type the following command to convert the distro from WSL to WSL 2 and press Enter: `wsl --set-version Ubuntu 2`
	* In the command, change “Ubuntu” for the distro’s name you want to convert. If you do not know the distro’s name, use the wsl -l -v command.
  * Confirm distro platform
    * Open Start.
	* Search for PowerShell, right-click the top result, and select the Run as administrator option.
	* Type the following command to verify the version of the distro and press Enter: `wsl --list --verbose`
	* Confirm the distro version is 2.
	* 
* [Error code: Wsl/Service/CreateInstance/CreateVm/HCS_E_SERVICE_NOT_AVAILABLE #8693](https://github.com/microsoft/WSL/issues/8693)
  * Step 1: Go to settings > (search) turn windows feature on / off
  * Step 2: If Windows Hypervisor Platform and Virtual Machine Platform is unchecked, please check them, else uncheck and recheck them.
  * Step 3: Reboot
  * Step 4: Open the terminal check, run command - `wsl -l -v` should result in saying ubuntu is running in version 1/2.
  
* Error: Can not open display [After installing "nautilus", "pcmanfm"]
  * 

## Remove Distribution

* [How to remove Linux distro from WSL](https://pureinfotech.com/remove-linux-distro-wsl/)
  * Uninstall WSL distro on Windows 11
    * Open Settings on Windows 11.
    * Click on Apps
    * Click the Installed apps page.
    * Select the Linux distro, open the menu (three-dotted button) on the right side, and choose the “Uninstall” option.
    * Click the Uninstall option again.
  * Uninstall WSL distro on Windows 10
    * Open Settings.
	* Click on Apps.
	* Click on Apps & features.
	* Select the Linux distro and click the Uninstall button.
	* Click the Uninstall button again.
  * Remove Linux distro on WSL from Command Prompt or PowerShell
    * Open Start.
	* Search for Command Prompt (or PowerShell), right-click the top result, and select the Run as administrator option.
	* Type the following command to list all the apps installed on Windows 11 and press Enter: `winget uninstall`
	* Type the following command to remove the Linux distro (Ubuntu, Debian, Kali, Mint, etc.) and press Enter: `winget uninstall --id "DISTRO-ID-NAME"`
	* In the command, specify the name of the Linux distro to remove from Windows 11 completely. For example, this command removes the Ubuntu distro: `winget uninstall --id Canonical.Ubuntu`
  * Remove imported Linux distro on WSL with commands
    * Open Start.
	* Search for Command Prompt, right-click the top result, and select the Run as administrator option.
	* Type the following command to view a list of all available distros and press Enter: `wsl --list`
	* Type the following command to set a distro as the new default on Windows and press Enter: `wsl --unregister DISTRO-NAME`
	* In the command, replace DISTRO-NAME with the name of the distro you want to set as default (see step 3). For example, this command unregisters and deletes the Ubuntu Linux distribution: `wsl --unregister Ubuntu`
	* Type the following command to confirm distros and press Enter: `wsl --list`

# Configuration

## Mount HDD Partition/drive

### Using "/etc/wsl"

* [Example wsl.conf file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#example-wslconf-file)
* Open Windows-Explorer and enter into address bar: "\\wsl.localhost\Ubuntu-20.04\etc\wsl.conf"
* Add following configurations
```shellscript
# Automatically mount Windows drive when the distribution is launched
[automount]

# Set to true will automount fixed drives (C:/ or D:/) with DrvFs under the root directory set above. Set to false means drives won't be mounted automatically, but need to be mounted manually or with fstab.
enabled = true

# Sets the directory where fixed drives will be automatically mounted. This example changes the mount location, so your C-drive would be /c, rather than the default /mnt/c. 
root = /
```

### Using Symbolic Link

* Mounting windows partition from "sudo fdisk -l" does not work in WSL.
* Create symbolic link "sudo ln -s /mnt/d/ /", it works exactly the same way as mounting hdd partition.
* Create symbolic link for four partition
  * sudo ln -s /mnt/c/ /
  * sudo ln -s /mnt/d/ /
  * sudo ln -s /mnt/e/ /
  * sudo ln -s /mnt/f/ /

## Fixed IP for WSL

* [Fixed IP for WSL instances](https://dev.to/agiboire/fixed-ip-for-wsl-instances-2ilf)
* [go-wsl2-host GitHub](https://github.com/shayne/go-wsl2-host)
  * To install and run, download a binary from the releases tab. Place it somewhere like your Documents/ folder.
  * Open an elevated/administrator command prompt:
    * > .\wsl2host.exe install
    * Windows Username: <username-you-use-to-login-to-windows>
    * Windows Password: <password-for-this-user>
  * The program will install a service and start it up.
  * Usage
    * usage: .\wsl2host.exe <command> -> where <command> is one of -> install, remove, debug, start, stop, pause or continue.
    * .\wsl2host.exe start

# Interoperability

## Notes (Interoperability)

* View all Linux distributions and their root file systems in Windows File explorer, in the address bar enter: `\\wsl$` <sup>{32}</sup>
* About PowerShell
  * "powershell.exe" is Windows-OS built-in, which version is "5".
  * "pwsh.exe" is installed from [PowerShell-GitHub](https://github.com/PowerShell/PowerShell), which version is "7".
* [View your current directory in Windows File Explorer](https://learn.microsoft.com/en-us/windows/wsl/filesystems#view-your-current-directory-in-windows-file-explorer)
* Use Host-Windows-OS binary "bash.exe"(GitBash-HostWindowsOS), "explorer.exe", "pwsh.exe"(v7-GitHub), "powershell.exe"(v5-Builtin) from inside WSL (use ".exe" suffix). Use WSL binary "tmux" using command "wsl tmux" from Host-Windows-OS (use "wsl " prefix).

## Use Windows Binary

### General Information

* Inside WSL ("pwsh.exe" and "cmd.exe") environment variables and aliases are used from Windows-Command-Prompt, not PowerShell.

### Launch Windows-OS programs from inside WSL

* SHELL - Bash, PowerShell
  * Launch LunarVim: `pwsh.exe -c "lvim"` OR `pwsh.exe -c "C:\Users\<user-name>\.local\bin\lvim.ps1"`
  * Use Git-Bash "bash.exe": `bash.exe --version`
* [View your current directory in Windows File Explorer](https://learn.microsoft.com/en-us/windows/wsl/filesystems#view-your-current-directory-in-windows-file-explorer)
  * View directory files by opening Windows File Explorer inside WSL: `explorer.exe .` OR `notepad.exe`
* [Command-Line Option to Open Chrome in New Window and Move Focus](https://superuser.com/questions/731467/command-line-option-to-open-chrome-in-new-window-and-move-focus)
  * Launch Windows-OS Firefox browser from inside WSL: `pwsh.exe -c start firefox 'http://www.google.com'`
  * Launch Windows-OS Chrome browser from inside WSL: `pwsh.exe -c start chrome 'http://www.google.com'`

* Use WSL "~/.bashrc" file's alias-command to launch program from Windows-OS. To open "~/.bashrc" using windows-exporer, type in address bar `\\wsl$\Ubuntu-20.04\home\<user-name>`
* [How to check if a string has spaces in Bash shell](https://stackoverflow.com/questions/1473981/how-to-check-if-a-string-has-spaces-in-bash-shell)

File Path: \\wsl$\Ubuntu-20.04\home\<user-name>\.bashrc
```shellscript
# Start: Windows Subsystem for Linux
export EDITOR=vim
export SHELL=/bin/bash
export TMUXINATOR_CONFIG=/e/stproject/tmuxinator

function git() {
	cparams=""
	for var in "$@"
	do
		re="[[:space:]]+"
		if [[ $var =~ $re ]]; then
			cparams="${cparams} '${var}'"
		else
			cparams="${cparams} ${var}"
		fi
	done
	#echo ${cparams}
	pwsh.exe -c "git ${cparams}"
}
# End: Windows Subsystem for Linux
```

## Use WSL Binary

* Inside WSL ("pwsh.exe" and "cmd.exe") environment variables and aliases are used from Windows-Command-Prompt, not PowerShell.

### Windows Command Prompt Setup

* [Create alias for a specific command in cmd](https://stackoverflow.com/questions/54866820/create-alias-for-a-specific-command-in-cmd)
  * Create a file called init.cmd and save it to your user folder
  Example File Path: "C:\Users\UserName\init.cmd"
  ```shellscript
  @echo off
  doskey c=cls
  doskey d=cd %USERPROFILE%\Desktop
  doskey e=explorer $*
  doskey jp=cd C:\John\Pictures
  doskey l=dir /a $*
  ```

  Tmux Configuration: "C:\Users\<user-name>\init.cmd"
  ```
  @echo off
  doskey tmux=wsl tmux $*
  ```
  * Register it to be applied automatically whenever cmd.exe is executed. In the Command Prompt, run:
  `reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%"USERPROFILE"%\init.cmd" /f`
  * Restart the Command Prompt
    * Now close/open the Command Prompt and the aliases will be available.
    * To unregister, run:
    `reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun`

### PowerShell Setup

* Use Windows-Host "C:\Users\<user-name>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" file's alias-command to launch program from WSL. This file is created during LunarVim installation.
* To use the new alias in this window reload your profile with: `. $PROFILE`	
  * [How do I deal with paths when creating a PowerShell alias for a Windows Subsystem for Linux command?](https://serverfault.com/questions/911513/how-do-i-deal-with-paths-when-creating-a-powershell-alias-for-a-windows-subsyste)

File Path: "C:\Users\<user-name>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```shellscript
Set-Alias lvim 'C:\Users\Riazul\.local\bin\lvim.ps1'

Set-Alias -name 'tmux' -Value 'Start-Tmux'
function Start-Tmux {
    wsl tmux $args
}

Set-Alias -name 'mux' -Value 'Start-Tmuxinator'
function Start-Tmuxinator {
    wsl tmuxinator $args
}
```	

## Commands

* Windows Command Prompt
  * [Setting and getting Windows environment variables from the command prompt?](https://superuser.com/questions/79612/setting-and-getting-windows-environment-variables-from-the-command-prompt)
    * To get all the values of system variable open CMD and type: `Set`
    * Set environment variable "$EDITOR": `setx EDITOR vim /M` ["/M" means set for system-wide] [Open "cmd" in Administrator mode]
    * Set environment variable "$SHELL": `setx SHELL /bin/bash /M`
    * Set environment variable "$TMUXINATOR_CONFIG":`setx TMUXINATOR_CONFIG E:\tmuxinator /M` [UNC paths are not supported.  Defaulting to Windows directory.]

* Tmuxinator inside PowerShell
  * [How to Set environment variables using PowerShell?](https://www.tutorialspoint.com/how-to-set-environment-variables-using-powershell)
    * Shows all environment variables: `dir env:`
    * Set environment variable "EDITOR": `$env:EDITOR = 'vim'`
    * Set environment variable "SHELL": `$env:SHELL = '/bin/bash'`

# WSL Graphical UI Software

## FreeFileSync - WSL

* Why inside WSL?
  * If FreeFileSync is used in Antix-OS/Ubuntu-OS then ".ffs_db" file is created using Linux path, which does not work in Windows-OS.
  
* Mount "d" drive
  * Mounting windows partition from "sudo fdisk -l" does not work in WSL.
  * Create symbolic link "sudo ln -s /mnt/d/ /", it works exactly the same way as mounting hdd partition.
    * Create symbolic link for four partition
	* sudo ln -s /mnt/c/ /
	* sudo ln -s /mnt/d/ /
	* sudo ln -s /mnt/e/ /
	* sudo ln -s /mnt/f/ /

* Install FreeFileSync
  * Download FreeFileSync ".tar.gz" and extract ".run" file. Execute it from terminal.
  * For first time run FreeFileSync from terminal: `cd /opt/freefilesync/` and `sudo ./FreeFileSync`
  * Install xdg-util: `sudo apt install xdg-utils` [If shows error: "xdg command not found".]

* Install Google-Chrome
  * Install GDebi: `sudo apt install gdebi`
  * Download deb file from [Google-Chrome-amd64](https://deb.pkgs.org/packages/google-amd64/)
  * Launch GDebi in sudo mode `sudo gdebi-gtk`
  * Install google-chrome, by adding ".deb" file.
  
* Use FreeFileSync
  * If permission error is shown then execute FreeFileSync from terminal: `cd /opt/freefilesync/` and `sudo ./FreeFileSync`

# Ubuntu-WSL Software Setup

## Notes (Software Setup)

* Tested (WSL): Ubuntu-20.04
* Get configurations from "apt-antix-software.sh" and "xampp_8.2.4->php-apache"
* Access WSL files in Windows-Explorer: `explorer.exe .`

* Execute bash script: `./wsl-ubuntu-software.sh` [**Do not use "sudo".**]
  * Every user has different ".bashrc" file in their "$HOME" directory.
  * Ruby and Rust "$PATH" is exported using ".bashrc" file. We use normal-user's ".bashrc", not root-user's ".bashrc".
  * When we execute bash script using "sudo", then normal-user's exported "$PATH" is not available.
  * Enter into sudo user-mode: `sudo su` OR `su -`

* "command" vs "which"
  * "which" shows path from Host Windows-OS. "command" shows path from Windows Subsystem for Linux (WSL).
  * Output of `command -v tmuxinator`: /home/<user-name>/.rvm/gems/ruby-3.2.2/bin/tmuxinator
  * Output of `which tmuxinator`: /mnt/c/Users/<user-name>/AppData/Roaming/gem/ruby/3.2.0/bin/tmuxinator

* BASH Code
* Bash Hash
  * Remove from Bash Hash(Index): `hash -d ruby` [Run after "ruby" uninstallation.]
  * Previously shows output: "bash: /usr/bin/ruby: No such file or directory"
  * After shows output: "bash: ruby: command not found"
* Bash Comment
  * [Way to create multiline comments in Bash?](https://stackoverflow.com/questions/43158140/way-to-create-multiline-comments-in-bash)
	```shellscript
	<<'###BLOCK-COMMENT'
	line 1
	line 2

	line 3
	line 4
	###BLOCK-COMMENT
	```

## Preinstalled Software (WSL)
* Tmux
* Python3

## Uninstall Software
* Ruby & Gem
  * `sudo apt remove ruby`

* Rust & Cargo
  * [Install & Uninstall Rust](https://www.rust-lang.org/tools/install)
  * `rustup self uninstall`

## Ruby Installation

## Commands
* hash
  * Shows program is hashed or not: `command -V tmuxinator`

# Docker - WSL2

## Notes (Docker)

* ** Use Ubuntu-20.04, Do Not Use Ubuntu-22.04(Docker-Compose Shows Error) **
* Switch to "root" user inside container: `su -`
* Access local development site with: [http://localhost](http://localhost)
* Access phpmyadmin with URL: [http://localhost:8081/](http://localhost:8081/)
* Docker container is running inside WSL.
* Access Docker-Local development site with: [http://localhost](http://localhost)

## Docker does not start

* Docker works perfectly on Ubuntu-20.04, but does not start on Ubuntu-22.04 and Debian-12. Because Ubuntu-20.04 has legacy iptables, but Ubuntu-22.04 and Debian-12 has update iptables.
* To start docker on Ubuntu-22.04 and Debian-12, downgrade iptables from update to legacy.
* Working Steps
  * [Failure to install and run Docker in WSL Ubuntu 22.04 (works in 20.04): "Cannot connect to the Docker daemon" #1406](https://github.com/docker/for-linux/issues/1406)
  * [Docker service won't start on Ubuntu 22.04 on WSL2 [duplicate]](https://askubuntu.com/questions/1437128/docker-service-wont-start-on-ubuntu-22-04-on-wsl2)
  * Change iptables: `sudo update-alternatives --config iptables`
  * Type number "1" and press Enter to select "iptables-legacy"
  * Start docker service: `sudo service docker start`
  * Check docker service status: `sudo service docker status`
  * Restart docker service: `sudo service docker restart`
  * Stop docker service: `sudo service docker stop`

## Ubuntu-WSL Installation (Docker)

* Docker install using script
  * [Installing Docker on Ubuntu (4 Easy Ways)](https://kinsta.com/blog/install-docker-ubuntu/)
  * [Install using the convenience script](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
  * Download script: `curl -fsSL https://get.docker.com -o get-docker.sh`
  * Execute script, install Docker: `sudo sh get-docker.sh`
  * Add the user to the docker user group.
    * [Remote Development BY Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
    * sudo usermod -aG docker ${USER} [Sign out and back in again so this setting takes effect.]

* [Install Docker on Windows 11 with WSL Ubuntu 22.04](https://tjisblogging.blogspot.com/2022/05/install-docker-on-windows-11-with-wsl.html)
  * Run the apt update command to get the updated and install some required packages.
    * sudo apt-get update
    * sudo apt-get install ca-certificates curl gnupg lsb-release
  * Add CPG keys for the official docker repository.
    * curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  * Add Docker repository to APT.
    * echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  * Install Docker
    * sudo apt-get update
    * sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  * Start the docker service
    * sudo service docker start
  * Check the docker service status
    * sudo service docker status
  * Add the user to the docker user group.
    * [Remote Development BY Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
    * sudo usermod -aG docker ${USER} [Sign out and back in again so this setting takes effect.]
    * [Su Command in Linux (Switch User)](https://linuxize.com/post/su-command-in-linux/)
    * su - ${USER}
  * Use Docker
    * docker ps
  * Install "docker-compose"
    * sudo apt install docker-compose
    * Check version: `docker-compose --version` [Shows output: docker-compose version 1.25.0, build unknown]
    * ["Unlock the Full Potential of Docker: Run Docker-Compose without Sudo"](https://sujanrajtuladhar.com.np/unlock-the-full-potential-of-docker-run-docker-compose-without-sudo)

* [How to find WSL2 machine's IP address from windows](https://superuser.com/questions/1586386/how-to-find-wsl2-machines-ip-address-from-windows)
  * ip add | grep "eth0"
  * apt install net-tools
  * ifconfig [Get IP address from "eth0"]

## Commands (Docker)

* Build with compose: `docker-compose up --build --detach`
* Enter inside of container: `docker container exec -it <container-name> bash`
* Build without cache: `docker-compose build --no-cache`
* Build with memory-limit and no-cache: `docker-compose build --no-cache --memory 1024m`
* Run all service (defined in "docker-compose.yml"): `docker-compose up -d` ["-d" means run in background]
* Run specific service (defined in "docker-compose.yml"): `docker-compose up -d php-apache mariadb phpmyadmin`

## Error and Solution (Docker)

* ERROR: build path /e/xampp_8.2.4/htdocs/docker-xampp/code-server either does not exist, is not accessible, or is not a valid URL.
  * This error is shown during executing command: `docker-compose up -d php-apache mariadb phpmyadmin`
  * Solution:
  * Use command: `sudo docker-compose up -d php-apache mariadb phpmyadmin`

# References

* Next Serial: {33}

* Tutorial-WSL
  * {1} [Ubuntu on WSL](https://ubuntu.com/wsl)
  * {2} [Install Ubuntu on WSL2 and get started with graphical applications](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview)
  * {3} [Share Environment Vars between WSL and Windows](https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/)

* Guides-WSL
  * {4} [Windows and Ubuntu interoperability on WSL2](https://ubuntu.com/tutorials/windows-and-ubuntu-interoperability-on-wsl2#1-overview)
  * {5} [How to upgrade to WSL2 from WSL1 on Windows 10](https://pureinfotech.com/upgrade-wsl2-wsl1-windows-10/)
  * {6} [How to install WSL2 (Windows Subsystem for Linux 2) on Windows 10](https://pureinfotech.com/install-windows-subsystem-linux-2-windows-10/)
  * {7} [Error code: Wsl/Service/CreateInstance/CreateVm/HCS_E_SERVICE_NOT_AVAILABLE #8693](https://github.com/microsoft/WSL/issues/8693)
  * {8} [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)
  * {9} [Comparing WSL Versions](https://learn.microsoft.com/en-us/windows/wsl/compare-versions)
  * {10} [YouTube - How to install Linux GUI apps with WSL 2 on Windows 10](https://www.youtube.com/watch?v=DooJlOPpNTI)
  * {11} [Linux Terminal & GUI Inside of Windows 10 (WSL)](https://www.youtube.com/watch?v=qYlgUDKKK5A)
  * {12} [How to remove Linux distro from WSL](https://pureinfotech.com/remove-linux-distro-wsl/)

* Software inside WSL

  * $PATH
    * {13} [Is $PATH in WSL supposed to be very long?](https://askubuntu.com/questions/1066100/is-path-in-wsl-supposed-to-be-very-long)
    * {14} [Advanced settings configuration in WSL -> Interop settings](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#interop-settings)

  * Command exists
    * {15} [How can I check if a program exists from a Bash script?](https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script)
    * {16} [What is </dev/null in bash?](https://stackoverflow.com/questions/19955260/what-is-dev-null-in-bash)
    * {17} [What does &> do in bash?](https://stackoverflow.com/questions/24793069/what-does-do-in-bash)
    * {18} [Command inside if statement of bash script [duplicate]](https://stackoverflow.com/questions/5276393/command-inside-if-statement-of-bash-script)

* Interoperability

  * PATH
    * {32} [Get started using Git on Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git)

  * Windows Command Prompt
    * {19} [Setting and getting Windows environment variables from the command prompt?](https://superuser.com/questions/79612/setting-and-getting-windows-environment-variables-from-the-command-prompt)
    * {20} [Create alias for a specific command in cmd](https://stackoverflow.com/questions/54866820/create-alias-for-a-specific-command-in-cmd)

  * PowerShell
    * {21} [How to Set environment variables using PowerShell?](https://www.tutorialspoint.com/how-to-set-environment-variables-using-powershell)
    * {22} [How do I deal with paths when creating a PowerShell alias for a Windows Subsystem for Linux command?](https://serverfault.com/questions/911513/how-do-i-deal-with-paths-when-creating-a-powershell-alias-for-a-windows-subsyste)

  * Bash
    * {23} [How to check if a string has spaces in Bash shell](https://stackoverflow.com/questions/1473981/how-to-check-if-a-string-has-spaces-in-bash-shell)

  * Launch Windows-Host Program
    * {24} [Command-Line Option to Open Chrome in New Window and Move Focus](https://superuser.com/questions/731467/command-line-option-to-open-chrome-in-new-window-and-move-focus)

* Ubuntu-WSL Software Setup

  * Bash
    * {25} [delete bash hash for particular executable path](https://unix.stackexchange.com/questions/443076/delete-bash-hash-for-particular-executable-path)
    * {26} [Way to create multiline comments in Bash?](https://stackoverflow.com/questions/43158140/way-to-create-multiline-comments-in-bash)

* Docker-WSL

  * Installation
    * {27} [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
    * {28} [Install Docker Engine on Debian](https://docs.docker.com/engine/install/debian/)

  * Docker does not start
    * {29} [Failure to install and run Docker in WSL Ubuntu 22.04 (works in 20.04): "Cannot connect to the Docker daemon" #1406](https://github.com/docker/for-linux/issues/1406)
    * {30} [Docker service won't start on Ubuntu 22.04 on WSL2 [duplicate]](https://askubuntu.com/questions/1437128/docker-service-wont-start-on-ubuntu-22-04-on-wsl2)

* Linux
  * {31} [How to Check your Debian Linux Version](https://linuxize.com/post/how-to-check-your-debian-version/)
