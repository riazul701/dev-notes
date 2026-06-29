# Internet-Usage.md

## Notes

* There are two wifi - regular/broadband and metered/sim
  * When there is no internet in broadband wifi then update "no-broadband-internet" status in FireBase using sim internet via computer
  * When internet is restored in broadband wifi then update "restored-broadband-internet" status in FireBase using broadband internet via android mobile. Then connect computer to broadband wifi.

# Usage Logs And Switch Wifi

## Linux Data Usage Logs And Switch Wifi

**ChatGPT Question: "On fedora os using bash create service to log wifi ssid based internet usage using sqlite database and switch to metered wifi with password if available and regular wifi does not have internet. Also block websites like youtube and applications like free download manager using firewalld on that metered wifi. Again reconnect to regular wifi if metered wifi is unavailable and unblock blocked websites and applications which were blocked by using firewalld."**

* You're looking for a Bash script on Fedora OS to:
  * 1. Log internet usage per Wi-Fi SSID into an SQLite database.
  * 2. Switch to a metered Wi-Fi (with password) if the regular Wi-Fi has no internet.
  * 3. While on metered Wi-Fi:
    * Block sites like YouTube.
    * Block applications like Free Download Manager using firewalld.
  * 4. Switch back to the regular Wi-Fi if available, and revert firewall changes.

* 🧩 Solution Overview
  * 🔧 Requirements
    * SQLite: For logging.
    * nmcli: For managing Wi-Fi connections.
    * firewalld: To block domains/apps.
    * iptables/nftables (via firewalld): For app port blocking.
    * dnsmasq (optional): To block DNS resolution of domains.

* 🛠️ Step-by-Step Setup

* ✅ 1. Define Configs
```bash
#!/bin/bash

DB_PATH="$HOME/wifi_usage.db"
REGULAR_SSID="HomeNetwork"
METERED_SSID="MobileHotspot"
METERED_PASSWORD="YourHotspotPassword"
CHECK_HOST="8.8.8.8"
BLOCKED_DOMAINS=("youtube.com" "www.youtube.com")
BLOCKED_APP="fdm"  # Assumes process name is "fdm"
```

* ✅ 2. Initialize SQLite DB
```bash
init_db() {
  if [ ! -f "$DB_PATH" ]; then
    sqlite3 "$DB_PATH" "CREATE TABLE usage_log (timestamp TEXT, ssid TEXT, bytes_in INTEGER, bytes_out INTEGER);"
  fi
}
```

* ✅ 3. Get Current Wi-Fi SSID
```
get_ssid() {
  nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2
}
```

* ✅ 4. Log Network Usage
```bash
log_usage() {
  local ssid=$(get_ssid)
  local rx_bytes=$(cat /sys/class/net/w*/statistics/rx_bytes)
  local tx_bytes=$(cat /sys/class/net/w*/statistics/tx_bytes)
  local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  sqlite3 "$DB_PATH" "INSERT INTO usage_log VALUES ('$timestamp', '$ssid', $rx_bytes, $tx_bytes);"
}
```

* ✅ 5. Internet Check
```bash
has_internet() {
  ping -c 1 -W 1 "$CHECK_HOST" > /dev/null 2>&1
}
```

* ✅ 6. Connect to Wi-Fi
```bash
connect_wifi() {
  local ssid="$1"
  local password="$2"

  if nmcli -t -f NAME con show | grep -q "^$ssid$"; then
    nmcli con up "$ssid"
  else
    nmcli dev wifi connect "$ssid" password "$password"
  fi
}
```

* ✅ 7. Block Resources (Domains + App)
```bash
block_resources() {
  echo "Blocking domains and applications..."

  for domain in "${BLOCKED_DOMAINS[@]}"; do
    firewall-cmd --permanent --add-rich-rule="rule family='ipv4' destination address=$domain reject"
  done

  # Block Free Download Manager by killing it and blocking common download ports
  pkill -f "$BLOCKED_APP"
  firewall-cmd --permanent --add-port=80/tcp --add-port=443/tcp --remove-port=80/tcp --remove-port=443/tcp --add-rich-rule="rule family=ipv4 source address=0.0.0.0/0 service name='http' reject"
  firewall-cmd --reload
}
```

* ✅ 8. Unblock Resources
```bash
unblock_resources() {
  echo "Unblocking domains and applications..."

  for domain in "${BLOCKED_DOMAINS[@]}"; do
    firewall-cmd --permanent --remove-rich-rule="rule family='ipv4' destination address=$domain reject"
  done

  firewall-cmd --permanent --remove-rich-rule="rule family=ipv4 source address=0.0.0.0/0 service name='http' reject"
  firewall-cmd --reload
}
```

