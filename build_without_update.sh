#!/bin/bash
#  author: LiXizhi   date:2017.5.1

#  update and install packages from git

#  Mod, script, texture folder into root directory
function BuddlePackage()
{
    cp -rf $1/Mod/  $1/../../Mod/
	if  [ -d $1/Mod ]; then ( cp -rf $1/Mod/  $1/../../Mod/ ) fi
	if  [ -d $1/script ]; then ( cp -rf $1/script/  $1/../../script/ ) fi
	if  [ -d $1/textures ]; then ( cp -rf $1/textures/  $1/../../textures/ ) fi
	if  [ -d $1/npl_mod ]; then ( cp -rf $1/npl_mod/  $1/../../npl_mod/ ) fi
}

#  remove old redist folder
rm -rf Mod
rm -rf textures
rm -rf script
rm -rf build
rm -rf ParacraftBuildinMod
rm -rf npl_mod
mkdir Mod
mkdir npl_mod
mkdir textures
mkdir script
mkdir ParacraftBuildinMod
rm ParacraftBuildinMod.zip

pushd "npl_packages"

BuddlePackage AutoUpdater
BuddlePackage STLExporter
BuddlePackage BMaxToParaXExporter

BuddlePackage NPLCAD
BuddlePackage NplCadLibrary
BuddlePackage ModelVoxelizer

BuddlePackage NplCad2
BuddlePackage NplBrowserScript

BuddlePackage WorldShare
BuddlePackage ExplorerApp
BuddlePackage EMapMod
BuddlePackage CodeBlockEditor
BuddlePackage PluginBlueTooth
BuddlePackage GoogleAnalytics
BuddlePackage ParaWorldClient

BuddlePackage PyRuntime

BuddlePackage NplMicroRobot

popd

#  copy files to ParacraftBuildinMod folder for packaging
if  [ -d Mod ]; then ( cp -rf Mod/  ParacraftBuildinMod/Mod/ ) fi

if  [ -d npl_mod ]; then ( cp -rf npl_mod/  ParacraftBuildinMod/npl_mod/ ) fi

if  [ -d textures ]; then ( cp -rf textures/  ParacraftBuildinMod/textures/ ) fi

if  [ -d script ]; then ( cp -rf script/  ParacraftBuildinMod/script/ ) fi

cp -f package.npl  ParacraftBuildinMod/

zip -r ParacraftBuildinMod.zip ParacraftBuildinMod
# cp -rf ParacraftBuildinMod.zip  ../



