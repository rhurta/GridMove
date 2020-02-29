set OUTPUTDIR=_out_
set COMPILER="C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"

rmdir /S /Q %OUTPUTDIR%
mkdir %OUTPUTDIR% %OUTPUTDIR%\Plugins 

%COMPILER% /in GridMove.ahk /out %OUTPUTDIR%\GridMove.exe /icon Images\GridMove.ico
for %%f in (Plugins\*.ahk) do (
    %COMPILER% /in %%f /out %OUTPUTDIR%\Plugins\%%~nf.exe /icon Images\GridMove.ico
  )
for %%d in (Images Documents Grids) do (
    xcopy /I /S /E %%d %OUTPUTDIR%\%%d
  )
copy packing\GridMoveHelp_*.txt %OUTPUTDIR%\
