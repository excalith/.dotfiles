@echo off
if "%~1"=="" (
    echo ERROR: No directory specified
    exit /b
)
if not exist "%~1" (
    mkdir "%~1"
) else (
    echo WARNING: Directory %~1 already exists.
)
cd "%~1"