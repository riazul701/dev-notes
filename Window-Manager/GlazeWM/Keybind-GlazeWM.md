# Commands/Usage

* On the first launch of GlazeWM, a default configuration can optionally be generated. <sup>{1}</sup>

# [Default keybindin](https://github.com/glzr-io/glazewm#default-keybindings)

* [GlazeWM Commands Cheatsheet](https://github.com/glzr-io/glazewm/blob/main/resources/assets/cheatsheet.png)

* All available commands and their default keybindings

## Shifting focus

* `focus --direction <DIRECTION>` : Focus in direction
  * `Alt+H`, `Alt+LeftArrow` : focus left
  * `Alt+J`, `Alt+DownArrow` : focus down
  * `Alt+K`, `Alt+UpArrow` : focus up
  * `Alt+l`, `Alt+RightArrow` : focus right

* `Alt+Space`, `wm-cycle-focus` : Focus tiling -> floating -> fullscreen

* `Alt+D`, `focus --recent-workspace` : Focus recent workspace

* `Alt+S`, `focus --next-workspace` : Focus next workspace

* `Alt+A`, `focus --prev-workspace` : Focus previous workspace

* `Alt+1...9`, `focus --workspace <NAME>` : Focus workspace by name

## Moving around

* `move --direction <DIRECTION>` : Move in direction
  * `Alt+Shift+H`, `Alt+Shift+LeftArrow` : move left
  * `Alt+Shift+J`, `Alt+Shift+DownArrow` : move down
  * `Alt+Shift+K`, `Alt+Shift+UpArrow` : move up
  * `Alt+Shift+l`, `Alt+Shift+RightArrow` : move right

* `move --recent-workspace` : Move window to recent workspace

* `move --next-workspace` : Move window to next workspace

* `move --prev-workspace` : Move window to previous workspace

* `Alt+Shift+1...9`, `move --workspace <NAME>` : Move window to workspace

* `Alt+Shift+A`, `Alt+Shift+S`, `Alt+Shift+D`, `Alt+Shift+F`, `move-workspace --direction <DIRECTION>` : Move workspace in direction

## Modifying windows

* `Alt+U`, `Alt+I`, `Alt+O`, `Alt+P`, `resize --width <AMOUNT> --height <AMOUNT>` : Resize window

* `size --width <AMOUNT> --height <AMOUNT>` : Set exact window size

* `Alt+Shift+Q`, `close` : Close window

* `ignore` : Ignore window

* `adjust-borders --left <AMOUNT> --right <AMOUNT> ...` : Resize window borders

* `Alt+V`, `toggle-tiling-direction` : Toggle tiling direction

* `Alt+Shift+Space`, `toggle-floating` : Toggle floating state
  * Windows Notification: Input language switching
    * Typing Left Alt + Shift changes your input language. You can turn this feature off or change your hot key sequence by selecting Customize.

* `Alt+M`, `toggle-minimized` : Toggle minimized state

* `Alt+F`, `toggle-fullscreen` : Toggle fullscreen state

* `Alt+T`, `toggle-tiling` : Toggle tiling state

* `set-floating` : Change to floating state

* `set-minimized` : Change to minimized state

* `set-fullscreen` : Change to fullscreen state

* `set-tiling` : Change to tiling state

## General

* `Alt+Shift+E`, `wm-exit` : Gracefully exit WM

* `Alt+Shift+R`, `wm-reload-config` : Reload config

* `Alt+Shift+W`, `wm-redraw` : Redraw all windows

* `wm-enabling-binding-mode --name <NAME>` : Enable binding mode by name

* `wm-disable-binding-mode --name <NAME>` : Disable binding mode by name

* `shell-exe <COMMAND...>` : Execute a shell command

# Keybind-GlazeWM.md

# References

* next-sl: {2}

## Commands From

* {1} [glzr-io/glazewm GitHub](https://github.com/glzr-io/glazewm)
