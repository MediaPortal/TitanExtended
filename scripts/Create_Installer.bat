@ECHO OFF

Title Creating MediaPortal Titan Extended Installer
ECHO Creating MediaPortal Titan Extended Installer

:: Get version from DLL
FOR /F "tokens=*" %%a IN ('git rev-list HEAD --count') DO SET version=%%a 

:: Trim version
SET version=%version:~0,-1%

:: Set version
SET version=5.0.0.%version%

:: Build MPE1
"Tools\MPEMaker.exe" "..\MPEI\Titan Extended.xmp2" /B /V=%version% /UpdateXML
