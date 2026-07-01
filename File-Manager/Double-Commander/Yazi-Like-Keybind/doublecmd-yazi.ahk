#Requires AutoHotkey v2.0

; ==========================================================
; Double Commander -> Vifm-like Keybindings
; Works only when Double Commander window is active
; ==========================================================

#HotIf WinActive("ahk_exe doublecmd.exe") && !(WinGetClass("ahk_id " ControlGetFocus("A")) = "Edit")

; -------------------------
; Debug Code
; -------------------------
; MsgBox("Double-Commander Window Activated.")

;F1::
;{
;    hwnd := ControlGetFocus("A")
;    class := WinGetClass("ahk_id " hwnd)
;
;    MsgBox("HWND: " hwnd "`nClass: " class)
;}

; -------------------------
; Movement (hjkl)
; -------------------------
h::Send("{Left}")
j::Send("{Down}")
k::Send("{Up}")
l::Send("{Right}")

; -------------------------
; Open / Enter
; -------------------------
o::Send("{Enter}")

; -------------------------
; Go to parent directory
; -------------------------
u::Send("!{Up}")

; -------------------------
; Refresh
; -------------------------
r::Send("{F2}")

; -------------------------
; Rename
; -------------------------
; c & w::Send("{F6}")

c::
{
    ih := InputHook("L1 T0.3")
    ih.Start()
    ih.Wait()

    if (ih.Input = "w")
        Send("{F6}")
    ;else
        ;Send("c" ih.Input)
}

; -------------------------
; Copy / Move
; -------------------------
y & y::Send("{F5}")   ; copy
;y::Send("{F5}")   ; copy


~y::
{
    static last := 0
    now := A_TickCount

    ; if second y within 400 ms
    if (now - last < 400)
    {
        Send("{F5}")
        last := 0
    }
    else
    {
        last := now
    }
}

; d & d::Send("{F8}")   ; delete

~d::
{
    static last := 0
    now := A_TickCount

    ; if second y within 400 ms
    if (now - last < 400)
    {
        Send("{F8}")
        last := 0
    }
    else
    {
        last := now
    }
}

; p & p::Send("^v")     ; paste

p::
{
    ih := InputHook("L1 T0.3")
    ih.Start()
    ih.Wait()

    if (ih.Input = "p")
        Send("^v")
    ;else
        ;Send("c" ih.Input)
}

; -------------------------
; Create directory
; -------------------------
; m & d::Send("+{F7}")

m::
{
    ih := InputHook("L1 T0.3")
    ih.Start()
    ih.Wait()

    if (ih.Input = "d")
        Send("{F6}")
    ;else
        ;Send("c" ih.Input)
}

; -------------------------
; Search
; -------------------------
/::Send("^f")

; -------------------------
; Tabs
; -------------------------
; g & t::Send("^{Tab}")
; g & T::Send("^+{Tab}")

g::
{
    ih := InputHook("L1 T0.3")
    ih.Start()
    ih.Wait()

    if (ih.Input == "t")
        Send("^Tab")

    else if (ih.Input == "T")
        Send("^+Tab")

    ;else
        ;Send("c" ih.Input)
}

; -------------------------
; Jump to top / bottom
; -------------------------
g & g::Send("^{Home}")
+g::Send("^{End}")

; -------------------------
; Toggle selection with space
; -------------------------
Space::Send("{Insert}")

; -------------------------
; Select all
; -------------------------
v::Send("^a")

; -------------------------
; Quit tab
; -------------------------
q::Send("^w")

; -------------------------
; Open terminal
; -------------------------
; t::Send("^`")

; -------------------------
; Reload panel
; -------------------------
; R::Send("^r")

; -------------------------
; Home directory
; -------------------------
g & h::Send("!{Home}")

; -------------------------
; Root directory
; -------------------------
g & /::Send("^\")

; -------------------------
; New tab
; -------------------------
t & n::Send("^t")

; -------------------------
; Close tab
; -------------------------
t & c::Send("^w")

; -------------------------
; Split focus panels
; -------------------------
Tab::Send("{Tab}")

#HotIf
