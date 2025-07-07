# Commands/Usage

* SSH Client
  * `ssh <user-name>@<ip-address>` : Connect to server

* SSH Server (Debian-OS with Systemd)
  * `sudo apt install ssh` : Install OpenSSH, if not present
  * `systemctl status sshd` : Check ssh service is running or not <sup>{45}</sup>
  * `sudo systemctl start sshd` : Start ssh service <sup>{45}</sup>
  * `sudo systemctl stop sshd` : Stop ssh service <sup>{45}</sup>
  * `sudo systemctl restart sshd` : Restart ssh service (For configuration reload) <sup>{45}</sup>
  * `sudo systemctl reload sshd` (as root) : Reload sshd and its configuration <sup>{45}</sup>
  * `systemctl is-enabled sshd` : Check whether sshd is enabled <sup>{45}</sup>
  * `sudo systemctl enable sshd` (as root) : Enable sshd to start automatically at boot <sup>{45}</sup>
  * `sudo systemctl enable --now sshd` (as root) : Enable sshd to start automatically at boot and start it immediately <sup>{45}</sup>
  * `sudo systemctl disable sshd` (as root) : Disable sshd to no longer start at boot <sup>{45}</sup>
  * `sudo systemctl reenable sshd` (as root) : Reenable sshd (i.e. disable and enable anew) <sup>{45}</sup>

* SSH Server (Antix-OS without Systemd)
  * `ssh localhost` : Check if sshd(openssh) is running
  * `service ssh status` : Check ssh service is running
  * `service sshd start` : Start ssh service
  * `service sshd stop` : Stop ssh service
  * `service sshd restart` : Restart ssh service (For configuration reload)

* SSH-Copy-Id
  * `ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2222  <user-name>@<ip-address>` : Copy public key using different ssh port [NOTE: Never copy your private key to another machine.] <sup>{25}</sup>

* SSH agent forwarding
  * {44} [Using SSH agent forwarding](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/using-ssh-agent-forwarding)

# Contents of SSH

## Websites

