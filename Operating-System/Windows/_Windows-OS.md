# Windows OS

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7) <sup>Main Code</sup>
* [repology.org => The packaging hub](https://repology.org/)
* [windowsxlite.com](https://windowsxlite.com/)
* [Ameliorated: Tool for modifying Windows](https://ameliorated.io/)
* [AtlasOS: Redesigned Windows for gamers](https://atlasos.net/)
* [ReviOS: Customized version of Windows](https://www.revi.cc/)
* [Windowstan -> Windows OS and MS Office Download](https://windowstan.com/)
* [Softlay -> Windows OS Download](https://www.softlay.com/downloads/apps/utility-tools/system/operating-system)
* [c7x43t/Windows 10 Keys.txt](https://gist.github.com/c7x43t/ceb8ab75da308ea820546375e9230dd9)
* [massgravel/Microsoft-Activation-Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts)
* [abbodi1406/KMS_VL_ALL_AIO](https://github.com/abbodi1406/KMS_VL_ALL_AIO)
* [TGSAN/CMWTAT_Digital_Edition](https://github.com/TGSAN/CMWTAT_Digital_Edition)
* [LeDragoX/Win-Debloat-Tools GitHub](https://github.com/LeDragoX/Win-Debloat-Tools)

## Notes

* Check Windows-10 version: Press "WindowsKey+R" to open "Run" window -> Enter "winver" -> Click "OK"
* Open PowerShell and enter command "bash" to start bash-shell.
* Open Git-Bash and enter command "pwsh.exe" to start power-shell.

## Motherboard's UEFI Boot Manager

* In dual boot system, there are two boot managers in motherboard's UEFI. One for Linux and other for Windows.
  * Before reinstall Linux, remove Linux's boot manager from motherboard. Also format/delete Linux boot partitions.
  * Before reinstall Windows, remove Windows's boot manager from motherboard. Also format/delete Windows boot partitions.

## On/ShutDown/Sleep/Hibernate

* [Shut down, sleep, or hibernate your PC](https://support.microsoft.com/en-gb/windows/shut-down-sleep-or-hibernate-your-pc-2941d165-7d0a-a5e8-c5ad-8c972e8e6eff)
  * Turn your PC off completely
    * To shut down, select Start -> then select Power  -> Shut down.
  * Sleep
    * To set your PC so it goes to sleep when you close the lid or press the power button:
    * Open power options: select Start -> then select Settings  -> System  -> Power & sleep  -> Additional power settings.
    * Do one of the following:
      * If you’re using a desktop, tablet, or laptop, select Choose what the power buttons does. Next to When I press the power button, select Sleep, and then select Save changes.
      * If you’re using only a laptop, select Choose what closing the lid does. Next to When I close the lid, select Sleep, and then select Save changes.
  * Hibernate
    * Open power options: select Start -> then select Settings  -> System  -> Power & sleep  -> Additional power settings.
    * Select Choose what the power button does, and then select Change settings that are currently unavailable. Under Shutdown settings, select the Hibernate checkbox (if it's available), and then select Save changes.
    * Now you’ll be able to hibernate your PC in a few different ways:
      * Select Start , and then select Power  -> Hibernate.
      * Press the Windows logo key + X on your keyboard, and then select Shut down or sign out -> Hibernate.

* [How to disable and re-enable hibernation on a computer that is running Windows](https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/disable-and-re-enable-hibernation)
  * How to make hibernation unavailable
    * Press the Windows button on the keyboard to open Start menu or Start screen.
    * Search for cmd. In the search results list, right-click Command Prompt, and then select Run as Administrator.
    * When you are prompted by User Account Control, select Continue.
    * At the command prompt, type powercfg.exe /hibernate off, and then press Enter.
    * Type exit, and then press Enter to close the Command Prompt window.
  * How to make hibernation available
    * Press the Windows button on the keyboard to open Start menu or Start screen.
    * Search for cmd. In the search results list, right-click Command Prompt, and then select Run as Administrator.
    * When you are prompted by User Account Control, select Continue.
    * At the command prompt, type powercfg.exe /hibernate on, and then press Enter.
    * Type exit, and then press Enter to close the Command Prompt window.

## Keyboard Management

**Change Keyboard Layout**

* [Guide - Change Keyboard Layout](https://www.youtube.com/watch?v=YdSEb3hnokE)  
* Instructions:
  * Goto Settings -> Time & Language -> Language -> Preferred languages
  * Move "English (United States)" at top -> Goto "Options" -> Check keyboard "US (QWERTY)" exists
  * On right side of Taskbar choose input method "English (United States) US keyboard"
  
## User Management

**Change existing user name without deleting user data**

* Guides
  * [How To Change User Folder Name in Windows 10](https://www.youtube.com/watch?v=Y5_Q2BmTx3Y)
  * [How to Change User Folder Name in Windows 10 – 2 Ways](https://www.minitool.com/news/change-user-folder-name-windows-10.html)

# Boot Repair

## Software (Boot Repair)

* [Grub2Win](https://sourceforge.net/projects/grub2win/)
* [EasyBCD](https://neosmart.net/EasyBCD/)

# Resource Management

## Notes

* Primarily windows services consume lot of resources (cpu, ram, disk). Disable unnecessary windows services. To open services windows right-click on taskbar -> Task Manager -> Services -> Open Services.
* Disable some services
  * "SysMain": In previous windows os versions it's name was "SuperFetch". It caches software for faster access and makes high disk usage.
  * "Windows Search": It makes content indexing.
* Disable Disk Defragmentation: File Explorer -> Right-Click on "C" drive -> Properties -> Tools -> Optimise and defragment drive -> Optimise -> Turn Off "Scheduled optimisation"

## Guides

* [[SOLVED] 100% DISK USAGE Windows 10 FIX 2021](https://www.youtube.com/watch?v=UoeG8uxPxZY&list=PLXLq3JI1WPVJsOqqRBdDefvYTMgcJDOag&index=2)
* [100% Disk Usage in Windows 10 Tips](https://www.youtube.com/watch?v=e3kYlLbk20I&list=PLXLq3JI1WPVJsOqqRBdDefvYTMgcJDOag&index=4)

# Startup Applications

## [Configure Startup Applications in Windows](https://support.microsoft.com/en-us/windows/configure-startup-applications-in-windows-115a420a-0bff-4a6f-90e0-1934c844e473)

# References

* YouTube Tutorials
  * [AtlasOS vs ReviOS vs Tiny11 - Which is the Best Custom Windows 11? BY NotroDan](https://www.youtube.com/watch?v=2Ya18RAB9Z8)
  * [Windows X Lite: The ULTIMATE Lightweight OS? BY NotroDan](https://www.youtube.com/watch?v=Hcw13JEoCek)
  * [আপনার কম্পিউটারে কেন উইন্ডোজ ১১ চলবে না? - This PC can't run windows 11 - Fixed! BY Sohag360](https://www.youtube.com/watch?v=htHI9_sEHbM)
  * [Windows LTSC | The Best Version of Windows 10 BY Chris Titus Tech](https://www.youtube.com/watch?v=8dyhoh7u8JA)