* ✅ 9. Main Loop Logic
```bash
main_loop() {
  init_db

  while true; do
    log_usage

    current_ssid=$(get_ssid)

    if ! has_internet; then
      if [ "$current_ssid" != "$METERED_SSID" ]; then
        echo "No internet. Switching to metered Wi-Fi..."
        connect_wifi "$METERED_SSID" "$METERED_PASSWORD"
        sleep 10
        block_resources
      fi
    else
      if [ "$current_ssid" == "$METERED_SSID" ]; then
        echo "Metered has internet. Checking for regular Wi-Fi..."
        connect_wifi "$REGULAR_SSID"
        sleep 10
        if has_internet; then
          unblock_resources
        else
          echo "Sticking with metered Wi-Fi..."
          connect_wifi "$METERED_SSID" "$METERED_PASSWORD"
        fi
      elif [ "$current_ssid" == "$REGULAR_SSID" ]; then
        unblock_resources
      fi
    fi

    sleep 60
  done
}
```

* 🚀 10. Run Script as a Service
  * Create a systemd service to run it in background.
  * 🔹 Create script
    * Save as /usr/local/bin/wifi_monitor.sh and make executable:
```bash
chmod +x /usr/local/bin/wifi_monitor.sh
```
  * 🔹 Create systemd service
```ini
# /etc/systemd/system/wifi-monitor.service

[Unit]
Description=Wi-Fi Monitor and Usage Logger
After=network.target

[Service]
ExecStart=/usr/local/bin/wifi_monitor.sh
Restart=always
User=your_username
Environment=DISPLAY=:0

[Install]
WantedBy=multi-user.target
```
  * Then:
```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now wifi-monitor.service
```

* 🛑 Notes and Caveats
  * Domain blocking via firewalld using hostnames doesn't always resolve unless DNS-based blocking is used (e.g., via `dnsmasq` or `iptables` + IPs).
  * App blocking can be more robust with `cgroups` or `auditd`, but `pkill` and port filtering can suffice.
  * You can enhance with GeoIP or more intelligent bandwidth tracking via `vnstat`.

* Would you like me to generate the actual service file and ready-to-run script zip for download?

**ChatGPT => Reply: "generate the actual service file" => Question: "fedora os"**

* Great — you’re asking for the actual systemd service file to run the Fedora bash script (for Wi-Fi monitoring and firewall control) as a background service.

* ✅ Assumptions
  * Let's assume you have:
    * The script saved at: `/usr/local/bin/wifi_monitor.sh`
    * The script is executable:
```bash
sudo chmod +x /usr/local/bin/wifi_monitor.sh
```

* 📝 Step 1: Create systemd Service File
  * Create a service file at:
```bash
sudo nano /etc/systemd/system/wifi-monitor.service
```
  * Paste the following content:
```ini
[Unit]
Description=Wi-Fi Monitor and Usage Logger
After=network.target
Requires=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/wifi_monitor.sh
Restart=always
RestartSec=10
User=your_username
Environment=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[Install]
WantedBy=multi-user.target
```
  * 🔁 Replace `your_username` with your Fedora username.

* 🟢 Step 2: Reload and Enable the Service
```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now wifi-monitor.service
```

* ✅ Commands to Manage the Service
```bash
sudo systemctl status wifi-monitor.service      # Check status
sudo systemctl restart wifi-monitor.service     # Restart
sudo journalctl -u wifi-monitor.service -f      # View live logs
```

* 🛠 Optional: Log Output to a File
  * If you want output logged to a file, modify your script to redirect logs:
```bash
#!/bin/bash

exec >> /var/log/wifi_monitor.log 2>&1
echo "Starting wifi_monitor.sh at $(date)"

# rest of your script...
```
  * Make sure the script has permission to write to that log:
```bash
sudo touch /var/log/wifi_monitor.log
sudo chown your_username:your_username /var/log/wifi_monitor.log
```

* Would you like a `.tar.gz` or `.zip` containing the script and service file ready to install?

## Windows Data Usage Logs And Switch Wifi

**ChatGPT Question: "On windows os using powershell create service to log wifi ssid based internet usage using sqlite database and switch to metered wifi with password if available and regular wifi does not have internet. Also block websites like youtube and applications like free download manager using firewall on that metered wifi. Again reconnect to regular wifi if metered wifi is unavailable and unblock blocked websites and applications which were blocked by using firewall."**

* You're asking for a fairly advanced PowerShell-based Windows script to:
  * 1. Monitor Wi-Fi SSID and log internet usage into an SQLite database.
  * 2. Automatically switch to a metered connection (with credentials) if the current one doesn't have internet.
  * 3. Apply firewall rules to block specific websites and applications (like YouTube and FDM) while on metered connection.
  * 4. Revert to the regular connection if the metered one goes down and restore internet access.

