# SMB-File-Manager.md

# SMB Share Access

# Mu Commander SMB Access

mucommander SMB connection

Nice choice — **muCommander + SMB** actually works pretty smoothly once you know where to click. Here’s the clean, no-nonsense way to do it on **Windows**.

***


## **How to create an SMB connection in muCommander**

### **1️⃣ Open the connection dialog**

- Launch **muCommander**

- Menu: **File → Connect to server…** _(or press_ **_Ctrl + K_**_)_

***


### **2️⃣ Choose SMB (Windows share)**

In the connection window:

- **Protocol:** `SMB (Windows share)

  `

***


### **3️⃣ Fill in the connection details**

**Server**

    servername

or

    192.168.1.10

**Share**

    sharename

**Username**

    username

**Password**

    your_password

**Domain** (optional)

    WORKGROUP

or your Windows domain (leave blank if unsure)

✅ You can also check **Save password** if you want.

***


### **4️⃣ Connect**

Click **Connect** The SMB share opens like a normal folder in one pane.

***


## **SMB URL format (alternative way)**

You can also type SMB URLs directly in the location bar:

    smb://server/share

With username:

    smb://username@server/share

With domain:

    smb://DOMAIN;username@server/share

***


## **Save it for next time (recommended)**

After connecting once:

- Go to **Bookmarks → Add bookmark**

- Give it a name\
  &#x20;Now it’s one click forever.

***


## **Common SMB problems & fixes**

### **❌ “Authentication failed”**

- Try:

  - Removing the domain

  - Using the server **IP address**

  - Checking Windows credentials (Control Panel → Credential Manager)

***


### **❌ “Cannot connect to server”**

- SMB might be blocked by firewall

- Server name may not resolve → use IP

- Server might require **SMB2/SMB3 only**

***


### **⚠️ Old NAS / SMB1**

muCommander **does not support SMB1**.\
&#x20;If your NAS is very old, you’ll need:

- SMB2/3 enabled on the server\
  &#x20;**or**

- Windows mapped drive workaround

***


## **Pro tip**

If Windows can access it via:

    \\server\share

but muCommander can’t — it’s almost always:

- SMB version mismatch

- Domain / auth formatting issue

***

If you want, tell me:

- Windows version

- NAS / server type (Windows, Samba, NAS brand)

- Exact error message

I’ll dial it in fast 🔧


# Double Commander SMB Access

double commander SMB access

Gotcha — you’re talking about **accessing SMB (Windows/Samba) network shares in Double Commander**. Here’s the practical rundown 👇

***


## **How to access SMB shares in Double Commander**

### **Option 1: Using the built-in SMB plugin (recommended)**

1. Open **Double Commander**

In the address bar, type:\
\
&#x20;`smb://`

2.  and press **Enter**

3. You should see available **workgroups / domains**

Drill down:\
\
&#x20;`smb://WORKGROUP/`

    smb://SERVER_NAME/
    smb://SERVER_NAME/SHARE_NAME

4.

5. When prompted, enter:

   - **Username**

   - **Password**

   - **Domain** (often optional; try leaving it blank first)

✅ This uses Double Commander’s **WFX SMB plugin** (libsmbclient).

***


### **Option 2: Direct SMB path (sometimes works)**

In the path bar:

    smb://user@server/share

Example:

    smb://john@nas/media

If credentials aren’t embedded, DC will ask for them.

***


### **Option 3: Mount SMB at OS level (most reliable)**

If the plugin is flaky (it can be, depending on system/libs), mount the share first, then browse it like a local folder.


#### **Linux**

    sudo mount -t cifs //SERVER/SHARE /mnt/share \
      -o username=USER,password=PASS,iocharset=utf8

Then in Double Commander:

    /mnt/share


#### **macOS**

    mkdir ~/smbshare
    mount_smbfs //user@server/share ~/smbshare


#### **Windows**

Map a network drive:

    \\SERVER\SHARE

Then open the drive letter in Double Commander.

***


## **Common problems & fixes**

**“Connection failed” / empty list**

- Make sure `libsmbclient` is installed (Linux)

- Try `smb://IP_ADDRESS/` instead of hostname

- Check firewall and SMB version (SMB1 vs SMB2/3)

**Authentication keeps failing**

- Try username without domain

- Try `DOMAIN\username

  `

Clear saved credentials in DC:\
\
&#x20;`Configuration → Options → Plugins → WFX → SMB`

-

**Slow browsing**

- Disable “retrieve file size” for remote FS

- Mounting via OS is usually faster than the plugin

***


## **Best practice (real talk)**

- 🔹 **Occasional access** → DC SMB plugin is fine

- 🔹 **Daily / heavy use** → Mount SMB in the OS and browse locally

- 🔹 **Large transfers** → OS mount or `rsync` beats the plugin

***

If you want, tell me:

- **OS** (Linux / Windows / macOS)

- **Double Commander version**

- Whether this is a **NAS, Windows PC, or Samba server**

…and I’ll dial it in exactly for your setup.

