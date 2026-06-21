# Multiplexing.md

# Concept

> ChatGPT Question: 
> 
> complete tutorial of wezterm multiplexing when connecting from one windows machine to another via ssh

If you're connecting from **Windows → Windows via SSH**, WezTerm multiplexing can be used, but the setup is different from tmux. The key idea is:

* **Remote Windows PC** runs the WezTerm multiplexer server.
* **Local Windows PC** runs WezTerm as the client.
* You connect to the remote multiplexer through SSH and reconnect to the same sessions later.

***## Architecture***

```text
Windows Laptop (Client)
        |
        | SSH
        v
Windows Desktop (Server)
        |
   WezTerm Mux
        |
  PowerShell / CMD / WSL
```

The multiplexer lives on the remote machine, not on your local machine.

---

***# Step 1: Install WezTerm on both machines***

Install WezTerm on:

* Local Windows machine
* Remote Windows machine

Get it from:

[WezTerm Downloads & Documentation](https://wezfurlong.org/wezterm/installation.html?utm_source=chatgpt.com)

Verify:

```powershell
wezterm --version
```

on both systems.

---

***# Step 2: Ensure SSH access works***

On the remote Windows machine, enable and start the Windows OpenSSH Server.

Verify from the local machine:

```powershell
ssh username@remote-pc
```

works successfully.

If this isn't working yet, fix SSH first before touching WezTerm multiplexing.

---

***# Step 3: Start a multiplexer server on the remote machine***

On the remote machine:

```powershell
wezterm start --always-new-process
```

This launches a WezTerm instance and its mux.

You can confirm WezTerm is running in Task Manager.

---

***# Step 4: Create an SSH domain***

On the local machine, edit your WezTerm configuration:

```lua
local wezterm = require 'wezterm'

return {
  ssh_domains = {
    {
      name = 'work-pc',
      remote_address = '192.168.1.100',
      username = 'your_username',
    },
  },
}
```

Replace:

* `192.168.1.100`
* `your_username`

with your actual values.

Save as:

```text
%USERPROFILE%\.wezterm.lua
```

or

```text
%USERPROFILE%\.config\wezterm\wezterm.lua
```

depending on your setup.

---

***# Step 5: Connect to the remote machine***

Open WezTerm.

Use:

```text
New Tab → work-pc
```

or Command Palette:

```text
CTRL+SHIFT+P
```

then:

```text
Connect to SSH Domain
```

Choose:

```text
work-pc
```

You should now have a shell running on the remote Windows machine.

---

***# Step 6: Create persistent sessions***

Start something long-running:

```powershell
ping -t google.com
```

or

```powershell
python long_job.py
```

Create tabs:

```text
Ctrl+Shift+T
```

Split panes:

```text
Alt+Shift+H
Alt+Shift+V
```

(assuming default bindings).

---

***# Step 7: Detach***

Close the client window.

The remote mux continues running.

Your shells remain active.

Your processes continue running.

---

***# Step 8: Reconnect***

Later:

```text
Open WezTerm
→ Connect to SSH Domain
→ work-pc
```

You reconnect to the same mux instance and can recover the tabs/panes that are still running.

---

***# Step 9: Workspaces (optional)***

Create separate workspaces:

```lua
local wezterm = require 'wezterm'
local mux = wezterm.mux
```

Example concepts:

```text
workspace: development
workspace: monitoring
workspace: testing
```

Each workspace can contain:

* Multiple tabs
* Multiple panes
* Independent layouts

You can switch between them later.

Documentation:

[WezTerm Workspaces Documentation](https://wezfurlong.org/wezterm/recipes/workspaces.html?utm_source=chatgpt.com)

---

***# Step 10: Using WSL on the remote machine***

Many Windows developers actually run:

```text
Remote Windows
    └─ WSL
         └─ bash
              └─ applications
```

inside the WezTerm multiplexer.

Example:

```powershell
wsl
```

then:

```bash
npm run dev
```

or

```bash
docker compose up
```

The WSL processes continue running as long as the mux session remains alive.

---

***# What most users actually do***

For a Windows-to-Windows setup, there are two common patterns:

***### Pattern A: WezTerm only***

```text
Local WezTerm
     |
Remote WezTerm mux
```

Pros:

* Integrated UI
* Workspaces
* Native pane management

Cons:

* Requires WezTerm on both machines

---

***### Pattern B: WezTerm + tmux***

```text
Local WezTerm
      |
SSH
      |
Remote Linux/WSL
      |
tmux
```

Pros:

* Extremely portable
* Works from any terminal
* Mature ecosystem

Cons:

* Extra layer

---

***# Which should you choose?***

If the remote machine is **pure Windows** and you use WezTerm everywhere, WezTerm multiplexing is a reasonable replacement for tmux.

If the remote machine primarily hosts **WSL**, many developers still use tmux inside WSL because:

```bash
ssh machine
tmux attach
```

works from any terminal emulator, not just WezTerm.

One important note: WezTerm's multiplexing features have evolved over time. Before investing heavily in a setup, check the current multiplexing and SSH-domain documentation in the official docs:

[WezTerm Multiplexing Documentation](https://wezfurlong.org/wezterm/multiplexing.html?utm_source=chatgpt.com)

because some connection methods and configuration details may change between releases.

==================================================================================

> ChatGPT Question: 
> 
> On windows OS, start wezterm multiplexer, run some continuous process in it, 
> close wezterm GUI, start wezterm GUI again and attach to previous wezterm 
> multiplexer. This all steps can be done using tmux.

The answer is **yes, but not with the default setup**.

By default, when you launch WezTerm normally:

```powershell
wezterm
```

and then close all WezTerm windows, the local mux goes away. It does **not** behave like tmux automatically. ([wezterm.org][1])

To get tmux-like behavior, you need to run a **separate mux server domain** and reconnect to it later.

***## What you want***

You want this workflow:

1. Start mux server
2. Run a long process

```powershell
ping -t google.com
```

3. Close WezTerm GUI
4. Process keeps running
5. Open WezTerm again
6. Reattach and see the same session

That is possible using a local Unix domain (works on Windows too). ([wezterm.org][1])

---

***## Configuration***

In your `wezterm.lua`:

```lua
local wezterm = require 'wezterm'

return {
  unix_domains = {
    {
      name = 'unix',
    },
  },
}
```

This tells WezTerm to create/connect to a local mux server. ([wezterm.org][1])

---

***## Start the mux server***

Open PowerShell:

```powershell
wezterm connect unix
```

The first time, WezTerm will start the mux server if it isn't already running and connect to it. ([wezterm.org][1])

---

***## Run a process***

Inside WezTerm:

```powershell
ping -t google.com
```

or

```powershell
python long_running_script.py
```

---

***## Close the GUI***

Click the X button.

The GUI closes.

The mux server should remain running, and the shell/process continues because it belongs to the mux server, not the GUI client. This is exactly the tmux-style architecture. ([wezterm.org][1])

---

***## Reattach later***

From PowerShell:

```powershell
wezterm connect unix
```

You reconnect to the same mux domain and should see the running pane/tab. ([wezterm.org][1])

---

***## Check whether it is still alive***

From a normal PowerShell window:

```powershell
wezterm cli list --prefer-mux
```

The CLI can talk to a running mux server and list panes/tabs. ([wezterm.org][2])

---

***## The catch***

This is the part that surprises many tmux users:

* tmux is designed around a persistent server from day one.
* WezTerm's mux is newer and considered a more advanced feature. The documentation explicitly notes that multiplexing is still evolving. ([wezterm.org][1])
* Most WezTerm users don't use it this way; they either use the built-in GUI tabs or run tmux on remote systems.

So if your goal is simply:

> "Close terminal, reopen later, and keep my shells alive"

tmux is still the more battle-tested solution.

If you want, I can show a **complete Windows example** where:

* WezTerm starts a persistent local mux server automatically at login,
* closing the GUI never kills it,
* and reopening WezTerm automatically reattaches to your previous workspace (making it feel almost exactly like tmux).

[1]: https://wezterm.org/multiplexing.html?utm_source=chatgpt.com "Multiplexing - Wez's Terminal Emulator"
[2]: https://wezterm.org/cli/cli/index.html?utm_source=chatgpt.com "wezterm cli - Wez's Terminal Emulator"

==================================================================================

> ChatGPT Question: 
> 
> Do it 
> WezTerm starts a persistent local mux server automatically at login
> closing the GUI never kills it
> and reopening WezTerm automatically reattaches to your previous workspace (making it feel almost exactly like tmux).

Here's a setup that makes WezTerm behave much more like tmux on Windows:

***## Goal***

You want:

```text
1. Start Windows
2. Start WezTerm mux server
3. Open WezTerm GUI
4. Run long-running processes
5. Close all WezTerm windows
6. Processes continue running
7. Open WezTerm again
8. Reattach to existing session
```

***## Important Caveat***

Unlike tmux, WezTerm is not primarily designed as a standalone daemon that users manually manage all day. Its local mux functionality exists, but tmux remains more mature for this specific use case.

That said, here's how to get close.

---

***# Step 1: Configure a local persistent domain***

Create or edit:

```text
%USERPROFILE%\.wezterm.lua
```

```lua
local wezterm = require 'wezterm'

return {
  unix_domains = {
    {
      name = 'persistent',
    },
  },

  default_gui_startup_args = {
    'connect',
    'persistent',
  },
}
```

This tells WezTerm to connect to a local mux domain named `persistent` whenever the GUI starts.

---

***# Step 2: Start the mux server***

Open PowerShell:

```powershell
wezterm connect persistent
```

The first connection starts the mux server if it isn't already running.

You should now have a WezTerm window connected to that domain.

---

***# Step 3: Create some tabs***

Example:

Tab 1:

```powershell
ping -t 8.8.8.8
```

Tab 2:

```powershell
python long_running_script.py
```

Tab 3:

```powershell
powershell
```

---

***# Step 4: Verify the mux exists***

Open a separate PowerShell window:

```powershell
wezterm cli list --prefer-mux
```

You should see pane information.

If you see panes listed, you're talking to the mux server rather than a standalone GUI instance.

---

***# Step 5: Close all WezTerm windows***

Click the X button.

At this point:

```text
WezTerm GUI    -> Closed
Mux Server     -> Running
Processes      -> Running
```

This is the tmux-like behavior you're after.

---

***# Step 6: Reopen WezTerm***

Launch:

```powershell
wezterm
```

Because of:

```lua
default_gui_startup_args = {
  'connect',
  'persistent',
}
```

the GUI reconnects to the existing mux domain.

You should see your previous tabs and panes.

---

***# Step 7: Auto-start at Windows login (optional)***

Create a shortcut in:

```text
shell:startup
```

that runs:

```powershell
wezterm connect persistent
```

or create a Scheduled Task that starts:

```powershell
wezterm.exe connect persistent
```

at user logon.

Then the mux server starts automatically after login.

---

***# Useful Commands***

***### List panes***

```powershell
wezterm cli list --prefer-mux
```

***### Spawn a new tab***

```powershell
wezterm cli spawn --new-tab
```

***### Send text to a pane***

```powershell
wezterm cli send-text "hello"
```

***### List workspaces***

```powershell
wezterm cli list-clients
```

(availability depends on version).

---

***# A Better tmux-like Workspace Restore***

Add this event to your config:

```lua
local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function()
  local _, _, window = mux.spawn_window {}
  window:gui_window():maximize()
end)

return {
  unix_domains = {
    {
      name = 'persistent',
    },
  },

  default_gui_startup_args = {
    'connect',
    'persistent',
  },
}
```

This automatically creates or reconnects a window on startup.

---

***# Reality Check***

For the exact workflow:

```text
close terminal
keep shells alive
reopen terminal
reattach
```

tmux still has fewer moving parts:

```bash
tmux new -s work
tmux attach -t work
```

WezTerm can do something very similar, but the local mux feature is less commonly used and less extensively documented than tmux. If you already use WezTerm everywhere and want integrated tabs, panes, SSH domains, and GUI features, it can be worthwhile. If your only goal is persistent local sessions, tmux remains the simpler mental model.

==================================================================================

> ChatGPT Question: 
> 
> wezterm multiplexer supports workspaces or not

Yes. **WezTerm's multiplexer supports workspaces natively.**

A workspace is essentially a named collection of:

* Windows
* Tabs
* Panes

similar to having multiple tmux sessions, but integrated into the WezTerm mux.

For example:

```text id="eztv7j"
workspace: dev
├─ tab: backend
├─ tab: frontend
└─ tab: logs

workspace: ops
├─ tab: prod-logs
└─ tab: monitoring

workspace: personal
└─ tab: notes
```

You can switch between workspaces and each maintains its own layout and running processes.

---

***## Comparison with tmux sessions***

tmux:

```text id="25xw5v"
tmux session: dev
tmux session: ops
tmux session: personal
```

WezTerm:

```text id="yy8r3f"
workspace: dev
workspace: ops
workspace: personal
```

Conceptually, a WezTerm workspace is very close to a tmux session.

---

***## Do processes keep running inside a workspace?***

Yes.

If you're connected to a persistent mux domain:

```powershell id="j5wf5z"
python train.py
```

inside workspace `dev`,

then:

1. Close WezTerm GUI
2. Process continues running
3. Open WezTerm later
4. Reconnect to the mux
5. Switch to workspace `dev`

and the process is still there.

---

***## Creating a workspace***

From the command palette:

```text id="v7b74g"
Ctrl+Shift+P
```

Search:

```text id="qk7iyz"
Switch Workspace
```

or

```text id="c6ig7d"
Create Workspace
```

depending on your version.

---

***## CLI example***

You can spawn into a workspace:

```powershell id="w3f5mo"
wezterm cli spawn --workspace dev
```

Now tabs created there belong to `dev`.

---

***## Why workspaces are nicer than tmux sessions in some cases***

Because WezTerm knows about:

* GUI windows
* Tabs
* Panes
* Workspaces

all at the multiplexer level.

tmux only knows about terminal panes.

Example:

```text id="r77m7s"
Workspace: Work
    Window A
        Tab 1
        Tab 2

    Window B
        Tab 3
```

When you reconnect, WezTerm can restore the full hierarchy.

---

***## For your Windows "persistent terminal" setup***

A common pattern is:

```text id="9e1w4t"
persistent mux server

workspace: coding
workspace: docker
workspace: monitoring
workspace: experiments
```

Then:

```text id="s6n6e6"
close GUI
```

Later:

```text id="s5h6ea"
open GUI
```

Reconnect to the mux and switch workspaces as needed.

This is probably the closest WezTerm gets to the "multiple tmux sessions" workflow, except that the workspaces are built into the multiplexer rather than managed by a separate tool.

# References

## Tutorials

* [Multiplexing](https://wezterm.org/multiplexing.html)
* [SSH](https://wezterm.org/ssh.html)

## YouTube Tutorials

* [Why WezTerm Beats Ghostty, Warp, and tmux COMBINED BY Better Stack](https://www.youtube.com/watch?v=kYBvkzwM8Iw)
