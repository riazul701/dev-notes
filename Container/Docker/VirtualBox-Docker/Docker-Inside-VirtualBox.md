# Docker-Inside-VirtualBox.md

# VirtualBox Docker Windows

# SMB Mount Windows Host To Linux VM (VirtualBox)

windows host to linux virtualbox guest SMB share and mounting full guide

Got it — here’s a **clean, end-to-end, no-hand-waving guide** for **Windows host → Linux guest SMB share** in **VirtualBox**, optimized for the common **Host-Only (or NAT + Host-Only)** setup.

I’ll assume:

- **Host:** Windows 10/11

- **Guest:** Linux (Ubuntu/Debian-like; I’ll note differences where needed)

- **Goal:** Linux mounts a Windows folder via SMB

***


## **1️⃣ VirtualBox network setup (important)**

### **Recommended setup (best performance)**

**Adapter 1**

- Attached to: **NAT** (for internet)

**Adapter 2**

- Attached to: **Host-only Adapter**

- Name: `VirtualBox Host-Only Ethernet Adapter

  `

This gives:

- Internet access

- Fast, isolated SMB to host

If you only want SMB and no internet, you can skip NAT.

***


## **2️⃣ Find the Windows host IP (Host-Only)**

On **Windows host**, open **Command Prompt**:

    ipconfig

Look for:

    VirtualBox Host-Only Network:
       IPv4 Address . . . . . : 192.168.56.1

📌 This IP is what Linux will connect to.

***


## **3️⃣ Create & configure the Windows SMB share**

### **Choose a folder**

Example:

    C:\VMShare


### **Share it**

1. Right-click folder → **Properties**

2. **Sharing** tab → **Advanced Sharing**

3. Check **Share this folder**

4. Share name: `VMShare

   `

5. **Permissions**

   - Add your Windows user

   - Allow **Read** or **Full Control**


### **NTFS permissions (very important)**

In **Security** tab:

- Ensure your Windows user has **Read/Write**

- SMB uses NTFS permissions too

***


## **4️⃣ Windows firewall (usually already OK)**

Host-Only is treated as **Private network**.

If it fails later:

- Windows Defender Firewall

- Allow **File and Printer Sharing**

- Or temporarily test with firewall off

***


## **5️⃣ Install SMB client on Linux guest**

### **Debian / Ubuntu / Mint**

    sudo apt update
    sudo apt install -y cifs-utils


### **RHEL / CentOS / Rocky**

    sudo dnf install -y cifs-utils

***


## **6️⃣ Test connectivity from Linux**

    ping 192.168.56.1

If this fails:

- Network adapter misconfigured

- Host-Only adapter missing

***


## **7️⃣ Create mount point in Linux**

    sudo mkdir -p /mnt/windows

***


## **8️⃣ Mount the SMB share (manual test)**

    sudo mount -t cifs //192.168.56.1/VMShare /mnt/windows \
      -o username=YOUR_WINDOWS_USERNAME

You’ll be prompted for your Windows password.


### **If Windows user has no password (not recommended)**

    -o username=USER,password=

***


## **9️⃣ Verify it works**

    ls /mnt/windows
    touch /mnt/windows/testfile

Check from Windows that the file appears.

***


## **🔟 Permanent mount (fstab — clean & secure)**

### **Create credentials file**

    sudo nano /root/.smbcredentials

Contents:

    username=YOUR_WINDOWS_USERNAME
    password=YOUR_WINDOWS_PASSWORD

Secure it:

    sudo chmod 600 /root/.smbcredentials

***


### **Add to** `/etc/fstab`

    sudo nano /etc/fstab

Add:

    //192.168.56.1/VMShare  /mnt/windows  cifs  credentials=/root/.smbcredentials,iocharset=utf8,vers=3.1.1,uid=1000,gid=1000,_netdev  0  0

Apply:

    sudo mount -a

***


## **🔧 Performance tuning (optional but recommended)**

Add these options to fstab if you want speed:

    serverino,nosharesock,actimeo=1

