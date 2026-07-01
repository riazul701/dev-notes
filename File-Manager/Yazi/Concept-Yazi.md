# Concept-Yazi.md

# File Opener

> ChatGPT Question: 
> 
> In yazi file manager, "O" keybinding does not show all programs like windows-explorer right click, then "open with" for opening files

That's expected behavior. In **Yazi**, the default **`O`** (capital O) is **not equivalent to Windows Explorer's "Open with..." dialog**.

Here's how it works:

* **`Enter`**: Opens the file with the default application (using your system's opener, e.g. `xdg-open` on Linux).
* **`O`**: Shows applications that Yazi knows about through its opener configuration (`yazi.toml`/`open.toml`), **not every installed application** on your system.

Unlike Windows, Yazi doesn't query the desktop environment for a complete "Open with" list.

### If you're on Linux

The list shown by `O` comes from your `open.toml` configuration (or built-in openers). For example:

```toml
[opener]
mpv = [
    { run = 'mpv "$@"', desc = "MPV" }
]

vim = [
    { run = 'nvim "$@"', desc = "Neovim" }
]

gimp = [
    { run = 'gimp "$@"', desc = "GIMP" }
]
```

Then you associate them with MIME types:

```toml
[open]
rules = [
    { mime = "video/*", use = ["mpv"] },
    { mime = "image/*", use = ["gimp"] },
    { mime = "text/*", use = ["vim"] },
]
```

Pressing **`O`** will show only these configured openers.

### If you want a Windows Explorer–style "Open With"

Yazi doesn't currently provide a dynamic menu of **all installed GUI applications** like Windows Explorer does.

Your options are:

1. Configure the applications you commonly use in `open.toml` (recommended).
2. Create a custom Yazi plugin or keybinding that launches an external application picker.
3. Use your desktop environment's file manager when you need its native "Open With" dialog.

### On Windows

If you're using Yazi on Windows, `O` similarly won't invoke the native Windows "Open with" dialog. It uses Yazi's configured openers instead.

If you tell me:

* your **OS** (Linux, Windows, macOS),
* your **Yazi version** (`yazi --version`),
* and whether you're using **Kitty**, **WezTerm**, **Windows Terminal**, etc.,

I can show you the best way to get behavior that's as close as possible to Explorer's "Open with" menu.

===========================================================================================

> ChatGPT Question: 
> 
> configure Yazi so that pressing O lists applications like VS Code, Notepad++, Photoshop, Paint.NET, VLC, MPV, etc., making it feel much closer to Explorer's experience.

Yes. On Windows, you can make `O` much more useful by defining your own openers.

## 1. Find your config directory

It is usually:

```text
%APPDATA%\yazi\config\
```

For example:

```text
C:\Users\<YourUser>\AppData\Roaming\yazi\config\
```

If `yazi.toml` or `open.toml` doesn't exist, create them.

---

## 2. Create or edit `open.toml`

Here's a good starting point:

```toml
[opener]

default = [
    { run = 'start "" "%1"', orphan = true, desc = "Default Windows app" },
]

vscode = [
    { run = 'code "%1"', orphan = true, desc = "Visual Studio Code" },
]

notepadpp = [
    { run = '"C:\\Program Files\\Notepad++\\notepad++.exe" "%1"', orphan = true, desc = "Notepad++" },
]

paint = [
    { run = 'mspaint "%1"', orphan = true, desc = "Paint" },
]

photoshop = [
    { run = '"C:\\Program Files\\Adobe\\Adobe Photoshop 2025\\Photoshop.exe" "%1"', orphan = true, desc = "Photoshop" },
]

vlc = [
    { run = '"C:\\Program Files\\VideoLAN\\VLC\\vlc.exe" "%1"', orphan = true, desc = "VLC" },
]

mpv = [
    { run = 'mpv "%1"', orphan = true, desc = "mpv" },
]

sevenzip = [
    { run = '"C:\\Program Files\\7-Zip\\7zFM.exe" "%1"', orphan = true, desc = "7-Zip File Manager" },
]
```

Adjust the executable paths if your software is installed elsewhere.

---

## 3. Add rules

Below the openers:

```toml
[open]

rules = [
    { mime = "text/*", use = ["vscode", "notepadpp", "default"] },

    { mime = "image/*", use = ["paint", "photoshop", "vscode", "default"] },

    { mime = "video/*", use = ["mpv", "vlc", "default"] },

    { mime = "audio/*", use = ["vlc", "mpv", "default"] },

    { mime = "application/pdf", use = ["default", "vscode"] },

    { mime = "application/zip", use = ["sevenzip", "default"] },

    { name = "*", use = ["default"] },
]
```

---

## 4. Restart Yazi

Now when you press **`O`**:

For a `.png` you'll see something like:

```
Paint
Photoshop
Visual Studio Code
Default Windows app
```

For a `.mp4`:

```
mpv
VLC
Default Windows app
```

For a `.txt`:

```
Visual Studio Code
Notepad++
Default Windows app
```

---

## Bonus: Automatically detect installed apps

Instead of hardcoding paths, you can use commands that are already on your `PATH`:

```toml
vscode = [
    { run = 'code "%1"', orphan = true }
]

mpv = [
    { run = 'mpv "%1"', orphan = true }
]

vlc = [
    { run = 'vlc "%1"', orphan = true }
]
```

If the executable is on your `PATH`, Yazi will launch it regardless of its installation location.

---

If you use **Scoop**, **Winget**, or **Chocolatey**, I can also generate an `open.toml` that automatically works with most of the apps installed through those package managers.

====================================================================================================

> ChatGPT Question: 
> 
> set default and open-with app list, opener program in yazi.toml config, when pressing "o" and "O"

In Yazi:

* **`o`** opens the file with the **first opener** listed in the matching `use` array.
* **`O`** (Shift+O) opens the **"Open with"** menu, showing **all openers** listed in the `use` array so you can choose one. ([DeepWiki][1])

For Windows, here's an example `yazi.toml`:

```toml
[opener]
open = [
    { run = 'start "" %1', desc = "Default Windows app", orphan = true, for = "windows" },
]

code = [
    { run = 'code %*', desc = "Visual Studio Code", orphan = true, for = "windows" },
]

notepad = [
    { run = 'notepad %1', desc = "Notepad", orphan = true, for = "windows" },
]

paint = [
    { run = 'mspaint %1', desc = "Paint", orphan = true, for = "windows" },
]

[open]
prepend_rules = [
    # Text files
    { mime = "text/*", use = [ "code", "notepad", "open" ] },

    # Images
    { mime = "image/*", use = [ "open", "paint" ] },

    # PDFs
    { mime = "application/pdf", use = [ "open", "code" ] },

    # Fallback
    { url = "*", use = [ "open", "code", "notepad" ] },
]
```

***### Behavior***

* Press **`o`** on:

  * a `.txt` file → opens in **VS Code** (first item).
  * an image → opens with the **default Windows image viewer**.
  * any other file → opens with the **default Windows application**.

* Press **`O`** on the same file:

  * Text: `Visual Studio Code`, `Notepad`, `Default Windows app`
  * Image: `Default Windows app`, `Paint`
  * Other: `Default Windows app`, `Visual Studio Code`, `Notepad`

The first opener becomes the default for `o`, while `O` lets you choose from the complete list. ([DeepWiki][1])

If you use **Neovim**, **Notepad++**, **Sublime Text**, or another editor instead of VS Code, I can provide a configuration tailored to those applications.

[1]: https://deepwiki.com/yazi-rs/yazi-rs.github.io/3.1-yazi.toml-reference?utm_source=chatgpt.com "yazi.toml Reference | yazi-rs/yazi-rs.github.io | DeepWiki"

