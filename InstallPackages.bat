@echo off 
if not exist "npl_packages" ( mkdir npl_packages )

pushd "npl_packages"

rem if exist WorldShare (
rem      pushd WorldShare
rem      git reset --hard
rem      git pull
rem      popd
rem ) else (
rem      git clone ssh://git@code.kp-para.cn:10022/paracraft/worldshare.git
rem )

REM set GitHubURL=https://github.com/
set GitHubURL=git@github.com:
set GitLabURL=ssh://git@code.kp-para.cn:10022/

if "%1" equ "dev" (
    CALL :InstallPackageGitLab WorldShare paracraft/worldshare.git dev
    
    CALL :InstallPackage AutoUpdater NPLPackages/AutoUpdater dev
    CALL :InstallPackage GeneralGameServerMod tatfook/GeneralGameServerMod dev
) else (
    CALL :InstallPackageGitLab WorldShare paracraft/worldshare.git master

    CALL :InstallPackage AutoUpdater NPLPackages/AutoUpdater master
    CALL :InstallPackage GeneralGameServerMod tatfook/GeneralGameServerMod master
)
 
CALL :InstallPackage STLExporter LiXizhi/STLExporter
CALL :InstallPackage BMaxToParaXExporter tatfook/BMaxToParaXExporter

CALL :InstallPackage NPLCAD tatfook/NPLCAD
CALL :InstallPackage NplCadLibrary NPLPackages/NplCadLibrary
CALL :InstallPackage ModelVoxelizer NPLPackages/ModelVoxelizer

CALL :InstallPackage NplCad2 tatfook/NplCad2

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
CALL :InstallPackage Microbit tatfook/Microbit

CALL :InstallPackage CodePkuCommon tatfook/CodePkuCommon.git
CALL :InstallPackage CodePku tatfook/CodePku.git

popd

EXIT /B %ERRORLEVEL%

rem install function here
:InstallPackage
if exist "%1\README.md" (
    pushd %1
    echo.
    echo check update for: %1
    git remote set-url origin %GitHubURL%%2
    git reset --hard
    if "%3" neq "" (
        git checkout -B %3 origin/%3
    )
    git pull
    popd
) else (
    rmdir /s /q "%CD%\%1"
    git clone %GitHubURL%%2
)
goto:eof

:InstallPackageGitLab
if exist "%1\README.md" (
    pushd %1
    echo.
    echo check update for: %1
    git reset --hard
    if "%3" neq "" (
        git checkout -B %3 origin/%3
    )
    git pull
    popd
) else (
    rmdir /s /q "%CD%\%1"
    git clone %GitLabURL%%2
)
goto:eof