Example:

    credentials=/root/.smbcredentials,vers=3.1.1,serverino,nosharesock,actimeo=1

***


## **🧠 Common problems & fixes**

### **❌** `mount error(13): Permission denied`

- NTFS permissions missing

- Wrong Windows username

- Folder shared but NTFS denies access


### **❌** `mount error(95): Operation not supported`

Try lower SMB version:

    vers=3.0


### **❌ Slow performance**

- Use **Host-Only**, not Bridged Wi-Fi

- Disable SMB signing (Windows Local Security Policy)

- Disk speed is often the real bottleneck

***


## **🥇 Best-practice summary**

- **Network:** NAT + Host-Only

- **Protocol:** SMB 3.x

- **Auth:** credentials file

- **Mount:** `/etc/fstab

  `

- **Speed:** Host-Only beats Wi-Fi every time

If you want, tell me:

- Linux distro

- Desktop vs server

- Need Linux → Windows write access or read-only

I can tailor the exact options for your setup.

\=====================================================================

in previous case, what will happen if we use Bridge adapter instead of NAT. Everything else stays same.

Good “what if” — this is mostly about **how traffic flows** and **what can break**, not about SMB itself.

We’ll keep **everything else the same**:

- Windows host shares a folder

- Linux guest mounts it via SMB

- Host-Only adapter still exists

- Only change: **Adapter 1 = Bridged instead of NAT**

***


## **What actually changes**

### **Network layout now**

- **Adapter 1 (Bridged):**

  - VM appears as a **real device on your LAN**

  - Gets an IP from your router (e.g. `192.168.1.x`)

- **Adapter 2 (Host-Only):**

  - Still `192.168.56.x

    `

  - Private, fast link to host

So the VM now has **two networks**:

    VM
     ├─ eth0 → Bridged → LAN / Router
     └─ eth1 → Host-Only → Windows host (SMB)

***


## **What happens to SMB (host share)**

### **If you keep using the Host-Only IP (recommended)**

Example mount:

    //192.168.56.1/VMShare

✅ **Nothing changes**

- SMB still goes over Host-Only

- Same speed

- Same security

- Router and Wi-Fi still irrelevant

This is the _best_ and intended setup.

***


### **If you switch SMB to the bridged IP (not recommended)**

Example:

    //192.168.1.10/VMShare   # Windows LAN IP

Now SMB traffic:

- Uses **Bridged adapter**

- Traverses the **Wi-Fi or Ethernet NIC**

- May hit the router’s switch (even if it doesn’t fully route)

Effects:

- ⚠️ Slower (especially on Wi-Fi)

- ⚠️ Subject to Wi-Fi interference

- ⚠️ Depends on router/LAN behavior

- ⚠️ Windows firewall profile may change (Public vs Private)

It’ll still _work_, just worse.

***


## **Internet access behavior**

### **NAT vs Bridged difference**

With Bridged:

- VM is fully visible on LAN

- Inbound connections from LAN **just work**

- No port forwarding needed

With NAT:

- VM is hidden

- Inbound connections require port forwarding

If you’re running servers _inside_ the Linux VM:

- Bridged is convenient

- NAT is safer

***


## **Routing & priority (important detail)**

Linux chooses routes by **metric**.

Usually:

- Bridged adapter gets **default route**

- Host-Only is used only for `192.168.56.0/24

  `

So:

- Internet → Bridged

- SMB to `192.168.56.1` → Host-Only

No conflict **as long as you mount using the Host-Only IP**.

***


## **Security implications**

|                    |         |                         |
| :----------------: | :-----: | :---------------------: |
|     **Aspect**     | **NAT** |       **Bridged**       |
|  VM visible on LAN |    ❌    |            ✅            |
|   LAN can scan VM  |    ❌    |            ✅            |
| SMB exposed to LAN |    ❌    | ⚠️ (if bound to LAN IP) |
|      Isolation     |   High  |          Lower          |

