# Windows-11.md

## Supported Processor List

* [Windows Processor Requirements](https://learn.microsoft.com/en-us/windows-hardware/design/minimum/windows-processor-requirements)

* [Windows 11 supported Intel processors](https://learn.microsoft.com/en-us/windows-hardware/design/minimum/supported/windows-11-supported-intel-processors)

* [Windows 11 supported AMD processors](https://learn.microsoft.com/en-us/windows-hardware/design/minimum/supported/windows-11-supported-amd-processors)

# Bypass Installation Requirements

## Requirements Are

* TPM 2.0 requirement
* Secure Boot requirement
* CPU requirement
* RAM requirement (usually)
* Storage requirement

## In Ventoy, Bypass Installation Requirements

### ChatGPT: "In ventoy, remove windows 11 installation TPM 2.0 requirement like rufus"

Yes — you can bypass the **TPM 2.0 / Secure Boot / CPU requirements** for Windows 11 when installing from USB using Ventoy — similar to what Rufus does. ✅

***## ✅ Method 1 — Use Ventoy “Control Plugin” (Official Way)***

Ventoy supports Windows 11 bypass via a config file.

***### 🔧 Steps***

1. Plug in your Ventoy USB
2. Open the USB drive
3. Create this folder structure:

```
/ventoy/ventoy.json
```

4. Create a file named **ventoy.json** and paste:

```json
{
    "control": [
        { "VTOY_WIN11_BYPASS_CHECK": "1" }
    ]
}
```

5. Save the file
6. Copy your Windows 11 ISO to the USB (no modification needed)
7. Boot from the USB and install 🎉

➡️ This disables:

* TPM 2.0 requirement
* Secure Boot requirement
* CPU requirement
* RAM requirement (usually)
* Storage requirement

---

***## ✅ Method 2 — Ventoy New GUI Toggle (If Using Latest Version)***

Recent Ventoy versions show a **Windows 11 bypass option automatically**:

During ISO selection screen:

👉 Press **Ctrl + i**
👉 Toggle **Bypass Windows 11 Check**

---

***## ✅ Method 3 — Manual Registry Trick (Inside Installer)***

If bypass isn’t active:

When installer shows “This PC can’t run Windows 11”:

1. Press **Shift + F10** to open Command Prompt
2. Type:

```
regedit
```

3. Go to:

```
HKEY_LOCAL_MACHINE\SYSTEM\Setup
```

4. Create new key → `LabConfig`

5. Inside it, create DWORD (32-bit):

```
BypassTPMCheck = 1
BypassSecureBootCheck = 1
BypassRAMCheck = 1
BypassCPUCheck = 1
```

Close Registry → continue install 🚀

---

***## 🏆 Ventoy vs Rufus (Quick)***

| Feature               | Ventoy | Rufus |
| --------------------- | ------ | ----- |
| Multiple ISOs         | ✅      | ❌     |
| No reformat each time | ✅      | ❌     |
| Built-in Win11 bypass | ✅      | ✅     |
| Best for testing OSes | ⭐⭐⭐⭐⭐  | ⭐⭐⭐   |

---

***## ⚠️ Important Notes***

✔ Windows Update may still work normally
✔ Some features may be limited without TPM
✔ Not officially supported by Microsoft
✔ Works best for older PCs 💻

---

If you want, I can also show:

✅ Best Windows 11 version for old PCs
✅ How to make Windows 11 run faster without TPM
✅ Tiny11 / lightweight Windows options
✅ Whether your PC can run Windows 11 smoothly

Just tell me 👍

### ChatGPT: `Where will be "/ventoy/ventoy.json" file, there are two partitions on pendrive`

Good question 👍 — Ventoy USB **always has 2 partitions**, and this confuses many people.

***## ✅ Put the file in the LARGE partition (Ventoy partition)***

Use the partition where you normally copy ISO files.

👉 It is usually:

* The **bigger partition**
* Visible in Windows Explorer
* Labeled something like: `Ventoy`
* Contains your ISO files

***### 📂 Correct location***

Create this path in the large partition:

```
Ventoy (USB Drive)
 └── ventoy
      └── ventoy.json
```

---

***## ❌ Do NOT use the small partition***

The small partition is:

* Only ~32 MB
* Often hidden or read-only
* Used by Ventoy system files
* May appear as EFI partition

👉 Do NOT put anything there.

---

***## 🧠 Example (Windows Explorer)***

If your USB drive letter is `E:`:

```
E:\ventoy\ventoy.json
```

---

***## 📌 If the `ventoy` folder does NOT exist***

Just create it manually:

1. Open USB drive
2. Right-click → New Folder
3. Name it exactly:

```
ventoy
```

(lowercase recommended)

4. Create file inside:

```
ventoy.json
```

---

***## ✅ After setup***

Copy your Windows 11 ISO to the same large partition
Boot using Ventoy 🚀

---

If you want, I can also show:

✅ How to check if bypass is working before installation
✅ Best Windows 11 version for old PC (22H2 vs 23H2 vs LTSC)
✅ Fix “This PC can’t run Windows 11” even after bypass
✅ Make Windows 11 super lightweight for low-end PC

Just tell me 👍

## In Rufus, Bypass Installation Requirements

* [💻 Windows 11 Install করুন সহজে | Setup Windows 11 With USB | Easy Bangla Setup BY RI ROBIN](https://www.youtube.com/watch?v=PlWpVv1ta74)
