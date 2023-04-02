@echo off 
rem author: LiXizhi   date:2017.5.1

rem update and install packages from git
rem call InstallPackages.bat

rem remove old redist folder
rmdir Mod  /s /q
rmdir Texture  /s /q
rmdir script  /s /q
rmdir build  /s /q
rmdir ParacraftBuildinMod  /s /q
rmdir npl_mod  /s /q
mkdir Mod
mkdir npl_mod
mkdir Texture
mkdir script
mkdir ParacraftBuildinMod
del ParacraftBuildinMod.zip

pushd "npl_packages"

CALL :BuddlePackage AutoUpdater
CALL :BuddlePackage STLExporter
CALL :BuddlePackage BMaxToParaXExporter

CALL :BuddlePackage NPLCAD
CALL :BuddlePackage NplCadLibrary
CALL :BuddlePackage ModelVoxelizer

CALL :BuddlePackage NplCad2
CALL :BuddlePackage NplBrowserScript

@REM CALL :BuddlePackage WorldShare
CALL :BuddlePackage ExplorerApp
CALL :BuddlePackage EMapMod
CALL :BuddlePackage CodeBlockEditor
CALL :BuddlePackage PluginBlueTooth
CALL :BuddlePackage GoogleAnalytics
CALL :BuddlePackage ParaWorldClient
CALL :BuddlePackage Agents

CALL :BuddlePackage PyRuntime

CALL :BuddlePackage NplMicroRobot
CALL :BuddlePackage HaqiMod
CALL :BuddlePackage GeneralGameServerMod
CALL :BuddlePackage Microbit

CALL :BuddlePackage CodePkuCommon
CALL :BuddlePackage CodePku

popd

rem copy files to ParacraftBuildinMod folder for packaging
if exist Mod ( xcopy /s /y Mod  ParacraftBuildinMod\Mod\ )
if exist npl_mod ( xcopy /s /y npl_mod  ParacraftBuildinMod\npl_mod\ )
if exist Texture ( xcopy /s /y Texture  ParacraftBuildinMod\Texture\ )
if exist script ( xcopy /s /y script  ParacraftBuildinMod\script\ )
xcopy /y package.npl  ParacraftBuildinMod\

call "7z.exe" a ParacraftBuildinMod.zip ParacraftBuildinMod\
xcopy /y/r ParacraftBuildinMod.zip  ..\
rem start explorer.exe "%~dp0"


EXIT /B %ERRORLEVEL%

rem Mod, script, texture folder into root directory
:BuddlePackage
    xcopy /s /y %1\Mod  %1\..\..\Mod\
	if exist %1\Mod ( xcopy /s /y %1\Mod  %1\..\..\Mod\ )
	if exist %1\script ( xcopy /s /y %1\script  %1\..\..\script\ )
	if exist %1\Texture ( xcopy /s /y %1\Texture  %1\..\..\Texture\ )
	if exist %1\npl_mod ( xcopy /s /y %1\npl_mod  %1\..\..\npl_mod\ )

EXIT /B 0