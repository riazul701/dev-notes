# Repair-GRUB.md

# GRUB Repair

## [Grub Rescue | Repairing your Bootloader => Legacy BIOS](https://christitus.com/grub-rescue/) <sup>{1} {16}</sup>

* Lets go over Grub Rescue and repairing your bootloader. This is a very misunderstood topic and by learn basic syntax you will be able to repair your GRUB very easily. Here are 4 methods of doing a GRUB Rescue.

**Repairing from a GRUB > Prompt**

* `ls` : Find your Hard drive
  * Output Example: (hd0) (hd0,msdos2) (hd0,msdos1)

* `ls (hd0,msdos2)/` : List Root partition on each drive til you find your Install
  * Check for the directory listing, if nothing, move to next

* Now that we have found the proper drive lets boot to it
```
grub> set root=(hd0,msdos2)

grub> linux /boot/vmlinu (tab complete) root=/dev/sda1 (or the root linux partition)

grub> initrd /boot/initrd (tab complete)

grub> boot
```

**Repairing from a GRUB Rescue > Prompt**

* `ls` : Find your Hard drive
  * Output Example: (hd0) (hd0,msdos2) (hd0,msdos1)

* `ls (hd0,msdos2)/` : List Root partition on each drive til you find your Install
  * Check for the directory listing, if nothing, move to next

* Now that we have found the proper drive lets boot to it
```
grub rescue> set prefix=(hd0,msdos2)/boot/grub

grub rescue> set root=(hd0,msdos2)

grub rescue> insmod normal

grub rescue> normal

grub rescue> insmod linux

grub rescue> linux /boot/vmlinu (tab complete) root=/dev/sda1 (or the root linux partition)

grub rescue> initrd /boot/initrd (tab complete)

grub rescue> boot
```

**Fix GRUB Permanently**

* Now that we are booted in from GRUB Rescue, we can begin work with repairing our grub permanently. First we rebuild the /boot/grub/grub.cfg file:

* `update-grub` : Debian-based Distributions use 

* `grub-mkconfig -o /boot/grub/grub.cfg` : Other Distributions use 

* `grub-install /dev/sda` : With the Configuration rebuilt, we now simply need to reinstall grub

* Note: `/dev/sda is` the DEVICE…NOT THE PARTITION.

**Other Methods of Repairing GRUB**

* Use the [https://www.supergrubdisk.org/ image on a USB drive to repair][1]

* Use a vanilla server distribution pen drive to boot to prompt, then chroot to your existing install and reinstall GRUB.

# Linux & Windows Dual Boot GRUB-Rapair

## [How to install or update Grub after Windows installation](https://askubuntu.com/questions/1483941/how-to-install-or-update-grub-after-windows-installation) <sup>{9}</sup>

* Are both UEFI or both (old) BIOS/CSM/legacy? Can you boot either one from UEFI/BIOS boot menu? Did you run sudo update-grub ? Is Windows fast startup or hibernation off? Otherwise grub's os-prober cannot see the Windows install. If new Windows is bitlocker off?

* 1- Disable fast startup (hibernation) in windows

* 2- After installing Windows, go to your motherboard firmware and put Ubuntu first and save the settings.

* 3-
```
sudo os-prober

sudo update-grub
```

## [Restoring GRUB After Installing Windows](https://www.cybrary.it/blog/restoring-grub-installing-windows) <sup>{7}</sup>

* GRUB stands for GRand Unified Bootloader and is a default bootloader used in Linux distributions. It is responsible for packing itself at boot time from BIOS and loading the Linux kernel into the memory. It then transfers the control to the operating system kernel.

* Today we will share three ways to restore the GRUB bootloader after losing it while dual-booting Windows with Linux. This problem is that Windows doesn't recognize neighboring systems, and it's a common problem. So here are the methods:
  * A live CD or live USB
  * EasyBCD
  * Boot-repair

**1st METHOD: By using a live CD or live USB**

* We start by burning the distribution on CD or Flash storage(USB).

* Now boot it in test (try without install).

* Open a terminal and type in this command to see the Disk: `sudo fdisk -l`
  * We will see the installed Linux partitions. Often we'll find it next to "EXT."

* Replace "sda3" with what is appropriate with the condition on the system: `sudo mount /dev/sda3 /mnt`

* Then type in this command to do mount: `sudo mount --bind /dev /mnt/dev`

* Now run: `sudo chroot /mnt`

* Write This command to install GRUB: `grub-install /dev/sda`

* Finally, update GRUB: `sudo update-grub`

* GRUB has been installed successfully.

**2nd METHOD: By Using EasyBCD on Windows**

* Download it from this link. [EasyBCD](https://neosmart.net/EasyBCD/)

* Run the program and go for these steps:
  * a. Add new entry Linux/BSD
  * b. From Type choose Linux(GRUB) or (GRUB 2)
  * c. Think of a suitable name for the system.
  * d. Select the partition where Linux is installed
  * e. Lastly, click on "Add Entry."

* And this program has many features like using the METRO screen or choosing the time for booting, etc. But our problem here is solved. So let's move on to the last method.

**3rd METHOD: By using Boot-Repair**

* This is the easiest way to repair your boot screen.

* For windows, one has to download the program and run it.

* For Linux open terminal. Run the following commands:
```
sudo add-apt-repository ppa:yannubuntu/boot-repair sudo apt-get update sudo apt-get install boot-repair

boot-repair
```
* Now from the screen, take "recommended repair." Problem solved.

# References

* next-sl: {17}

## Tutorials

* Get Instructions From
  * {7} [Restoring GRUB After Installing Windows](https://www.cybrary.it/blog/restoring-grub-installing-windows)
  * {9} [How to install or update Grub after Windows installation](https://askubuntu.com/questions/1483941/how-to-install-or-update-grub-after-windows-installation)

## YouTube Tutorials

* {1} [GRUB Rescue | Repairing GRUB BY Chris Titus Tech](https://www.youtube.com/watch?v=r7meKJsjqfY)

* {16} [Bootloader Themes | Install & Configuration BY Chris Titus Tech](https://www.youtube.com/watch?v=BAyzHP1Cqb0)
