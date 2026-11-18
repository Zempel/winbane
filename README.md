# winbane
a.k.a. Keyapp26.ahk is an old Windows version of the productivity enhancement daemon bane,
that is written in Auto Hotkey.

The script contains a handy set of Keyboard shortcut functions:

```
 [ Alt + r ]  => run a python script with hidden console
 [ Alt + c ]  => automate cmd shell
 [ Alt + Space ] => toggle active window always on top
 [ Alt + t ]     => toggle active windows title bar
 [ F1 ] <=> [ F11 ] (swap keys)
 [ Alt + f ] => toggle Firefox Browser
 [ Alt + n ] => toggle Notepad++ Editor
 [ Alt + p ] => toggle mspaintxp.exe
 [ Win + Alt + n ] => toggle negativescreen.exe screen colour inversion
```
 To run it, associate the ahk file with AutoHotkey.exe v1 and place a shortcut into startup folder. Find it here:
 https://www.autohotkey.com/download/1.1/AutoHotkey112207_ansi.zip

 ## Usage:
 The concept is to read the script and specify your own literals for the event calls and appearing targets.
 Common Hotkeys are expressed in shorthand. Alt = !, Win = #, Ctrl = ^, Space = Space, Letters allowed.
 Example for [ Alt + r ] is ^r
