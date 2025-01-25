# Monitor.md

## Important

* Above 100 PPI Is Good For Reading Text And Programming. Do Not Go Beyond 24 Inch For Full HD.<sup>{19} {20} {21}</sup>
  * 21.5 Inch Full HD Monitor Is Best According To PPI. It Has 102.46 PPI. <sup>{21}</sup>
* Alway Buy IPS Panel Monitor For COLOR. <sup>{6}</sup>
* VA Panel Monitor's COLOR Is WASHED-OUT (ঝাপসা), So DO NOT Buy It. <sup>{6}</sup>
* Xiaomi Monitor has BAD COLOR. <sup>{18}</sup>

## Websites

* Official Brightness Control Software
  * [MSI Display Kit](https://www.msi.com/Landing/MSI-Display-Kit) <sup>{17} {6} {15}</sup>
  * [Lenovo Artery Software](https://smartdisplay.lenovo.com/artery/) <sup>{27}</sup>
  * [Lenovo Display Control Center – ThinkColour](https://support.lenovo.com/us/en/downloads/ds547223-lenovo-display-control-center-thinkcolor) <sup>{27}</sup>
  * {{VG series}} [ViewSonic vDisplay Manager](https://www.viewsonic.com/bd/products/lcd/vDisplay%20Manager)
  * [What Is HP Display Center And How To Download It](https://www.hp.com/th-en/shop/tech-takes/post/what-is-hp-display-center)
  * [LG OnScreen Control => Search Model Number](https://www.lg.com/us/support/software-firmware-drivers) <sup>{29}</sup>
  * [Acer Display Widget](https://www.acer.com/us-en/acer-display-widget) <sup>{30}</sup>
  * [Asus DisplayWidget Center](https://www.asus.com/content/monitor-software-osd-displaywidgetcenter/)
    * [Asus DisplayWidget Supported Monitor](https://zentalk.asus.com/t5/faq/lcd-monitor-asus-displaywidget-center/ta-p/408942)

* Specifications
  * [displayspecifications.com](https://www.displayspecifications.com/)

* Monitor Test
  * [EIZO MONITOR TEST](https://www.eizo.be/monitor-test/)
  * [testufo.com](https://www.testufo.com/)
  * [testufo.com/ghosting](https://www.testufo.com/ghosting)

* PPI (Pixels Per Inch)
  * [Pixels Per Inch PPI Calculator](https://www.calculatorsoup.com/calculators/technology/ppi-calculator.php)

* Screen Brightness (Artificial)

  * Multiple Platform
    * [f.lux](https://justgetflux.com/)

  * Windows
    * [Dimmer](https://www.nelsonpires.com/software/dimmer)
    * [PangoBright](https://www.pangobright.com/)

  * Linux
    * {{Works/Best}} [xrandr](https://www.x.org/wiki/Projects/XRandR/) <sup>{32} {33}</sup>
      * [ARandR: Another XRandR GUI](http://christian.amsuess.com/tools/arandr/)

* DDC/CI Brightness (Hardware Level)

  * DDC/CI (Display Data Channel/Command Interface) supported monitors, HDMI/VGA Cable.
  * [Display Data Channel Wikipedia](https://en.wikipedia.org/wiki/Display_Data_Channel)

  * Windows
    * [emoacht/Monitorian](https://github.com/emoacht/Monitorian) || [Monitorian BY emoacht](https://www.microsoft.com/store/apps/9nw33j738bl0)
    * [xanderfrangos/twinkle-tray](https://github.com/xanderfrangos/twinkle-tray) || [twinkletray.com](https://twinkletray.com/) || [Twinkle Tray: Brightness Slider BY Xander Frangos](https://www.microsoft.com/store/productId/9PLJWWSV01LK)
    * [blackholeearth/Win10_BrightnessSlider](https://github.com/blackholeearth/Win10_BrightnessSlider)
    * [scottaxcell/winddcutil](https://github.com/scottaxcell/winddcutil)
    * [NirSoft ControlMyMonitor](https://www.nirsoft.net/utils/control_my_monitor.html) <sup>{28}</sup>

  * Linux
    * [ddccontrol/ddccontrol](https://github.com/ddccontrol/ddccontrol)
    * [gddccontrol => A graphical utility to control monitor parameters via software](https://manpages.ubuntu.com/manpages/bionic/man1/gddccontrol.1.html)
    * [rockowitz/ddcutil](https://github.com/rockowitz/ddcutil) || [ddcutil.com](https://www.ddcutil.com/)
    * [rockowitz/ddcui](https://github.com/rockowitz/ddcui)
    * [Hummer12007/brightnessctl](https://github.com/Hummer12007/brightnessctl) <sup>{31} {32}</sup>
    * [LordAmit/Brightness](https://github.com/LordAmit/Brightness) <sup>{32}</sup>

  * Light Sensor
    * [FedeDP/Clight](https://github.com/FedeDP/Clight)
    * [BackLight Unit coNTRoL](http://sven.killig.de/BLUntrl/)

* Collection
  * Multiple Platform
    * [Iris](https://iristech.co/iris/)
      * [Iris mini](https://iristech.co/iris-mini/)
  * Linux
    
## Warranty

* There is no warranty for "Dead/Stuck Pixel" in Monitor. Therefore, check "Dead/Stuck Pixel" before buying Monitor.
* Also check Monitor Bleeding.

* Dead/Stuck Pixel Test
  * [EIZO MONITOR TEST](https://www.eizo.be/monitor-test/)
  * {10} [Dead Pixel Test BY CharlietoKind](https://www.youtube.com/watch?v=gIA_4nV-CqE)

* Monitor Bleeding Test
  * {11} [Backlight Bleed Test BY BacklightTest](https://www.youtube.com/watch?v=WexJRnud32U)

## Notes

* CHECK Monitor supports VESA Mount For Using Monitor Stand. <sup>{26}</sup>

* MSI Monitor Has Software Control Feature, named "MSI Display Kit". <sup>{17} {15}</sup>

* If You Use Monitor Greater Than 24 Inch, Then You Have To Move Head/Neck To See Display Corner. It can cause Head/Neck Pain. So Do Not Buy Monitor Above 24 Inch. <sup>{25}</sup>

* Do Not Buy Glossy Panel Surface Monitor, Because It Reflects Light. By Anti-Glare/Matte Finishing Monitor. <sup>{24}</sup>

* Graphics-Card "Sync" with Monitor means, Graphics-Card provides FPS (Frame Per Second) according to monitor capability. This feature is Monitor specific.
  * NVIDIA has G-Sync for Monitor
  * AMD has FreeSync for Monitor

# Artificial Brightness Control

## Windows Artificial

* Download and install any of the following softwares
  * [Dimmer](https://www.nelsonpires.com/software/dimmer)
  * [PangoBright](https://www.pangobright.com/)

## Linux Artificial

* {33} [How do dim screen, even if artifically, below the minimum?](https://unix.stackexchange.com/questions/181496/how-do-dim-screen-even-if-artifically-below-the-minimum)
  * With xrandr you can affect the gamma and brightness of a display by altering RGB values.
  * From `man xrandr`:
    * `--brightness`
      * Multiply the gamma values on the crtc currently attached to the output to specified floating value. Useful for overly bright or overly dim outputs. However, this is a software only modification, if your hardware has support to actually change the brightness, you will probably prefer to use `xbacklight`.
  * I can use it like: `xrandr --output DVI-1 --brightness .7`
  * There is also the `xgamma` package, which does much of the same, but...
    * `man xgamma`:
      * Note that the `xgamma` utility is obsolete and deficient, `xrandr` should be used with drivers that support the XRandr extension.
  * I can use it like: `xgamma -gamma .7`

* Instructions
  * `xgamma` does not work well for artificial brightness control
  * `xrandr` : Use this command to get "display" name
  * `xrandr --output {{display-name}} --brightness {{value}}` : Use this command to set brightness. "value" can be: ".1" to ".9" and "1" means normal hardware brightness.
  * Add `alias` to `~/.bashrc` file for keyboad shortcuts
    * `alias b7='xrandr --output {{display-name}} --brightness .7'` [Make 9 copies of this command from value ".1" to ".9"]
    * `alias bn='xrandr --output {{display-name}} --brightness 1'`
    * `source ~/.bashrc` : Reload "~/.bashrc" file
  * `b7` : Open terminal and enter this command to change brightness.

* Note: After computer restart, brightness is resetted to normal hardware brightness. To change normal hardware brightness, use DDC/CI (Display Data Channel / Command Interface) based command/software.

# Product

## Best Monitors

* Have Eye-Care Technology and Software OSD Control (Brightness, Contrast, Etc.) Feature

* MSI 100Hz
  * {{Eye-Care}} [MSI PRO MP225 21.5 inch 100Hz IPS FHD Monitor](https://www.ultratech.com.bd/msi-pro-mp225-100hz-ips-fhd-monitor)
  * {{Eye-Care}} [MSI PRO MP243X 23.8 Inch 100Hz IPS FHD Monitor](https://www.ultratech.com.bd/msi-pro-mp243x-100hz-ips-fhd-monitor)
  * {{Eye-Care}} [MSI PRO MP252 24.5 Inch 100Hz IPS FHD Monitor](https://www.ultratech.com.bd/msi-pro-mp252-245-inch-100hz-business-productivity-monitor)
* Lenovo 75Hz
  * {{Eye-Care 75Hz}} [Lenovo L22i-40 21.5 Inch FHD IPS HDMI VGA Professional Monitor](https://fourstaritbd.com/lenovo-l22i-40-ips-fhd-monitor/)

## Software Brightness/OSD Control

* HP 75Hz
  * [HP M22f 21.5 Inch IPS LED FHD Monitor](https://www.ultratech.com.bd/hp-m22f-215-inch-ips-led-fhd-monitor)

* LG Monitor
  * {29} [LG On Screen Control (OSC) Full Review! LG Monitor Utility Tool (27GL650F/22MP68VQ) Hindi BY GEEKY SOUMYA](https://www.youtube.com/watch?v=vZ5OBicwznU)
    * Comments
    * @Kapildev_N._Pol: Sir Yeh har lg monitor pe chalega kya ya phir specific model pe
      * @GEEKYSOUMYA: Most of the LG Models per chalega

# Specification

## Software Brightness Control

* Software Brightness Control Demo
  * MSI Display Kit
    * {17} {Best Monitor} [১০ হাজার টাকায় 100Hz IPS মনিটর! | MSI PRO MP225 Bangla Review BY PC Builder Bangladesh](https://www.youtube.com/watch?v=jD2a4BwNROA)
    * {6} {VA Panel Has BAD Color} [100hz MSI MP223 Monitor Review | 10000 Taka Best Monitor BY PC Builder Bangladesh](https://www.youtube.com/watch?v=MrZpJ37PimA)
    * {15} [The BEST Gaming Monitor Settings 2023 BY Vylsa](https://www.youtube.com/watch?v=ydRjb-nPmvM)
  * Lenovo Artery / Display Control Center – ThinkColour
    * {27} [১০ হাজার টাকায় সেরা!! | Lenovo L22i-40 Bangla Review BY PC Builder Bangladesh](https://www.youtube.com/watch?v=96CA_wUjI0Y)

## PPI (Pixels Per Inch)

* Above 100 PPI Is Good For Reading Text And Programming. Do Not Go Beyond 24 Inch For Full HD. 23.8 Inch == 92.56 PPI.<sup>{19} {20} {21}</sup>
  * 21.5 Inch Full HD Monitor Is Best According To PPI. It Has 102.46 PPI. <sup>{21}</sup>

* Monitor PPI List <sup>{13}</sup>
  * Full HD (1920x1080: 1080p) Monitor
    * 15.6": 141.21 ppi
    * 21.5": 102.46 ppi
    * 24": 91.79 ppi
    * 24.5": 89.91 ppi
    * 27": 81.59 ppi
    * 32": 68.84 ppi
    * 34": 64.79 ppi
  * 2K (2560x1440: 1440p) Monitor
    * 23.8": 123.41 ppi
    * 25": 117.49 ppi
    * 27": 108.79 ppi
    * 32": 91.79 ppi
    * 34": 86.39 ppi
  * 4K (3840x2160: 4K) Monitor
    * 28": 157.35 ppi
    * 32": 137.68 ppi
    * 42": 104.90 ppi
    * 48": 91.79 ppi
    * 55": 80.11 ppi
  * 8K (7680x4320) 55": 160.21 ppi
  * Ultrawides
    * 49" 3840x1080: 81.41 ppi
    * 34" 2560x1080: 81.72 ppi
    * 49" 5120x1440: 108.54 ppi
    * 38" 3840x1600: 109.47 ppi
    * 34" 3440x1440: 109.68 ppi
    * 40" 5120x2160: 138.92 ppi

* Products for PPI Compare
  * [HP V194 18.5 Inch HD LED Monitor (VGA)](https://www.ryans.com/hp-v194-185-inch-hd-led-monitor-vga-v5e94aa)
  * [18.5" HP V190 - Specifications](https://www.displayspecifications.com/en/model/26f11137)

* Opinions and Comments
* {21} [Don't Make THIS Mistake!! BY Hardware Mana](https://www.youtube.com/watch?v=tVeE-zAQkFI)
  * @amitmisra9438 => Very clear advice in your channel that i really want that for normal coding and work 21.5 is a best monitor. Thanks for sharing your critical advice as everyone says go for big which will damage your experience in case of 2 feet table. Keep it Up
  * @farazalikhan5242 => I am using a 24" 1080p monitor and I can see some pixels when I look closely, So I would recommend going for 1440p or 4k for 27"or above monitors. As the picture will be much crisper
  * @QuantumCanvas07 => I'll get a macbook air m3 and external monitor this year.  macOS doesn't allow subpixel anti-aliasing and for people on a budget, the perfect PPI according to reddit would be half of apple retina display (~220 PPI) that is ~110 PPI.
  * @aniket8350 => But it also depends on the viewing distance right.
  * @iamdshanbhag => I agree i recently bought 27 inch monitor and returned it became of the pixelated issue. [Full HD Monitor]
  * @arrowRX => Good content bro, i dont understand why even companies selling 1080 27, sharpness is bad. Nice editing, nice content overall, keep adding more videos.
    * @HardwareMana => Some people just buy it for the size. It's more of a TV at that point and not a monitor.
  * @kunalsehgal3481 => Lol even before watching this video I bought a 22 inch full hd monitor instead of 24 inch just because of ppi. For me size doesn't matter that much, but I don't want a grainy display on a new monitor.
  * @swarajroy5631 => 27inch hamesha 2k k upar kharidna chaiye.

## Product Feature

* Check "MSI Display Kit" of MSI-Monitor <sup>{5}</sup>
* "Dahua DHI-LM22-C201PL" Monitor has DDC/CI (Display Data Channel/Command Interface) Feature. <sup>{6}</sup>

# References

* next-sl: {34}

* Monitor Test
  * Dead/Stuck Pixel Test
    * {10} [Dead Pixel Test BY CharlietoKind](https://www.youtube.com/watch?v=gIA_4nV-CqE)

  * Monitor Bleeding Test
    * {11} [Backlight Bleed Test BY BacklightTest](https://www.youtube.com/watch?v=WexJRnud32U)

* Guides

  * Linux Brightness
    * {33} [How do dim screen, even if artifically, below the minimum?](https://unix.stackexchange.com/questions/181496/how-do-dim-screen-even-if-artifically-below-the-minimum)
    * {32} [Changing Monitor Brightness on Linux](https://www.baeldung.com/linux/monitor-brightness-change)
    
  * DDC/CI (Display Data Channel / Command Interface) Brightness
    * {1} [After 10 years of using monitors I found out that you can control their brightness via software (DDC/CI)](https://www.reddit.com/r/Monitors/comments/tok3g9/after_10_years_of_using_monitors_i_found_out_that/?rdt=46942)
    * {2} [How can I get my PC to automatically adjust the screen brightness based on ambient light?](https://www.quora.com/How-can-I-get-my-PC-to-automatically-adjust-the-screen-brightness-based-on-ambient-light)
    * {3} [MSI Monitor keeps auto-adjusting the brightness constantly](https://www.reddit.com/r/Monitors/comments/b6s985/msi_monitor_keeps_autoadjusting_the_brightness/?rdt=43611)
    * {28} [Why don't more monitor brands have a software-based OSD, that allows for FULL control?](https://www.reddit.com/r/Monitors/comments/mpion4/why_dont_more_monitor_brands_have_a_softwarebased/)
    * [Why don't any monitors use software controls instead of the OSD?](https://www.reddit.com/r/Monitors/comments/kcg7mp/why_dont_any_monitors_use_software_controls/)
    * {31} [Brightness dimmer in Linux](https://www.reddit.com/r/linuxmasterrace/comments/133rmai/brightness_dimmer_in_linux/?rdt=42969)

  * PPI (Pixels Per Inch)
    * {19} [What Is Pixel Density And Pixels Per Inch (PPI)?](https://www.displayninja.com/what-is-pixel-density/)

* YouTube
  
  * DDC/CI (Brightness)
    * {4} [Brightness control for windows 10 | Increase & Decrease brightness in pc | Monitorian |DebajitSaikia BY Debajit Saikia](https://www.youtube.com/watch?v=rs0HfGeME5E)

  * OSD (On Screen Display) Software
    * {29} [LG On Screen Control (OSC) Full Review! LG Monitor Utility Tool (27GL650F/22MP68VQ) Hindi BY GEEKY SOUMYA](https://www.youtube.com/watch?v=vZ5OBicwznU)
    * {30} [Acer Display Widget Software Tour w/ VG240YS BY Satyajit Mishra](https://www.youtube.com/watch?v=DsbMznV43EU)

  * Monitor Product
    * {17} {Best Monitor} [১০ হাজার টাকায় 100Hz IPS মনিটর! | MSI PRO MP225 Bangla Review BY PC Builder Bangladesh](https://www.youtube.com/watch?v=jD2a4BwNROA)
    * {6} {VA Panel Has BAD Color} [100hz MSI MP223 Monitor Review | 10000 Taka Best Monitor BY PC Builder Bangladesh](https://www.youtube.com/watch?v=MrZpJ37PimA)
    * {5} [24.5inch 100hz IPS Budget Monitor! | MSI Pro MP251 Review BY PC Builder Bangladesh](https://www.youtube.com/watch?v=1MIJv3ZpCpE)
    * {16} [MSI & BLEEDIING | MSI Pro MP275P Monitor Review BY PC Builder Bangladesh](https://www.youtube.com/watch?v=nywri0ms-Ig)
    * {14} [আরও একটা ১০০ হার্জ মনিটর! | Dahua DHI-LM22-C201PL Review BY PC Builder Bangladesh](https://www.youtube.com/watch?v=kYHLvJnjuiQ)
    * {15} [The BEST Gaming Monitor Settings 2023 BY Vylsa](https://www.youtube.com/watch?v=ydRjb-nPmvM)
    * {23} [Top 5 Best 100Hz Monitors Tested - Here's The Result ('24 Edition) BY Tech Land BD](https://www.youtube.com/watch?v=jHwQs-K19Y4)
    * {27} [১০ হাজার টাকায় সেরা!! | Lenovo L22i-40 Bangla Review BY PC Builder Bangladesh](https://www.youtube.com/watch?v=96CA_wUjI0Y)

  * Bad Monitor
    * {18} [Testing Budget Xiaomi Monitors BY PC Builder Bangladesh](https://www.youtube.com/watch?v=fEnSDCmRnlY)

  * Concept
    * {7} [এই ৫টি বিষয় দেখে কম্পিউটারের মনিটর কিনুন! Monitor Buying Guide 2023! TechTalk BY Tech Talk](https://www.youtube.com/watch?v=fYIH6WcbpZc)
    * {8} [HDMI, DisplayPort, DVI, VGA Explained I HDMI vs DisplayPort vs VGA: কোনটা ব্যবহার করবেন? TechTalk BY Tech Talk](https://www.youtube.com/watch?v=2fz2X4J57uU)
    * {9} [Monitor Refresh Rate Explained in Bangla I Watch Before Buying Monitor I কোন মনিটর সবচেয়ে ভালো? BY Tech Talk](https://www.youtube.com/watch?v=mfERYhZAv5k)
    * {12} [Explaining Display Connectors: HDMI, DisplayPort, USB-C, DVI, VGA & Thunderbolt BY ExplainingComputers](https://www.youtube.com/watch?v=R-mJ0J_ACEM)
    * {24} [IPS vs VA vs TN vs QD-OLED vs WOLED - Which Display Tech is Best? BY Monitors Unboxed](https://www.youtube.com/watch?v=NFPcLmIVIbY)
    * {25} [Watch This BEFORE You Buy a Monitor! BY The Mysterious Tech](https://www.youtube.com/watch?v=nEAyY9dzAZ0)
    * [Why Monitor Brands Are Lying to You? BY The Mysterious Tech](https://www.youtube.com/watch?v=iI1eBfMA7WU)

  * PPI (Pixels Per Inch) YouTube
    * {13} [Best Monitor Size For 1080p, 1440p, 4K & Ultrawide Monitors: Pixel Density Explained! BY TotallydubbedHD](https://www.youtube.com/watch?v=o6kWpXFDpco)
    * {20} [Ultimate Guide⚡Best Budget Monitors Under 10000, 15000, and 20,000 in 2024 BY TechZonical](https://www.youtube.com/watch?v=OxqiQpt3hJ8)
    * {21} [Don't Make THIS Mistake!! BY Hardware Mana](https://www.youtube.com/watch?v=tVeE-zAQkFI)
    * {22} [27” 1080p Monitors - Do they suck? Viewsonic XG2705 Review - TechteamGB BY TechteamGB](https://www.youtube.com/watch?v=Ub8m5sHEUDQ)
    * [Monitor Size Matters!!! BY Daniel Owen](https://www.youtube.com/watch?v=2W7_FqInpxY)
    * [Are You Making This MONITOR Buying Mistake? BY VGYAN TECH](https://www.youtube.com/watch?v=2hUsXEKiBVw)

  * G-Sync/FreeSync/Adaptive Sync
    * [Nvidia G-Sync vs AMD FreeSync vs Adaptive Sync in 2024 BY Monitors Unboxed](https://www.youtube.com/watch?v=CQdo67SjIHk)
    * [Replying to Misconceptions, Confusion & Comments: G-Sync vs FreeSync vs Adaptive Sync BY Monitors Unboxed](https://www.youtube.com/watch?v=biSY6WeCDus)
    * [Your Next Monitor Is A Keeper! - AdaptiveSync Explained BY Techquickie](https://www.youtube.com/watch?v=1fKoBigWEAk)

  * Monitor Stand
    * {26} [MONITOR STAND Buying Guide for BEGINNERS in India BY INDIAN GAMER](https://www.youtube.com/watch?v=GLqgTLtCPfA)
    * [Dream মাল্টি মনিটর Setup - All About ARM's & Mounts BY PC Builder Bangladesh](https://www.youtube.com/watch?v=bUGAD0AWWcI)
    * [Best Way to Setup My Dual Monitors? BY David Zhang](https://www.youtube.com/watch?v=l1N3jlgqcQ4)
    * [Are Vertical Monitors Worth It for Programming? BY Federico Terzi](https://www.youtube.com/watch?v=CpdQud__yys)
    * [The Ultimate Monitor Arm Tier List BY BTODtv](https://www.youtube.com/watch?v=80KBIItTMoE)
    * [$25 vs. $300 Monitor Arm - What Stands Do I Recommend? BY David Zhang](https://www.youtube.com/watch?v=__K4V8pFhf4)
    * [DO NOT Buy A Monitor Arm Until You’ve Watched This Video BY BTODtv](https://www.youtube.com/watch?v=f4hcvSoPrp8)
    * [Monitor Arm comparison ft IKEA MALM desk. How to choose? BY Tao M Studio](https://www.youtube.com/watch?v=KVkGNzW4WTQ)

  * Monitor Stand Product
    * [KALOC DS200 Monitor Arm Unboxing and Installation | First Time Dual Monitor Setup BY Project Galileo](https://www.youtube.com/watch?v=5BFZE45zpw4)
    * [KALOC DS200 SINGLE DESK MONITOR ARM, ADJUSTABLE GAS SPRING BY Distiplus Lebanon](https://www.youtube.com/watch?v=np9cYe_wUzA)

  * Multi-Monitor Arrangement
    * [Best Way to Setup My Dual Monitors? BY David Zhang](https://www.youtube.com/watch?v=l1N3jlgqcQ4)
    * [Dual Monitor Productivity Setup Guide 2022 BY ThisIsE](https://www.youtube.com/watch?v=9YV4-vW174E)
    * [Ultrawide Monitor VS Dual Monitor Setup - Which one is better? BY The Indian Budget Gamer](https://www.youtube.com/watch?v=JjIwVvuH2tE)

  * Multi-Monitor Setup
    * [4 Monitor Setup with Laptop for Stock Trading BY Sai Techvision](https://www.youtube.com/watch?v=EMexiRZASwg)

  * Monitor Light Bar
    * [MONITOR LIGHT BAR complete buying guide. Pros and Cons. Prices. Types etc. BY INDIAN GAMER](https://www.youtube.com/watch?v=3yVOBVpzbIs)