* This is a complex but doable solution. Here's how we can break it down and script it in PowerShell. The plan:

* 🧩 Breakdown

* ✅ Prerequisites
  * SQLite: Use `System.Data.SQLite` or `sqlite3.exe`.
  * Network Checks: Use `Test-Connection` or check if DNS resolves.
  * Firewall Control: Use `New-NetFirewallRule`, `Remove-NetFirewallRule`.
  * Wi-Fi Switching: Use `netsh wlan connect`.
  * SSID & Usage Logging: Periodically check SSID, network stats, and log into SQLite.

* 🛠️ Step-by-Step PowerShell Script
  * Let’s outline the code for each part.

  * 🔸 1. Define Variables
```powershell
$RegularSSID = "HomeNetwork"
$MeteredSSID = "MobileHotspot"
$MeteredPassword = "your_hotspot_password"
$DatabasePath = "$env:USERPROFILE\wifi_usage.db"
$BlockedApp = "fdm.exe"
$BlockedSites = @("youtube.com", "www.youtube.com")
```

  * 🔸 2. Initialize SQLite Database (Once)
```powershell
if (-not (Test-Path $DatabasePath)) {
    sqlite3.exe $DatabasePath "CREATE TABLE usage_log (timestamp TEXT, ssid TEXT, bytes_in INTEGER, bytes_out INTEGER);"
}
```

  * 🔸 3. Get Current Wi-Fi SSID
```powershell
function Get-CurrentSSID {
    $output = netsh wlan show interfaces
    if ($output -match "^\s*SSID\s*:\s*(.+)$") {
        return $matches[1].Trim()
    }
    return $null
}
```

  * 🔸 4. Log Usage to SQLite
```powershell
function Log-NetworkUsage {
    $ssid = Get-CurrentSSID
    $netStats = Get-NetAdapterStatistics | Where-Object {$_.Name -like "*Wi-Fi*"}
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    if ($netStats) {
        $bytesIn = $netStats.ReceivedBytes
        $bytesOut = $netStats.SentBytes
        sqlite3.exe $DatabasePath "INSERT INTO usage_log VALUES ('$timestamp', '$ssid', $bytesIn, $bytesOut);"
    }
}
```

  * 🔸 5. Test Internet Connectivity
```powershell
function Has-Internet {
    try {
        $ping = Test-Connection -Count 1 -ComputerName 8.8.8.8 -Quiet -ErrorAction SilentlyContinue
        return $ping
    } catch {
        return $false
    }
}
```
 
  * 🔸 6. Switch to Metered Wi-Fi
```powershell
function Connect-To-Metered {
    netsh wlan connect name="$MeteredSSID"
    Start-Sleep -Seconds 10
}
```

  * 🔸 7. Switch Back to Regular Wi-Fi
```powershell
function Connect-To-Regular {
    netsh wlan connect name="$RegularSSID"
    Start-Sleep -Seconds 10
}
```

  * 🔸 8. Block Apps & Sites
```powershell
function Block-MeteredResources {
    New-NetFirewallRule -DisplayName "Block YouTube" -Direction Outbound -Action Block -RemoteAddress "youtube.com", "www.youtube.com" -Protocol TCP
    New-NetFirewallRule -DisplayName "Block FDM" -Direction Outbound -Action Block -Program "C:\Program Files\FreeDownloadManager.ORG\Free Download Manager\fdm.exe"
}
```

  * 🔸 9. Unblock
```powershell
function Unblock-MeteredResources {
    Get-NetFirewallRule -DisplayName "Block YouTube" | Remove-NetFirewallRule
    Get-NetFirewallRule -DisplayName "Block FDM" | Remove-NetFirewallRule
}
```

* 🔁 10. Main Loop Script (Run as Scheduled Task or Service)
```powershell
$LastSSID = ""

while ($true) {
    $currentSSID = Get-CurrentSSID
    $internet = Has-Internet

    if (-not $internet) {
        if ($currentSSID -ne $MeteredSSID) {
            Connect-To-Metered
            Start-Sleep -Seconds 5
            Block-MeteredResources
        }
    } else {
        if ($currentSSID -eq $MeteredSSID) {
            # Metered has internet, but check if regular is back
            Connect-To-Regular
            Start-Sleep -Seconds 5
            if (Has-Internet) {
                Unblock-MeteredResources
            } else {
                # Fallback to metered
                Connect-To-Metered
                Block-MeteredResources
            }
        } elseif ($currentSSID -eq $RegularSSID) {
            Unblock-MeteredResources
        }
    }

    Log-NetworkUsage
    Start-Sleep -Seconds 60
}
```

