#!/bin/bash
# author: lixizhi@yeah.net
# date: 2019.7.25

# GitURL=https://github.com/
GitURL=git@github.com:

# param1 is folder name
# param2 is github url
function InstallPackage()
{
    if [ -f "$1/README.md" ]; then
        pushd $1
		git remote set-url origin $GitURL$2
        git reset --hard
        git pull
        popd
    else
        rm -rf "./$1"
        git clone $GitURL$2
    fi
}

if [ ! -d npl_packages ]; then 
    mkdir npl_packages 
fi

pushd npl_packages

InstallPackage AutoUpdater NPLPackages/AutoUpdater
InstallPackage STLExporter LiXizhi/STLExporter
InstallPackage BMaxToParaXExporter tatfook/BMaxToParaXExporter

InstallPackage NPLCAD tatfook/NPLCAD
InstallPackage NplCadLibrary NPLPackages/NplCadLibrary
InstallPackage ModelVoxelizer NPLPackages/ModelVoxelizer

InstallPackage NplCad2 tatfook/NplCad2

InstallPackage WorldShare tatfook/WorldShare
InstallPackage ExplorerApp tatfook/ExplorerApp
InstallPackage EMapMod tatfook/EMapMod
InstallPackage CodeBlockEditor tatfook/CodeBlockEditor
InstallPackage PluginBlueTooth NPLPackages/PluginBlueTooth
InstallPackage GoogleAnalytics NPLPackages/GoogleAnalytics
InstallPackage ParaWorldClient tatfook/ParaworldClient
InstallPackage Agents NPLPackages/Agents

InstallPackage PyRuntime tatfook/PyRuntime

InstallPackage NplMicroRobot tatfook/NplMicroRobot
InstallPackage HaqiMod tatfook/HaqiMod
InstallPackage GeneralGameServerMod tatfook/GeneralGameServerMod

InstallPackage CodePkuCommon tatfook/CodePkuCommon.git
InstallPackage CodePku tatfook/CodePku.git

popd