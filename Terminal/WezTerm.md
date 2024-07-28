# WezTerm.md

# Commands

## Set "SHELL" Env-Var (Windows-OS)

* Windows Command Prompt
  * Open "cmd" in Administrator mode
  * [Setting and getting Windows environment variables from the command prompt?](https://superuser.com/questions/79612/setting-and-getting-windows-environment-variables-from-the-command-prompt)
    * To get all the values of system variable open CMD and type: `Set`
    * Set environment variable "$SHELL" (Bash): `setx SHELL bash /M` ["/M" means set for system-wide] [Open "cmd" in Administrator mode]
    * Set environment variable "$SHELL" (PowerShell-7): `setx SHELL pwsh /M` {{New Version Powershell-7, installed from [GitHub-PowerShell](https://github.com/PowerShell/PowerShell)}}
    * Set environment variable "$SHELL" (PowerShell-5): `setx SHELL powershell /M` [Old Version PowerShell. Built-in inside Windows-OS]
    * Set environment variable "$EDITOR": `setx EDITOR vim /M`

* PowerShell
  * Open PowerShell in Administrator mode
  * [How to Set environment variables using PowerShell?](https://www.tutorialspoint.com/how-to-set-environment-variables-using-powershell)
    * Shows all environment variables: `dir env:`
    * Set environment variable "EDITOR": `$env:EDITOR = 'vim'`
    * Set environment variable "SHELL": `$env:SHELL = '/bin/bash'`

# Contents of WezTerm.md

## Websites
* [WezTerm Site](https://wezfurlong.org/wezterm/index.html)
* [WezTerm GitHub](https://github.com/wez/wezterm)

## Tutorials
* Project Setup
  * [Automate terminal configurations with WezTerm](https://cosimomatteini.com/blog/terminal-configurations-with-wezterm)
  * [WezTerm configuration files GitHub](https://github.com/devmatteini/dotfiles/tree/main/config/wezterm)
  * [Startup arrangements #3236](https://github.com/wez/wezterm/discussions/3236)

## Notes
* WezTerm log file location: "C:\Users\<user-name>\.local\share\wezterm" [Lua-function: "wezterm.log_error()"] [Log to file #1576](https://github.com/wez/wezterm/issues/1576)

## Project Setup
* Copy "WezTerm-Prject/.wezterm.lua" file to user "HOME(~)" directory.
* Copy "WezTerm-Prject/project.lua" file to "/e/stproject/wezterm" directory.
* Copy "WezTerm-Prject/t-larav1.lua" file to "/e/stproject/wezterm/projects" directory. And create new project files here.

## Keyboard Shortcuts

### Keyboard Commands
* [The Launcher Menu](https://wezfurlong.org/wezterm/config/launch.html#the-launcher-menu)
  * Left click on "+" icon open new Tab. Right click on "+" icon to open Launcher-Menu.

* [Default Key Assignments](https://wezfurlong.org/wezterm/config/default-keys.html)
* [Available Features](https://wezfurlong.org/wezterm/features.html#available-features)
  * Open new Window: "Super-n"
  * Split Vertically (pane): Ctrl-Shift-Alt-%
  * Split Horizontally (pane): Ctrl-Shift-Alt-"
  * Move between Panes: Ctrl-Shift-ArrowKey
  * Open new Tab: "Ctrl-Shift-t" (Works). Alternatively: "Super-t" [Does not work on Windows-OS, highlights taskbar items]
  * Next Tab: Super-Shift-[
  * Previous Tab:  and Super-Shift-]

# Installation

## Windows Installation

## Linux Installation

# Configuration

## Looking for Configuration
* If `local project = require "project"`, "project.lua" file does not exist.
```shellscript
runtime error: [string "C:\Users\<user-name>\.wezterm.lua"]:2: module 'project'
not found:
        no field package.preload['project']
        no file 'C:\Program Files\WezTerm\wezterm_modules/project.lua'
        no file 'C:\Program Files\WezTerm\wezterm_modules/project/init.lua'
        no file 'C:\Users\<user-name>\.config\wezterm/project.lua'
        no file 'C:\Users\<user-name>\.config\wezterm/project/init.lua'
        no file 'C:\Users\<user-name>\.local/share/wezterm/plugins/project/plugin/init.lua'
        no file 'C:\Users\<user-name>\.wezterm/project.lua'
        no file 'C:\Users\<user-name>\.wezterm/project/init.lua'
        no file 'C:\Program Files\WezTerm\lua\project.lua'
        no file 'C:\Program Files\WezTerm\lua\project\init.lua'
        no file 'C:\Program Files\WezTerm\project.lua'
        no file 'C:\Program Files\WezTerm\project\init.lua'
        no file 'C:\Program Files\WezTerm\..\share\lua\5.4\project.lua'
        no file 'C:\Program Files\WezTerm\..\share\lua\5.4\project\init.lua'
        no file '.\project.lua'
        no file '.\project\init.lua'

        can't load C modules in safe mode
stack traceback:
        [C]: in function 'require'
        [string "C:\Users\<user-name>\.wezterm.lua"]:2: in main chunk
```

# Error and Solution

## Antix-OS

* In GDebi: "Error: Dependency is not satisfiable: libssl1.1(>=1.1.1)"
  * REASON: In Antix-OS 23 version, "libssl1.1" is replace by "libssl3". "libssl1.1" is outdated version, which is available on older Antix-OS 22 and Antix-OS 21 version.
    * [debian package missing dependency on libssl1.1 #1802](https://github.com/zerotier/ZeroTierOne/issues/1802)
  * SOLUTION-1
  * [Debian Bookworm/Sid - libssl1.1 - dependency depreciated/removed from repo #3682](https://github.com/wez/wezterm/issues/3682)
    * Install nightly build of the .deb file
  * SOLUTION-2
  * Command `apt show libssl1.1` shows "Package 'libssl1.1' has no installation candidate"
  * Download [Package: libssl1.1 (1.1.1n-0+deb10u6 and others) [security]](https://packages.debian.org/buster/libssl1.1)
  * Install using "GDebi"
    * `sudo gdebi-gtk`
    * Open "libssl1.1" file -> Install [Alternatively `sudo dpkg -i libssl1.1.deb`]
    * Open "wezterm.deb" file -> Install [Alternatively `sudo dpkg -i wezterm.deb`]

## Windows-OS

* WARN   window::os::windows::wgl > failed to created extended OpenGL context (CreateContextAttribsARB failed, GetLastError=3221692565 c0072095),
fall back to basic
  * 

# References

* Tutorials
  * [Keyboard shortcuts in Windows](https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec#WindowsVersion=Windows_10)

* YouTube Tutorials
  * [How To Create An AMAZING macOS Terminal Setup With Wezterm BY Josean Martinez](https://www.youtube.com/watch?v=TTgQV21X0SQ)

* WezTerm Project
  * [Switch to new workspace via wezterm cli #3534](https://github.com/wez/wezterm/discussions/3534)

* WezTerm
  * [Log to file #1576](https://github.com/wez/wezterm/issues/1576)

* WezTerm Official Guide
  * Keybaord Shortcuts
    * [Default Key Assignments](https://wezfurlong.org/wezterm/config/default-keys.html)
  * Launch Program  
    * [Launching Programs](https://wezfurlong.org/wezterm/config/launch.html)
    * [ShowLauncher](https://wezfurlong.org/wezterm/config/lua/keyassignment/ShowLauncher.html)
  
* Windows Command Prompt
  * [Setting and getting Windows environment variables from the command prompt?](https://superuser.com/questions/79612/setting-and-getting-windows-environment-variables-from-the-command-prompt)
  * [Create alias for a specific command in cmd](https://stackoverflow.com/questions/54866820/create-alias-for-a-specific-command-in-cmd)

* PowerShell
  * [How to Set environment variables using PowerShell?](https://www.tutorialspoint.com/how-to-set-environment-variables-using-powershell)
  * [How do I deal with paths when creating a PowerShell alias for a Windows Subsystem for Linux command?](https://serverfault.com/questions/911513/how-do-i-deal-with-paths-when-creating-a-powershell-alias-for-a-windows-subsyste)

* Lua Language
  * [8.1 – The require Function](https://www.lua.org/pil/8.1.html)
  * [Lua Require function on a full path name](https://stackoverflow.com/questions/11868847/lua-require-function-on-a-full-path-name)
  * [require os, Am i missing somehting?](https://stackoverflow.com/questions/52517153/require-os-am-i-missing-somehting)
