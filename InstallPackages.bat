@echo off 
if not exist "npl_packages" ( mkdir npl_packages )

pushd "npl_packages"

REM set GitURL=https://github.com/
set GitURL=git@github.com:
 
CALL :InstallPackage AutoUpdater NPLPackages/AutoUpdater
CALL :InstallPackage STLExporter LiXizhi/STLExporter
CALL :InstallPackage BMaxToParaXExporter tatfook/BMaxToParaXExporter

CALL :InstallPackage NPLCAD tatfook/NPLCAD
CALL :InstallPackage NplCadLibrary NPLPackages/NplCadLibrary
CALL :InstallPackage ModelVoxelizer NPLPackages/ModelVoxelizer

CALL :InstallPackage NplCad2 tatfook/NplCad2

CALL :InstallPackage WorldShare tatfook/WorldShare
CALL :InstallPackage ExplorerApp tatfook/ExplorerApp
CALL :InstallPackage EMapMod tatfook/EMapMod
CALL :InstallPackage CodeBlockEditor tatfook/CodeBlockEditor
CALL :InstallPackage PluginBlueTooth NPLPackages/PluginBlueTooth
CALL :InstallPackage GoogleAnalytics NPLPackages/GoogleAnalytics
CALL :InstallPackage ParaWorldClient tatfook/ParaworldClient
CALL :InstallPackage Agents NPLPackages/Agents

CALL :InstallPackage PyRuntime tatfook/PyRuntime

CALL :InstallPackage NplMicroRobot tatfook/NplMicroRobot
CALL :InstallPackage HaqiMod tatfook/HaqiMod
CALL :InstallPackage GeneralGameServerMod tatfook/GeneralGameServerMod

CALL :InstallPackage CodePkuCommon tatfook/CodePkuCommon.git
CALL :InstallPackage CodePku tatfook/CodePku.git

popd

EXIT /B %ERRORLEVEL%

rem install function here
:InstallPackage
if exist "%1\README.md" (
    pushd %1
	git remote set-url origin %GitURL%%2
	git reset --hard
    git pull
    popd
) else (
    rmdir /s /q "%CD%\%1"
    git clone %GitURL%%2
)
EXIT /B 0