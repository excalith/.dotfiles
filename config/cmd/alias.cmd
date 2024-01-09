@echo off

:: Commands

DOSKEY ls=dir /B $*
DOSKEY cat=bat
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