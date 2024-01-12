@echo off
if "%~1"=="" (
    echo ERROR: No file specified
    exit /b
)
if exist "%~1" (
    echo WARNING: File %~1 already exists.
) else (
    echo.> "%~1"
    echo SUCCESS: File %~1 created.
)