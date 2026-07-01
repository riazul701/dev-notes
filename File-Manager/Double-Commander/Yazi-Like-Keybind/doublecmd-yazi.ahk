#Requires AutoHotkey v2.0

; ==========================================================
; Double Commander -> Yazi-like Keybindings
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

h::Send("{Left}") ; h = Go to parent directory
j::Send("{Down}") ; j = Move down
k::Send("{Up}") ; k = Move up
l::Send("{Right}") ; l = Go to child directory

; -------------------------
; Scroll
; -------------------------

^d:: {  ; Ctrl+D = scroll down ~half page
    Loop 15
        Send "{Down}"
}

^u:: {  ; Ctrl+U = scroll up ~half page
    Loop 15
        Send "{Up}"
}

; Shift+PgDn = half page down
+PgDn:: {
    Loop 15
        Send "{Down}"
}

; Shift+PgUp = half page up
+PgUp:: {
    Loop 15
        Send "{Up}"
}

; Ctrl+F = full page down
^f::Send "{PgDn}"

; Ctrl+B = full page up
^b::Send "{PgUp}"

; gg = Jump to top
g & g::Send("^{Home}")

~g::
{
    static last := 0
    now := A_TickCount

    ; if second y within 400 ms
    if (now - last < 400)
    {
        Send("^{Home}")
        last := 0
    }
    else
    {
        last := now
    }
}

; Shift+g = Jump to bottom
+g::Send("^{End}")

; -------------------------
; Selection
; -------------------------

; Ctrl+r = Invert selection (cm_MarkInvert)
^r::Send "{NumpadMult}"

; Ctrl+[ = Unselect all (cm_MarkUnmarkAll)
^[::
{
    Send "^-{NumpadSub}"
}

; -------------------------
; Open File/Folder
; -------------------------

; o = Open file/folder (cm_Open)
o::Send("{Enter}")

; Shift+o = Mouse right-click menu
+o::Send "{AppsKey}"

; Shift+Enter = Mouse right-click menu
+Enter::Send "{AppsKey}"

; -------------------------
; Copy / Move / Delete
; -------------------------

; y = Copy (cm_Copy)
y::Send("{F5}")

; x = Move (cm_Rename)
x::Send("{F6}")

; d = Delete to trash (cm_Delete)
d::Send("{F8}")

; Shift+d = Delete permanently (cm_Delete)
+d::Send "+{Delete}"

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
; Tabs
; -------------------------

#HotIf
