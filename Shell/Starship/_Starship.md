# Commands/Usage

## Installation

* `curl -sS https://starship.rs/install.sh | sh` : Install Latest Version, With Shell <sup>{1}</sup>
* Bash: Add the following to the end of `~/.bashrc`: <sup>{1}</sup>
```bash
# ~/.bashrc

eval "$(starship init bash)"
```
* `source ~/.bashrc` : Reload bash configuration

# Starship.md

## Websites

* [starship.rs](https://starship.rs/) <sup>{1}</sup>
* [starship/starship GitHub](https://github.com/starship/starship) <sup>{2}</sup>

## Notes

* Any command execution reloads Starship's config file, like: `clear`

## PATH

* Starship config file location: `~/.config/starship.toml` <sup>{5}</sup>

# Error and Solution

## Command Execution TimeOut

**Error Message:**

> [WARN] - (starship::utils): Executing command "/usr/bin/git" timed out.
> [WARN] - (starship::utils): You can set command_timeout in your config to a higher value to allow longer-running commands to keep executing.

**Solution** <sup>{6}</sup>

* Add to `~/.config/starship.toml` file
```shell
command_timeout = 500
```

# References

* next-sl: {7}

## Websites

* {1} [starship.rs](https://starship.rs/)
* {2} [starship/starship GitHub](https://github.com/starship/starship)

## Tutorials

* {5} [Starship Configuration](https://starship.rs/config/)
* {6} [Starship Frequently Asked Questions](https://starship.rs/faq/)

## YouTube Tutorials

* {3} [The Starship Prompt Offers Infinite Possibilities BY DistroTube](https://www.youtube.com/watch?v=ZbgulVriTPE)
* {4} [Ultimate Starship Shell Prompt Setup From Scratch BY Henry Misc](https://www.youtube.com/watch?v=v2S18Xf2PRo)
