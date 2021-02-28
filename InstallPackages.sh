#!/bin/bash
# author: lixizhi@yeah.net
# date: 2019.7.25


# param1 is folder name
# param2 is github url
function InstallPackage()
{
    if [ -f "$1/README.md" ]; then
        pushd $1
        git reset --hard
        git pull
        popd
    else
        rm -rf "./$1"
        git clone $2
    fi
}

if [ ! -d npl_packages ]; then 
    mkdir npl_packages 
fi

pushd npl_packages

InstallPackage AutoUpdater https://github.com/NPLPackages/AutoUpdater
InstallPackage STLExporter https://github.com/LiXizhi/STLExporter
InstallPackage BMaxToParaXExporter https://github.com/tatfook/BMaxToParaXExporter

InstallPackage NPLCAD https://github.com/tatfook/NPLCAD
InstallPackage NplCadLibrary https://github.com/NPLPackages/NplCadLibrary
InstallPackage ModelVoxelizer https://github.com/NPLPackages/ModelVoxelizer

InstallPackage NplCad2 https://github.com/tatfook/NplCad2

InstallPackage WorldShare https://github.com/tatfook/WorldShare
InstallPackage ExplorerApp https://github.com/tatfook/ExplorerApp
InstallPackage EMapMod https://github.com/tatfook/EMapMod
InstallPackage CodeBlockEditor https://github.com/tatfook/CodeBlockEditor
InstallPackage PluginBlueTooth https://github.com/NPLPackages/PluginBlueTooth
InstallPackage GoogleAnalytics https://github.com/NPLPackages/GoogleAnalytics
InstallPackage ParaWorldClient https://github.com/tatfook/ParaworldClient
InstallPackage Agents https://github.com/NPLPackages/Agents

InstallPackage PyRuntime https://github.com/tatfook/PyRuntime

InstallPackage NplMicroRobot https://github.com/tatfook/NplMicroRobot
InstallPackage HaqiMod https://github.com/tatfook/HaqiMod
InstallPackage GeneralGameServerMod https://github.com/tatfook/GeneralGameServerMod

InstallPackage CodePkuCommon https://github.com/tatfook/CodePkuCommon.git
InstallPackage CodePku https://github.com/tatfook/CodePku.git

popd