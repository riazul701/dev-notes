# Server/HestiaCP-Ubuntu.md

# Vagrant-Ubuntu-HestiaCP Installation

## Vagrant Installation

### Antix-OS Vagrant Error
* The provider 'virtualbox' that was requested to back the machine
'default' is reporting that it isn't usable on this system. The
reason is shown below:

Vagrant could not detect VirtualBox! Make sure VirtualBox is properly installed.
Vagrant uses the `VBoxManage` binary that ships with VirtualBox, and requires
this to be available on the PATH. If VirtualBox is installed, please find the
`VBoxManage` binary and add it to the PATH environmental variable.

### Vagrant and VirtualBox On Antix-OS
* Install latest VirtualBox
  * [VirtualBox Download](https://download.virtualbox.org/virtualbox/7.0.6/virtualbox-7.0_7.0.6-155176~Debian~bullseye_amd64.deb)
  * Open GDebi: `sudo gdebi-gtk`
  * Shows error: Conflicts with "virtualbox-guest-additions-iso"
  * sudo apt remove virtualbox-guest-additions-iso

* Install Vagrant latest version
  * wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
  * echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  * sudo apt update && sudo apt install vagrant

* Error: The private key to connect to the machine via SSH must be owned by the user running Vagrant. This is a strict requirement from SSH itself. Please fix the following key to be owned by the user running Vagrant:
.vagrant/machines/default/virtualbox/private_key
  * [Private key to connect to the machine via SSH must be owned by the user running Vagrant](https://stackoverflow.com/questions/35964050/private-key-to-connect-to-the-machine-via-ssh-must-be-owned-by-the-user-running)
  * Use vagrant from Linux path, not from NTFS partition.
  