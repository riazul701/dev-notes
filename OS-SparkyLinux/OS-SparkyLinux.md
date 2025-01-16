# OS-SparkyLinux.md

## Websites

## Dual Boot with Windows-OS

* {1} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
  * SparkyLinux does not detect Windows-OS on "GRUB" boot loader
  * On SparkyLinux open Terminal and type: `sudo nano /etc/default/grub`
    * To edit graphically, enter command `sudo pcmanfm`, and edit file `/etc/default/grub`
  * Uncomment line `#GRUB_DISABLE_OS_PROBER=false` [Remove `#` at first character] -> Save File
  * Reload GRUB: `sudo update-grub`
  * Restart PC and check "Windows Boot Manager"

# References

* next-sl: {2}

* YouTube Tutorials

  * Dual Boot with Windows
    * {1} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
    