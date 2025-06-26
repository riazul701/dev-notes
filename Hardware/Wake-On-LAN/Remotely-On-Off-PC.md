# Remotely-On-Off-PC.md

## Notes

* Use Motherboard BIOS Restore AC Power Loss function and Sonoff Wifi Smart Plug to remotely turn on PC. <sup>{1} {2} {3}</sup>

* Use Digital Timer Switch/Socket to timely on/off Wifi Router. <sup>{6}</sup>

# Auto Login OS

## Linux

* For LXDE desktop environment, display manager is `/var/lib/lxdm` <sup>{4} {5}</sup>
  * Autologin : To log in to one account automatically on startup, without providing a password, find the line in `/etc/lxdm/lxdm.conf` that looks like this: `#autologin=dgod`. Uncomment it, substituting the target user instead of `dgod`. <sup>{5}</sup>

# References

* next-sl: {7}

## Tutorials

* {1} [[Motherboard]BIOS item-Restore AC Power Loss function => ASUS Desktop and Laptop](https://www.asus.com/support/faq/1049855/)

* Linux Desktop Environment
  * {4} [LXDE => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDE)
  * {5} [LXDM => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDM)

## YouTube Tutorials

* {2} [Remotely TURN ON and Connect To Your Computer EASIEST METHOD BY GPUSpecs](https://www.youtube.com/watch?v=-eqr4jkpI3I)
* {3} [এটা দিয়ে সবই হবে স্মার্ট ডিভাইস! // Sonoff Wifi Smart Plug Review & Setup BY Gadget Insider Bangla](https://www.youtube.com/watch?v=kw82UXblSIo)
* {6} [ডিজিটাল টাইমার সুইচ! // Digital Timer Switch | Automatic Switching Device! BY Gadget Insider Bangla](https://www.youtube.com/watch?v=EhNJbwZ-NqU)
