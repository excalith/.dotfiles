@echo off
if "%~1"=="" (
    echo No directory specified
    exit /b
)
mkdir "%~1" && cd "%~1"