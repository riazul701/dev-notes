# [Default Keybindings](https://lgug2z.github.io/komorebi/example-configurations.html#whkdrc)

* `.shell powershell`

## Reload whkd configuration

* `# alt + o` : taskkill /f /im whkd.exe && start /b whkd # if shell is cmd
* `alt + o`                 : taskkill /f /im whkd.exe; Start-Process whkd -WindowStyle hidden # if shell is pwsh / powershell
* alt + shift + o         : komorebic reload-configuration

## App shortcuts

* App shortcuts - these require shell to be pwsh / powershell
* The apps will be focused if open, or launched if not open
* `# alt + f` : if ($wshell.AppActivate('Firefox') -eq $False) { start firefox }
* `# alt + b` : if ($wshell.AppActivate('Chrome') -eq $False) { start chrome }
* `alt + q` : komorebic close
* `alt + m` : komorebic minimize

## Focus windows

* `alt + h` : komorebic focus left
* `alt + j` : komorebic focus down
* `alt + k` : komorebic focus up
* `alt + l` : komorebic focus right
* `alt + shift + oem_4` : komorebic cycle-focus previous # oem_4 is [
* `alt + shift + oem_6` : komorebic cycle-focus next # oem_6 is ]

## Move windows

* `alt + shift + h` : komorebic move left
* `alt + shift + j` : komorebic move down
* `alt + shift + k` : komorebic move up
* `alt + shift + l` : komorebic move right
* `alt + shift + return` : komorebic promote

## Stack windows

* `alt + left` : komorebic stack left
* `alt + down` : komorebic stack down
* `alt + up` : komorebic stack up
* `alt + right` : komorebic stack right
* `alt + oem_1` : komorebic unstack # oem_1 is ;
* `alt + oem_4` : komorebic cycle-stack previous # oem_4 is [
* `alt + oem_6` : komorebic cycle-stack next # oem_6 is ]

## Resize

* `alt + oem_plus` : komorebic resize-axis horizontal increase
* `alt + oem_minus` : komorebic resize-axis horizontal decrease
* `alt + shift + oem_plus` : komorebic resize-axis vertical increase
* `alt + shift + oem_minus` : komorebic resize-axis vertical decrease

## Manipulate windows

* `alt + t` : komorebic toggle-float
* `alt + shift + f` : komorebic toggle-monocle

## Window manager options

* `alt + shift + r` : komorebic retile
* `alt + p` : komorebic toggle-pause

## Layouts

* `alt + x` : komorebic flip-layout horizontal
* `alt + y` : komorebic flip-layout vertical

## Workspaces

* `alt + 1` : komorebic focus-workspace 0
* `alt + 2` : komorebic focus-workspace 1
* `alt + 3` : komorebic focus-workspace 2
* `alt + 4` : komorebic focus-workspace 3
* `alt + 5` : komorebic focus-workspace 4
* `alt + 6` : komorebic focus-workspace 5
* `alt + 7` : komorebic focus-workspace 6
* `alt + 8` : komorebic focus-workspace 7

## Move windows across workspaces

* `alt + shift + 1` : komorebic move-to-workspace 0
* `alt + shift + 2` : komorebic move-to-workspace 1
* `alt + shift + 3` : komorebic move-to-workspace 2
* `alt + shift + 4` : komorebic move-to-workspace 3
* `alt + shift + 5` : komorebic move-to-workspace 4
* `alt + shift + 6` : komorebic move-to-workspace 5
* `alt + shift + 7` : komorebic move-to-workspace 6
* `alt + shift + 8` : komorebic move-to-workspace 7

# Set Keybindings

## [Focusing Windows](https://lgug2z.github.io/komorebi/usage/focusing-windows.html)

* Windows can be focused in a direction (left, down, up, right) using the `komorebic focus` command.
  * alt + h                 : komorebic focus left
  * alt + j                 : komorebic focus down
  * alt + k                 : komorebic focus up
  * alt + l                 : komorebic focus right

* Windows can be focused in a cycle direction (previous, next) using the `komorebic cycle-focus` command.
  * alt + shift + oem_4     : komorebic cycle-focus previous # oem_4 is [
  * alt + shift + oem_6     : komorebic cycle-focus next # oem_6 is ]

* It is possible to attempt to focus the first window, on any workspace, matching an exe using the `komorebic eager-focus` command.
  * win + 1                 : komorebic eager-focus firefox.exe

* The window at the largest tile can be focused using the komorebic promote-focus command.
  * alt + return            : komorebic promote-focus

## [Moving Windows](https://lgug2z.github.io/komorebi/usage/moving-windows.html)

