::  Copyright (C):  2023 Martin Haverland
::    
::
::  LICENSE: MIT
@echo off
if exist neural-amp-modeler-0.5.0\installed.txt (
  echo NAM already installed!
  GOTO STARTNAM
  )
echo This program is downloading and installing the complete NAM modelling environment and all prerequisites and runtimes.
echo.
echo.
echo PLEASE BE PATIENT.
echo SOME PARTS OF THIS INSTALLATION PROCESS CAN TAKE QUITE SOME TIME!
echo DON'T CLOSE THIS WINDOW UNTIL YOU ARE ASKED TO DO IT.
echo.
echo Done.
echo.
echo Downloading and extracting Neural Amp Modeler release archive...
curl -L "https://github.com/sdatkinson/neural-amp-modeler/archive/refs/tags/v0.5.0.tar.gz" -o nam.tar.gz
tar -xvzf nam.tar.gz -C .
echo Done.
echo.
echo Removing NAM release archive...
del nam.tar.gz
cd neural-amp-modeler-0.5.0
echo Done.
echo.
echo. 
echo Downloading Python. Please wait...
rem --Download python installer
curl "https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe" -o python-installer.exe
echo Installing Python Please wait...
rem --Install python
python-installer.exe /quiet InstallAllUsers=0 PrependPath=1
rem --Refresh Environmental Variables
del python-installer.exe
call RefreshEnv.cmd
echo Creating python virtual environment in directory mynamenv...
python -m venv .\mynamenv
echo Activating python virtual environment...
call .\mynamenv\Scripts\activate.bat
echo Updating PIP...
python.exe -m pip install --upgrade pip
echo Python install done.
echo.
echo.
echo Writing requirement file for PIP...
set file=namrequirements.txt
>>%file% echo absl-py==1.4.0
>>%file% echo aiohttp==3.7.4.post0
>>%file% echo anyio==3.6.2
>>%file% echo argon2-cffi==21.3.0
>>%file% echo argon2-cffi-bindings==21.2.0
>>%file% echo asttokens==2.2.1
>>%file% echo async-timeout==3.0.1
>>%file% echo attrs==22.2.0
>>%file% echo backcall==0.2.0
>>%file% echo backports.functools-lru-cache==1.6.4
>>%file% echo beautifulsoup4==4.12.1
>>%file% echo black==23.3.0
>>%file% echo bleach==6.0.0
>>%file% echo blinker==1.6
>>%file% echo brotlipy==0.7.0
>>%file% echo cached-property==1.5.2
>>%file% echo cachetools==5.3.0
>>%file% echo certifi==2022.12.7
>>%file% echo cffi==1.15.1
>>%file% echo cfgv==3.3.1
>>%file% echo chardet==4.0.0
>>%file% echo charset-normalizer==3.1.0
>>%file% echo click==8.1.3
>>%file% echo colorama==0.4.6
>>%file% echo coloredlogs==15.0.1
>>%file% echo comm==0.1.3
>>%file% echo contourpy==1.0.7
>>%file% echo cryptography==40.0.1
>>%file% echo cycler==0.11.0
>>%file% echo debugpy==1.6.7
>>%file% echo decorator==5.1.1
>>%file% echo defusedxml==0.7.1
>>%file% echo distlib==0.3.6
>>%file% echo entrypoints==0.4
>>%file% echo exceptiongroup==1.1.1
>>%file% echo executing==1.2.0
>>%file% echo fastjsonschema==2.16.3
>>%file% echo filelock==3.11.0
>>%file% echo flake8==6.0.0
>>%file% echo flatbuffers==23.3.3
>>%file% echo flit_core==3.8.0
>>%file% echo fonttools==4.39.3
>>%file% echo fsspec==2023.3.0
>>%file% echo google-auth==2.17.2
>>%file% echo google-auth-oauthlib
>>%file% echo grpcio
>>%file% echo h5py==3.8.0
>>%file% echo humanfriendly==10.0
>>%file% echo identify==2.5.22
>>%file% echo idna==3.4
>>%file% echo importlib-metadata==6.1.0
>>%file% echo importlib-resources==5.12.0
>>%file% echo iniconfig==2.0.0
>>%file% echo ipykernel==6.22.0
>>%file% echo ipython==8.12.0
>>%file% echo ipython-genutils==0.2.0
>>%file% echo ipywidgets==8.0.6
>>%file% echo jedi==0.18.2
>>%file% echo Jinja2==3.1.2
>>%file% echo jsonschema==4.17.3
>>%file% echo jupyter==1.0.0
>>%file% echo jupyter_client==8.1.0
>>%file% echo jupyter-console==6.6.3
>>%file% echo jupyter_core==5.3.0
>>%file% echo jupyter-events==0.6.3
>>%file% echo jupyter_server==2.5.0
>>%file% echo jupyter_server_terminals==0.4.4
>>%file% echo jupyterlab-pygments==0.2.2
>>%file% echo jupyterlab-widgets==3.0.7
>>%file% echo kiwisolver==1.4.4
>>%file% echo lightning-utilities==0.8.0
>>%file% echo Markdown==3.4.3
>>%file% echo MarkupSafe==2.1.2
>>%file% echo matplotlib==3.7.1
>>%file% echo matplotlib-inline==0.1.6
>>%file% echo mccabe==0.7.0
>>%file% echo mistune==2.0.5
>>%file% echo mpmath==1.3.0
>>%file% echo multidict==6.0.4
>>%file% echo munkres==1.1.4
>>%file% echo mypy-extensions==1.0.0
>>%file% echo nbclassic==0.5.5
>>%file% echo nbclient==0.7.3
>>%file% echo nbconvert==7.3.0
>>%file% echo nbformat==5.8.0
>>%file% echo nest-asyncio==1.5.6
>>%file% echo networkx==3.1
>>%file% echo nodeenv==1.7.0
>>%file% echo notebook==6.5.4
>>%file% echo notebook_shim==0.2.2
>>%file% echo numpy==1.24.2
>>%file% echo oauthlib==3.2.2
>>%file% echo onnx==1.13.1
>>%file% echo onnxruntime==1.14.1
>>%file% echo packaging==23.0
>>%file% echo pandocfilters==1.5.0
>>%file% echo parso==0.8.3
>>%file% echo pathspec==0.11.1
>>%file% echo pickleshare==0.7.5
>>%file% echo Pillow==9.5.0
>>%file% echo pip==23.0.1
>>%file% echo pkgutil_resolve_name==1.3.10
>>%file% echo platformdirs==3.2.0
>>%file% echo pluggy==1.0.0
>>%file% echo ply==3.11
>>%file% echo pooch==1.7.0
>>%file% echo pre-commit==3.2.2
>>%file% echo prometheus-client==0.16.0
>>%file% echo prompt-toolkit==3.0.38
>>%file% echo protobuf==3.20.3
>>%file% echo psutil==5.9.4
>>%file% echo pure-eval==0.2.2
>>%file% echo pyasn1==0.4.8
>>%file% echo pyasn1-modules==0.2.7
>>%file% echo pycodestyle==2.10.0
>>%file% echo pycparser==2.21
>>%file% echo pyflakes==3.0.1
>>%file% echo Pygments==2.14.0
>>%file% echo PyJWT==2.6.0
>>%file% echo pyOpenSSL==23.1.1
>>%file% echo pyparsing==3.0.9
>>%file% echo PyQt5==5.15.7
>>%file% echo PyQt5-sip==12.11.0
>>%file% echo pyreadline3==3.4.1
>>%file% echo pyrsistent==0.19.3
>>%file% echo PySocks==1.7.1
>>%file% echo pytest==7.2.2
>>%file% echo python-dateutil==2.8.2
>>%file% echo python-json-logger==2.0.7
>>%file% echo pytorch-lightning==2.0.1
>>%file% echo pyu2f==0.1.5
>>%file% echo pywin32==304
>>%file% echo pywinpty==2.0.10
>>%file% echo PyYAML==6.0
>>%file% echo pyzmq==25.0.2
>>%file% echo qtconsole==5.4.2
>>%file% echo QtPy==2.3.1
>>%file% echo requests==2.28.2
>>%file% echo requests-oauthlib==1.3.1
>>%file% echo rfc3339-validator==0.1.4
>>%file% echo rfc3986-validator==0.1.1
>>%file% echo rsa==4.9
>>%file% echo scipy==1.10.1
>>%file% echo semver==2.13.0
>>%file% echo Send2Trash==1.8.0
>>%file% echo setuptools==67.6.1
>>%file% echo sip==6.7.7
>>%file% echo six==1.16.0
>>%file% echo sniffio==1.3.0
>>%file% echo sounddevice==0.4.6
>>%file% echo soupsieve==2.3.2.post1
>>%file% echo stack-data==0.6.2
>>%file% echo sympy==1.11.1
>>%file% echo tensorboard==2.12.1
>>%file% echo tensorboard-data-server==0.7.0
>>%file% echo tensorboard-plugin-wit==1.8.1
>>%file% echo terminado==0.17.0
>>%file% echo tinycss2==1.2.1
>>%file% echo toml==0.10.2
>>%file% echo tomli==2.0.1
>>%file% echo torchmetrics==0.11.4
>>%file% echo tornado==6.2
>>%file% echo tqdm==4.65.0
>>%file% echo traitlets==5.9.0
>>%file% echo typing_extensions==4.5.0
>>%file% echo unicodedata2==15.0.0
>>%file% echo urllib3==1.26.15
>>%file% echo virtualenv==20.21.0
>>%file% echo wavio==0.0.4
>>%file% echo wcwidth==0.2.6
>>%file% echo webencodings==0.5.1
>>%file% echo websocket-client==1.5.1
>>%file% echo Werkzeug==2.2.3
>>%file% echo wheel==0.40.0
>>%file% echo widgetsnbextension==4.0.7
>>%file% echo win-inet-pton==1.1.0
>>%file% echo yarl==1.8.2
>>%file% echo zipp==3.15.0
echo Done.
echo Installing NAM modelling requirements...
pip install -r ./namrequirements.txt
echo.
echo.
echo Installing torch gpu...
pip3 install scipy==1.10.1
pip3 install numpy --pre torch torchvision torchaudio --force-reinstall --index-url https://download.pytorch.org/whl/nightly/cu118
echo Done.
echo.
echo.
echo Building and installing NAM package in virtual environment...
python setup.py build
python setup.py install
echo Done.
echo Done.> installed.txt
echo Local NAM modelling environment installed.
call .\mynamenv\Scripts\deactivate.bat
cd..
:STARTNAM
echo Starting NAM GUI.
cd neural-amp-modeler-0.5.0
call .\mynamenv\Scripts\activate.bat

nam
echo.
echo De-activating python virtual environment...
call .\mynamenv\Scripts\deactivate.bat
cd..
echo.
echo.
echo This window can now be closed.
echo In case something went wrong or the installation got corrupted:
echo You can simply delete the folder neural-amp-modeler-0.5.0 and try a reinstall.
echo Note, that a reinstallation needs an internet connection.
echo Thank you.
pause

