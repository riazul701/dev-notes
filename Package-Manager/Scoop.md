# Scoop

## Websites

* [Packages to install via scoop, winget, choco, and other tools...](https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7) <sup>Main Code</sup>
* [repology.org](https://repology.org/)
* [distrowatch.com](https://distrowatch.com/)

* [Scoop: A command-line installer for Windows](https://scoop.sh/)
* [gsudo => sudo for Windows](https://gerardog.github.io/gsudo/) || [gsudo GitHub](https://github.com/gerardog/gsudo)
* Scoop Buckets
  * [ScoopInstaller/Main => The default bucket for Scoop](https://github.com/ScoopInstaller/Main)
  * [kkzzhizhou/scoop-apps GitHub](https://github.com/kkzzhizhou/scoop-apps)
  * [TheRandomLabs/Scoop-Python GitHub](https://github.com/TheRandomLabs/Scoop-Python)

## Notes

* Do Not Install Scoop As Admin.

## $PATH
  * Global/System-wise installed apps path: `C:\ProgramData\scoop` [Before enable "show hidden items"]
  * User-wise installed apps path: `C:\Users\{{user-name}}\scoop`

## [How do I install a specific version of an app?](https://github.com/ScoopInstaller/Scoop/wiki/FAQ#how-do-i-install-a-specific-version-of-an-app)

* If you need to install a specific version of an app, use `scoop install [app]@[version]`. E.g. for Git:

```
scoop install git@2.23.0.windows.1
```

## `gsudo` on Windows-X-Lite Micro-10

**`gsudo` prompt on `scoop`**

* On Windows-X-Lite Micro-10, `gsudo` prompt for every software installation.
* Go to "Control Panel" -> "Security and Maintenance" -> "Change User Account Control settings" -> "Choose when to be notified about changes to your computer"
  * Change this to: `Notify me only when apps try to make changes to my computer (default)`
* Check this by opening `Task Manger` from right clicking on `Taskbar`

**Task Manager**

* Right click "Taskbar" -> Task Manager; also show permission prompt
  * Turn this off using above settings (`gsudo` prompt on `scoop`)

## Git Dubious Ownership

* When executing `scoop --version` command, then if `git` shows some dubious ownership error, run following command
* `git config --global --add safe.directory '*'`

# Install/Uninstall

## Scoop Install Normally

**Do Not Install Scoop As Admin**

* [scoop.sh](https://scoop.sh/)
* Open a PowerShell terminal (version 5.1 or later) and from the PS C:\> prompt, run:
```shell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## Scoop Install as Admin

**Do Not Install Scoop As Admin**

* On elevated/administrator powershell, scoop installation command shows error:
  * Running the installer as administrator is disabled by default, see https://github.com/ScoopInstaller/Install#for-admin for details. Abort.

* Solution
  * [For Admin => Scoop installation](https://github.com/ScoopInstaller/Install#for-admin)
  * Installation under the administrator console has been disabled by default for security considerations. If you know what you are doing and want to install Scoop as administrator. Please download the installer and manually execute it with the `-RunAsAdmin` parameter in an elevated console. Here is the example:
  ```shell
irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -RunAsAdmin [-OtherParameters ...]
# I don't care about other parameters and want a one-line command
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
  ```

# References

* next-sl: 

* Guides
  * [Uninstalling Scoop](https://github.com/ScoopInstaller/Scoop/wiki/Uninstalling-Scoop)
