# Configuration.md

## Websites

# User

* `sudo su` : Switch to `root` user.
  * `exit` : Go back to `normal` user.

# PATH

## [Linux: Add a Directory to PATH](https://phoenixnap.com/kb/linux-add-to-path) <sup>{7}</sup>

**How to View the Directories in PATH**

* `echo $PATH` : To print all the configured directories in the system's `PATH` variable, run the `echo` command

* `printenv PATH` : The output shows directories configured in `PATH` by default. The `printenv` command delivers the same output

* `which whoami` : Furthermore, running `which` on a certain command shows where its executable is. For instance, execute `which` with `whoami`
  * The output shows that the executable for `whoami` is located in the `/usr/bin/` directory.

**How Do I Add a Directory to PATH in Linux?**

**Linux: Add to PATH Temporarily**

* Temporarily adding a directory to `PATH` affects the current terminal session only. Once users close the terminal, the directory is removed.

* `export PATH="/Directory1:$PATH"` : To temporarily add a directory to `PATH`, use the `export PATH` command

* `echo $PATH` : The command added `Directory1` from the `Home` directory to `PATH`. Verify the result with
  * The output shows that the directory was added to the variable. This configuration lasts during the current session only.

**Linux: Add to PATH Permanently**

* Add a directory to `PATH` permanently by editing the `.bashrc` file located in the `Home` directory. Follow these steps:

  * `vim ~/.bashrc` : Open the `.bashrc` file using a text editor. The example below uses `Vim`.
  * Go to the end of the file.
  * Paste the export syntax at the end of the file : `export PATH="/Directory1:$PATH"`
  * Save and exit.
  * Execute the script or reboot the system to make the changes live.
  * `echo $PATH` : To verify the changes, run `echo`
  * Editing the `.bashrc` file adds a directory for the current user only. To add the directory to the PATH for all users, edit the `.profile` file

**Remove Directory from PATH in Linux**

* There is no single command to remove a directory from `PATH`. Still, several options enable the process.

* Method 1: Exit the Terminal

  * Removing a directory from `PATH` is simple when it's added temporarily. Adding the directory in the terminal works for the current session only. Once the current session ends, the directory is removed from `PATH` automatically.
  * To delete a temporary directory from `PATH`, exit the terminal or reboot the system.

* Method 2: Edit Configuration Files

  * If the directory export string was added to the `.bashrc` or `.profile` file, remove it using the same method. Open the file in a text editor, navigate to the end of the file, and remove the directory.

* Method 3: Apply the String Replacement Concept

  * `export PATH=${PATH/'/Directory1'/}` : To remove a directory from `PATH`, use string replacement
  * The command only removes the string from the current session.

* Method 4: Use a One-Liner

  * `export PATH="$( echo $PATH| tr : '\n' |grep -v Directory1 | paste -s -d: )"` : Another option is to use the combination of `tr`, `grep` and `paste` to remove a directory from `PATH`. For instance
  * `echo $PATH` : Verify the result with

# Debian/Ubuntu

## Sound

* Install "pavucontrol" : `sudo apt install pavucontrol`
* Goto Start Menu -> Applications -> Multimedia -> PulseAudio Volume Control
  * Alternatively, goto Start Menu -> App Select -> Search for "pavucontrol"
* For shortcut, add "pavucontrol" to "Personal Menu". Goto Start Menu -> Applications -> antiX -> Personal Menu Editor -> ADD ICON -> Select "PulseAudio Volume Control -- /usr/share/applications/pavucontrol.desktop"

## Trash

* Antix-OS does not have Trash. Files are deleted permanently.
* To use Trash use file manager: "pcmanfm" or "nautilus".
* "rm" command deletes file permanently, install package "trash-cli" and use command "trash" instead of "rm".
* Website Links
  * [Does Linux have a recycle bin?](https://ngangasn.com/linux-recycle-bin/)
  * [Antix - Trashcan Possible?](https://www.antixforum.com/forums/topic/trashcan-possible/)

# Fonts

## Fonts Installation

* [How to Install New Fonts in Ubuntu and Other Linux Distributions](https://itsfoss.com/install-fonts-ubuntu/)
* [SutonnyMJ Regular](https://bengalifonts.net/fonts/sutonnymj-regular)

* Step 1: Create .fonts directory in your home directory
* Step 2: Put fonts files in the .fonts directory

**Alternate Way**

* [Copying Configurations => Fonts](https://github.com/addy-dclxvi/i3-starterpack?tab=readme-ov-file#copying-configurations)

* Create `.local/share/fonts` directory in your home directory
* Put fonts files in the `.local/share/fonts` directory
* Refresh your fontconfig cache `fc-cache -fv` after You copy the font.

## Install bangla font

* Open Synaptic Package Manager -> Search for "font"
* Install "fonts-beng", "fonts-beng-extra", "fonts-lohit-beng-bengali", "fonts-lohit-beng-assamese", "fonts-indic"
* Then bangla font will work in Firefox, Chrome browser.
* Install Avro Keyboard "ibus-avro" [For problem use command "ibus" and "ibus-daemon"] [Run ibus daemon in background: `ibus-daemon -d`]

# References

* Next Serial: {8}

## Tutorials

* {7} [Linux: Add a Directory to PATH](https://phoenixnap.com/kb/linux-add-to-path)

## Guides

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
