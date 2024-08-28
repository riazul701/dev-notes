# Aria2.md

## Websites
* [Aria2 Site](https://aria2.github.io/) || [Aria2 GitHub](https://github.com/aria2/aria2)
* [mayswind/AriaNg](https://github.com/mayswind/AriaNg)
* [ziahamza/webui-aria2](https://github.com/ziahamza/webui-aria2)
* [alexhua/Aria2-Explorer](https://github.com/alexhua/Aria2-Explorer)
* [RossWang/Aria2-Integration](https://github.com/RossWang/Aria2-Integration)
* [agalwood/Motrix](https://github.com/agalwood/Motrix)
* [FlashGot - Firefox Browser Integration](https://flashgot.net/)
* [pawamoy/aria2p](https://github.com/pawamoy/aria2p)
* [baptistecdr/aria2-extensions](https://github.com/baptistecdr/aria2-extensions)

## Notes
* To resume download, Aria2 needs to enter download command again with url.

# Commands
* Download with save session (for later resume): `aria2c --save-session=/home/<user-name>/aria2/<file-name> --save-session-interval=1 <download-link>` <sup>{101}</sup>
* Resume Download: `aria2c --input-file=/home/<user-name>/aria2/<file-name>` <sup>{101}</sup>

# Aria2P

## Configuration

* [how to use Aria2c RPC server as a daemon?](https://stackoverflow.com/questions/62101819/how-to-use-aria2c-rpc-server-as-a-daemon)
  * `aria2c --enable-rpc --rpc-listen-all`

## Error & Solution

### Error_1:

* Error Message_1:

$ `python3 -m pip install aria2ptui`
> error: externally-managed-environment
> 
> × This environment is externally managed
> ╰─> To install Python packages system-wide, try apt install
>     python3-xyz, where xyz is the package you are trying to
>     install.
> 
>     If you wish to install a non-Debian-packaged Python package,
>     create a virtual environment using python3 -m venv path/to/venv.
>     Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
>     sure you have python3-full installed.
> 
>     If you wish to install a non-Debian packaged Python application,
>     it may be easiest to use pipx install xyz, which will manage a
>     virtual environment for you. Make sure you have pipx installed.
> 
>     See /usr/share/doc/python3.11/README.venv for more information.
> 
> note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
> hint: See PEP 668 for the detailed specification.

* Solution_1:
  * python3 -m venv ~/venv
  * ~/venv/bin/python3 -m pip install aria2p
  * ~/venv/bin/python3 -m pip install aria2p[tui]
  * ~/venv/bin/python3 -m aria2p --version
  * ~/venv/bin/python3 -m aria2p --help
  * Launch TUI: `~/venv/bin/python3 -m aria2p`
    * Press "?" to see help menu.

# References

* Installation
  * {1}

* Configuration
  * {51}

* Download
  * {101} [Save current downloading files list #36](https://github.com/ziahamza/webui-aria2/issues/36)
