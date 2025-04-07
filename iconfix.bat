@echo off
setlocal

:: Define variables
set "EXPECTED_FOLDER=NEOTOKYO"
set "ZIP_FILE=iconfix.zip"
set "ICON_FILE=game.ico"
set "BASH_FILE=iconfix.sh"
set "DEST_DIR=NeotokyoSource\resource"
set "README_FILE=readme_nticonfix.txt"
set "EXAMPLE_1=example_1.png"
set "EXAMPLE_2=example_2.png"

:: Get the current directory name
for %%I in (.) do set "CURRENT_FOLDER=%%~nxI"

:: Check if the script is running in the NEOTOKYO folder
if /I not "%CURRENT_FOLDER%"=="%EXPECTED_FOLDER%" (
    echo This script must be run inside the NEOTOKYO folder!
    echo Press any key to exit...
    pause >nul
    exit /b
)

:: Extract the zip file directly
echo Extracting %ZIP_FILE%...
powershell -command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '.' -Force"

:: Move the icon file
if exist "%ICON_FILE%" (
    echo Moving %ICON_FILE%...
    move /Y "%ICON_FILE%" "%DEST_DIR%"
) else (
    echo %ICON_FILE% not found!
)

:: Delete the zip file
if exist "%ZIP_FILE%" (
    echo Deleting %ZIP_FILE%...
    del "%ZIP_FILE%"
)

:: Delete the readme file
if exist "%README_FILE%" (
    echo Deleting %README_FILE%...
    del "%README_FILE%"
)

:: Delete the example images
if exist "%EXAMPLE_1%" (
    echo Deleting %EXAMPLE_1%...
    del "%EXAMPLE_1%"
)

:: Delete the example images
if exist "%EXAMPLE_2%" (
    echo Deleting %EXAMPLE_2%...
    del "%EXAMPLE_2%"
)

:: Delete the bash file equivalent
del "%BASH_FILE%" >nul 2>&1

:: Completion message
echo Icon fix complete...
pause

del "%~f0" >nul 2>&1