* 🔁 Running as a Windows Service
  * 1. Create a .ps1 file with all the above code.
  * 2. Use NSSM or Task Scheduler to run it in background.
  * Example (with NSSM):
```powershell
nssm install WifiManager "powershell.exe" "-ExecutionPolicy Bypass -File C:\Path\To\Script.ps1"
```

* 🛑 Note on Limitations
  * Blocking websites by domain via firewall is not always reliable (DNS-based filtering requires more advanced firewall like Windows Defender Firewall with IP rules or use of proxies).
  * Free Download Manager path must be adjusted based on install.
  * Metered Wi-Fi tag isn't required to set explicitly but can be done via registry if needed.

* Would you like me to generate a fully ready `.ps1` script file for you or help with setting it up as a service?

**ChatGPT => Reply: "generate a fully ready `.ps1` script file" => Question: "for windows os"**

* Here's a ready-to-use PowerShell script for Windows OS that:
  * ✅ Logs Wi-Fi SSID-based internet usage into a SQLite database
  * ✅ Switches to a metered Wi-Fi if regular Wi-Fi has no internet
  * ✅ Blocks YouTube and Free Download Manager (FDM) when on metered Wi-Fi
  * ✅ Reconnects to regular Wi-Fi when available and unblocks previously blocked items

* 📁 File: `WiFiMonitor.ps1`
```powershell
# WiFiMonitor.ps1

# Configuration
$RegularSSID = "HomeNetwork"
$MeteredSSID = "MobileHotspot"
$MeteredPassword = "YourHotspotPassword"
$DatabasePath = "$env:USERPROFILE\wifi_usage.db"
$BlockedSites = @("youtube.com", "www.youtube.com")
$BlockedApp = "fdm.exe"
$CheckHost = "8.8.8.8"

# Function: Initialize SQLite database
function Initialize-Database {
    if (-not (Test-Path $DatabasePath)) {
        sqlite3.exe $DatabasePath "CREATE TABLE usage_log (timestamp TEXT, ssid TEXT, bytes_in INTEGER, bytes_out INTEGER);"
    }
}

# Function: Get current Wi-Fi SSID
function Get-CurrentSSID {
    $wifiInfo = netsh wlan show interfaces
    if ($wifiInfo -match "^\s*SSID\s*:\s*(.+)$") {
        return $matches[1].Trim()
    }
    return $null
}

# Function: Log network usage
function Log-NetworkUsage {
    $ssid = Get-CurrentSSID
    $stats = Get-NetAdapterStatistics | Where-Object { $_.Name -like "*Wi-Fi*" }
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    if ($stats) {
        $bytesIn = $stats.ReceivedBytes
        $bytesOut = $stats.SentBytes
        sqlite3.exe $DatabasePath "INSERT INTO usage_log VALUES ('$timestamp', '$ssid', $bytesIn, $bytesOut);"
    }
}

# Function: Check for internet connectivity
function Has-Internet {
    return Test-Connection -ComputerName $CheckHost -Count 1 -Quiet -ErrorAction SilentlyContinue
}

# Function: Connect to specified Wi-Fi
function Connect-ToWiFi($ssid, $password = "") {
    if ($password) {
        netsh wlan connect name="$ssid"
    } else {
        netsh wlan connect name="$ssid"
    }
    Start-Sleep -Seconds 10
}

# Function: Block sites and apps
function Block-MeteredResources {
    foreach ($site in $BlockedSites) {
        New-NetFirewallRule -DisplayName "Block $site" -Direction Outbound -RemoteFQDN $site -Action Block -Enabled True
    }
    $appPath = Get-Process -Name ($BlockedApp -replace "\.exe$","") -ErrorAction SilentlyContinue | Select-Object -First 1 | ForEach-Object { $_.Path }
    if ($appPath) {
        New-NetFirewallRule -DisplayName "Block FDM App" -Direction Outbound -Program $appPath -Action Block -Enabled True
        Stop-Process -Name ($BlockedApp -replace "\.exe$","") -Force -ErrorAction SilentlyContinue
    }
}

# Function: Unblock sites and apps
function Unblock-MeteredResources {
    Get-NetFirewallRule -DisplayName "Block *" | Where-Object {
        $_.DisplayName -like "Block youtube*" -or $_.DisplayName -eq "Block FDM App"
    } | Remove-NetFirewallRule
}

# MAIN LOOP
Initialize-Database
$LastSSID = ""

while ($true) {
    $currentSSID = Get-CurrentSSID
    $internetAvailable = Has-Internet

    if (-not $internetAvailable) {
        if ($currentSSID -ne $MeteredSSID) {
            Connect-ToWiFi -ssid $MeteredSSID -password $MeteredPassword
            Block-MeteredResources
        }
    } else {
        if ($currentSSID -eq $MeteredSSID) {
            Connect-ToWiFi -ssid $RegularSSID
            if (Has-Internet) {
                Unblock-MeteredResources
            } else {
                Connect-ToWiFi -ssid $MeteredSSID -password $MeteredPassword
                Block-MeteredResources
            }
        } elseif ($currentSSID -eq $RegularSSID) {
            Unblock-MeteredResources
        }
    }

    Log-NetworkUsage
    Start-Sleep -Seconds 60
}
```

