# PPPoE-Connection.md

# Concept

## PPPoE Connection As Default In Windows-10

> ChatGPT Question:
> Make PPoE connection as default in windows 10

To make a *PPPoE connection auto-connect on Windows 10 startup or wake from sleep, you can use **Task Scheduler*. Windows doesn’t natively auto-reconnect PPPoE reliably, so this method is the most consistent.

---

## ✅ Method: Use Task Scheduler + rasdial

### 1. Find your PPPoE connection name

* Go to *Control Panel → Network Connections*
* Note the exact name of your PPPoE connection (e.g., Broadband Connection)

---

### 2. Test manual connect command

Open Command Prompt and test:

cmd
rasdial "YourConnectionName" username password


Example:

cmd
rasdial "Broadband Connection" myuser mypass


If it connects, you’re good.

---

### 3. Create a Scheduled Task

#### Open Task Scheduler

* Press Win + R → type taskschd.msc

---

### 4. Create Task (not basic task)

#### General tab:

* Name: Auto PPPoE Connect
* Check:

  * ✔️ Run with highest privileges
  * ✔️ Run whether user is logged in or not

---

### 5. Triggers tab → Add:

#### Trigger 1: At startup

* Begin the task: *At startup*

#### Trigger 2: On wake from sleep

* New → Begin task: *On an event*
* Log: System
* Source: Power-Troubleshooter
* Event ID: 1

(This event fires when PC wakes from sleep)

---

### 6. Actions tab → Add:

* Action: *Start a program*
* Program/script:

cmd
rasdial


* Add arguments:

cmd
"YourConnectionName" username password


---

### 7. Conditions tab:

* Uncheck:

  * ❌ Start the task only if the computer is on AC power (optional)

---

### 8. Settings tab:

* ✔️ Allow task to be run on demand
* ✔️ Run task as soon as possible after a scheduled start is missed

---

## 🔄 Optional: Disconnect before reconnect (for stability)

Sometimes PPPoE fails if already connected. Use:

cmd
rasdial "YourConnectionName" /disconnect
timeout /t 5
rasdial "YourConnectionName" username password


To do this:

* Save above commands in a .bat file
* Use the batch file in Task Scheduler instead

---

## ⚠️ Security Note

Your password is stored in plain text if used this way. To avoid that:

* Save credentials once:

cmd
rasdial "YourConnectionName" username password


* Then use:

cmd
rasdial "YourConnectionName"


---

## ✔️ Result

Now your PPPoE will:

* Auto-connect on startup
* Reconnect after sleep/wake

---

If you want, I can show a *no-password-visible method* or help you create the .bat file step-by-step.

=======================================================================================

Putting a .bat file in the *Startup folder* makes it run automatically every time Windows logs in. Here’s how to do it properly.

---

## 📂 Step 1: Open the Startup folder

Press:


Win + R


Type:


shell:startup


Press *Enter* — this opens your personal Startup folder.

---

## 📝 Step 2: Create or add your .bat file

### Option A: Create a new one

1. Right-click → *New → Text Document*
2. Rename it to something like:

   
   myscript.bat
   
3. Edit it and add your commands, for example:

bat id="p1l9v2"
@echo off
echo Startup script running...
start "" notepad.exe


---

### Option B: Use an existing .bat

Just copy and paste your .bat file into the Startup folder.

---

## 🔁 Step 3: Test it

* Restart your computer or log out and log back in
* Your script should run automatically

---

## ⚠️ Important notes

### 1. Run minimized (optional)

To avoid the command window popping up:

* Create a shortcut of the .bat
* Right-click shortcut → *Properties*
* Set *Run:* to *Minimized*
* Put the shortcut in Startup instead of the .bat

---

### 2. Run as Administrator (if needed)

Startup folder *does NOT* run scripts as admin.

If your script needs admin rights:

* Use *Task Scheduler* instead
* Enable *“Run with highest privileges”*

---

### 3. Common Startup folder paths

* Current user:

  
  C:\Users\YourUsername\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
  

* All users:

  
  C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
  

---

## 💡 Example useful startup scripts

### Auto open apps

bat id="u8sd0x"
@echo off
start "" chrome
start "" notepad


### Auto connect network drive

bat id="3hwc92"
@echo off
net use Z: \\server\share /persistent:yes


---

If you tell me what you want to run at startup (VPN, app, script, server, etc.), I can build a clean .bat specifically for your setup.