* [openssh.com](https://www.openssh.com/)
* [SSH Tutorial](https://www.ssh.com/)
* [TimothyYe/skm: SSH keys manager](https://github.com/TimothyYe/skm)
* [PowerShell/openssh-portable](https://github.com/PowerShell/openssh-portable)

## Notes

* authorized_keys = public_key and identity key = private key
* The default identity key file name starts with id_<algorithm>
* [OpenSSH's limitation on the number of private keys](https://www.ssh.com/academy/ssh-keys)

# Install/Setup OpenSSH

## Windows-10 OpenSSH Client & Server

* {24} [Get started with OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui)

* Prerequisites
  
  * Open an elevated PowerShell session
  
  * Type `winver.exe` and check Windows 10 (build 1809) or above.
  
  * Run `$PSVersionTable.PSVersion`. Verify your major version is at least 5, and your minor version at least 1.
  
  * Output will show True when you're a member of the built-in Administrators group: `(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)`

* Graphical User Interface (GUI)
  
  * Open "Settings", select "Apps", then select "Optional Features".
  
  * Scan the list to see if the OpenSSH is already installed. If not, at the top of the page, select "Add a feature", then:
    
    * Find "OpenSSH Client", then select "Install"
    
    * Find "OpenSSH Server", then select "Install"
  
  * Open the "Services" desktop app. (Select "Start", type "services.msc" in the search box, and then select the "Service" app or press "ENTER".)
    
    * Alternatively, go from "Task Manager" -> "Services" Tab -> "Open Services" 
  
  * In the details pane, double-click "OpenSSH SSH Server".
  
  * On the "General" tab, from the "Startup type" drop-down menu, select "Automatic".
  
  * To start the service, select "Start".
  
  * Note: Installing OpenSSH Server will create and enable a firewall rule named "OpenSSH-Server-In-TCP". This allows inbound SSH traffic on port 22. If this rule is not enabled and this port is not open, connections will be refused or reset.

* PowerShell
  
  * To install OpenSSH using PowerShell, run PowerShell as an Administrator.
  
  * To make sure that OpenSSH is available, run the following cmdlet: `Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'`
  
  * Then, install the server or client components as needed:
```shell
# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```
  
  * Run the following commands to start the sshd service:
```shell
# Start the sshd service
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}
```

* Connect to OpenSSH Server
  
  * Once installed, you can connect to OpenSSH Server from a Windows or Windows Server device with the OpenSSH client installed. From a PowerShell prompt, run the following command: `ssh domain\username@servername`
  
  * Once connected, you get a message similar to the following output.
```shell
The authenticity of host 'servername (10.00.00.001)' can't be established.
ECDSA key fingerprint is SHA256:(<a large string>).
Are you sure you want to continue connecting (yes/no)?
```
  * Once connected, you'll see the Windows command shell prompt: `domain\username@SERVERNAME C:\Users\username>`

* Uninstall using GUI
  
  * Open "Settings", then go to "Apps" > "Apps & Features".
  
  * Go to "Optional Features".
  
  * In the list, select "OpenSSH Client" or "OpenSSH Server".
  
  * Select "Uninstall".

* Uninstall using PowerShell
  
  * To uninstall the OpenSSH components using PowerShell, use the following commands:
```shell
# Uninstall the OpenSSH Client
Remove-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Uninstall the OpenSSH Server
Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

* Uninstall Note
  
  * You may need to restart Windows afterwards if the service was in use at the time it was uninstalled.

* Guides
  * {30} [Install openSSH server on Windows 10](https://www.youtube.com/watch?v=0G1Qh-_jBTQ)
  * {31} [Windows 10 Native SSH Client Connect Without Password](https://www.youtube.com/watch?v=Z46YbczqbiE)

## Windows-X-Lite/Micro-10/Optimum-10

**Create Password for User**

* Windows-X-Lite creates "Admin" user without password, during installation.
  
  * (Must for OpenSSH) Create password for "Admin" user: Windows Start Menu -> Control Panel -> User Accounts -> Manage another account -> Select user "Admin" -> Create new password
  * Change account name: Windows Start Menu -> Control Panel -> User Accounts -> Select "Change your account name"

* Windows-X-Lite does not have "Settings" -> "Apps" -> "Optional Features" OR PowerShell's `Add-WindowsCapability`.

**Install OpenSSH**

* Instructions from [scoop.sh/#/apps?q=openssh => "openssh in main" field](https://scoop.sh/#/apps?q=openssh)
  
  * Windows 10 or higher includes this build of OpenSSH in the system itself, hence it is recommended to use the system OpenSSH there. Run 'sudo $dir\install-sshd.ps1' to install sshd and ssh-agent as a service. Run 'sudo $dir\uninstall-sshd.ps1' to uninstall the services.

* Open PowerShell in Administrator mode. Install OpenSSH using command `scoop install --global main/openssh` . Shows instructions when run this command:
  
  * Windows 10 or higher includes this build of OpenSSH in the system itself, hence it is recommended to use the system OpenSSH there.
  
  * Run 'sudo C:\ProgramData\scoop\apps\openssh\current\install-sshd.ps1' to install sshd and ssh-agent as a service.
  
  * Run 'sudo C:\ProgramData\scoop\apps\openssh\current\uninstall-sshd.ps1' to uninstall the services.

* NOTE: Windows-OS does have `sudo` command, instead open PowerShell as Administrator mode.
  
  * When run `C:\ProgramData\scoop\apps\openssh\current\install-sshd.ps1` command, shows message:
    * Updated Machine PATH to include OpenSSH directory, restart/re-login required to take effect globally.

  * To uninstall ssh service run `C:\ProgramData\scoop\apps\openssh\current\uninstall-sshd.ps1`

**Configure Windows Firewall**

* Allow connection through Windows Defender Firewall
  
  * Go to Control Panel -> Windows Defender Firewall -> Allow an app or feature through Windows Defender Firewall -> Allow another app -> Browse -> "C:\ProgramData\scoop\apps\openssh\current\sshd.exe" -> Open -> Tick "sshd.exe" in "Allowed apps and features" list, also tick "Private" and "Public" -> OK
  
  * Go to Control Panel -> Windows Defender Firewall -> Advanced settings -> Inbound Rules -> Enable 4 "sshd.exe" rules (First 2 are from profile: "Private" and "Public") (Next 2 are from profile: "Domain") (For every pair, one is for TCP and another is for UDP connection)

* If Windows Firewall's above technique does not work, then disable Windows Firewall completely
  
  * Go to Control Panel -> Windows Defender Firewall -> Turn Windows Defender Firewall on or off -> Tick "Turn off Windows Defender Firewall (not recommended)" for both "Private network settings" and "Public network settings"

**SSH Service Auto Start => [Get started with OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui) <sup>{24}</sup>**

* Graphical User Interface (GUI)

* Open the "Services" desktop app. (Select "Start", type "services.msc" in the search box, and then select the "Service" app or press "ENTER".)
  
  * Alternatively, go from "Task Manager" -> "Services" Tab -> "Open Services" 

* In the details pane, double-click "OpenSSH SSH Server".

* On the "General" tab, from the "Startup type" drop-down menu, select "Automatic".

* To start the service, select "Start".

* Note: Installing OpenSSH Server will create and enable a firewall rule named "OpenSSH-Server-In-TCP". This allows inbound SSH traffic on port 22. If this rule is not enabled and this port is not open, connections will be refused or reset.

## Termux (Android)

* Install Termux Android App from [F-Droid](https://f-droid.org/en/). In Google Play Store, Termux softwrae is old and does not work properly.

**[Termux SSH : Use Termux in Windows Using SSH Server](https://www.learntermux.tech/2020/10/Termux-SSH-Use-Termux-Windows.html) <sup>{26}</sup>**
  
* Install OpenSSH and Nmap in termux: `pkg install openssh nmap -y`
  
* Run the ssh server by typing command: `sshd`
  
* Get and copy your username: `whoami`
  
* Set up a password, paste your username: `passwd <user-name>`

* Find your local IP Address: `ifconfig wlan0`

* To see your ssh port number, enter command: `nmap localhost` [mostly it will be 8022]

* Open the command prompt on your computer, type the command to connect your termux: `ssh username@your-Ip-address -p portnumber`
  
* Type your password that you used while setup, type that password and Press Enter and you will be inside your Termux Terminal.

* How to resolve sshd: no hostkeys available -- exiting Error in Termux?
  
  * If you delete your termux data or maybe reinstall the new version of termux, you might see this issue popping up whenever you will try to execute the sshd command.
  
  * To solve, just type this and wait for 1 second: `ssh-keygen -A`
  
  * Run `sshd` command again and it will work fine

* How to Close the SSH server in Termux?
  
  * To close the ssh server you can always close or exit your termux and the ssh server will automatically be turned off.
  
  * If you don't wanna close your termux then you can kill the ssh process using command: `pkill ssh`

* Copy ssh public key, for password less authentication: `ssh-copy-id -i ~/.ssh/id_rsa.pub -p <port:8022> <user-name>@<ip-address>` [NOTE: Never copy your private key to another machine.] <sup>{25}</sup>

# Passwordless SSH Authentication

## From Linux to Linux/Android(sshd)

* Connect to remote host using SSH <sup>{25} {27} {28}</sup>
* {25} [How to Use the ssh-copy-id Command](https://linuxhint.com/use-ssh-copy-id-command/)
* {27} [How to SSH Without a Password (like a boss)](https://www.youtube.com/watch?v=j2vBT3T79Pg)
* {28} [Getting started with Ansible 02 - SSH Overview & Setup](https://www.youtube.com/watch?v=-Q4T9wLsvOQ)

* To generate an RSA key pair on your local computer, type: `ssh-keygen`

* Press ENTER to leave this blank if you do not want a passphrase.: `Enter passphrase (empty for no passphrase):`
  
  * ~/.ssh/id_rsa: The private key. DO NOT SHARE THIS FILE!
  
  * ~/.ssh/id_rsa.pub: The associated public key. This can be shared freely without consequence.
  
  * To change or remove the passphrase, simply type: `ssh-keygen -p`

* Copying your Public SSH Key to a Server with SSH-Copy-ID: `ssh-copy-id username@remote_host`
  
  * Previous command copies all public key (<name>.pub) to remote host, for specific public key use "-i" argument: `ssh-copy-id -i ~/.ssh/id_rsa.pub -p <port:22/8022> <user-name>@<ip-address>` <sup>{25}</sup>
  
  * After typing in the password, the contents of your ~/.ssh/id_rsa.pub key will be appended to the end of the user account’s ~/.ssh/authorized_keys file in remote host.

* You can now log in to that account without a password: `ssh username@remote_host`
  
## From Windows to Linux/Android(sshd)

* Enter into Git-Bash `bash` and execute commands from "## From Linux to Linux/Android(sshd)"

* After that, `ssh <user-name>@<ip-address>` works from both Bash and PowerShell.

## From Linux to Windows

* Execute commands from "## From Linux to Linux/Android(sshd)"

* {34} [Key-based authentication in OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement)
* {32} [Command to copy client public key to Windows OpenSSH SFTP/SSH server authorized keys file](https://superuser.com/questions/1451241/command-to-copy-client-public-key-to-windows-openssh-sftp-ssh-server-authorized)

* Note: ssh-copy-id script works only against *nix servers (or servers with *nix emulation), as it internally executes some "*nix" shell commands on the server (like `exec, sh, umask, rm, mkdir, tail, cat, etc`).

* Create the `.ssh` folder in your Windows account profile folder (typically in `C:\Users\username\.ssh`). Note that the location of the file for Administrators is overridden in the default `sshd_config` file to `%ALLUSERSPROFILE%\ssh\administrators_authorized_keys`.

* Create `authorized_keys` file in the folder and add your public key to it.

* Make sure that the ACL of the `.ssh` (or Administrator's `ssh`) folder and the `authorized_keys` are set so that only a respective Windows account have a write access to the folder and the file and the account that runs the server have a read access.

* If you want to do that from your local machine, you can do it using `sftp`.
  
  * Go to ".ssh" folder on Host PC: `cd ~/.ssh`
  
  * `sftp martin@example.com`
  
  * `mkdir .ssh`
  
  * `cd .ssh`
  
  * `put id_rsa.pub authorized_keys` ["id_rsa.pub" file is at current(pwd) folder in Host PC]
  
  * `bye`

* The above is basically, what `ssh-copy-id` does internally – Except that `ssh-copy-id` appends the `authorized_keys`, what plain `sftp` cannot do. If you need to append, you can download `authorized_keys` to the local machine, append it locally and re-upload it back.

* {33} [Windows SSH server refuses key based authentication from client](https://superuser.com/questions/1445976/windows-ssh-server-refuses-key-based-authentication-from-client)

* As of Windows 10 v1809, the default config (found in `%ProgramData%/ssh/sshd_config`) defines a separate `AuthorizedKeysFile` for administrator users:
```shell
Match Group administrators
       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
```

* This means any user who is in the special Windows `Administrators` group (SID `S-1-5-32-544`) will not look at the `%UserProfile%/.ssh/authorized_keys` file but will rather look at `%ProgramData%/ssh/administrators_authorized_keys`.

* You have a few options:
  
  * Use a non-administrator user, or
  
  * Comment out those two lines from the bottom of `sshd_config`, which will then revert back to the default per-user `AuthorizedKeysFile`, or
  
  * Add your keys to the (global!) `administrators_authorized_keys` file

# Log/Debug

## Windows SSHD Log

**[Starting OpenSSH server in Windows with debug messages enabled (-d)](https://superuser.com/questions/1635361/starting-openssh-server-in-windows-with-debug-messages-enabled-d) <sup>{35}</sup>**


* The Windows OpenSSH server logs to the event log by default. You should look in the Event Log Viewer under Applications and Services Logs -> OpenSSH. The Admin log shows errors, the Operational log shows Informational messages.

* The OpenSSH logging is controlled by your `C:\ProgramData\ssh\sshd_config` file. The entry `SyslogFacility` determines the log location.

* I got the answer from here: [Logging Facilities - Win32-OpenSSH](https://github.com/PowerShell/Win32-OpenSSH/wiki/Logging-Facilities).

* The event log may miss some extra lines that would otherwise be shown in a log file (e.g. the reason why authorized_keys is ignored). To see them, edit `C:\ProgramData\ssh\sshd_config` (e.g. with notepad.exe run as an administrator), then set:
```shell
SyslogFacility LOCAL0
LogLevel Debug3
```

* Restart the OpenSSH SSH Server service and expect logs to appear in `C:\ProgramData\ssh\logs\sshd.log`

* Above commands show logs in "C:\ProgramData\ssh\logs\sshd.log":
  
  * This problem arises, when SSH user is Administrator. "~/.ssh/authorized_keys" only works for Standard/Non-Administrator user.
  
  * Bad permissions. Try removing permissions for user: S-1-1-11 on file C:/ProgramData/ssh/administrators_authorized_keys
  
  * Solution:
  
  * Right click on `C:/ProgramData/ssh/administrators_authorized_keys`
  
  * Properties -> Security -> Advanced -> "Disable inheritance" -> "OK"
  
  * Properties -> Security -> To change permissions, click Edit -> Remove "Authenticated Users"
  
  * Only keep "SYSTEM" and "Administrators"

# Error and Solution

## OpenSSH Install/Config

### Windows-10/Windows-X-Lite

* [Error 1067- on start OpenSSH by net start opensshd in windows cmd](https://stackoverflow.com/questions/39319140/error-1067-on-start-openssh-by-net-start-opensshd-in-windows-cmd)

# References

* next-sl: {46}

## Tutorials

* [ssh.com](https://www.ssh.com/) Commands
  * {1} [What is SSH (Secure Shell)?](https://www.ssh.com/academy/ssh)
  * {2} [SSH Command - Usage, Options, Configuration](https://www.ssh.com/academy/ssh/command)
  * {3} [How to Use ssh-keygen to Generate a New SSH Key?](https://www.ssh.com/academy/ssh/keygen)
  * {4} [SSH Copy ID for Copying SSH Keys to Servers](https://www.ssh.com/academy/ssh/copy-id)
  * {5} [ssh-agent: How to configure ssh-agent, agent forwarding, & agent protocol](https://www.ssh.com/academy/ssh/agent)
  * {6} [SSH Keys for SSO: Usage, ssh-add Command, ssh-agent](https://www.ssh.com/academy/ssh/add-command)
  * {7} [scp - Secure File Copy](https://www.ssh.com/academy/ssh/scp)
  * {8} [SSH File Transfer Protocol (SFTP): Get SFTP client & server](https://www.ssh.com/academy/ssh/sftp-ssh-file-transfer-protocol)
  * {9} [sshd – SSH server process](https://www.ssh.com/academy/ssh/sshd)

* [ssh.com](https://www.ssh.com/) Config
  * {10} [What is an SSH Client?](https://www.ssh.com/academy/ssh/client)
  * {11} [SSH config file for OpenSSH client](https://www.ssh.com/academy/ssh/config)
  * {12} [sshd_config - How to Configure the OpenSSH Server?](https://www.ssh.com/academy/ssh/sshd_config)

* [ssh.com](https://www.ssh.com/) Concepts
  * {13} [Basic overview of SSH Keys](https://www.ssh.com/academy/ssh-keys)
  * {14} [What are SSH Host Keys?](https://www.ssh.com/academy/ssh/host-key)
  * {15} [SSH Host Key Management Demystified](https://www.ssh.com/blog/what-are-ssh-host-keys)
  * {16} [Identity Key in SSH](https://www.ssh.com/academy/ssh/identity-key)
  * {17} [Authorized Key in SSH](https://www.ssh.com/academy/ssh/authorized-key)
  * {18} [Session Key](https://www.ssh.com/academy/ssh/session-key)
  * {19} [What is Passphrase & How to Use It?](https://www.ssh.com/academy/ssh/passphrase)
  * {20} [What is SSH Public Key Authentication?](https://www.ssh.com/academy/ssh/public-key-authentication)
  * {21} [Authorized Keys File in SSH](https://www.ssh.com/academy/ssh/authorized-keys-file)
  * {22} [SSH Tunneling](https://www.ssh.com/academy/ssh/tunneling)
  * {23} [SSH Tunneling: Examples, Command, Server Config](https://www.ssh.com/academy/ssh/tunneling-example)

* {24} [Get started with OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui)

* SSH-Copy-Id
  * {25} [How to Use the ssh-copy-id Command](https://linuxhint.com/use-ssh-copy-id-command/)
  * {34} [Key-based authentication in OpenSSH for Windows](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement)
  * {32} [Command to copy client public key to Windows OpenSSH SFTP/SSH server authorized keys file](https://superuser.com/questions/1451241/command-to-copy-client-public-key-to-windows-openssh-sftp-ssh-server-authorized)
  * {33} [Windows SSH server refuses key based authentication from client](https://superuser.com/questions/1445976/windows-ssh-server-refuses-key-based-authentication-from-client)

* SSH agent forwarding
  * {44} [Using SSH agent forwarding](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/using-ssh-agent-forwarding)

* Termux
  * {26} [Termux SSH : Use Termux in Windows Using SSH Server](https://www.learntermux.tech/2020/10/Termux-SSH-Use-Termux-Windows.html)
  * {43} [Mount an Android phone on Linux/Unix with sshfs](https://www.miskatonic.org/2019/07/05/sshfs-phone/)

* Log/Debug

  * Windows
    * {35} [Starting OpenSSH server in Windows with debug messages enabled (-d)](https://superuser.com/questions/1635361/starting-openssh-server-in-windows-with-debug-messages-enabled-d)
    * {36} [What Is SID (Security Identifier) and How to Find It on Windows](https://www.minitool.com/lib/sid.html)

* SSHFS
  * {39} [SSHFS: How to Mount Remote File Systems Over SSH](https://phoenixnap.com/kb/sshfs)
  * {40} [How do I specify SSH options for SSHFS?](https://askubuntu.com/questions/975818/how-do-i-specify-ssh-options-for-sshfs)
  * {41} [SSHFS-Win · SSHFS for Windows](https://github.com/winfsp/sshfs-win/blob/master/README.md)
  * {38} [System error 67 when attempting to mount #155](https://github.com/winfsp/sshfs-win/issues/155)

* SystemD
  * {45} [systemd => Archlinux Wiki](https://wiki.archlinux.org/title/Systemd)

## Guides

## YouTube Tutorial

* SSH without Password
  * {27} [How to SSH Without a Password (like a boss)](https://www.youtube.com/watch?v=j2vBT3T79Pg)
  * {28} [Getting started with Ansible 02 - SSH Overview & Setup](https://www.youtube.com/watch?v=-Q4T9wLsvOQ)
  * {29} [Windows 10 Native SSH Client Connect Without Password](https://www.youtube.com/watch?v=Z46YbczqbiE)
  * {30} [Install openSSH server on Windows 10](https://www.youtube.com/watch?v=0G1Qh-_jBTQ)
  * {31} [Windows 10 Native SSH Client Connect Without Password](https://www.youtube.com/watch?v=Z46YbczqbiE)

* SSHFS
  * {37} [Mounting Remote Filesystems With SSHFS](https://www.youtube.com/watch?v=-0jyrvMl0Ic)
  * {42} [WinFsp and SshFS - Connecting to a remote server over SFTP in Windows 10](https://www.youtube.com/watch?v=JUDUkfEH6TA)
