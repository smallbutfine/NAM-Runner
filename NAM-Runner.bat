::  Copyright (C):  2023 Martin Haverland
::    
::
::  LICENSE: MIT
@echo off
set NAMNAME=neural-amp-modeler-0.5.2
set NAMVER=0.5.2
if exist %NAMNAME%\installed.txt (
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
::curl -L "https://www.python.org/ftp/python/3.11.3/python-3.11.3-embed-amd64.zip" -o python.zip 
:: we need tcl/tk which can NOT installed in python embedded
curl -L https://github.com/winpython/winpython/releases/download/5.3.20221233/Winpython64-3.11.1.0dot.exe -o python.exe
if exist %NAMNAME% rmdir /q %NAMNAME%
::mkdir %NAMNAME% 
::tar -xf python.exe -C %NAMNAME%
python.exe -y
call %~dp0\WPy64-31110\scripts\make_winpython_movable.bat
move /Y "%~dp0\WPy64-31110\python-3.11.1.amd64" "%NAMNAME%"
::copy "%~dp0\WPy64-31110\scripts\*.*" "%NAMNAME%\Scripts"
echo Removing Python archive and unused files...
del /f /s /q WPy64-31110 1>nul
rmdir /s /q WPy64-31110
del python.exe
echo Done.
cd %NAMNAME%
echo.
echo. 
::echo Rewriting python310._pth
::set file=python310._pth
::del %file%
::>>%file% echo python310.zip
::>>%file% echo .
::>>%file% echo import site
:: does NOT work because of the same file contained in the python zip file
::ren python311._pth python311._pth.save
set PYTHONPATH=%~dp0\%NAMNAME%;%~dp0\%NAMNAME%\DLLs;%~dp0\%NAMNAME%\lib;%~dp0\%NAMNAME%\lib\plat-win;%~dp0\%NAMNAME%\lib\site-packages
set PATH=%~dp0%NAMNAME%;%~dp0%NAMNAME%\Scripts;%PATH%
echo Upgrading PIP...
python.exe -m pip install --upgrade pip
echo Done.
echo.
echo.
echo Installing NAM...
python -m pip install neural-amp-modeler==%NAMVER%
::https://files.pythonhosted.org/packages/9f/a4/e01762009193e5b6017def90db16c2414e107ac0e08b5a4fe8de9bc38a30/neural_amp_modeler-0.5.2-py3-none-any.whl - not necessary after pythonpath fix
::python -m pip install tk
echo.
echo Installing torch gpu...
pip3 install scipy==1.10.1
pip3 install torch torchvision torchaudio --force-reinstall --index-url https://download.pytorch.org/whl/cu118
echo Done.
echo.
>%~dp0%NAMNAME%\installed.txt echo done
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

