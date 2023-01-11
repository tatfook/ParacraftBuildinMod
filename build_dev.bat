@echo off 
rem author: LiXizhi   date:2017.5.1

rem update and install packages from git
call InstallPackages.bat dev
call build_without_update.bat
