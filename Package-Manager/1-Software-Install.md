# Software-Install.md

## Websites

## GUI Software Doesn't Launch

* If any GUI software failed to start, when launching from OS menu. Then try to launch it from terminal, see if there any dependency error.

* For Example (PeaZip Archiver): `peazip` command in Debian-LXQt-OS (Testing branch) terminal shows error:
```
peazip: error while loading shared libraries: libQt6PrintSupport.so.6: cannot open shared object file: No such file or directory
```

# Debian/Ubuntu

## Install Backports/Updated Software

* Backports/Updated Software Installation <sup>{2} {3} {4} {5}</sup>

* {2} [DebianUnstable](https://wiki.debian.org/DebianUnstable)
  * Debian Unstable (also known by its codename "Sid")
  * The sequence of package propagation in the Debian development process is as follows:
    * experimental
    * unstable -> testing -> stable
  * Attempting to mix packages between Debian repositories will likely create an unusable system.
  * If you wish to use newer software, it is best to install packages from [Backports](https://backports.debian.org/Instructions/).

* {5} [Debian Backports ›› Instructions](https://backports.debian.org/Instructions/)

  * For Antix-23 (Debian-Bookworm/Debian-12)
  * Add Backports to sources.list
    * `deb http://deb.debian.org/debian bookworm-backports main`
    * to `sources.list` (or add a new file with the ".list" extension to `/etc/apt/sources.list.d/`).
    * Run `apt update` or `apt-get update`
  * Installing a Package from Backports
    * To install something from backports run one of:
      * `apt install <package>/bookworm-backports`
      * `apt-get install <package>/bookworm-backports`
      * OR
      * `apt install -t bookworm-backports <package>`
      * `apt-get install -t bookworm-backports <package>`
      * and of course aptitude may also be used:
      * `aptitude install <package>/bookworm-backports`

  * For Antix-22 (Debian-Bullseye/Debian-11)
    * The Old-stable-sloppy Suite
    * Add Backports to sources.list
      * `deb http://deb.debian.org/debian bullseye-backports main`
      * to `sources.list` (or add a new file with the ".list" extension to `/etc/apt/sources.list.d/`).
      * Run `apt update` or `apt-get update`
    * Installing a Package from Backports
      * To install something from backports run one of:
        * `apt install <package>/bullseye-backports`
        * `apt-get install <package>/bullseye-backports`
        * OR
        * `apt install -t bullseye-backports <package>`
        * `apt-get install -t bullseye-backports <package>`
        * and of course aptitude may also be used:
        * `aptitude install <package>/bullseye-backports`

## Install AppImage as Regular Software

* [Neovim Installation Details](https://www.reddit.com/r/neovim/comments/f9661m/how_do_i_install_the_latest_version_of_neovim_on/)
  * Remove the current version of NeoVim: `sudo apt remove neovim`
  * Download [this](https://github.com/neovim/neovim/releases/download/stable/nvim.appimage) (latest version - 0.5.0 appimage from github)
  * cd into the directory it was downloaded to e.g. cd ~/Downloads
  * Make it executable for your user chmod u+x ./nvim.appimage
  * Move it to a folder that's indexed in your PATH env var so your computer knows what you mean when you type nvim. You can check the folders in your current path by typing echo $PATH which will show you something like this: /usr/local/bin:/usr/bin. Notice there are 2 folders here in this case separated by a colon (:). You will likely have more than two. /usr/local/bin is a common place to stick it. To move it there you'll need to use sudo: sudo mv nvim.appimage /usr/local/bin/nvim
  * When you type nvim it should "just work"
  * Bonus: add this to ~/.bashrc/~/.zshrc etc to create an alias in case you accidentally type vi (I always type it by mistake): alias vi=nvim
  * Bonus #2: Also in your bashrc/zshrc etc set your EDITOR env var so various programs know what editor you prefer to use: EDITOR=/usr/local/bin/nvim

## ".deb" File Installation
  
### GDebi

* [Gdebi](https://launchpad.net/gdebi)
* Install ".deb" file using GDebi
  * Install GDebi: `sudo apt install gdebi`
  * Launch GDebi: `sudo gdebi-gtk`

### Dpkg

* Install ".deb" file: `sudo dpkg -i file-name.deb`

### Error and Solution (".deb" File)

* [zst compression not supported by apt/dpkg](https://unix.stackexchange.com/questions/669004/zst-compression-not-supported-by-apt-dpkg)
  * sudo apt upgrade dpkg

## Synaptic Package Manager

## Fonts Installation

* [How to Install New Fonts in Ubuntu and Other Linux Distributions](https://itsfoss.com/install-fonts-ubuntu/)
* [SutonnyMJ Regular](https://bengalifonts.net/fonts/sutonnymj-regular)

* Step 1: Create .fonts directory in your home directory
* Step 2: Put fonts files in the .fonts directory

# References

# References

* Next Serial: {7}

* Websites
  * {6} [antiX also has two possible init systems: sysVinit (default option) or runit.](https://antixlinux.com/download/)

* Access
  * {1} [Quick Tips](https://antixlinux.com/quick-tips/)

* Software Installation

  * Install Backports/Updated Software
    * {2} [DebianUnstable](https://wiki.debian.org/DebianUnstable)
    * {3} [DontBreakDebian](https://wiki.debian.org/DontBreakDebian)
    * {4} [Debian Backports](https://backports.debian.org/)
    * {5} [Debian Backports ›› Instructions](https://backports.debian.org/Instructions/)

* SSH & SSH-FS
  * [ERROR: "adb push" returned with value 1 #185](https://github.com/Genymobile/scrcpy/issues/185)
  * [Run apps on a hardware device](http://developer.android.com/tools/device.html)
