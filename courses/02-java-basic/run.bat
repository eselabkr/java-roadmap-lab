@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "SOURCE_DIR=%SCRIPT_DIR%src\main\java"
set "OUTPUT_DIR=%SCRIPT_DIR%build\classes"
set "SOURCE_LIST=%SCRIPT_DIR%build\sources.txt"

if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

dir /s /b "%SOURCE_DIR%\*.java" > "%SOURCE_LIST%"
if errorlevel 1 (
    echo Java source file not found: %SOURCE_DIR%
    exit /b 1
)

javac -encoding UTF-8 -d "%OUTPUT_DIR%" @"%SOURCE_LIST%"
if errorlevel 1 exit /b 1

java -cp "%OUTPUT_DIR%" lab.Main
if errorlevel 1 exit /b 1

endlocal

