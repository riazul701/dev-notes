# Homebrew.md

# Install

## SparkyLinux (Debian)

### Instruction

* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` : Install Homebrew <sup>{1}</sup>

### Success Message

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

* Tutorials
  * {3} [Installing and Using Homebrew Package Manager on Linux](https://itsfoss.com/homebrew-linux/)
