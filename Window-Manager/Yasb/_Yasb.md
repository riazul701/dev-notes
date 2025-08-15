## Important

* Enable Autostart: Start Yasb App -> Tray Icon -> Right Click -> Enable Autostart

* Configuration Reload: Start Yasb App -> Tray Icon -> Right Click -> Reload YASB

* Get Configuration: Start Yasb App -> Tray Icon -> Right Click -> Get Themes

# Yasb.md

## PATH

* Yasb log file path : `~/.config/yasb/yasb.log`

# Installation

## `scoop` Package Manager

* [https://scoop.sh/#/apps?q=yasb](https://scoop.sh/#/apps?q=yasb)

* `scoop bucket add LucasOe_scoop-lucasoe https://github.com/LucasOe/scoop-lucasoe`

* `scoop install LucasOe_scoop-lucasoe/yasb`
  * Installation Message:
  * Create the directory C:/Users/{usrename}/.config/yasb/ and copy styles.css and config.yaml into folder. When you update files, always check styles.css and config.yaml for new features and changes; otherwise, your config can be broken.

# Configuration

## [Configure Startup Applications in Windows](https://support.microsoft.com/en-us/windows/configure-startup-applications-in-windows-115a420a-0bff-4a6f-90e0-1934c844e473)

**Configure startup applications from Settings**

* In the Settings app  on your Windows device, Apps > Startup or use the following shortcut: `ms-settings:startupapps`

* For any of the applications in the list
  * set the toggle to On to start the app automatically when you sign in
  * set the toggle to Off to prevent the app from starting automatically

* If you want to change the advanced settings for that app, select the chevron  and make changes as desired

* If the app that you want to configure isn't listed in the startup list, you can configure its startup from File Explorer.

**Configure startup applications from Task Manager**

* The Task Manager provides the same list of startup applications offered by Settings. You can configure the applications that run at startup with both tools, but they present the information slightly differently.

* The Task Manager provides a more detailed view, including the impact each app has on the startup process. This can be particularly useful for troubleshooting performance issues during system startup.

* Right-click on Start  and select Task Manager

* Select the Startup apps tab

* Select the app that you want to configure
  * Select Enable to start the app automatically when you sign in
  * Select Disable to prevent the app from starting automatically

* Task Manager shows the impact of each of the apps have on your startup experience:
  * None : Startup app is disabled
  * Not Measured : No data available to measure the startup app, startup app is enabled
  * Low Impact : Total CPU usage takes less than 300 milliseconds and total disk usage is less than 292 kilobytes
  * Medium Impact : Total CPU usage takes less than 1 second but more than 300 milliseconds or total disk usage is less than 3 megabytes but more than 292 kilobytes
  * High Impact : Total CPU usage takes more than 1 second or total disk usage is more than 3 megabytes

* If the app that you want to configure isn't listed in the startup list, you can configure its startup from File Explorer.

**Configure startup applications from File Explorer**

* For applications that aren't registered in Windows with a startup task, you can use File Explorer. The process consists of copying or creating a shortcut to the app's executable to either one of these folders:

  * `shell:startup` if you are configuring the startup behavior for the current user
  ```
  Note: the path corresponds to %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
  ```
  * `shell:common startup` if you are configuring the startup behavior for all users using the device
  ```
  Note: the path corresponds to %ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup
  ```

* Here are the steps:

  * Right-click on Start  and select Run
  * In the Run dialog box, type `shell:appsfolder` and select Enter
    * A File Explorer window opens, containing a list of all applications installed on the device. Keep this first window open
  * Right-click on Start  and select Run
  * In the Run dialog box, type either `shell:startup` or `shell:common startup` and select Enter
    * A second File Explorer window opens, containing a list of applications that start automatically when a user signs in
  * Drag and drop the applications that you want to start automatically from the first window to the second one

* If you want to remove applications from the startup folder, delete the links from the second window.

# Error and Solution

## Fonts Missing Error

**Error_Message_1:**

* Some fonts specified in your stylesheet are not installed on your system, some icons or symbols may not be visible or may not display correctly.

* Please install the missing fonts.

* [JetBrainsMono NFP](https://www.nerdfonts.com/font-downloads)
* Segoe Fluent Icons
* Geneva

**Solution_1:**

* Download [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip)
  * Extract zip file

* Right-click on Start  and select Run

* In the Run dialog box, type `fonts` and select Enter
  * This will open location `C:\Windows\Fonts`

* Paste downloaded fonts

# References

## Websites

* [amnweb/yasb GitHub](https://github.com/amnweb/yasb)
* [amnweb/yasb-themes GitHub](https://github.com/amnweb/yasb-themes)
