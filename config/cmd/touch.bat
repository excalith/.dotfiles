@echo off
if "%~1"=="" (
    echo No file specified
    exit /b
)
echo.> "%~1"