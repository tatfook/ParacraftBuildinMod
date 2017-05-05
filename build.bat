@echo off 
rem author: LiXizhi   date:2017.5.1

rem update and install packages from git
call InstallPackages.bat

rem remove old redist folder
rmdir Mod  /s /q
rmdir textures  /s /q
rmdir script  /s /q
rmdir build  /s /q
rmdir ParacraftBuildinMod  /s /q
mkdir Mod
mkdir textures
mkdir script
mkdir ParacraftBuildinMod

pushd "npl_packages"

CALL :BuddlePackage STLExporter
CALL :BuddlePackage BMaxToParaXExporter

CALL :BuddlePackage NPLCAD
CALL :BuddlePackage NplCadLibrary
CALL :BuddlePackage ModelVoxelizer

CALL :BuddlePackage WorldShare

popd

rem copy files to ParacraftBuildinMod folder for packaging
if exist Mod ( xcopy /s /y Mod  ParacraftBuildinMod\Mod\ )
if exist textures ( xcopy /s /y textures  ParacraftBuildinMod\textures\ )
if exist script ( xcopy /s /y script  ParacraftBuildinMod\script\ )
xcopy /y package.npl  ParacraftBuildinMod\

Set /p tmp=Do you want to zip ParacraftBuildinMod directory (y to confirm)
if '%tmp%'=='y' (
	call "7z.exe" a ParacraftBuildinMod.zip ParacraftBuildinMod\
) else (
	pause
	start explorer.exe "%~dp0"
)



EXIT /B %ERRORLEVEL%

rem Mod, script, texture folder into root directory
:BuddlePackage
if exist "%1\Mod" (
    xcopy /s /y %1\Mod  %1\..\..\Mod\
	if exist %1\script ( xcopy /s /y %1\script  %1\..\..\script\ )
	if exist %1\textures ( xcopy /s /y %1\textures  %1\..\..\textures\ )
) else (
    echo %1 is not a mod
)
EXIT /B 0