# ParacraftBuildinMod
for making paracraft buildin mod package

## How to Install
By default, this package is installed as a zip file in paracraft. 

### Method1: Use As a Package Zip File
run 
```
./build.bat
```
The final package file is generated at `./ParacraftBuildinMod.zip`.
Put above file in paracraft redist's `npl_package/ParacraftBuildinMod.zip` and restart paracraft to take effect.

### Method2: Use As It is
git clone this project to `npl_package/ParacraftBuildinMod` and then
run `npl_package/ParacraftBuildinMod/build.bat`

Restart paracraft for the latest version of buildin-mod to take effect. 

## Internals
- git pull all packages from git 
- copy and merge all files to `Mod, script, textures` folder
- zip folders as `./ParacraftBuildinMod.zip`

## How to Code and Debug (Easy Way)
- 1: git clone this repository to paracraft's `npl_packages/ParacraftBuildinMod` folder
- 2: run `build.bat` once
- 3: edit repository code in `./npl_packages/*`
- 4: run `build_without_update.bat` and test the code
- repeat 3 and 4 until your code is ready
- 5: commit and push your changes in `./npl_packages/*`
- 6: run `build.bat` once

## How to Debug (Advanced Way)
Git clone your mod in development to `npl_packages/[your_mod_name]` folder, such as `npl_packages/GeneralGameServerMod/`. 
Rename `npl_packages/ParacraftBuildinMod` (to something like `npl_packages/ParacraftBuildinMod_`)
make sure npl_package/ParacraftBuildinMod.zip is available. 

When you start paracraft, use the command line 'loadpackage="npl_packages/GeneralGameServerMod/"' to load your mod. Replace GeneralGameServerMod with your mod folder name.
Now, you are ready to edit the mod, and run paracraft to test immediately. 




