#Requires AutoHotkey v2.0

; ==========================================================
; Double Commander -> Yazi-like Keybindings
; Works only when Double Commander window is active
; ==========================================================

#HotIf WinActive("ahk_exe doublecmd.exe") && !(WinGetClass("ahk_id " ControlGetFocus("A")) = "Edit")

; --------------------------------------------------
; Debug Code
; --------------------------------------------------

; MsgBox("Double-Commander Window Activated.")

;F1::
;{
;    hwnd := ControlGetFocus("A")
;    class := WinGetClass("ahk_id " hwnd)
;
;    MsgBox("HWND: " hwnd "`nClass: " class)
;}

; --------------------------------------------------
; Movement (hjkl)
; --------------------------------------------------

h::Send("{Left}") ; h = Go to parent directory
j::Send("{Down}") ; j = Move down
k::Send("{Up}") ; k = Move up
l::Send("{Right}") ; l = Go to child directory

; --------------------------------------------------
; Scroll
; --------------------------------------------------

^d:: {  ; Ctrl+d = scroll down ~half page
    Loop 15
        Send "{Down}"
}

^u:: {  ; Ctrl+u = scroll up ~half page
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

; --------------------------------------------------
; Selection
; --------------------------------------------------

; Ctrl+r = Invert selection (cm_MarkInvert)
^r::Send "{NumpadMult}"

; Ctrl+[ = Unselect all (cm_MarkUnmarkAll)
^[::
{
    Send "^-{NumpadSub}"
}

; --------------------------------------------------
; Open File/Folder
; --------------------------------------------------

; o = Open file/folder (cm_Open)
o::Send("{Enter}")

; Shift+o = Mouse right-click menu
+o::Send "{AppsKey}"

; Shift+Enter = Mouse right-click menu
+Enter::Send "{AppsKey}"

; --------------------------------------------------
; Copy / Move / Delete / Rename
; --------------------------------------------------

; y = Copy (cm_Copy)
y::Send("{F5}")

; x = Move (cm_Rename)
x::Send("{F6}")

; d = Delete to trash (cm_Delete)
d::Send("{F8}")

; Shift+d = Delete permanently (cm_Delete)
+d::Send "+{Delete}"

; r = Rename (cm_RenameOnly)
r::Send("{F2}")

; --------------------------------------------------
; Terminal
; --------------------------------------------------

; ";" = Terminal open (cm_RunTerm)
`;::Send("{F9}")

; --------------------------------------------------
; Search / Sort
; --------------------------------------------------

; Type sequential keys within 0.5 seconds
leader := false

$,::
{
    global leader
    leader := true
    SetTimer LeaderTimeout, -500
}

m::
{
    global leader

    if leader
    {
        leader := false
        Send("^{F5}") ; ",m" = Sort by date (cm_SortByDate)
    }
}

e::
{
    global leader

    if leader
    {
        leader := false
        Send("^{F4}") ; ",e" = Sort by extension (cm_SortByExt)
    }
}

a::
{
    global leader

    if leader
    {
        leader := false
        Send("^{F3}") ; ",a" = Sort by name (cm_SortByName)
    }
    else
    {
        Send("{F7}") ; a = Create directory (cm_MakeDir)
    }
}

s::
{
    global leader

    if leader
    {
        leader := false
        Send("^{F6}") ; ",s" = Sort by size (cm_SortbySize)

    }
    else
    {
        Send("!{F7}") ; s = Search (cm_Search)
    }
}

LeaderTimeout()
{
    global leader
    leader := false
}

;$,::
;{
;    ih := InputHook("L1 T0.3")
;    ih.Start()
;    ih.Wait()
;
;    if (ih.Input = "s")
;        Send("^{F6}")
;}

; --------------------------------------------------
; Tabs
; --------------------------------------------------

; t = New tab (cm_NewTab)
t::Send("^{t}")

; Ctrl+c = Close tab (cm_CloseTab)
^c::Send("^w")

; "1", "2", "3", "4", "5", "6", "7", "8" = Activate tab by index (cm_ActivateTabByIndex)
1::Send("!{1}")
2::Send("!{2}")
3::Send("!{3}")
4::Send("!{4}")
5::Send("!{5}")
6::Send("!{6}")
7::Send("!{7}")
8::Send("!{8}")
9::Send("!{9}")

; "[" = Switch to previous tab (cm_PrevTab)
[::Send("^+{Tab}")

; "]" = Switch to next tab (cm_NextTab)
]::Send("^{Tab}")

#HotIf
