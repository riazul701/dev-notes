# Theme-Starship.md

## Websites

* [catppuccin/starship GitHub](https://github.com/catppuccin/starship) <sup>{1}</sup>

# [catppuccin/starship GitHub](https://github.com/catppuccin/starship) <sup>{1}</sup>

## Usage

* Copy one or all of the flavor palettes from [themes/](https://github.com/catppuccin/starship/blob/main/themes) to your [Starship configuration file](https://starship.rs/config/).
* Set `palette = "catppuccin_<flavor>"`, preferably at the top of your config. Palette tables must be defined under this line.
* Save and reload your prompt.

## Tip

* Check out this [example Starship configuration](https://github.com/catppuccin/starship/blob/main/starship.toml) for how to define and use colors from custom palettes.

## Contributing

* Requires [Whiskers](https://github.com/catppuccin/whiskers) & [Just](https://github.com/casey/just) be installed
  * Make changes to `templates/` file(s)
  * Run `just build`
  * Commit changes to branch, make PR

* Changes to prompt appearance require new [catwalk](https://github.com/catppuccin/catwalk) image.

* Tip
  * When making changes to the prompt, simply run `export STARSHIP_CONFIG="../../starship/starship.toml"` in your terminal for testing. Use an absolute path. This way, you don't have to worry about moving or replacing your personal starship.toml.

# References

* next-sl: {2}

## Websites

* {1} [catppuccin/starship GitHub](https://github.com/catppuccin/starship)
