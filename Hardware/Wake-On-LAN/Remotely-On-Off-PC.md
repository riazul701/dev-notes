# Remotely-On-Off-PC.md

## Notes

* Laptops don’t power on automatically when AC power is restored, unlike desktop PCs.

* Check Wifi Plug/Socket Before Buying => Connect wifi smart socket to broadband internet and connect android phone (plug/socket control app) to sim internet. Then try to remotely on/off wifi smart socket. Also check wifi plug/socket has physical button, that works without internet like normal switch. Check wifi plug/socket has power usage monitoring feature through android app.
  * [Sonoff S26 WiFi Smart Socket](https://store.roboticsbd.com/home-automation-robotics-bangladesh/1176-sonoff-s26-wifi-smart-socket-robotics-bangladesh.html)
    * Check LAN Control: Turn on/off the device even when WiFi has no Internet access

* Check Some Wifi Plug/Socket Works As Timer Switch/Socket

* Check Timer Switch/Socket Before Buying => Check timer switch/socket has physical bypass button, so that wifi router can be turned on manually outside of timing. Check battery is replaceable. Also check it supplies power to wifi router, when there is no battery or battery is down.

* Use Motherboard BIOS/UEFI "Restore AC Power Loss" function and Sonoff Wifi Smart Plug (Switch/Socket) to remotely turn on PC. <sup>{1} {2} {3}</sup>

* Motherboard BIOS/UEFI power management functions (turn on computer)
  * Press "F2/Del/Esc" during computer starting to enter BIOS/UEFI settings -> Advanced -> APM (Advanced Power Management) --OR-- ACPI (Advanced Configuration and Power Interface)
  * "Restore AC Power Loss"
  * "Power On by PCI-E"
  * "Power On by RTC (Real-Time Clock)"

* Use Digital Timer Switch/Socket to timely on/off Wifi Router. <sup>{6}</sup>
  * SONOFF S26 R2 WiFi Smart Plug => Set scheduled/countdown/loop timers to turn on/off your devices at a specified  time. <sup>{7}</sup>

* Remote USB Insert/Attach
  * Wi-Fi USB switch/relay is for remotely turn on/off portable hard disk. Must check "data support".
  * USB-over-IP hub or USB device server
  * [SONOFF Micro Zigbee USB Smart Adaptor](https://sonoff.tech/products/sonoff-micro-zigbee-usb-smart-adaptor)

* Laptop
  * No "Restore AC Power Loss" function
  * Smart Button Presser(Pusher)/SwitchBot, check internet (another wifi/sim) controlled not bluetooth - Alternative, physically press power button
    * [SwitchBot Bot](https://www.switch-bot.com/products/switchbot-bot)

## UPS (Uninterruptible Power Supply) Alarm Sound

* Turn UPS alarm sound permanently off. Wifi smart plug/socket is inserted to backside of UPS to remotely turn on/off computer. UPS power button will be turned on all time. When no electricity and computer is also off, then UPS makes alarm sound.

# Auto Login OS

## Linux

* For LXDE desktop environment, display manager is `/var/lib/lxdm` <sup>{4} {5}</sup>
  * Autologin : To log in to one account automatically on startup, without providing a password, find the line in `/etc/lxdm/lxdm.conf` that looks like this: `#autologin=dgod`. Uncomment it, substituting the target user instead of `dgod`. <sup>{5}</sup>

# References

* next-sl: {8}

## Websites

* [ldnio.com.bd => Wifi smart plug/socket](https://ldnio.com.bd/)
## Tutorials

* {1} [[Motherboard]BIOS item-Restore AC Power Loss function => ASUS Desktop and Laptop](https://www.asus.com/support/faq/1049855/)

* Linux Desktop Environment
  * {4} [LXDE => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDE)
  * {5} [LXDM => ArchLinux Wiki](https://wiki.archlinux.org/title/LXDM)

## Products

* {7} [SONOFF S26 R2 WiFi Smart Plug Wireless Wifi Outlet Socket Remote Control Wall Plug Alexa Google](https://www.daraz.com.bd/products/sonoff-r2-wifi-wifi-i274335274-s1249615976.html)
* [LDNIO SCW1050 WiFi Smart Plug](https://ldnio.com.bd/product/ldnio-scw1050-wifi-smart-plug/)
* [LDNIO SCW3451 WIFI Smart Universal Power Socket](https://ldnio.com.bd/product/ldnio-scw3451/)

* Other Products
  * [Smart Motion Sensor Light Holder for Indoor/Outdoor – E27](https://nabatechshop.com/product/smart-motion-sensor-light-holder-e27-bangladesh/)
  * [Automatic Street Light Controller AC 220V 10A – Photocell Day Night Light Sensor Switch](https://nabatechshop.com/product/automatic-street-light-controller-photocell-day-night-light-sensor-switch/)
  * [HTC-2 Digital Temperature & Humidity Meter with Clock](https://nabatechshop.com/product/htc-2-digital-temperature-humidity-meter-with-clock/)

## YouTube Tutorials

* General
  * {2} [Remotely TURN ON and Connect To Your Computer EASIEST METHOD BY GPUSpecs](https://www.youtube.com/watch?v=-eqr4jkpI3I)
  * {3} [এটা দিয়ে সবই হবে স্মার্ট ডিভাইস! // Sonoff Wifi Smart Plug Review & Setup BY Gadget Insider Bangla](https://www.youtube.com/watch?v=kw82UXblSIo)
  * [Control your world with a tap; Best Budget Friendly IoT Smart Plugs in Bangladesh | TSP BY TSP | Total Solution Plus](https://www.youtube.com/watch?v=re7eCmzfWL0)
  * {6} [ডিজিটাল টাইমার সুইচ! // Digital Timer Switch | Automatic Switching Device! BY Gadget Insider Bangla](https://www.youtube.com/watch?v=EhNJbwZ-NqU)

* USB Switch
  * [USB 3.0 On / Off Switch Button: Type A Cable Teardown in 3 Minutes BY Luke Builds Stuff](https://www.youtube.com/watch?v=ob-IkjLMZfw)
