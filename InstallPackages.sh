#!/bin/bash
# author: lixizhi@yeah.net
# date: 2019.7.25

# GitURL=https://github.com/
GitURL=git@github.com:
GitLabURL=ssh://git@code.kp-para.cn:10022/

# param1 is folder name
# param2 is github url
function InstallPackage()
{
    if [ -f "$1/README.md" ]; then
        pushd $1
        git remote set-url origin $GitURL$2
        git reset --hard
        if [ ! -z $3 ]; then
            git checkout -B $3 origin/$3
        fi
        git pull
        popd
    else
        rm -rf "./$1"
        git clone $GitURL$2
    fi
}

function InstallPackageGitLab()
{
    if [ -f "$1/README.md" ]; then
        pushd $1
        echo check update for: $1
        git reset --hard
        if [ ! -z $3 ]; then
            git checkout -B $3 origin/$3
        fi
        git pull
        popd
    else
        rm -rf "./$1"
        git clone $GitLabURL$2
        if [ ! -z $3 ]; then
            git checkout -B $3 origin/$3
        fi
    fi
}

if [ ! -d npl_packages ]; then 
    mkdir npl_packages 
fi

pushd npl_packages

# if [ -d "WorldShare" ]; then
#     pushd "WorldShare"
#     git reset --hard
#     git pull
#     popd
# else
#     git clone ssh://git@code.kp-para.cn:10022/paracraft/worldshare.git WorldShare
# fi

if [ "$1" = "dev" ]; then
    # InstallPackageGitLab WorldShare paracraft/worldshare.git dev
    
    InstallPackage AutoUpdater NPLPackages/AutoUpdater dev
    # InstallPackage GeneralGameServerMod tatfook/GeneralGameServerMod dev
else
    # InstallPackageGitLab WorldShare paracraft/worldshare.git master

    InstallPackage AutoUpdater NPLPackages/AutoUpdater master
    # InstallPackage GeneralGameServerMod tatfook/GeneralGameServerMod master
fi

InstallPackage STLExporter LiXizhi/STLExporter
InstallPackage BMaxToParaXExporter tatfook/BMaxToParaXExporter

InstallPackage NPLCAD tatfook/NPLCAD
InstallPackage NplCadLibrary NPLPackages/NplCadLibrary
InstallPackage ModelVoxelizer NPLPackages/ModelVoxelizer

InstallPackage NplCad2 tatfook/NplCad2

# InstallPackage ExplorerApp tatfook/ExplorerApp
InstallPackage EMapMod tatfook/EMapMod
InstallPackage CodeBlockEditor tatfook/CodeBlockEditor
InstallPackage PluginBlueTooth NPLPackages/PluginBlueTooth
InstallPackage GoogleAnalytics NPLPackages/GoogleAnalytics
InstallPackage ParaWorldClient tatfook/ParaworldClient
InstallPackage Agents NPLPackages/Agents

# InstallPackage PyRuntime tatfook/PyRuntime

InstallPackage NplMicroRobot tatfook/NplMicroRobot
InstallPackage HaqiMod tatfook/HaqiMod

InstallPackage Microbit tatfook/Microbit

InstallPackage CodePkuCommon tatfook/CodePkuCommon.git
InstallPackage CodePku tatfook/CodePku.git

popd