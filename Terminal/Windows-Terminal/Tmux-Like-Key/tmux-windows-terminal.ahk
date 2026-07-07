#Requires AutoHotkey v2.0

; ==========================================================
; Windows Terminal -> Tmux-like Keybindings
; Works only when Windows Terminal window is active
; ==========================================================

#HotIf WinActive("ahk_exe WindowsTerminal.exe")


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
        Send("^{Tab}") ; 	Switch to next tab
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


~%::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{+}") ; Split pane horizontally
    }
}

~"::
{
    global leader
    if leader
    {
        leader := false
        Send("!+{-}") ; Split pane vertically
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

#HotIf

LeaderTimeout()
{
    global leader
    leader := false
}

#HotIf

