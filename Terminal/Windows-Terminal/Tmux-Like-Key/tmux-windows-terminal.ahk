#Requires AutoHotkey v2.0

; ==========================================================
; Windows Terminal -> Tmux-like Keybindings
; Works only when Windows Terminal window is active
; ==========================================================

#HotIf WinActive("ahk_exe WindowsTerminal.exe")

; Copy mode like Tmux
copyMode := false
selecting := false

; Type sequential keys within 0.5 seconds
leader := false

^Space::
{
    global leader
    leader := true
    SetTimer LeaderTimeout, -1500
}

#HotIf WinActive("ahk_exe WindowsTerminal.exe") && leader

; --------------------------------------------------
; Windows
; --------------------------------------------------

c::
{
    global leader
    if leader
    {
        leader := false
        Send("^+t") ; Create new tab
    }
}

&::
{
    global leader
    if leader
    {
        leader := false
        Send("^+w") ; Close current tab
    }
}

p::
{
    global leader
    if leader
    {
        leader := false
        Send("^+{Tab}") ; Switch to previous tab
    }
}

n::
{
    global leader
    if leader
    {
        leader := false
        Send("^{Tab}") ; Switch to next tab
    }
}

1::
{
    global leader
    if leader
    {
        leader := false
        Send("^!1") ; Switch to tab, index:0
    }
}

2::
{
    global leader
    if leader
    {
        leader := false
        Send("^!2") ; Switch to tab, index:1
    }
}

3::
{
    global leader
    if leader
    {
        leader := false
        Send("^!3") ; Switch to tab, index:2
    }
}

4::
{
    global leader
    if leader
    {
        leader := false
        Send("^!4") ; Switch to tab, index:3
    }
}

5::
{
    global leader
    if leader
    {
        leader := false
        Send("^!5") ; Switch to tab, index:4
    }
}

6::
{
    global leader
    if leader
    {
        leader := false
        Send("^!6") ; Switch to tab, index:5
    }
}

7::
{
    global leader
    if leader
    {
        leader := false
        Send("^!7") ; Switch to tab, index:6
    }
}

8::
{
    global leader
    if leader
    {
        leader := false
        Send("^!8") ; Switch to tab, index:7
    }
}

9::
{
    global leader
    if leader
    {
        leader := false
        Send("^!9") ; Switch to the last tab
    }
}

; --------------------------------------------------
; Panes
; --------------------------------------------------

%::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{+}") ; Split pane horizontally
    }
}

"::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{-}") ; Split pane vertically
    }
}

+[::
{
    global leader
    if leader
    {
        leader := false
        Send("^+!r") ; Rotate panes counter-clockwise
    }
}

+]::
{
    global leader
    if leader
    {
        leader := false
        Send("^+r") ; Rotate panes clockwise
    }
}

Up::
{
    global leader
    if leader
    {
        leader := false
        Send("!{Up}") ; Select the pane above the active pane
    }
}

Down::
{
    global leader
    if leader
    {
        leader := false
        Send("!{Down}") ; Select the pane below the active pane
    }
}

Left::
{
    global leader
    if leader
    {
        leader := false
        Send("!{Left}") ; Select the pane to the left of the active pane
    }
}

Right::
{
    global leader
    if leader
    {
        leader := false
        Send("!{Right}") ; Select the pane to the right of the active pane
    }
}

z::
{
    global leader
    if leader
    {
        leader := false
        Send("^+z") ; Zoom/unzoom current pane
    }
}

^Up::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{Up}") ; Resize the pane up
    }
}

^Down::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{Down}") ; Resize the pane down
    }
}

^Left::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{Left}") ; Resize the pane left
    }
}

^Right::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{Right}") ; Resize the pane right
    }
}

x::
{
    global leader
    if leader
    {
        leader := false
        Send("^+w") ; Close current pane
    }
}

[::
{
    global copyMode, selecting

    if copyMode
        return

    copyMode := true
    selecting := false

    ; Open Windows Terminal Mark Mode
    Send "^+m"

;    ToolTip "COPY MODE"
    ShowToolTipTopRight("COPY MODE")
}

#HotIf

#HotIf WinActive("ahk_exe WindowsTerminal.exe") && copyMode && !selecting

; start visual selection
Space::
{
    global copyMode, selecting

    selecting := true
    copyMode := false
}

; navigation
h::Send "{Left}"
j::Send "{Down}"
k::Send "{Up}"
l::Send "{Right}"

w::Send "^{Right}"
b::Send "^{Left}"

g::Send "{Home}"
+g::Send "{End}"

; page movement
^u::Send "{PgUp}"
^d::Send "{PgDn}"

; Transfer entire output buffer to neovim: Enter into mark mode. Select all text. Copy all text. Open neovim with clipboard text.
^n::
{
    global copyMode, selecting
    copyMode := false
    selecting := false
    ToolTip
    
    Send "^a"
    Send "^+c"
;    Run('powershell.exe -NoProfile -Command "Get-Clipboard | nvim -"') ; Open new powershell.exe window
    SendText('powershell.exe -NoProfile -Command "Get-Clipboard | nvim -"') ; Use built-in powershell-5 (pwershell.exe), not powershell-7 (pwsh). Vim does not copy to clipboard, so use Neovim.
    Send('{Enter}')
}

; cancel
Esc::
q::
{
    global copyMode, selecting
    Send "{Esc}"
    copyMode := false
    selecting := false
    ToolTip
}

#HotIf

#HotIf WinActive("ahk_exe WindowsTerminal.exe") && selecting && !copyMode

; copy mode selection
h::Send "+{Left}"
j::Send "+{Down}"
k::Send "+{Up}"
l::Send "+{Right}"

; Copy selected text
Enter::
y::
{
    global copyMode, selecting
    Send "{Enter}"
    copyMode := false
    selecting := false
    ToolTip
}

; cancel
Esc::
q::
{
    global copyMode, selecting
    Send "{Esc}"
    copyMode := false
    selecting := false
    ToolTip
}

#HotIf

LeaderTimeout()
{
    global leader
    leader := false
}

ShowToolTipTopRight(text) {
    WinGetPos(&x, &y, &w, &h, "A")
    ToolTip(text, x + w - 200, y + 10)
}

#HotIf

