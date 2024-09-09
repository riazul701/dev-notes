# Commands

* [chezmoi.io](https://www.chezmoi.io/)
* `chezmoi --help` : Chezmoi help.

## Paths

* Default source directory: `/home/{{user-name}}/.local/share/chezmoi`
* Default destination directory: `/home/{{user-name}}`
* Default cache directory: `/home/{{user-name}}/.cache/chezmoi`

## Commands

* `chezmoi init` : Setup the source directory, generate the config file, and optionally update the destination directory to match the target state.

* Chezmoi add
  * 

# Chezmoi.md

## Websites

* [Chezmoi Site](https://www.chezmoi.io/)
* [twpayne/chezmoi](https://github.com/twpayne/chezmoi)

# Installation

## Antix

* One-line binary install
  * `sh -c "$(curl -fsLS get.chezmoi.io)"`
  * Chezmoi is install in `~/bin/chezmoi`
  * Move to `$PATH`: `sudo mv ~/bin/chezmoi /usr/local/bin/chezmoi`
  * Check version: `chezmoi --version`

# References

* Installation
  * [Chezmoi Install](https://www.chezmoi.io/install/)
