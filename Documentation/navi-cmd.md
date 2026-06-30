# navi-cmd.md

## PATH

**[Configuring Navi](https://github.com/denisidoro/navi/tree/master/docs/configuration)**

* The default configuration file path
  * During the compilation of navi, the default configuration file path is set by the `$NAVI_CONFIG` environment variable. If it is not set, it fallbacks to `~/.config/navi/config.yaml`.
  * If `navi` is install via scoop command `scoop install main/navi --global`, then `$NAVI_CONFIG` environment variable's value is `C:\ProgramData\scoop\apps\navi\current\config.yaml`

* Cheatsheets paths
  * Navi checks the paths in the following order until it finds a value:
    * the `$NAVI_PATH` environment variable
    * the configuration file
    * The default value of navi
  * The default cheatsheets path
    * By default, navi stores the cheatsheets in the `~/.local/share/navi/cheats/` directory.

# Installation

## Windows-OS

* `scoop install main/fzf --global`

* `scoop install main/navi --global`

## Debian-Server (Standard Edition)

* [Using the installation script](https://github.com/denisidoro/navi/blob/master/docs/installation/README.md#using-the-installation-script)

# Configuration

## Shell Common

* `pwsh` : Enter into PowerShell-7 shell.
  * [PowerShell/PowerShell GitHub](https://github.com/powershell/powershell)

* `powershell.exe` : Enter into PowerShell-5 shell.
  * Built-in powershell inside Windows-OS.

* `bash` : Enter into Git-Bash shell.

* `cmd.exe` : Enter into cmd.exe shell. Built-in inside Windows-OS.

## Temporarily Set Config `PATH` Environment Variable

**PowerShell**

* `$env:NAVI_PATH = "C:\Users\YourName\navi-cheats"` (powershell) : Current PowerShell session only, set environment variable. This disappears when you close the terminal.
  * `$env:NAVI_CONFIG = "C:\Users\YourName\navi\config.yaml"` (powershell)

* `$env:NAVI_PATH` (powershell) : Check/print environment variable.
  * `$env:NAVI_CONFIG` (powershell)

**Bash**

* `export NAVI_PATH="/C/Users/YourName/navi-cheats"` (bash) : Current Bash session only, set environment variable. This disappears when you close the terminal.
  * `export NAVI_CONFIG="/C/Users/YourName/navi/config.yaml"` (bash)

* `echo $NAVI_PATH` (bash) : Check/print environment variable.
  * `echo $NAVI_CONFIG` (bash)

**cmd.exe**

* `set NAVI_PATH="C:\Users\YourName\navi-cheats"` (cmd.exe) : Current cmd.exe session only, set environment variable. This disappears when you close the terminal.
  * `set NAVI_CONFIG="C:\Users\YourName\navi\config.yaml"` (cmd.exe)

* `echo %NAVI_PATH%` (cmd.exe) : Check/print environment variable.
  * `echo %NAVI_CONFIG%` (cmd.exe)

## Permanently Set Config `PATH` Environment Variable

**PowerShell**

* Set a permanent system-wide variable (Admin required). Run PowerShell as Administrator.

* `[System.Environment]::SetEnvironmentVariable("NAVI_PATH", "C:\Users\YourName\navi-cheats", "Machine")` (powershell) : Applies to all users.
  * `[System.Environment]::SetEnvironmentVariable("NAVI_CONFIG", "C:\Users\YourName\navi\config.yaml", "Machine")` (powershell)

* `$env:NAVI_PATH` (powershell) : Check/print environment variable.
  * `$env:NAVI_CONFIG` (powershell)

**Bash**

* Open `~/.bashrc` file and append code:

```bash
export NAVI_PATH="/C/Users/YourName/navi-cheats"
export NAVI_CONFIG="/C/Users/YourName/navi/config.yaml"
```

* `echo $NAVI_PATH` (bash) : Check/print environment variable.
  * `echo $NAVI_CONFIG` (bash)

**cmd.exe**

* Set a system environment variable (Administrator required)

* `setx NAVI_PATH "C:\Users\YourName\navi-cheats" /M` (cmd.exe) : This makes the variable available to all users.
  * `setx NAVI_CONFIG "C:\Users\YourName\navi\config.yaml" /M` (cmd.exe)

* `echo %NAVI_PATH%` (cmd.exe) : Check/print environment variable.
  * `echo %NAVI_CONFIG%` (cmd.exe)

* Note: `setx` updates the persistent environment for future processes. It does not change the environment of the current `cmd.exe` window. Open a new Command Prompt to see the change.

* If you want the variable to be available immediately in the current window as well, run both commands:

```
set NAVI_PATH="C:\Users\YourName\navi-cheats"
setx NAVI_PATH "C:\Users\YourName\navi-cheats"

set NAVI_CONFIG="C:\Users\YourName\navi\config.yaml"
setx NAVI_PATH "C:\Users\YourName\navi\config.yaml"
```

* The first affects the current session; the second makes it persistent for future sessions.

## config.yaml

* On Windows-OS, navi is installed via `scoop install main/navi --global` command. Here `config.yaml` file code:

```yaml
shell:
  command: powershell
style:
  tag:
    color: cyan
  comment:
    color: white
  snippet:
    color: red
```

# Error & Solution

## Variable prompt error on Windows-OS

### Error-1 Details

* `navi` and `fzf` are installed via scoop package manager.

* Create cheatsheet `test.cheat` with content:

```shell
% test

# Echo
echo <name>
```

* Run this using `navi` : `navi --path . --print`

* Above command show error from `navi` :

```shell
error: the following required arguments were not provided:
<VARIABLE>
Usage: navi.exe preview-var <SELECTION> <QUERY> <VARIABLE>
For more information, try '--help'.
```

* But on Debian-Server linux, no such issue. 

### Solution-1: 

* On Windows-OS, it works, but does not show variable filling infomation in `fzf` preview, like Linux-OS (Debian-Server).

# References

## Websites

* General
  * [denisidoro/navi GitHub](https://github.com/denisidoro/navi)

* CheatSheet Repositories
  * [denisidoro/cheats/featured_repos.txt](https://github.com/denisidoro/cheats/blob/master/featured_repos.txt)
  * [denisidoro/cheats GitHub](https://github.com/denisidoro/cheats)
  * [denisidoro/navi-tldr-pages GitHub](https://github.com/denisidoro/navi-tldr-pages)

* Editor Extension
  * [yanivmo/navi-cheatsheet-language GitHub](https://github.com/yanivmo/navi-cheatsheet-language)
  * [Navi Cheatsheet Language Support BY Yaniv Mordekhay](https://marketplace.visualstudio.com/items?itemName=yanivmo.navi-cheatsheet-language)

## Tutorials

* [Creating templates for CLIs](https://denisidoro.github.io/posts/cli-templates/)