* Windows can be moved in a direction (left, down, up, right) using the komorebic move command.
  * alt + shift + h         : komorebic move left
  * alt + shift + j         : komorebic move down
  * alt + shift + k         : komorebic move up
  * alt + shift + l         : komorebic move right

* Windows can be moved in a cycle direction (previous, next) using the `komorebic cycle-move` command.
  * alt + shift + oem_4     : komorebic cycle-move previous # oem_4 is [
  * alt + shift + oem_6     : komorebic cycle-move next # oem_6 is ]

* The focused window can be moved to the largest tile using the `komorebic promote` command.
  * alt + shift + return    : komorebic promote

## [Stacking Windows](https://lgug2z.github.io/komorebi/usage/stacking-windows.html)

* Windows can be stacked in a direction (left, down, up, right) using the `komorebic stack` command.
  * alt + left              : komorebic stack left
  * alt + down              : komorebic stack down
  * alt + up                : komorebic stack up
  * alt + right             : komorebic stack right

* Windows can be popped from a stack using the `komorebic unstack` command.
  * alt + oem_1             : komorebic unstack # oem_1 is ;

* Windows in a stack can be focused in a cycle direction (previous, next) using the `komorebic cycle-stack` command.
  * alt + oem_4             : komorebic cycle-stack previous # oem_4 is [
  * alt + oem_6             : komorebic cycle-stack next # oem_6 is ]

* Windows in a stack can have their positions in the stack moved in a cycle direction (previous, next) using the `komorebic cycle-stack-index` command.
  * alt + shift + oem_4     : komorebic cycle-stack-index previous # oem_4 is [
  * alt + shift + oem_6     : komorebic cycle-stack-index next # oem_6 is ]

## [Focusing Workspaces](https://lgug2z.github.io/komorebi/usage/focusing-workspaces.html)

* Workspaces on the focused monitor can be focused by their index using the `komorebic focus-workspace` command.
  * alt + 1                 : komorebic focus-workspace 0
  * alt + 2                 : komorebic focus-workspace 1
  * alt + 3                 : komorebic focus-workspace 2

* Workspaces on the focused monitor can be focused in a cycle direction (previous, next) using the `komorebic cycle-workspace` command.
  * alt + shift + oem_4     : komorebic cycle-workspace previous # oem_4 is [
  * alt + shift + oem_6     : komorebic cycle-workspace next # oem_6 is ]

* Workspaces on other monitors can be focused by both the monitor index and the workspace index using the komorebic focus-monitor-workspace command.
  * alt + 1                 : komorebic focus-monitor-workspace 0 0
  * alt + 2                 : komorebic focus-monitor-workspace 0 1
  * alt + 3                 : komorebic focus-monitor-workspace 1 0

* Workspaces on any monitor can be focused by their name (given that all workspace names across all monitors are unique) using the `komorebic focus-named-workspace` command.
  * alt + c                 : komorebic focus-named-workspace coding

* Workspaces on all monitors can be set to the same index (emulating single workspaces which span across all monitors) using the `komorebic focus-workspaces` command.
  * alt + 1                 : komorebic focus-workspaces 0
  * alt + 2                 : komorebic focus-workspaces 1
  * alt + 3                 : komorebic focus-workspaces 2

## [Moving Windows Across Workspaces](https://lgug2z.github.io/komorebi/usage/moving-windows-across-workspaces.html)

* Windows can be moved to another workspace on the focused monitor using the `komorebic move-to-workspace` command. This command will also move your focus to the target workspace.
  * alt + shift + 1         : komorebic move-to-workspace 0
  * alt + shift + 2         : komorebic move-to-workspace 1
  * alt + shift + 3         : komorebic move-to-workspace 2

* Windows can be sent to another workspace on the focused monitor using the `komorebic send-to-workspace` command. This command will keep your focus on the origin workspace.
  * alt + shift + 1         : komorebic send-to-workspace 0
  * alt + shift + 2         : komorebic send-to-workspace 1
  * alt + shift + 3         : komorebic send-to-workspace 2

* Windows can be moved to another workspace on the focused monitor in a cycle direction (previous, next) using the `komorebic cycle-move-to-workspace` command. This command will also move your focus to the target workspace.
  * alt + shift + oem_4     : komorebic cycle-move-to-workspace previous # oem_4 is [
  * alt + shift + oem_6     : komorebic cycle-move-to-workspace next # oem_6 is ]

* Windows can be sent to another workspace on the focused monitor in a cycle direction (previous, next) using the `komorebic cycle-send-to-workspace` command. This command will keep your focus on the origin workspace.
  * alt + shift + oem_4     : komorebic cycle-send-to-workspace previous # oem_4 is [
  * alt + shift + oem_6     : komorebic cycle-send-to-workspace next # oem_6 is ]
