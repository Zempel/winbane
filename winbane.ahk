; Bodo Zempel, 2026-07-14, KeyApp26
;
; This Auto Hotkey script contains a handy set of Keyboard shortcut functions:

; [ Alt + r ]  => run a python script with hidden console
; [ Alt + c ]  => automate cmd shell
; [ Alt + Space ] => toggle active window always on top
; [ Alt + t ]     => toggle active windows title bar
; [ F1 ] <=> [ F11 ] (swap keys)
; [ Alt + f ] => toggle Firefox Browser
; [ Alt + n ] => toggle Notepad++ Editor
; [ Alt + p ] => toggle mspaintxp.exe
; [ Win + Alt + n ] => toggle negativescreen.exe screen colour inversion

; To run it, associate the ahk file with AutoHotkey.exe v1 and place a shortcut into startup folder.
; Find it here: www.autohotkey.com/download/1.1/AutoHotkey112207_ansi.zip

; Usage:
; The concept is to read the script and specify your own literals for the event calls and appearing targets.
; Common Hotkeys are expressed in shorthand. Alt = !, Win = #, Ctrl = ^, Space = Space, Letters allowed.
; Example for [ Alt + r ] is ^r

#NoEnv ; tolerance for empty variables
#NoTrayIcon
#SingleInstance Force ; To restart a script by just clicking its icon again
SetTitleMatchMode, 2 ; This script searches for Titlebar matches. Now, a window's title can contain WinTitle anywhere inside it to be a match
#WinActivateForce ; use fast window activation method

; [ Alt + r ] => run a python script with hidden console
!r::
  Run, "python" "D:\pi\Documents\relays.py",, Hide
Return

; [ Alt + c ] => open/close the console at a specific path
working_directory := "C:\Software\python" ; Change this variable to your specific path. 
!c::
    if WinExist("ahk_exe cmd.exe")
        WinClose
    else
    {
        Run, cmd, % working_directory
        if ErrorLevel
        {
            MsgBox, WinWait timed out.
            Return
        }
        else
        {
            WinWaitActive, ahk_exe cmd.exe
            WinSet, AlwaysOnTop, On
            SendInput {Raw}python .py
            Send {Left}
            Send {Left}
            Send {Left}
            ; WinMove, WinTitle, WinText, X, Y, Width, Height
            WinMove,,, % A_ScreenWidth - 765, % A_ScreenHeight - 315, 765, 315
            WinSetTitle,,, cmd
            WinSet, Transparent, 200
        }
    }
Return

; [ Alt + Space ] => toggle the active window stay in foreground
!Space::
  WinSet, AlwaysOnTop, Toggle, A
Return

; [ Alt + t ] => toggle the active window's title bar
!t::
    WinSet, Style, ^0xC00000, A
Return

; [ F1 ] => [ F11 ] (reassign F1 key to F11 key)
F1::F11
Return

; [ F11 ] => [ F1 ] (reassign F11 key to F1 key)
F11::F1
Return

; Toggles (explaination)
; The first one was difficult to determine, so we search for window class and title.
; The next two Toggles are convenient. Use this method to make your own Toggles.
; The last one is made in addition to a not included software, which uses the same hotkey #!n at runtime.

; [ Alt + f ] => Firefox starten | schnell minimieren | schnell wiederherstellen 
#IfWinActive ahk_class MozillaWindowClass
    !f::Winminimize
#IfWinNotActive ahk_class MozillaWindowClass
    !f::
        if WinExist("Firefox") ; this searches for a matching window title
            WinActivate
        else
        {
            Run, "C:\Software\Editor\MOZDEV64\firefox.exe",,
 WinWait, ahk_class MozillaWindowClass
            WinActivate
        }
Return

; [ Alt + n ] => Notepad++ starten | schnell minimieren | schnell wiederherstellen
#IfWinActive ahk_exe notepad++.exe
    !n::Winminimize
#IfWinNotActive ahk_exe notepad++.exe
    !n::
      if WinExist(ahk_exe notepad++.exe)
          WinActivate
      else
          Run, "C:\Software\Editor\npp.8.6.8\notepad++.exe"
Return

; [ Alt + p ] => run mspaintxp.exe | minimize | restore
#IfWinActive ahk_exe mspaintxp.exe
    !n::Winminimize
#IfWinNotActive ahk_exe mspaintxp.exe
    !n::
      if WinExist(ahk_exe mspaintxp.exe)
          WinActivate
      else
          Run, "C:\Software\Editor\mspaintxp\mspaintxp.exe"
Return

[ Win + Alt + n ] => Negative Screen
~#!n::
     Process, Exist, negativescreen.exe
     if (ErrorLevel = 0)
         Run, % A_ScriptDir . "\negativescreen.exe"
Return
