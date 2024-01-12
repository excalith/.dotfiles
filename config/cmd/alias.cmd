@echo off

:: Commands

DOSKEY ls=dir /B $*
DOSKEY mkcd="%USERPROFILE%\.dotfiles\config\cmd\mkcd.bat" $*
DOSKEY touch="%USERPROFILE%\.dotfiles\config\cmd\touch.bat" $*
DOSKEY clear=cls
DOSKEY cat=bat $*
DOSKEY nano=micro $*
DOSKEY lg=lazygit
DOSKEY ld=lazydocker


:: Common directories

DOSKEY dotfiles=cd "%USERPROFILE%\.dotfiles\$*"
DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"


:: Easy navigation

DOSKEY ..=cd ..
DOSKEY ...=cd ../..
DOSKEY ....=cd ../../..
DOSKEY .....=cd ../../../..