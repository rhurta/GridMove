SystemAccentColor() {
	if % substr(a_osversion, 1, 2) = 10 {
		RegRead, CheckReg, HKCU\SOFTWARE\Microsoft\Windows\DWM, ColorizationColor
		SetFormat, integer, hex
		CheckReg := Checkreg+0
		StringRight, CheckReg, CheckReg, 6
		SetFormat, integer, dec
		;msgbox % CheckReg
		return %CheckReg%
	} else {
		return "DDDDDD"
	}
}