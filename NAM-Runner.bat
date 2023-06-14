::  Copyright (C):  2023 Martin Haverland
::    
::
::  LICENSE: MIT
@echo off
set NAMNAME=neural-amp-modeler-0.6.0
set NAMVER=0.6.0
if exist "%~dp0\%NAMNAME%\installed.txt" (
  echo NAM already installed!
  GOTO NAMISINSTALLED
  )
echo This program is downloading and installing the complete NAM modelling environment and all prerequisites and runtimes.
echo.
echo.
echo PLEASE BE PATIENT.
echo SOME PARTS OF THIS INSTALLATION PROCESS CAN TAKE QUITE SOME TIME!
echo DON'T CLOSE THIS WINDOW UNTIL YOU ARE ASKED TO DO IT.
echo.
echo Downloading and extracting Python archive...
curl -L https://github.com/winpython/winpython/releases/download/6.1.20230527/Winpython64-3.10.11.1dot.exe -o python.exe
if exist "%~dp0\%NAMNAME%" rmdir /q "%~dp0\%NAMNAME%"
python.exe -y
call %~dp0\WPy64-310111\scripts\make_winpython_movable.bat
move /Y "%~dp0\WPy64-310111\python-3.10.11.amd64" "%NAMNAME%"
echo Removing Python archive and unused files...
del /f /s /q "%~dp0\WPy64-310111" 1>nul
rmdir /s /q "%~dp0\WPy64-310111"
del python.exe
echo Done.
cd %NAMNAME%
echo.
echo. 
set PYTHONPATH=%~dp0\%NAMNAME%;%~dp0\%NAMNAME%\DLLs;%~dp0\%NAMNAME%\lib;%~dp0\%NAMNAME%\lib\plat-win;%~dp0\%NAMNAME%\lib\site-packages
set PATH=%~dp0%NAMNAME%;%~dp0%NAMNAME%\Scripts;%PATH%
echo Upgrading PIP...
python.exe -m pip install --upgrade pip
echo Done.
echo.
echo.
echo Installing NAM...
python -m pip install neural-amp-modeler==%NAMVER%
echo.
echo Installing torch gpu...
pip3 install scipy==1.10.1
pip3 install torch torchvision torchaudio --force-reinstall --index-url https://download.pytorch.org/whl/cu118
echo Done.
echo.
>"%~dp0%NAMNAME%\installed.txt" echo done
echo NAM install done.
echo.
echo.
:NAMISINSTALLED
set PYTHONPATH=%~dp0\%NAMNAME%;%~dp0\%NAMNAME%\DLLs;%~dp0\%NAMNAME%\lib;%~dp0\%NAMNAME%\lib\plat-win;%~dp0\%NAMNAME%\lib\site-packages
set PATH=%~dp0%NAMNAME%;%~dp0%NAMNAME%\Scripts;%PATH%
python -c "from winpython import wppm;dist=wppm.Distribution(r'%~dp0\%NAMNAME%');dist.patch_standard_packages('pip', to_movable=True)"
nam

cd..
echo.
echo.
echo This window can now be closed.
echo In case something went wrong or the installation got corrupted:
echo You can simply delete the folder %NAMNAME% and try a reinstall.
echo Note, that a reinstallation needs an internet connection.
echo Thank you.
pause

