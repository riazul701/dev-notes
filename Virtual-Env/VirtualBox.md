# VirtualBox.md

## Websites
* [Linux VM Images](https://www.linuxvmimages.com/)
* [OSBoxes](https://www.osboxes.org/)

## Notes

* In machine settings, use "Bridge" adapter to get IP from WiFi router. This is dynamic IP.

* Sometimes, turn on and off `Scaled Mode`, by pressing `Host+C`, makes guest operating system to full screen. `Host` key is `Right-Ctrl` on keyboard.

# UEFI Boot

## UEFI Boot Menu

* {9} [F12 boot device selection does not work after manually selecting boot order in EFI](https://forums.virtualbox.org/viewtopic.php?t=103602)
  * Install a guest linux vm, set EFI option on in settings.
  * The `F12` key is only used in the legacy BIOS, use the `ESC` key for the (U)EFI BIOS.

## UEFI Mode

* {4} [How to Enable EFI on VirtualBox Virtual Machines Running Linux](https://www.makeuseof.com/set-up-efi-linux-virtual-machine-virtualbox/)
  * To use GPT partition table in UEFI mode, follow:
  * Select Virtual-Machine -> System -> Motherboard
  * Turn On "Enable EFI (special OSes only)"
  * Start virtual-machine, if terminal is displayed, then enter command "exit" to get options. 

* If operating system failed to boot, then
  * Turn Off "Enable I/O APIC"
  * Turn Off "Enable Hardware Clock in UTC Time"
  * Turn Off "Enable Secure Boot"

# Boot From Media

## Boot From USB (Linux-VirtualBox)

* {1} [How To Boot From USB Drive In Virtualbox In Linux](https://ostechnix.com/how-to-boot-from-usb-drive-in-virtualbox-in-linux/)
  * Command to find USB drive details: `sudo fdisk -l` [USB drive name is /dev/sdc]
  * Commands to create a vmdk file: `sudo vboxmanage internalcommands createrawvmdk -filename  ~/usb.vmdk -rawdisk /dev/sdc`
  * In some Linux distros, the vboxmanage command is case-sensitive: `sudo VBoxManage internalcommands createrawvmdk -filename  ~/usb.vmdk -rawdisk /dev/sdc`
  * Shows an output like below: RAW host disk access VMDK file /home/<user-name>/usb.vmdk created successfully.
  * Set proper permission to the newly created vmdk file: `sudo chown $USER:$USER ~/usb.vmdk`
  * Add your user to "vboxusers" and "disk" groups using the following commands:
    * `sudo usermod -a -G vboxusers <user-name>`
    * `sudo usermod -a -G disk <user-name>`
    * Please be mindful that adding a user to "disk" group is dangerous and security risk.
  * Now remove the USB drive and reboot your system to take effect the changes. If you don't remove your USB, the name of your drive letter may change at next boot. So it is important to remove the USB first and reboot the system.
  * Open Oracle Virtualbox application and create a new virtual machine:
    * Enter the name of the VM, OS type and version and click Next to continue.
    * Enter RAM size.
    * This is an important step. Choose "Use an existing virtual hard disk file" option and click the browse button (UP arrow button).
    * Click "Add" button to choose the newly created vmdk file.
    * Choose the newly created vmdk file from your local drive.
    * You will now see the vmdk file is selected as the virtual hard disk for the new virtual mahine.

## Boot From USB (Windows-VirtualBox)

* {3} [How to Make VirtualBox Boot from USB? (Windows-OS)](https://www.partitionwizard.com/partitionmanager/virtualbox-boot-from-usb.html)

# Configuration

## Enable nested vtx/amd-v

* Select Virtual-Machine -> Settings -> System -> Processor -> "Enable Nested VT-x/AMD-V" is required for Windows Subsystem for Linux inside Windows-10
* If this can not be enabled from GUI, then follow instructions below:
* {5} [Virtualbox enable nested vtx/amd-v greyed out](https://stackoverflow.com/questions/54251855/virtualbox-enable-nested-vtx-amd-v-greyed-out)
  * Execute this: `VBoxManage modifyvm <VirtualMachineName> --nested-hw-virt on`
* Select Virtual-Machine -> Settings -> System -> Acceleration -> Paravirtualization Interface: None <sup>{6}</sup>
  * Otherwise Windows-10 will not start, when enable "Hyper-V" from Control Panel -> Program and Features -> Turn Windows features on or off
}

## Mount

* {7} [Virtualbox shared folder permissions [closed]](https://stackoverflow.com/questions/26740113/virtualbox-shared-folder-permissions)
  * Add yourself to the "vboxsf" group within the guest VM: `sudo adduser $USER vboxsf`
  * To take effect you should log out and then log in, or you may need to reboot.
  
# Error and Solution

## virtualbox UUID already exists

* {8} [VirtualBox Cannot register the hard disk already exists](https://stackoverflow.com/questions/44114854/virtualbox-cannot-register-the-hard-disk-already-exists)

* Error Message:
  * virtualbox uuid already exists

* Solution:
  * File -> Virtual Media Manager -> Removed existing images (note, I removed them only from the registry).
  * I followed these steps.
  * [http://www.webdesignblog.asia/software/virtualbox-moving-vdi-file-re-linking-guest/#sthash.1QOHeiw5.dpbs](http://www.webdesignblog.asia/software/virtualbox-moving-vdi-file-re-linking-guest/#sthash.1QOHeiw5.dpbs)
  * After that I could update the path in the VM settings.

# References

* Next Serial: {11}

* Tutorial
  
* Guides
  * {1} [How To Boot From USB Drive In Virtualbox In Linux](https://ostechnix.com/how-to-boot-from-usb-drive-in-virtualbox-in-linux/)
  * {2} [How To Create An ISO From A Bootable USB Drive In Linux](https://ostechnix.com/create-iso-bootable-usb-drive-linux/)
  * {3} [How to Make VirtualBox Boot from USB? (Windows-OS)](https://www.partitionwizard.com/partitionmanager/virtualbox-boot-from-usb.html)
  * {9} [F12 boot device selection does not work after manually selecting boot order in EFI](https://forums.virtualbox.org/viewtopic.php?t=103602)
  * {10} [http://www.webdesignblog.asia/software/virtualbox-moving-vdi-file-re-linking-guest/#sthash.1QOHeiw5.dpbs](http://www.webdesignblog.asia/software/virtualbox-moving-vdi-file-re-linking-guest/#sthash.1QOHeiw5.dpbs)

* Configuration
  * {4} [How to Enable EFI on VirtualBox Virtual Machines Running Linux](https://www.makeuseof.com/set-up-efi-linux-virtual-machine-virtualbox/)
  * {5} [Virtualbox enable nested vtx/amd-v greyed out](https://stackoverflow.com/questions/54251855/virtualbox-enable-nested-vtx-amd-v-greyed-out)
  * {6} [VM launch fail on Windows 10 when WSL2 and Docker is enabled](https://www.virtualbox.org/ticket/20357)
  * {7} [Virtualbox shared folder permissions [closed]](https://stackoverflow.com/questions/26740113/virtualbox-shared-folder-permissions)

* Error and Solution
  * {8} [VirtualBox Cannot register the hard disk already exists](https://stackoverflow.com/questions/44114854/virtualbox-cannot-register-the-hard-disk-already-exists)
