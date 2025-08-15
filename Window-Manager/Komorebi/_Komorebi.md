# Important

* Start Komorebi From Yasb: Start Yasb App -> Tray Icon -> Right Click -> Komorebi -> Start Komorebi / Stop Komorebi / Reload Komorebi

* `Ctrl + Alt + Left/Up/Right/Down-Arrow` changes display orientation/direction.
  * To turn it off goto Desktop -> Right Click -> Graphics Options -> Hot Keys -> Disable

# Komorebi.md

## PATH

# Installation

## `scoop` Package Manager

* `scoop bucket add extras` : First add the extras bucket <sup>{1}</sup>

* `scoop install komorebi whkd` : Then install the `komorebi` and `whkd` packages using `scoop install` <sup>{1}</sup>

* `komorebic --version` : Check komorebi version <sup>{1}</sup>

# Configuration

## Downloading example configurations

* Run the following command to download example configuration files for `komorebi` and `whkd`. Pay attention to the output of the command to see where the example files have been downloaded. For most new users this will be in the `$Env:USERPROFILE` directory.
```
komorebic quickstart
```

* With the example configurations downloaded, you can now start `komorebi`, `komorebi-bar` and `whkd`.
```
komorebic start --whkd --bar
```
  * Without `komorebi-bar`
  ```
  komorebic start --whkd --bar
  ```

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

# References

* next-sl: {5}

## Websites

* {1} [lgug2z.github.io/komorebi](https://lgug2z.github.io/komorebi/)
* {2} [LGUG2Z/komorebi GitHub](https://github.com/LGUG2Z/komorebi)
* {4} [LGUG2Z/whkd GitHub](https://github.com/LGUG2Z/whkd)
* {3} [LGUG2Z/awesome-komorebi GitHub](https://github.com/LGUG2Z/awesome-komorebi)

* Tutorials
  * [QuinnCiccoretti/komorebi.ahk => i3-like configuration for the komorebi window manager](https://gist.github.com/QuinnCiccoretti/d22230303ad08f6247dfce48d46d9914)

## YouTube Tutorials

* 
