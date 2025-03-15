# Commands/Usage

* `sudo apt-get install grub2` : Install the GRUB 2 package. Watch the terminal. You will soon have to answer a few prompts. <sup>{11}</sup>

* `grub-install <target>` : GRUB 2 can be installed even while you are booted in the OS. You do not need a live environment for that. Just execute the `grub-install` command against the device or the partition you desire. <sup>{11}</sup>
  * `<target>` can be `/dev/hda`, `/dev/sdb`, `/dev/sdc4`, and so forth. <sup>{11}</sup>

* `update-grub` : Command reads the `/etc/grub.d` directory and looks for executable scripts inside it. The scripts are read, in the order of their numbering, and written into the `grub.cfg` file, along with the menu settings read from the `/etc/default/grub` file. <sup>{11}</sup>

* `grub2-mkconfig -o /boot/efi/EFI/<os>/grub.cfg` : If you need to update the configuration file, and you want to do it explicitly, without using the GRUB update command, you will need to specify the correct file as the output. <sup>{11}</sup>
  * For instance, you may get `/boot/efi/EFI/centos/grub.cfg` <sup>{11}</sup>

* `grub2-mkconfig -o /boot/grub2/grub.cfg` : This will recreate the `grub.cfg` file based on your scripts under `/etc/grub.d`. <sup>{11}</sup>

* `sudo upgrade-from-grub-legacy` : Boot both Ubuntu and Windows 7 to make sure everything works properly. Once you're satisfied, boot into Ubuntu and complete the migration process. You can now write GRUB 2 into MBR and make it the default bootloader. <sup>{11}</sup>

* `sudo apt-get install efibootmgr` <sup>{13}</sup>

# GRUB.md

## Notes

* GRUB should be installed on device, not partition <sup>{1}</sup>

* Is Windows fast startup or hibernation off? Otherwise grub's os-prober cannot see the Windows install. If new Windows is bitlocker off? <sup>{9}</sup>

* Remember that you should always install Windows first, on the first hard disk, on the first partition (the rule of three first). <sup>{8}</sup>
  * Nevertheless, even if you have Windows installed on a separate disk, you can solve the problem by swapping. You need to perform a virtual swap between hard disks. Like this:
  ```
  map (hd0) (hd1)
  map (hd1) (hd0)
  ```

## PATH

* `/etc/default/grub` - the file containing GRUB 2 menu settings. <sup>{11}</sup>
* `/etc/grub.d/` - the directory containing GRUB 2 menu creating scripts. <sup>{11}</sup>
* `/boot/grub/grub.cfg` - the GRUB 2 configuration file, not editable. <sup>{11}</sup>

* Legacy (old) GRUB
  * `/boot/grub/menu.lst` : Legacy GRUB menu is located on the root partition under this. <sup>{8}</sup>

# GRUB Customizer

