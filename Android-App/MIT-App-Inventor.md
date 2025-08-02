# MIT-App-Inventor.md

## MIT App Inventor Emulator On Waydroid

**ChatGPT Question: "mit app inventor emulator on waydroid"**

* If you're trying to use the MIT App Inventor emulator inside Waydroid on Fedora (or any Linux distro), you're exploring a creative path—but it comes with caveats. Let's break down the approach:

* 🧩 What You’re Asking:
  * You want to use Waydroid (an Android container running on Linux) to act as the MIT App Inventor emulator, instead of using:
    * A physical phone with the Companion App
    * The official MIT App Inventor emulator (Windows/macOS-focused)

* ✅ Is It Possible?
  * Yes, Waydroid can work as a substitute Android emulator for MIT App Inventor via the AI Companion App, but only via wireless (QR code) mode, not USB or direct ADB bridge, unless specifically configured.

* 🔧 How to Use Waydroid as an Emulator for MIT App Inventor

  * ✅ 1. Set Up Waydroid (if not already installed)
    * On Fedora, first ensure Waydroid is installed and functional:
```bash
sudo dnf install curl lzip unzip android-tools
```
    * Then install Waydroid (follow instructions from the official repo):
```bash
sudo curl https://raw.githubusercontent.com/waydroid/waydroid/main/scripts/install-waydroid.sh | bash
```
    * Start Waydroid:
```bash
waydroid session start
waydroid show-full-ui
```

  * ✅ 2. Install the MIT AI2 Companion App Inside Waydroid
    * Open the browser inside Waydroid
    * Visit https://play.google.com/store/apps/details?id=edu.mit.appinventor.aicompanion3
    * OR sideload it:
```bash
adb connect localhost:5555  # Or whatever Waydroid uses
adb install AI2Companion.apk
```

  * ✅ 3. Use App Inventor with QR Code
    * 1. Go to https://ai2.appinventor.mit.edu on your Linux host
    * 2. Click Connect → AI Companion
    * 3. Inside Waydroid, open the AI2 Companion app
    * 4. Scan the QR code OR enter the 6-character code manually
  * ✅ You should now see your App Inventor project running in Waydroid!

* ⚠️ Notes & Caveats
  * Title: Issue => Fix
  * QR code camera not working in Waydroid? => Use the 6-digit code entry option in the Companion app
  * ADB over USB won’t work easily => Waydroid doesn’t behave like a USB-attached device
  * Network issues => Make sure both host and Waydroid are on the same local interface; Waydroid must have internet access
  * No Google Play in default Waydroid => You may need to install GApps or sideload APKs manually

* 🧠 Summary
  * Title: Feature => Waydroid as Emulator
  * Companion App support => ✅ Yes
  * QR code support => ✅ (manual code more reliable)
  * USB/AIO emulator style => ❌ Not supported
  * Good alternative? => ✅ For development/testing without a real phone

* Would you like a script to sideload the AI2 Companion app into Waydroid or help with GApps installation?

# References

## YouTube Tutorials

* [MIT App Inventor All Tutorials - Full Course | 100 Days Tutorial of MIT App Inventor BY The Coding Bus => PlayList](https://www.youtube.com/playlist?list=PL7sbjUYIdF3XGD5WDOxea0GwbULOPaX5G)
* [Firebase tutorial for beginners 2020 BY The Coding Bus => PlayList](https://www.youtube.com/playlist?list=PL7sbjUYIdF3WYOS8AveigiI_AIe3urrq9)
* [MIT App Inventor Full  Course for beginners 2020 BY The Coding Bus => PlayList](https://www.youtube.com/playlist?list=PL7sbjUYIdF3Ux_UrRiBaC73OrJLvLza4u)
* [MIT App Inventor 2 Tutorial For Complete Beginners BY Computer Time](https://www.youtube.com/watch?v=iU10J3x7iRc)

* Emulator
  * [How To Install Emulator for MIT App Inventor 2 | Use of Emulator in App Inventor 2 BY The Coding Bus](https://www.youtube.com/watch?v=KvXde24Nk98)
