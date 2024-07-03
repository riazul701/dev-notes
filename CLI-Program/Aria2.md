# Aria2.md

## Websites
* [Aria2 Site](https://aria2.github.io/) || [Aria2 GitHub](https://github.com/aria2/aria2)
* [mayswind/AriaNg](https://github.com/mayswind/AriaNg)
* [ziahamza/webui-aria2](https://github.com/ziahamza/webui-aria2)
* [alexhua/Aria2-Explorer](https://github.com/alexhua/Aria2-Explorer)
* [RossWang/Aria2-Integration](https://github.com/RossWang/Aria2-Integration)

## Notes
* To resume download, Aria2 needs to enter download command again with url.

# Commands
* Download with save session (for later resume): `aria2c --save-session=/home/<user-name>/aria2/<file-name> --save-session-interval=1 <download-link>` <sup>{101}</sup>
* Resume Download: `aria2c --input-file=/home/<user-name>/aria2/<file-name>` <sup>{101}</sup>

# References

* Installation
  * {1}

* Configuration
  * {51}

* Download
  * {101} [Save current downloading files list #36](https://github.com/ziahamza/webui-aria2/issues/36)
