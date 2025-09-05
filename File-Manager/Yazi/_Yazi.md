# Yazi.md

## PATH

* Snap installation `ya` command: `/snap/yazi/current/ya --help` [`sudo snap install yazi --classic`]

* Yazi config file path: `~/.config/yazi/yazi.toml`

* Yazi theme file path: `~/.config/yazi/theme.toml`

# Install Yazi

## Debian

* Install Prerequisites

* Install Yazi using Nix package manager
  * On Non NixOS (without flakes): `nix-env -iA nixpkgs.yazi`

## Fodora

* To install ExifTool on Fedora: `sudo dnf install perl-Image-ExifTool`, `which exiftool`. `exiftool` is used to show details of file, when pressed "Shift+O" on file.

# Specific Work

## Compress and Decompress

**ChatGPT Question: "yazi compress and decompress"**

* The `yazi` file manager does not include built-in compression or decompression commands itself, but it integrates well with external tools to handle compression tasks via custom keybindings or shell commands.

* Here’s how you can compress and decompress files in Yazi, assuming you're on Fedora and using common CLI tools.

**✅ Step 1: Install Required Tools**
  
* Make sure you have compression tools installed:
```bash
sudo dnf install zip unzip tar xz p7zip
```

* Optional but recommended:
```bash
cargo install ouch  # Modern compression tool
```

**✅ Step 2: Compress/Decompress via Shell (Inside Yazi)**

* While browsing in `yazi`, press `:` to enter a shell command.

* ▶ Compress a file or folder

  * Example: Compress a folder to `.tar.gz`:
  ```bash
  :tar -czf my_archive.tar.gz my_folder
  ```

  * Or using ouch:
  ```bash
  :ouch compress my_folder
  ```

* ▶ Decompress an archive

  * For `.zip`:
  ```bash
  :unzip archive.zip
  ```

  * For `.tar.gz`:
  ```bash
  :tar -xzf archive.tar.gz
  ```

  * Or using `ouch`:
  ```bash
  :ouch decompress archive.tar.gz
  ```

**✅ Step 3: (Optional) Set Up Keybindings in Yazi for Compression**

* To make this seamless, you can add custom keybindings in your Yazi configuration:

* 1. Edit Yazi's config file (create if it doesn't exist):
```bash
nano ~/.config/yazi/yazi.toml
```

* 2. Example: Add custom keybinds
```toml
[keymap.normal]
"z" = "shell tar -czf {file}.tar.gz {file}"      # Compress
"x" = "shell tar -xzf {file}"                   # Decompress
```
  * You can change the keys (`z`, `x`, etc.) as you like.

* Reload Yazi or restart it to apply changes.

**Summary**

* Title: Task => Command (Yazi shell `:`)
* Compress => `tar -czf archive.tar.gz folder/` or `ouch compress folder/`
* Decompress => `tar -xzf archive.tar.gz` or `ouch decompress archive.tar.gz`

* If you want help writing full custom Yazi keybindings or `yazi.toml` configs, let me know!

# References

## Websites

* [yazi-rs.github.io => Terminal file manager](https://yazi-rs.github.io/)
* [sxyazi/yazi GitHub](https://github.com/sxyazi/yazi)
* [AnirudhG07/awesome-yazi](https://github.com/AnirudhG07/awesome-yazi)

* Plugin
  * [yazi-rs/plugins GitHub => Official Plugins](https://github.com/yazi-rs/plugins)
  
* Theme
  * [yazi-rs/flavors GitHub => Official Themes](https://github.com/yazi-rs/flavors)

## YouTube Tutorials
  
* [How To Use Yazi: An Awesome Terminal File Manager Written In Rust BY Josean Martinez](https://www.youtube.com/watch?v=iKb3cHDD9hw)