* 🧰 Setup Instructions
  * 1. 📦 Install Prerequisites
    * Download SQLite command-line tool (`sqlite3.exe`) and place it in a folder like `C:\sqlite\sqlite3.exe`
    * Ensure the folder is added to your `PATH`
  * 2. 🧪 Edit the Script
    * Update:
      * `$RegularSSID`, `$MeteredSSID`, `$MeteredPassword`
      * Adjust `BlockedSites` and `BlockedApp` as needed
  * 3. 🧷 Save the Script
    * Save as:
      * 📄 `C:\WiFiManager\WiFiMonitor.ps1`

* 🔁 Set as a Scheduled Task or Service

  * Option A: Task Scheduler
    * 1. Open Task Scheduler
    * 2. Create new task:
      * Trigger: At startup
      * Action:
        * Program: `powershell.exe`
        * Args: `-ExecutionPolicy Bypass -File "C:\WiFiManager\WiFiMonitor.ps1"`
    * 3. Set to run whether user is logged in or not

  * Option B: NSSM (Windows Service)
    * 1. [Download NSSM](https://nssm.cc/download)
    * 2. Install service:
```cmd
nssm install WiFiManager "powershell.exe" "-ExecutionPolicy Bypass -File C:\WiFiManager\WiFiMonitor.ps1"
nssm start WiFiManager
```

* ✅ Result
  * Logs internet usage by SSID every 60 seconds
  * Automatically switches to metered Wi-Fi if no internet on regular
  * Blocks YouTube and FDM on metered Wi-Fi
  * Reverts when regular Wi-Fi is back

* Would you like this as a downloadable .zip with:
  * The script
  * A setup guide
  * SQLite tool included?

* Let me know and I’ll package it.

# Notification/Appearance

## Polybar

**ChatGPT Question: "polybar change status bar color from bash script"**

* To change the Polybar status bar color dynamically from a Bash script, you need to modify the color values in the Polybar configuration file and then reload or restart Polybar.

* Here’s a basic guide and a sample script to achieve this:

* 🔧 1. Polybar Config Setup
  * In your `~/.config/polybar/config.ini` (or wherever your Polybar config is), define your colors using variables like this:
```ini
[colors]
background = ${env:POLYBAR_BG:#222}
foreground = ${env:POLYBAR_FG:#fff}
```
  * This allows you to override colors using environment variables.

* 🖥️ 2. Bash Script to Change Colors
  * Create a script like this, e.g. `change_polybar_color.sh`:
```bash
#!/usr/bin/env bash

# Define your new colors
export POLYBAR_BG="#005f87"
export POLYBAR_FG="#ffffff"

# Kill existing polybar instances
killall -q polybar

# Wait until Polybar has shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch Polybar again (adjust this line based on your launch setup)
polybar main &
```
  * Replace `main` with the name of your Polybar bar (from your config).
  * Make it executable:
```bash
chmod +x change_polybar_color.sh
```
  * Run it:
```bash
./change_polybar_color.sh
```

* 📌 Alternative: Edit Config File Directly
  * If you’re not using env vars in your config, you can edit the config file directly from Bash:
```bash
#!/usr/bin/env bash

CONFIG=~/.config/polybar/config.ini

# Change the background color using sed
sed -i 's/^background = .*/background = #005f87/' "$CONFIG"
sed -i 's/^foreground = .*/foreground = #ffffff/' "$CONFIG"

# Restart polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done
polybar main &
```

* 🧪 Tip: Test with Different Color Sets
  * You can pass colors as arguments to your script:
```bash
#!/usr/bin/env bash

BG="$1"
FG="$2"

export POLYBAR_BG="$BG"
export POLYBAR_FG="$FG"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done
polybar main &
```
  * Run it with:
```bash
./change_polybar_color.sh "#282c34" "#61afef"
```

* Let me know if you want to cycle through themes or set up auto-switching!

## i3 Window Manager

**ChatGPT Question: "i3 window manager change window color from bash script"**

* To change window colors in i3 dynamically from a bash script, you can use the `i3-msg` command to send new color configurations directly to i3 without restarting the window manager.

* ✅ Example: Changing i3 Window Border Colors from Bash

* 🔧 1. i3 Colors Format
  * In your `~/.config/i3/config`, the color settings look like:
```i3
# class                 border  background text    indicator child_border
client.focused          #4c7899 #285577    #ffffff #2e9ef4   #285577
client.unfocused        #333333 #222222    #888888 #292d3e   #222222
```
  * These are six color slots for each window state.

* 🖥️ 2. Bash Script to Change i3 Window Colors
  * Here's a bash script that sends new color values to i3:
```bash
#!/usr/bin/env bash

# Define colors
FOCUSED="#005f87"
FOCUSED_BG="#003f5c"
FOCUSED_TEXT="#ffffff"
FOCUSED_INDICATOR="#00afff"
FOCUSED_CHILD="#003f5c"

UNFOCUSED="#444444"
UNFOCUSED_BG="#222222"
UNFOCUSED_TEXT="#888888"
UNFOCUSED_INDICATOR="#292d3e"
UNFOCUSED_CHILD="#222222"

# Send colors to i3
i3-msg "client.focused          $FOCUSED $FOCUSED_BG $FOCUSED_TEXT $FOCUSED_INDICATOR $FOCUSED_CHILD"
i3-msg "client.unfocused        $UNFOCUSED $UNFOCUSED_BG $UNFOCUSED_TEXT $UNFOCUSED_INDICATOR $UNFOCUSED_CHILD"
```
  * Make the script executable:
```bash
chmod +x change_i3_colors.sh
```
  * Then run it:
```bash
./change_i3_colors.sh
```

* 🔄 Optional: Cycle Between Themes
  * You could define multiple themes and cycle through them by writing to a temp file or using command-line arguments.

* 📦 Tip: Combine with Polybar
  * If you're already changing Polybar colors dynamically, you can synchronize i3 window borders with it for a seamless look.

* Let me know if you want a ready-made theme cycle script or to apply colors from a JSON/YAML/theme file.

## Dunst

**ChatGPT Question: "dunst show notification from bash script"**

* You can show a notification using Dunst from a bash script by using the `notify-send` command, which Dunst listens to by default.

* ✅ Basic Example
```bash
#!/usr/bin/env bash

notify-send "Hello from Bash" "This is a test notification using Dunst."
```

* This will show a notification with:
  * Title: `Hello from Bash`
  * Body: `This is a test notification using Dunst.`

* 🎨 Customize Notification Appearance
  * Dunst supports urgency levels and icons:
```bash
notify-send -u normal -t 3000 -i dialog-information "Update Complete" "System updated successfully."
```
  * Title: Option => Description
  * `-u low` => normal
  * `-t <ms>` => Time in milliseconds before it fades
  * `-i <icon>` => Icon name or path

* 🔧 Example Bash Script (`notify.sh`)
```bash
#!/usr/bin/env bash

TITLE="Backup Finished"
MESSAGE="Your files have been backed up successfully."

notify-send -u low -t 5000 -i dialog-information "$TITLE" "$MESSAGE"
```
  * Make it executable:
```bash
chmod +x notify.sh
```
  * Run it:
```bash
./notify.sh
```

* 📌 Dunst Must Be Running
  * Ensure Dunst is running (usually autostarted via `.xinitrc`, `.xprofile`, or your window manager's config). You can manually start it with:
```bash
dunst &
```

* Let me know if you want to trigger notifications based on specific system events, script outputs, or logs!

## Tmux

**ChatGPT Question: "tmux show notification from bash script"**

* To show a notification inside tmux from a bash script, you can use `tmux display-message` to display messages in the status line, or use external tools like `notify-send` for desktop notifications if you're outside tmux context.

* ✅ Show Notification Inside tmux

* 🧪 Basic Example:
```bash
#!/usr/bin/env bash

tmux display-message "Hello from Bash script inside tmux!"
```
  * This shows a message in the tmux command line (bottom of the screen) for a few seconds.

* 🔄 Show in Status Line (More Persistent)
  * You can temporarily overwrite the status line with a message like this:
```bash
#!/usr/bin/env bash

MESSAGE="⚠️  Build Failed"

# Save current status-right
ORIGINAL=$(tmux show-option -gv status-right)

# Set new status-right
tmux set-option status-right "$MESSAGE"

# Wait and restore
sleep 5
tmux set-option status-right "$ORIGINAL"
```
  * This script:
    * Temporarily replaces the status-right with a custom message
    * Waits 5 seconds
    * Restores the original

* 💡 Tip: Use with tmux hooks
  * You can trigger notifications for events like pane closing, window renaming, etc., using `tmux` hooks + scripts like this.

* ✅ Alternative: Send Desktop Notifications from tmux
  * If you're using a graphical environment and want to trigger system notifications from within tmux:
```bash
#!/usr/bin/env bash

notify-send "tmux says:" "Your script has finished running!"
```
  * This works well for long-running background tasks started from tmux.

* 🧪 Advanced: Tmux Popup (tmux ≥ 3.2)
  * If your tmux version supports it, you can show a popup:
```bash
tmux display-popup -E "echo 'Build done!'; read"
```
  * This opens a small window within tmux showing the message until you press a key.

* ✅ Summary
  * Title: Goal => Command
  * Quick message => `tmux display-message "text"`
  * Temporary status message => `tmux set-option status-right "text"`
  * GUI notification => `notify-send "title" "body"`
  * Popup (tmux ≥ 3.2) => `tmux display-popup -E "echo text"`

* Let me know if you'd like to bind this to keys or tmux events!

## Yasb

**ChatGPT Question: "yasb change status bar color from powershell script"**

* If you're using YASB (Yet Another Status Bar) on Windows and want to change the status bar's color from a PowerShell script, here's how you can do that effectively.

* How YASB Handles Styling
  * YASB relies on a CSS stylesheet (styles.css) to define colors and overall appearance of the bar and its widgets [GitHub Wiki See](https://github-wiki-see.page/m/thesleepingsage/yasb-wiki/wiki/Styling?utm_source=chatgpt.com) [GitHub](https://github.com/da-rth/yasb?utm_source=chatgpt.com). To change the bar’s color programmatically, you need to modify that stylesheet on the fly and then reload the bar.

* PowerShell Script to Change Colors
  * One neat way is to inject a `:root { ... }` section to define CSS variables, then reference those variables in your stylesheet. Here's an example script adapted from the YASB Wiki:
```powershell
# Load colors (if using a tool like pywal)
$colorsPath = "$HOME\.cache\wal\colors.json"
$colors = Get-Content -Raw $colorsPath | ConvertFrom-Json

# Generate CSS variables
$variablesSection = @"
:root {
  --backgroundcol: $($colors.special.background);
  --foregroundcol: $($colors.special.foreground);
}
"@

# Path to your YASB CSS file
$stylesPath = "$HOME\.config\yasb\styles.css"
$stylesContent = Get-Content -Raw -Path $stylesPath

# Replace existing :root block or prepend if missing
if ($stylesContent -match ":root\{[\s\S]*?\}") {
    $newStylesContent = $stylesContent -replace ":root\{[\s\S]*?\}", $variablesSection
} else {
    $newStylesContent = "$variablesSection`n$stylesContent"
}

$newStylesContent.TrimEnd() | Set-Content -Path $stylesPath
```
  * This approach allows you to dynamically set bar colors by leveraging CSS variables 
[GitHub Wiki See](https://github-wiki-see.page/m/thesleepingsage/yasb-wiki/wiki/%28Widget%29-Wallpapers?utm_source=chatgpt.com).

* Putting It All Together
  * 1. Update `styles.css:` Insert or update the `:root {}` section using your PowerShell script.
  * 2. Reload YASB: Trigger a reload using YASB's CLI:
```powershell
yasbc reload
```
  * This ensures your changes take effect immediately [GitHub Wiki See](https://github-wiki-see.page/m/thesleepingsage/yasb-wiki/wiki/CLI?utm_source=chatgpt.com).

* Summary
  * Title: Step => Action
  * 1⃣ => Use PowerShell to insert/update CSS variables in your `styles.css`
  * 2⃣ => Reload YASB using `yasbc reload`

* With this method, you can dynamically adjust the status bar’s color scheme—great for switching themes, responding to light/dark modes, or integrating with tools like `pywal`.

* Let me know if you'd like help extending this to cycle multiple themes or incorporate a dynamic color picker!

## Komorebi Window Manager

**ChatGPT Question: "komorebi window manager change window color from powershell script"**

* You can absolutely change the window (active/inactive) border colors in Komorebi from a PowerShell script—here’s how to do it:

* What’s Possible with Komorebi
  * Komorebi supports dynamic control over window border appearance via its CLI:
    * Enable or disable active window borders:
```powershell
komorebic.exe active-window-border <enable|disable>
```
    * Set the border color (specifying RGB values and window kind, with "single" being default):
```powershell
komorebic.exe active-window-border-colour <R> <G> <B> --window-kind single
```
    * [GitHub](https://github.com/LGUG2Z/komorebi/issues/182?utm_source=chatgpt.com) [lgug2z.github.io](https://lgug2z.github.io/komorebi/cli/border-colour.html?utm_source=chatgpt.com)
  * You can also adjust the border style (e.g., rounded vs square):
```powershell
komorebic.exe border-style <system|rounded|square>
```
  * [lgug2z.github.io](https://lgug2z.github.io/komorebi/cli/border-style.html?utm_source=chatgpt.com)

* Sample PowerShell Script
  * Here’s an example PowerShell script (`Set-KomorebiBorder.ps1`) that changes the active window border color and style:
```powershell
param(
    [int]$R = 66,
    [int]$G = 165,
    [int]$B = 245,
    [string]$Style = "rounded"  # Options: system, rounded, square
)

# Enable active window border
komorebic.exe active-window-border enable

# Set the color for the 'single' window kind
komorebic.exe active-window-border-colour $R $G $B --window-kind single

# Optionally, set border style
komorebic.exe border-style $Style
```
  * You can run the script like so:
```powershell
.\Set-KomorebiBorder.ps1 -R 0 -G 255 -B 0 -Style square
```
  * That will enable a bright green border with a square style.

* Things to Note
  * Only windows managed by Komorebi will receive these borders. [lgug2z.github.io](https://lgug2z.github.io/komorebi/common-workflows/borders.html?utm_source=chatgpt.com)
  * The feature is still a bit unstable, so occasional visual glitches may occur. [lgug2z.github.io](https://lgug2z.github.io/komorebi/common-workflows/borders.html?utm_source=chatgpt.com)
  * If you're using a JSON config (`komorebi.json`), you can also set static defaults:
```json
{
  "border": true,
  "border_width": 8,
  "border_offset": -1,
  "border_style": "System",
  "border_colours": {
    "single": "#42a5f5",
    "stack": "#00a542",
    "monocle": "#ff3399",
    "unfocused": "#808080"
  }
}
```
  * [lgug2z.github.io](https://lgug2z.github.io/komorebi/common-workflows/borders.html?utm_source=chatgpt.com)

* TL;DR — In a Bash-ish Punchline
  * Use PowerShell to call `komorebic.exe` with:
    * `active-window-border enable/disable`
    * `active-window-border-colour R G B --window-kind ...`
    * `border-style ...`
  * Wrap those in a script for dynamic theming or hotkey binding.

* Need help cycling themes or integrating with tools like AutoHotkey? Just ask!

## Windows-OS Notification

**ChatGPT Question: "windows os show notification from powershell script"**

* To show a notification in Windows from a PowerShell script, you can use the built-in Toast Notifications via Windows APIs or a simpler wrapper module.

* Here are a few easy methods, depending on how fancy you want to get:

* ✅ Option 1: Simple Toast Notification (Windows 10/11)
```powershell
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]

$template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02
$xml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template)

