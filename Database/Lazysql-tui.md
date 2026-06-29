# Keybindings

## General

* `Esc` : To close window or get out from various situation.

* `PageDown` / `Shift+J` : Scroll page down in main window (Logs, Stats etc.)

* `PageUp` / `Shift+K` : Scroll page up in main window (Logs, Stats etc.)

# Lazysql-TUI.md

## PATH

* Config file path: `C:\Users\{{user-name}}\AppData\Roaming\lazysql\config.toml`

# Configuration

## config.toml

* Config file path: `C:\Users\{{user-name}}\AppData\Roaming\lazysql\config.toml`. Contents:

```toml
[application]
DefaultPageSize = 500

[[database]]
Name = 'Local development'
Provider = 'mysql'
URL = 'mysql://{{user-name}}:{{url-encoded-password}}@localhost:3306/{{db-name}}'
```

# Installation

## Debian-Server (Standard Edition)

**[Binary Release (Linux/OSX/Windows)](https://github.com/jesseduffield/lazydocker#binary-release-linuxosxwindows)**

* `curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash` : Automated install/update, don't forget to always verify what you're piping into bash.

* The script installs downloaded binary to `$HOME/.local/bin` directory by default, but it can be changed by setting `DIR` environment variable.

* To add `$HOME/.local/bin` to your PATH permanently in Bash, add this line to your `~/.bashrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

* `source ~/.bashrc` : Then reload your shell configuration.

* `echo $PATH` : Verify it was added.

* `which lazydocker` : Check whether a command in that directory is found.

# References

## Websitess

* [jorgerojas26/lazysql GitHub](https://github.com/jorgerojas26/lazysql)

## Tutorials

* [terminaldock.com/lazysql](https://terminaldock.com/lazysql)

## YouTube Tutorials

* [Terminal Based DB Client (Lazygit for DBs) BY PengVim](https://www.youtube.com/watch?v=rqV3xIl4hWE)
