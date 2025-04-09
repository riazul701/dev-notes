# Config-GRUB.md

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

* next-sl: {16}

## Tutorials

* Concept
  * {8} [GRUB bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub.html)
  * {11} [GRUB 2 bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub-2.html)
  * {13} [GRUB2 & EFI recovery - Tutorial](https://www.dedoimedo.com/computers/grub2-efi-recovery.html)
  * {14} [Recover from a badly corrupt Linux EFI installation](https://www.dedoimedo.com/computers/grub2-efi-corrupt-part-recovery.html)
  * {15} [GRUB2, Fedora & can't find command error](https://www.dedoimedo.com/computers/grub2-fedora-command-not-found.html)
