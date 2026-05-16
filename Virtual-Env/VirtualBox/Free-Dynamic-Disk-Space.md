# Free-Dynamic-Disk-Space.md

# Concept

> ChatGPT Question:
> 
> Virtualbox dynamic disk size increases over time and usage, 
> but not decreases over file deletion. Solution of it.

In Oracle VM VirtualBox, a **dynamically allocated virtual disk** (`VDI`, `VHD`, `VMDK`) grows when the guest OS writes new data, but it does **not automatically shrink** when files are deleted inside the VM. Deleting files only frees space *inside the guest filesystem*; the host disk image still contains old allocated blocks.

To reclaim space, you need **two steps**:

1. Zero out/free unused space inside the guest OS
2. Compact the virtual disk from the host

---

# Linux guest (Ubuntu, Debian, etc.)

## Step 1 — Fill free space with zeros

Inside the VM:

```bash
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm /EMPTY
sync
```

This creates a big zero-filled file occupying free space, then deletes it.

Alternative (better):

```bash
sudo fstrim -av
```

(if the filesystem and VirtualBox support TRIM)

---

## Step 2 — Compact the VDI

Shutdown the VM completely.

On the host machine:

```bash
VBoxManage modifymedium disk "path/to/disk.vdi" --compact
```

Older versions:

```bash
VBoxManage modifyhd "path/to/disk.vdi" --compact
```

Example:

```bash
VBoxManage modifymedium disk "/home/user/VirtualBox VMs/Ubuntu/Ubuntu.vdi" --compact
```

---

# Windows guest

## Step 1 — Zero free space

Use Microsoft's Sysinternals tool:

[Sysinternals SDelete](https://learn.microsoft.com/en-us/sysinternals/downloads/sdelete?utm_source=chatgpt.com)

Inside Windows VM:

```cmd
sdelete -z C:
```

This zeroes free space.

---

## Step 2 — Compact the disk

Shutdown the VM.

Host command:

```bash
VBoxManage modifymedium disk "C:\VMs\Win10.vdi" --compact
```

---

# Important limitations

## 1. Only works well with VDI

`--compact` works best on `VDI`.

If using `VMDK`:

* convert to VDI first
* compact
* optionally convert back

Example:

```bash
VBoxManage clonemedium disk old.vmdk new.vdi --format VDI
```

---

## 2. Snapshots prevent shrinking

If the VM has snapshots, VirtualBox may not reclaim much space.

Delete or merge snapshots first.

---

## 3. Fixed-size disks cannot shrink

Only **dynamic disks** can compact.

---

# Best modern setup (recommended)

Enable TRIM/discard support.

In VM settings:

* Storage
* Select SATA controller
* Check **Solid-state Drive**
* Enable **Discard**

Then Linux guests using `fstrim` can help keep disk growth under control.

---

# Verify actual size

Host side:

Linux/macOS:

```bash
ls -lh *.vdi
```

Windows:

```cmd
dir *.vdi
```

---

# Typical result

Example:

* Virtual disk maximum: 100 GB
* Actual file grew to: 60 GB
* After deleting files in VM: still 60 GB
* After zero + compact: maybe reduced to 25 GB

That behavior is normal for dynamic virtual disks.

