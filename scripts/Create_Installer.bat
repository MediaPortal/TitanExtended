@ECHO OFF

Title Creating MediaPortal Titan Extended Installer
ECHO Creating MediaPortal Titan Extended Installer

if "%programfiles(x86)%XXX"=="XXX" goto 32BIT
    :: 64-bit
    set PROGS=%programfiles(x86)%
    goto CONT
:32BIT
    set PROGS=%ProgramFiles%
:CONT

IF NOT EXIST "%PROGS%\Team MediaPortal\MediaPortal\" SET PROGS=C:

:: Get version from DLL
FOR /F "tokens=*" %%a IN ('git rev-list HEAD --count') DO SET version=%%a

:: Trim version
SET version=%version: =%

:: Set version
SET version=5.0.1.%version%

:: Temp xmp2 file
copy "..\MPEI\Titan Extended.xmp2" "..\MPEI\Titan Extended Temp.xmp2"

:: Build MPE1
"%PROGS%\Team MediaPortal\MediaPortal\MPEMaker.exe" "..\MPEI\Titan Extended Temp.xmp2" /B /V=%version% /UpdateXML

:: Cleanup
del "..\MPEI\Titan Extended Temp.xmp2"
