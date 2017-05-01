@echo off 
rem author: LiXizhi   date:2017.5.1

rem update and install packages from git
call InstallPackages.bat

rem remove old redist folder
rmdir Mod  /s /q
rmdir textures  /s /q
rmdir script  /s /q
mkdir Mod
mkdir textures
mkdir script

pushd "npl_packages"

CALL :BuddlePackage STLExporter
CALL :BuddlePackage BMaxToParaXExporter

CALL :BuddlePackage NPLCAD
CALL :BuddlePackage NplCadLibrary
CALL :BuddlePackage ModelVoxelizer

CALL :BuddlePackage WorldShare

popd

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