; Hack WinMove for Windows 10
WinSnap(WinTitle, X := "", Y := "", W := "", H := "") {
	; Detect Windows 10
	if % substr(a_osversion, 1, 2) = 10
		Windows10:=True	

	if Windows10
		_WinSnap(WinTitle, X, Y, W, H)
	else
		WinMove, WinTitle, X, Y, W, H
	return
}

_WinSnap(WinTitle, X := "", Y := "", W := "", H := "") {
	
	If ((X . Y . W . H) = "") ;
	  Return False
	  
	WinGet, hWnd, ID, %WinTitle% ; taken from Coco's version
	If !(hWnd)
	  Return False
	
	DL := DT := DR := DB := 0
	VarSetCapacity(RC, 16, 0)
	DllCall("GetWindowRect", "Ptr", hWnd, "Ptr", &RC)
	WL := NumGet(RC, 0, "Int")
	WT := NumGet(RC, 4, "Int")
	WR := NumGet(RC, 8, "Int")
	WB := NumGet(RC, 12, "Int")
	If (DllCall("Dwmapi.dll\DwmGetWindowAttribute", "Ptr", hWnd, "UInt", 9, "Ptr", &RC, "UInt", 16) = 0) { ; S_OK = 0
		FL := NumGet(RC, 0, "Int")
		FT := NumGet(RC, 4, "Int")
		FR := NumGet(RC, 8, "Int")
		FB := NumGet(RC, 12, "Int")
		DL := WL - FL
		DT := WT - FT
		DR := WR - FR
		DB := WB - FB
	}
	X := X <> "" ? X + DL : WL
	Y := Y <> "" ? Y + DT : WT
	W := W <> "" ? W - DL + DR : WR - WL
	H := H <> "" ? H - DT + DB: WB - WT
	Return DllCall("MoveWindow", "Ptr", hWnd, "Int", X, "Int", Y, "Int", W, "Int", H, "UInt", 1)
}