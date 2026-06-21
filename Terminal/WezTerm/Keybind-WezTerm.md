# Commands/Usage

## [Default Key Assignments](https://wezterm.org/config/default-keys.html)

* `SUPER + c` : CopyTo="Clipboard"

* `SUPER + v` : PasteFrom="Clipboard"

* `CTRL + SHIFT + c` : CopyTo="Clipboard"

* `CTRL + SHIFT + c` : CopyTo="Clipboard"

* `CTRL + Insert` : CopyTo="PrimarySelection"

* `SHIFT + Insert` : PasteFrom="PrimarySelection"

* `SUPER + m` : Hide

* `SUPER + n` : SpawnWindow

* `CTRL + SHIFT + n` : SpawnWindow



## [Mouse bindings](https://wezterm.org/config/mouse.html)

## [Scrollback](https://wezterm.org/scrollback.html)

* `CTRL-SHIFT-K` and `CMD-K` : By default, this will trigger the `ClearScrollback` action and discard the contents of the scrollback buffer. There is no way to undo discarding the scrollback.

* `SHIFT-PageUp` and `SHIFT-PageDown` : By default, this will adjust the viewport scrollback position by one full screen for each press.

* `CTRL-SHIFT-F` and `CMD-F` : By default, (`F` for `Find`) will activate the search overlay in the current tab.
  * `Enter`, `UpArrow` and `CTRL-P` : will cause the selection to move to any prior matching text.
  * `PageUp` : will traverse to previous matches one page at a time.
  * `CTRL-N` and `DownArrow` : will cause the selection to move to any next matching text.
  * `PageDown` : will traverse to the next match one page at a time.
  * `CTRL-R` : will cycle through the pattern matching mode. The initial mode is `case-sensitive`, the next will match `ignoring case` and the last will match using the `regular expression`.
  * `CTRL-U` : will clear the search pattern so you can start over.
  * `CTRL-SHIFT-C` : will copy the selected text to the clipboard.
  * `Escape` : will cancel the search overlay, leaving the currently selected text selected with the viewport scrolled to that location.

## [Quick Select Mode](https://wezterm.org/quickselect.html)

* `CTRL-SHIFT-SPACE` : The `QuickSelect` key assignment is used to enter quick select mode; it is bound to this by default.

* `ESCAPE` : Pressing this will cancel quick select mode.

## [Copy Mode](https://wezterm.org/copymode.html)

* `CTRL-SHIFT-X` : The ActivateCopyMode key assignment is used to enter copy mode; it is bound to this by default.
  * `v` : press this to toggle selection mode (it is off by default)
  * `CTRL-SHIFT-C` : use `Copy` (by default: this) to copy that region to the clipboard

* `Ctrl + Shift + X` : Activate copy mode

* `y` : Copy and exit copy mode

* `Esc` OR `Ctrl + C` OR `Ctrl + G` OR `q` : Exit copy mode

* `v` : Cell selection

* `Shift + V` : Line selection

* `Ctrl + V` : Rectangular selection

* `LeftArrow` OR `h` : Move Left

* `DownArrow` OR `j` : Move Down

* `UpArrow` OR `k` : Move Up

* `RightArrow` OR `l` : Move Right

* `Alt + RightArrow` OR `Alt + F` OR `Tab` OR `w` : Move forward one word

* `Alt + LeftArrow` OR `Alt + B` OR `Shift + Tab` OR `b` : Move backward one word

* `e` : Move forward one word end

* `0` OR `Home` : Move to start of this line

* `Enter` : Move to start of next line

* `$` OR `End` : Move to end of this line

* `Alt + M` OR `^` : Move to start of indented line

* `Shift + G` : Move to bottom of scrollback

* `g` : Move to top of scrollback

* `Shift + H` : Move to top of viewport

* `Shift + M` : Move to middle of viewport

* `Shift + L` : Move to bottom of viewport

* `PageUp` OR `Ctrl + B` : Move up one screen

* `Ctrl + U` : Move up half a screen

* `PageDown` OR `Ctrl + F` : Move down one screen

* `Ctrl + D` : Move down half a screen

* `o` : Move to other end of the selection

* `Shift + O` (useful in Rectangular mode) : Move to other end of the selection horizontally

# Keybind-WezTerm.md

## Notes

# References

## Websites

* [Default Key Assignments](https://wezterm.org/config/default-keys.html)
* [Copy Mode](https://wezterm.org/copymode.html)
* [Quick Select Mode](https://wezterm.org/quickselect.html)
* [Mouse bindings](https://wezterm.org/config/mouse.html)
