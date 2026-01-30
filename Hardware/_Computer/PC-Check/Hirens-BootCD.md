# Hirens-BootCD.md

## Working Way

**ChatGPT Question: "one software to check pc is functional"**

* If you want one simple tool to check if your PC is functional, I recommend:

* ✅ Hiren’s BootCD PE (Windows-based)
  * Best all-in-one tool for checking old PCs — no need to install anything.

* 🔧 What It Does:
  * Boots from USB (even if the PC's OS is broken)
  * Includes tools to check:
    * RAM health (MemTest)
    * Hard drive health (CrystalDiskInfo)
    * CPU temperature and usage (HWMonitor)
    * System info (CPU-Z, Speccy)
    * File system issues
    * Virus scan

* 🪛 What You Need:
  * 1. A working computer to prepare the USB.
  * 2. A USB stick (at least 2 GB).
  * 3. [Rufus](https://rufus.ie/en/) to write the ISO to USB.
  * 4. [Hiren’s BootCD PE ISO](https://www.hirensbootcd.org/download/) – free download.

* 📥 How to Set It Up:
  * 1. Download Hiren’s BootCD PE ISO:
    * 👉 https://www.hirensbootcd.org/download/
  * 2. Plug in a USB stick.
  * 3. Open Rufus:
    * Select your USB device.
    * Choose the Hiren’s BootCD PE ISO file.
    * Click Start (it will erase the USB contents).
  * 4. Plug the USB into the old PC.
  * 5. Boot from USB (you may need to press F12, ESC, or change boot order in BIOS).
  * 6. The Hiren’s environment will load and let you run tools directly.

* Would you like help creating the USB or running it on the old PC?

**ChatGPT Question: "hiren's boot cd ram test"**

* To test your RAM using Hiren’s BootCD PE, you’ll need to use one of the included memory testing tools. Here's how to do it:

* 🧠 RAM Testing with Hiren’s BootCD PE (Windows 10 PE-based)

* 🔧 Tool Used: MemTest86+ or Windows Memory Diagnostic
  * Hiren’s BootCD PE includes Windows Memory Diagnostic by default. For a more thorough test, MemTest86+ is recommended, but it requires a separate boot (not included in the PE).

* 🟢 Option 1: Using Windows Memory Diagnostic (Built into Hiren’s PE)
  * ✅ Steps:
    * 1. Boot from Hiren’s BootCD PE USB.
    * 2. Let it load into the desktop (Windows-like interface).
    * 3. Press Start Menu > Windows Administrative Tools > Windows Memory Diagnostic.
    * 4. Choose:
      * Restart now and check for problems
      * or Check for problems the next time I start my computer
      * (Since you’re on PE, choose the first one)
    * 5. The test will begin. It usually runs 2 passes.
    * 🔍 Result:
      * If issues are found, they will be reported after the system reboots.

* 🟡 Option 2: Use MemTest86+ (More Thorough)
  * MemTest86+ is not part of Hiren's PE, but you can create a separate USB for it.
  * ✅ Steps:
    * 1. Download from: https://www.memtest.org/
    * 2. Create a bootable USB with MemTest86+ using the installer.
    * 3. Plug it into your PC and boot from it (via F12/ESC/Boot Menu).
    * 4. Let it run at least 2 full passes (may take an hour+).
  * 🔍 Advantage:
    * Much more reliable and sensitive than Windows Memory Diagnostic
    * Identifies subtle RAM errors missed by basic tools

* 📝 Recommendation:
  * For a quick test, use Windows Memory Diagnostic from Hiren’s PE.
  * For a thorough, trusted RAM test, use MemTest86+ on its own USB.

* Would you like help creating a MemTest86+ USB or running the RAM test in Hiren’s PE right now?

# References

## Websites

* [Hiren’s BootCD PE (Preinstallation Environment)](https://www.hirensbootcd.org/)

## YouTube Tutorials

* [Ultimate DIY Guide: Create Bootable Hiren's USB with Ventoy | High-Level Overview! Step By Step BY Bootable USBs](https://www.youtube.com/watch?v=tngwn5aJYoE)