* [Grub Customizer](https://launchpad.net/grub-customizer) <sup>{3} {4}</sup>

* `apt show grub-customizer` <sup>{3}</sup>

# OS Prober

* `apt show os-prober` <sup>{4}</sup>

## Add windows boot manager to linux boot manager

**Add windows boot manager to linux boot manager, or refresh if previously added. <sup>{10} {11}</sup>**

* [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE) <sup>{10}</sup>
  * SparkyLinux does not detect Windows-OS on "GRUB" boot loader
  * On SparkyLinux open Terminal and type: `sudo nano /etc/default/grub`
    * To edit graphically, enter command `sudo pcmanfm`, and edit file `/etc/default/grub`
  * Uncomment line `#GRUB_DISABLE_OS_PROBER=false` [Remove `#` at first character] -> Save File
  * Reload GRUB: `sudo update-grub`
  * Restart PC and check "Windows Boot Manager"

# GRUB Repair

## [Grub Rescue | Repairing your Bootloader](https://christitus.com/grub-rescue/) <sup>{1} {16}</sup>

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

# GRUB Configuration

## Remove memtest from the menu <sup>{11}</sup>

* Go to `/etc/grub.d/` directory. This directory containing GRUB 2 menu creating scripts.

* If you do not want to have the memtest entries included, simply chmod -x the 20_memtest script. It will no longer be executable and won't be read into the `grub.cfg` file the next time you update GRUB.
```
sudo chmod -x 20_memtest86+
```

## Change theme (boot image) <sup>{11}</sup>

* You may want to use a beautiful image during boot rather than the boring blue one. No worries, this can be easily done, by editing the `05_debian_theme` script.

* The first thing is to find a number of images you want. Pay attention to image detail, as you want to achieve the right contrast between the entries and the background, so you can still read the menu. I will show you my own example - learn from it.

* Next, you need a directory to store the images. By default, GRUB 2 takes images from `/usr/share/images/desktop-base`. This can be a good location - or if you want your own, create one. For instance, `/usr/share/images/grub`, just as shown on [Ubuntu blog](http://www.ubuntu-inside.me/2009/06/howto-change-grub2-grub-pc-splash-image.html).

* Copy your images there, mind the extension. By default, GRUB 2 works with `.png` and `.tga` files. You can also use `.jpg` images if you want. The next step is to edit the `05_debian_theme` script and change the relevant entry to point to your own:

* What I did was comment out the original for loop that reads the image(s) and created my own. If you're not really comfortable doing this, then you should probably postpone any theme tweaking until a later date. My file is located: `/usr/share/images/grub/dark.png`. Once the file has been changed, run update-grub to update the grub.cfg file. If you've done everything correctly, you should see Found Debian background message in the terminal.

* Please note that the GRUB menu will not use background images unless these are enabled. To do that, you will have to change the line `use_bg=false` in theme script and change it to `use_bg=true`. Reboot and test:

* As you can see, my choice of background image was bad! You cannot see the text! Therefore, choose carefully what kind of background image you want to use. A theme with a few soft gradients seems like the best idea. For more details, take a look at the official Wiki documentation.

# References

* next-sl: {18}

## Websites

* {12} [supergrubdisk.org](https://www.supergrubdisk.org/) <sup>{1}</sup>

* {3} [Grub Customizer](https://launchpad.net/grub-customizer) <sup>{4}</sup>

* {17} [GRUB Bootloader Themes](https://christitus.com/bootloader-themes/) <sup>{1}</sup>

## Tutorials

* General

* Get Instructions From
  * {7} [Restoring GRUB After Installing Windows](https://www.cybrary.it/blog/restoring-grub-installing-windows)
  * {9} [How to install or update Grub after Windows installation](https://askubuntu.com/questions/1483941/how-to-install-or-update-grub-after-windows-installation)
  * {16} [Grub Rescue | Repairing your Bootloader](https://christitus.com/grub-rescue/) <sup>{1}</sup>

* Concept
  * {8} [GRUB bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub.html)
  * {11} [GRUB 2 bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub-2.html)
  * {13} [GRUB2 & EFI recovery - Tutorial](https://www.dedoimedo.com/computers/grub2-efi-recovery.html)
  * {14} [Recover from a badly corrupt Linux EFI installation](https://www.dedoimedo.com/computers/grub2-efi-corrupt-part-recovery.html)
  * {15} [GRUB2, Fedora & can't find command error](https://www.dedoimedo.com/computers/grub2-fedora-command-not-found.html)

* Arch Wiki
  * [Arch boot process](https://wiki.archlinux.org/title/Arch_boot_process)
  * [GRUB](https://wiki.archlinux.org/title/GRUB)
  * [Dual boot with Windows](https://wiki.archlinux.org/title/Dual_boot_with_Windows)

## Guides

* {2} [Grub Rescue | Repairing your Bootloader](https://christitus.com/grub-rescue/) <sup>{1}</sup>

## YouTube Tutorials

* {1} [GRUB Rescue | Repairing GRUB BY Chris Titus Tech](https://www.youtube.com/watch?v=r7meKJsjqfY)

* {4} [How To Fix Multiboot Systems | Windows & Linux BY Chris Titus Tech => Legacy BIOS](https://www.youtube.com/watch?v=3oQfnNhk7qU)

* {5} [How to Reinstall GRUB | Repair Boot on Linux BY Drew Howden Tech](https://www.youtube.com/watch?v=ZhxBJ3yh2OY)

* {6} [How to fix Boot issues | stuck at grub prompt | grub rescue prompt | Windows Ubuntu Linux BY Brainers Technology](https://www.youtube.com/watch?v=dB580m1USIs)

* {10} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
