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

#HotIf

LeaderTimeout()
{
    global leader
    leader := false
}

#HotIf

