#include <File.au3>
#include <FileConstants.au3>

Opt("MustDeclareVars", 1)

Main()

Func Main()
	Local $sTrailDir = CommandLineParametersVerify()
	Local $sTrailFile = LatestTrailFileGet($sTrailDir)
	Local $sElementName = SelectedElementNameGet($sTrailFile)
	ConsoleWrite('Element name: "' & $sElementName & '"' & @CRLF)
	ClipPut($sElementName)
EndFunc

Func CommandLineParametersVerify()
	Local $sTrailDir
	If $cmdLine[0] = 0 Then
		ConsoleWrite("Trail directory not passed." & @CRLF)
		Exit
	ElseIf Not FileExists($cmdLine[1]) Then
		ConsoleWrite("Trail directory not found, use working directory instead." & @CRLF)
		$sTrailDir = @WorkingDir
	Else
		$sTrailDir = $cmdLine[1]
	EndIf
	Return $sTrailDir
EndFunc

Func LatestTrailFileGet(Const ByRef $sTrailDir)
	Local $hTrailFiles = FileFindFirstFile($sTrailDir & "\trail.txt.*")
	If $hTrailFiles = -1 Then
		ConsoleWrite("No trail file found." & @CRLF)
		Exit
	EndIf
	
	Local $sTrailFile, $sTimeCreated, $sTrailFileLatest, $sTimeCreatedLatest = "00000000000000"
	While 1
		$sTrailFile = FileFindNextFile($hTrailFiles)
		If @error Then ExitLoop
		$sTimeCreated = FileGetTime($sTrailDir & "\" & $sTrailFile, $FT_CREATED, $FT_STRING)
		If $sTimeCreated > $sTimeCreatedLatest Then
			$sTrailFileLatest = $sTrailFile
			$sTimeCreatedLatest = $sTimeCreated
		EndIf
	Wend
	FileClose($hTrailFiles)
	Return $sTrailDir & "\" & $sTrailFileLatest
EndFunc

Func SelectedElementNameGet(Const ByRef $sTrailFile)
	Local $hFile = FileOpen($sTrailFile, $FO_READ)
	Local $i = -1
	Do
		FileSetPos($hFile, $i, $FILE_END)
		$i -= 1
	Until FileRead($hFile, 1) = "!"
	Local $sSelectedElementName = FileReadLine($hFile)
	If StringInStr($sSelectedElementName, "playing mapkey") Then
		Do
			FileSetPos($hFile, $i, $FILE_END)
			$i -= 1
		Until FileRead($hFile, 1) = "!"
		$sSelectedElementName = FileReadLine($hFile)
	EndIf
	FileClose($hFile)
	Return $sSelectedElementName
EndFunc