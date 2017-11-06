@echo off 
if not exist "npl_packages" ( mkdir npl_packages )

pushd "npl_packages"

CALL :InstallPackage STLExporter https://github.com/LiXizhi/STLExporter
CALL :InstallPackage BMaxToParaXExporter https://github.com/tatfook/BMaxToParaXExporter

CALL :InstallPackage NPLCAD https://github.com/tatfook/NPLCAD
CALL :InstallPackage NplCadLibrary https://github.com/NPLPackages/NplCadLibrary
CALL :InstallPackage ModelVoxelizer https://github.com/NPLPackages/ModelVoxelizer

CALL :InstallPackage WorldShare https://github.com/tatfook/WorldShare
CALL :InstallPackage EMapMod https://github.com/tatfook/EMapMod

popd

EXIT /B %ERRORLEVEL%

rem install function here
:InstallPackage
if exist "%1\README.md" (
    pushd %1
	git reset --hard
    git pull
    popd
) else (
    rmdir /s /q "%CD%\%1"
    git clone %2
)
EXIT /B 0