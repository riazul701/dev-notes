# (Recommended) VirtualBox Fedora Installation

**[VirtualBox 7.1 on Fedora 41/40/39: A Full Installation Guide](https://linuxiac.com/how-to-install-virtualbox-on-fedora-linux/)**

* `sudo dnf install VirtualBox-7.1` command shows output
```
Scriptlet output:

Creating group 'vboxusers'. VM users must be member of that group!                                                                                                                                 

This system is currently not set up to build kernel modules.                                                                       
Please install the Linux kernel "header" files matching the current kernel for adding new hardware support to the system.                                                                                     
This system is currently not set up to build kernel modules.                                                                       
Please install the Linux kernel "header" files matching the current kernel for adding new hardware support to the system.                                                                                     
                                                                                                                                  
There were problems setting up VirtualBox.  To re-start the set-up process, run                                                    
/sbin/vboxconfig                                                                                                                 
as root.
If your system is using EFI Secure Boot you may need to sign the kernel modules (vboxdrv, vboxnetflt, vboxnetadp, vboxpci) 
before you can load them. Please see your Linux system's documentation for more information.
```

* `vboxmanage -v | cut -dr -f1` command shows output
```
WARNING: The vboxd available for load. Please
  sudo /sbin/vboxconfig
You will not be able to start
7.1.10
```

* `sudo /sbin/vboxconfig` command shows error
```
vboxdrv.sh: Stopping VirtualBox services.
vboxdrv.sh: Starting VirtualBox services.
vboxdrv.sh: Building VirtualBox kernel modules.
This system is currently not set up to build kernel modules.
Please install the Linux kernel "header" files matching the current kernel
for adding new hardware support to the system.
This system is currently not set up to build kernel modules.
Please install the Linux kernel "header" files matching the current kernel
for adding new hardware support to the system.

There were problems setting up VirtualBox.  To re-start the set-up process, run
  /sbin/vboxconfig
as root.  If your system is using EFI Secure Boot you may need to sign the
kernel modules (vboxdrv, vboxnetflt, vboxnetadp, vboxpci) before you can load
them. Please see your Linux system's documentation for more information.
```

* Install Linux Header: `sudo dnf install kernel-devel-$(uname -r)` [Solution of `sudo /sbin/vboxconfig` command error] <sup>{3}</sup>

* `sudo /sbin/vboxconfig` : Stopping VirtualBox services, Starting VirtualBox services, Building VirtualBox kernel modules.

* `wget https://download.virtualbox.org/virtualbox/7.1.10/Oracle_VirtualBox_Extension_Pack-7.1.10.vbox-extpack` [Get virtualbox version "7.1.10", from `vboxmanage -v | cut -dr -f1` command]

* `sudo vboxmanage extpack install Oracle_VirtualBox_Extension_Pack-7.1.10.vbox-extpack` [Get virtualbox version "7.1.10", from `vboxmanage -v | cut -dr -f1` command]

* `vboxmanage list extpacks` : Verify installed VirtualBox’s extension pack version

* `sudo usermod -a -G vboxusers $USER` : Before using VirtualBox, add your user account to the “vboxusers” group. This is quick and simple to accomplish by running

* Now, perform a reboot.

* `groups $USER` : After login, check that you are in the “vboxusers” group with this command

**Error: VirtualBox can't operate in VMX root mode. Please disable the KVM kernel extension, recompile your kernel and reboot**

* [VirtualBox can't operate in VMX root mode. Please disable the KVM kernel extension, recompile your kernel and reboot => AI Overview](https://www.google.com/search?q=VirtualBox+can%27t+operate+in+VMX+root+mode.+Please+disable+the+KVM+kernel+extension%2C+recompile+your+kernel+and+reboot)

The "VirtualBox can't operate in VMX root mode" error typically arises when the Kernel-based Virtual Machine (KVM) is active and interfering with VirtualBox's access to hardware virtualization features. To resolve this, you need to disable the KVM kernel extension, recompile your kernel, and then reboot your system.
 
Here's a breakdown of the steps:

* 1. Identify and Disable KVM:
  * Check for active KVM modules: Run `lsmod | grep kvm` to see which KVM modules are loaded.
  * Unload KVM modules: Use `sudo modprobe -r kvm_intel` (or `sudo modprobe -r kvm_amd` depending on your CPU) and `sudo modprobe -r kvm` to unload the modules. You might need to run these commands multiple times if multiple KVM modules are loaded.
  * Blacklist KVM: To prevent KVM from loading on subsequent boots, create a blacklist file: `sudo nano /etc/modprobe.d/blacklist-kvm.conf` and add the lines `blacklist kvm`, `blacklist kvm_intel`, and `blacklist kvm_amd`. Save the file and exit nano.
  * Update initramfs: After blacklisting, update the initramfs: `sudo update-initramfs -u`. [Not for Fedora]
  * Reboot: Restart your computer to apply the changes.

* [Fedora Equivalent for "update-initramfs" command](https://www.reddit.com/r/linux4noobs/comments/rrt6pw/fedora_equivalent_for_updateinitramfs_command/)
  * `sudo dracut --regenerate-all --force` : Fedora uses dracut to generate an initramfs [Will take some time]

# (Not Recommended) VirtualBox Fedora Installation

* From [Download VirtualBox for Linux Hosts](https://www.virtualbox.org/wiki/Linux_Downloads), download VirtualBox [Fedora 40 / 41](https://download.virtualbox.org/virtualbox/7.1.10/VirtualBox-7.1-7.1.10_169112_fedora40-1.x86_64.rpm)

* Install pre-required packages: `sudo dnf install gcc make perl`

* Install virtualbox rpm file: `sudo rpm -ivh VirtualBox-7.1-7.1.10_169112_fedora40-1.x86_64.rpm`

* Add current user to `vboxuser` group (for enabling host usb devices): `sudo usermod -aG vboxusers $USER` <sup>{1} {2}</sup>

* Install Linux Header: `sudo dnf install kernel-devel-$(uname -r)` <sup>{3}</sup>

* Build virtualbox services: `/sbin/vboxconfig`

# References

* {1} [Virtualbox Ubuntu Add User to vboxusers | How-to](https://bobcares.com/blog/virtualbox-ubuntu-add-user-to-vboxusers/)
* {2} [How to add users to vboxusers to enable USB usage](https://askubuntu.com/questions/377778/how-to-add-users-to-vboxusers-to-enable-usb-usage)
* {3} [virtualbox please install the Linux kernel "header" files matching the current kernel => AI Overview](https://www.google.com/search?q=virtualbox+please+install+the+Linux+kernel+%22header%22+files+matching+the+current+kernel%0D%0Afor+adding+new+hardware+support+to+the+system)
