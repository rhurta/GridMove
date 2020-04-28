
global hVirtualDesktopAccessor := DllCall("LoadLibrary", "Str", A_ScriptDir . "\other\virtual-desktop-accessor.dll", "Ptr")

GetCurrentDesktopNumber(){
	GetCurrentDesktopNumberProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GetCurrentDesktopNumber", "Ptr")
	currentDesktop := DllCall(GetCurrentDesktopNumberProc) + 1
	return currentDesktop
}

GetNumberOfDesktops() {
	GetDesktopCountProc := DllCall("GetProcAddress", Ptr, hVirtualDesktopAccessor, AStr, "GetDesktopCount", "Ptr")
    numberOfDesktop := DllCall(GetDesktopCountProc)
	return numberOfDesktop
}
