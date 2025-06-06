# Commands/Usage

* `brew doctor` : Just verify that brew command is ready to run by using the brew doctor command <sup>{3}</sup>

* `brew install {{package_name}}` : To install a package with brew, use the install option <sup>{3}</sup>

* `brew remove {{package_name}}` : To remove a brew package, you can use either remove or uninstall option. Both works the same. <sup>{3}</sup>

* `brew list` : You can also list the installed brew packages with this command <sup>{3}</sup>

* `brew autoremove` : You can also remove the unneeded dependencies with the autoremove option <sup>{3}</sup>

# Homebrew.md

## Notes

## `--cask` MacOS Only

* `brew install --cask smplayer` : `--cask` means, this software will be installed in MacOS only. It can not be installed on Linux OS.

* Error Message
```
smplayer is built for Intel macOS and so requires Rosetta 2 to be installed.
You can install Rosetta 2 with:
    softwareupdate --install-rosetta --agree-to-license
Note that it is very difficult to remove Rosetta 2 once it is installed.
```

* Check package details on [brew.sh](https://brew.sh/) website
  * `Requires: macOS >= 10.15`

* This issue exists mostly for graphical apps. Terminal apps are OK.

## PATH

**Software Installation PATH**

* Installed softwares are located at: `/home/linuxbrew/.linuxbrew/bin` [Softwares are installed with `brew install {{package-name}}` command] <sup>{1}</sup>

# Installation

## SparkyLinux (Debian)

**Instruction**

* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` : Install Homebrew <sup>{1}</sup>
  * You must install Git before installing Homebrew.

**Success Message**

```

Warning: /home/linuxbrew/linuxbrew/bin is not in your PATH.
Instructions on how to configure your shell for Homebrew
can be found in the 'Next steps' secton below.
==> Installation successful!

==> Homebrew has enabled anonymous aggregate formulae and cask analytics.
Read the analytics documentation (and how to opt-out) here:
https://docs.brew.sh/Analytics
No analytics data has been sent yet (nor will any be during this install run).

==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
https://github.com/Homebrew/brew#donations

==> Next steps:
- Run these commands in your terminal to add Homebrew to your PATH:
    echo >> /home/{{user-name}}/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/{{user-name}}/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
- Install Homebrew's dependencies if you have sudo access:
    sudo apt-get install build-essential
  For more information, see:
    https://docs.brew.sh/Homebrew-on-Linux
- We recommend that you install GCC:
    brew install gcc
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh
```

# References

* next-sl: {4}

## Websites

* {1} [brew.sh](https://brew.sh/)
* {2} [Homebrew/brew GitHub](https://github.com/Homebrew/brew)

## Tutorials
  
* {3} [Installing and Using Homebrew Package Manager on Linux](https://itsfoss.com/homebrew-linux/)

## Guides

* Homebrew On Linux
  * [Homebrew on Linux](https://docs.brew.sh/Homebrew-on-Linux)
