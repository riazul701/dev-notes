# Qt-App-In-GTK-DE.md

* Qt window based application in GTK desktop environment.

# Qt App Menu Is Small

## Qt window menu is small in LXDE <sup>ChatGPT</sup>

* If your Qt apps (like Double Commander or others) have very small window menus, fonts, or icons on LXDE, this is a common issue — LXDE is GTK-based and doesn't configure Qt theming or DPI settings by default.

* Here’s how to fix the tiny menus and fonts in Qt apps under LXDE:

**✅ Fix 1: Install and configure qt5ct**

* `qt5ct` allows you to control Qt5/Qt6 appearance independently of the desktop.

* 📦 Step 1: Install it
  * On Fedora:
  ```bash
  sudo dnf install qt5ct
  ```
  * On Debian/Ubuntu:
  ```bash
  sudo apt install qt5ct
  ```

* 🛠️ Step 2: Tell Qt apps to use qt5ct
  * Add this environment variable to your session startup:
  ```bash
  export QT_QPA_PLATFORMTHEME=qt5ct
  ```
  * To apply it:
    * Add it to `~/.profile`, `~/.xsession`, or `~/.xinitrc` (depending on how you start LXDE).
    * Or, for temporary testing, just run in terminal before launching the app:
    ```bash
    QT_QPA_PLATFORMTHEME=qt5ct doublecmd-qt
    ```

* 🎨 Step 3: Launch `qt5ct` and configure
```bash
qt5ct
```
  * In the GUI:
    * Go to Fonts tab → Increase font size (e.g., 10pt or 11pt)
    * Go to Appearance tab → Choose a theme (Fusion is common)
    * Go to Icons tab → Pick an icon theme if needed
  * Click Apply, then restart your Qt apps.

**✅ Fix 2: Set Qt DPI manually (optional)**

* If fonts are still too small, manually set DPI:
```bash
export QT_SCALE_FACTOR=1.5
```

* Or:
```bash
export QT_FONT_DPI=96
```

* Test with:
```bash
QT_SCALE_FACTOR=1.5 doublecmd-qt
```

**🧠 Summary**

* Title: Problem => Solution
* Tiny menus in Qt apps => Install and configure `qt5ct`
* No theme/font control in LXDE => `QT_QPA_PLATFORMTHEME=qt5ct`
* Still too small? => Use `QT_SCALE_FACTOR=1.5` or `QT_FONT_DPI=96`

* Would you like me to generate a `.desktop` launcher that applies these fixes automatically when launching Qt apps?

## Generate double commander `.desktop` launcher <sup>ChatGPT</sup>

**ChatGPT: (Reply) "generate a `.desktop` launcher" => (Question) "double commander"**

* Here’s how to create a `.desktop` launcher for Double Commander (Qt version) on LXDE/Linux, with the correct environment variables to fix the tiny fonts/menus issue.

**✅ Step-by-Step: Create a `.desktop` Launcher**

* 📄 1. Create the launcher file
  * Open a terminal and run:
  ```bash
  nano ~/.local/share/applications/doublecmd-qt.desktop
  ```
  * Paste this into the file:
  ```bash
  [Desktop Entry]
  Name=Double Commander (Qt, Fixed UI)
  Exec=env QT_QPA_PLATFORMTHEME=qt5ct QT_SCALE_FACTOR=1.5 doublecmd-qt
  Icon=doublecmd
  Type=Application
  Categories=Utility;FileManager;
  StartupNotify=true
  Terminal=false
  ```
  * 🔧 You can adjust `QT_SCALE_FACTOR=1.5` to `1.25` or `2.0` depending on your screen.

* 💾 2. Save and close
  * Press `Ctrl+O` → `Enter` to save
  * Press `Ctrl+X` to exit nano

* 🧪 3. Make sure the launcher is visible in LXDE menu
  * LXDE will pick it up automatically from `~/.local/share/applications`. You can now:
    * Open the menu > Accessories or File Managers
    * Look for "Double Commander (Qt, Fixed UI)"
    * Right-click > Add to desktop or Add to panel if desired

**✅ Now when you launch it, it will:**

* Use `qt5ct` settings for themes and fonts
* Scale menus and UI properly (no more tiny text)

* Would you like a similar `.desktop` file for another app like `qBittorrent`, `Okular`, or `VLC`?
