# Windows-Notification.md

# Concept

> ChatGPT Question:
> 
> In windows 10, create test notification

Windows 10 doesn't include a built-in command specifically for generating a test toast notification, but you have several easy options.

***### Option 1: PowerShell (recommended)***

Open **PowerShell** and run:

```powershell
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] > $null

$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml(@"
<toast>
  <visual>
    <binding template="ToastGeneric">
      <text>Test Notification</text>
      <text>This is a Windows 10 test toast.</text>
    </binding>
  </visual>
</toast>
"@)

$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("PowerShell")
$notifier.Show($toast)
```

***### Option 2: BurntToast PowerShell module***

Install the module (once):

```powershell
Install-Module BurntToast -Scope CurrentUser
```

Then create a notification:

```powershell
Import-Module BurntToast
New-BurntToastNotification -Text "Test Notification", "This is a test."
```

***### Option 3: Using Command Prompt (requires PowerShell)***

From **cmd.exe**:

```cmd
powershell -Command "Import-Module BurntToast; New-BurntToastNotification -Text 'Test Notification','Hello from CMD'"
```

***### If nothing appears***

Check these settings:

* **Settings → System → Notifications & actions** → Ensure **Notifications** are turned **On**.
* Make sure **Focus Assist** is **Off**.
* Check the **Notification Center** (Win + A) in case the toast was dismissed.

If your goal is to test notifications from a specific application or for scripting/automation, let me know that context and I can suggest the most appropriate method.

# References

## Websites

* [PowerShell Gallery](https://www.powershellgallery.com/)
* [Windos/BurntToast GitHub](https://github.com/Windos/BurntToast)