If your Windows SMB share is:

- Bound to all interfaces → LAN devices could access it

- Host-Only only → safe

***


## **When Bridged makes sense here**

Use Bridged instead of NAT **only if**:

- You need the VM to behave like a real LAN machine

- You want LAN devices to access services on the VM

- You understand the security tradeoff

Otherwise:

- **NAT + Host-Only** is cleaner and safer

***


## **Final verdict**

**Replacing NAT with Bridged does NOT break SMB** **as long as you keep using Host-Only for the share**

You gain:

- LAN visibility

You risk:

- Accidental SMB over Wi-Fi

- More exposure

***

If you want, I can show:

- How to **bind Windows SMB only to Host-Only**

- How to **force Linux to always use Host-Only for SMB**

- How to **prevent LAN access entirely**

Just say which one you care about.


# SMB Mount Permissions On Linux

Can not create file during SMB mount from windows host OS to linux virtualbox guest OS

Ah, this one bites a lot of people with **Windows → Linux → VirtualBox → SMB** setups. You can _see_ the files but can’t create new ones — that almost always means a **permissions / mount option mismatch**, not a broken SMB connection.

Let’s walk through it cleanly.

***


## **First: what’s really happening**

Your **Linux guest** mounts an SMB share that lives on the **Windows host**.

- SMB connection works ✅

- Browsing works ✅

- Creating files fails ❌

This usually comes down to **UID/GID mapping** or **mount options** on the Linux side.

***


## **The most common fix (90% of cases)**

### **1️⃣ Mount with correct user ownership**

If you mounted the share manually, **you must specify UID/GID**.

Example:

    sudo mount -t cifs //WINDOWS_IP/ShareName /mnt/smb \
      -o username=winuser,password=winpass,uid=1000,gid=1000,iocharset=utf8,file_mode=0777,dir_mode=0777

Key parts:

- `uid=1000` → your Linux user (check with `id`)

- `gid=1000

  `

- `file_mode` / `dir_mode` → force write permissions

👉 Without this, files belong to `root`, and your normal user can’t write.

***


### **2️⃣ Check your Linux user ID**

Run:

    id

Example output:

    uid=1000(user) gid=1000(user)

Use **those numbers** in the mount options.

***


## **If you’re using** `/etc/fstab`

Bad (read-only symptoms):

    //host/share /mnt/smb cifs credentials=/root/.smbcred 0 0

Good:

    //host/share /mnt/smb cifs credentials=/root/.smbcred,uid=1000,gid=1000,file_mode=0777,dir_mode=0777 0 0

Then:

    sudo mount -a

***


## **Windows-side checks (important)**

### **✔ Share permissions**

On the **Windows host**:

1. Right-click shared folder → **Properties**

2. **Sharing → Advanced Sharing → Permissions**

   - Ensure your user has **Full Control**

3. **Security tab**

   - Your user must also have **Write** permission here\
     &#x20;(Sharing permissions + NTFS permissions both matter)

***


### **✔ Disable “read-only share” traps**

If the folder is inside:

    C:\Users\YourName\Desktop



    Documents



    Program Files

Windows can silently restrict writes.

👉 Try sharing something simple like:

    C:\SMB-Test

***


## **VirtualBox-specific gotcha (important)**

### **❌ VirtualBox “Shared Folders” ≠ SMB**

If you’re using **VirtualBox Shared Folders**, SMB options won’t apply.

Symptoms:

- Folder visible

- “Permission denied” on create

- Owner looks weird (`vboxsf`)

Fix:

    sudo usermod -aG vboxsf $USER
    reboot

But if you’re **actually using SMB**, ignore this.

***


## **Quick diagnosis checklist**

Reply with **yes / no** to these and I’ll zero in instantly:

1. Mounted using `mount -t cifs`?

2. Did you specify `uid=` and `gid=`?

3. Can root create files but user cannot?

4. Is the shared folder inside `C:\Users\...`?

This is very fixable — you’re already 90% there 🔧