$toastTextElements = $xml.GetElementsByTagName("text")
$toastTextElements[0].AppendChild($xml.CreateTextNode("Title")) | Out-Null
$toastTextElements[1].AppendChild($xml.CreateTextNode("This is a notification from PowerShell.")) | Out-Null

$toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("PowerShell Script")
$notifier.Show($toast)
```
  * This sends a toast with a title and message.

* ✅ Option 2: Use BurntToast Module (Simpler)
  * If you want an easier and more customizable way to send notifications, use the [BurntToast PowerShell module](https://github.com/Windos/BurntToast):
  
  * 🔧 Step 1: Install BurntToast (run once)
```powershell
Install-Module -Name BurntToast -Force -Scope CurrentUser
```
  * 📢 Step 2: Use It
```powershell
Import-Module BurntToast
New-BurntToastNotification -Text "Backup Completed", "All files were successfully saved."
```
  * You can also add images, buttons, and sounds with this method.

* ✅ Option 3: CMD-style Balloon Tip (Legacy, Works on Win7+)
```powershell
$balloon = New-Object System.Windows.Forms.NotifyIcon
$balloon.Icon = [System.Drawing.SystemIcons]::Information
$balloon.BalloonTipIcon = "Info"
$balloon.BalloonTipTitle = "Hello"
$balloon.BalloonTipText = "This is a Windows notification from PowerShell"
$balloon.Visible = $true
$balloon.ShowBalloonTip(5000)
```
  * This method is older and doesn't use modern Action Center toasts.

* 🧪 Example Use Case
  * You can create a `.ps1` file like:
```powershell
# notify.ps1
Import-Module BurntToast
New-BurntToastNotification -Text "Task Complete", "Your script just finished running!"
```
  * Then run it via Task Scheduler, a shortcut, or another script.

* Let me know if you want to trigger notifications for script errors, schedule them, or integrate with other tools like Python or tmux-on-Windows.
