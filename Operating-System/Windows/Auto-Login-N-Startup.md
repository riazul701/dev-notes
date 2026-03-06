# Auto-Login-N-Startup.md

# Windows-10

## PasswordLess Login

### Google AI: "windows auto login without password"

To enable automatic login on Windows 10 or 11, you typically use the netplwiz tool. However, in newer versions of Windows, Microsoft often hides the necessary checkbox for security reasons, requiring a small Registry tweak to bring it back. [1, 2, 3] 
Step 1: Reveal the Auto-Login Checkbox (If Missing)
If you already see the "Users must enter a username and password..." checkbox in Step 2, skip this. [4, 5] 

   1. Press Win + R, type regedit, and hit Enter.
   2. Navigate to: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device.
   3. Double-click DevicePasswordLessBuildVersion and change its value from 2 to 0.
   4. Close the Registry Editor. [1, 3, 6, 7, 8] 

Step 2: Configure Automatic Login [7] 

   1. Press Win + R, type netplwiz, and hit Enter.
   2. In the User Accounts window, select the user account you want to log in automatically.
   3. Uncheck the box labeled: "Users must enter a user name and password to use this computer".
   4. Click Apply.
   5. A window will appear asking for that user's password. Enter the password twice and click OK.
   * Note: If using a Microsoft account, enter your full email address as the username.
   6. Click OK on the main window and restart your PC to test. [2, 3, 6, 9, 10, 11, 12, 13] 

Alternative: Use Microsoft Autologon (Sysinternals) [9, 14] 
Microsoft offers a standalone official tool called [Autologon](https://learn.microsoft.com/en-us/sysinternals/downloads/autologon) that automates this process and encrypts your credentials in the registry for better security than manual entry. [14, 15, 16, 17] 
Important Considerations

* Security Risk: Enabling auto-login allows anyone with physical access to your device to bypass your security.
* Windows Hello: For this to work, you may need to disable "Only allow Windows Hello sign-in" under Settings > Accounts > Sign-in options.
* Wake from Sleep: Auto-login only works for a fresh boot or restart. To skip the password after waking from sleep, go to Settings > Accounts > Sign-in options and set "If you've been away..." to Never. [1, 2, 18, 19, 20, 21, 22] 

Are you using a Microsoft account or a Local account, as the steps for the username field can vary slightly?

[1] [https://www.ionos.com](https://www.ionos.com/digitalguide/server/configuration/windows-11-automatic-login/)
[2] [https://support.lenovo.com](https://support.lenovo.com/nz/en/solutions/ht503518-how-to-remove-login-password-from-windows-10)
[3] [https://www.lifewire.com](https://www.lifewire.com/how-do-i-auto-login-to-windows-2626066)
[4] [https://www.bennetrichter.de](https://www.bennetrichter.de/en/tutorials/windows-autologin/#:~:text=Enable%20automatic%20login%20Press%20Windows%20Key%20+,use%20this%20computer%22%20above%20the%20user%20list.)
[5] [https://gist.github.com](https://gist.github.com/andygock/6b3a18bc4918e68e10829b35e94eaeb7)
[6] [https://www.youtube.com](https://www.youtube.com/watch?v=Z8N_YUK_DSw)
[7] [https://www.ionos.com](https://www.ionos.com/digitalguide/server/configuration/windows-10-automatic-login/)
[8] [https://community.spiceworks.com](https://community.spiceworks.com/t/how-to-enable-auto-login-on-windows-11-23h2/1068140#:~:text=Navigate%20to%20Computer%5CHKEY_LOCAL_MACHINE%5CSOFTWARE%5CMicrosoft%5CWindows%20NT%5CCurrentVersion%5CPasswordLess%5CDevice%20.)
[9] [https://www.bennetrichter.de](https://www.bennetrichter.de/en/tutorials/windows-autologin/)
[10] [https://www.youtube.com](https://www.youtube.com/watch?v=-uVST_2iNjY)
[11] [https://support.ashampoo.com](https://support.ashampoo.com/hc/en-us/articles/360016282173-How-to-enable-Auto-Login-in-Windows-10)
[12] [https://www.youtube.com](https://www.youtube.com/watch?v=UjJYXdg8d-k&t=67)
[13] [https://www.reddit.com](https://www.reddit.com/r/Windows10/comments/181cbaz/how_to_setup_auto_login/)
[14] [https://learn.microsoft.com](https://learn.microsoft.com/en-us/answers/questions/750354/windows-10-auto-login-without-registry)
[15] [https://learn.microsoft.com](https://learn.microsoft.com/en-us/sysinternals/downloads/autologon)
[16] [https://4sysops.com](https://4sysops.com/archives/windows-auto-login-without-password/)
[17] [https://woshub.com](https://woshub.com/how-to-disable-password-login-in-windows-10/#:~:text=The%20Autologon%20is%20available%20for%20download%20from,as%20part%20of%20the%20Sysinternals%20toolset%20%28https://learn.microsoft.com/en%2Dus/sysinternals/downloads/autologon%29.)
[18] [https://www.reddit.com](https://www.reddit.com/r/Windows10/comments/1k976lq/how_can_i_have_my_pc_auto_sign_in_i_dont_want_a/#:~:text=I%20don%27t%20think%20you%20understand%20the%20security,you%20sit%20in%20front%20of%20the%20camera%29)
[19] [https://www.youtube.com](https://www.youtube.com/watch?v=Ptb7OsAyab0)
[20] [https://support.microsoft.com](https://support.microsoft.com/en-us/windows/go-passwordless-in-windows-585a71d7-2295-4878-aeac-a014984df856)
[21] [https://www.ionos.ca](https://www.ionos.ca/digitalguide/server/configuration/windows-10-automatic-login/)
[22] [https://superuser.com](https://superuser.com/questions/1706978/how-to-disable-auto-login-in-windows-11)

# Applications

## Google Chrome / PangoBright

### ChatGPT: "auto start google chrome during login"

To **auto-start Google Chrome at login**, follow the steps for your operating system:

---

## 🪟 Windows (10 / 11)

### Method 1: Startup Folder (Simple)

1. Press **Win + R**
2. Type: `shell:startup`
3. Press **Enter**
4. In the folder that opens, right-click → **New → Shortcut**
5. Browse to:

   ```
   C:\Program Files\Google\Chrome\Application\chrome.exe
   ```

   (or `Program Files (x86)` if installed there)
6. Click **Next → Finish**

Chrome will now open automatically when you log in.

---

### Method 2: Task Manager

1. Press **Ctrl + Shift + Esc**
2. Go to **Startup** tab
3. Find **Google Chrome**
4. Click **Enable**

---

## 🍎 macOS

1. Click **Apple Menu → System Settings**
2. Go to **General → Login Items**
3. Click **+**
4. Select **Google Chrome**
5. Click **Open**

Chrome will launch when you log in.

---

## 🐧 Linux (Ubuntu example)

1. Open **Startup Applications**
2. Click **Add**
3. Name: `Google Chrome`
4. Command:

   ```
   google-chrome
   ```
5. Click **Add**

---

## 🚀 Optional: Open Specific Website Automatically

If you want Chrome to open a specific website at startup:

1. Open Chrome
2. Go to **Settings → On startup**
3. Select:

   * **Open a specific set of pages**
4. Add your website URL

---

If you'd like, tell me your OS version and I can give more exact steps.

