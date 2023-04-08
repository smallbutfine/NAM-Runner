# NAM-Runner
A Windows 10 batch file, that installs and runs the NAM model trainer (neural-amp-modeler) right into the GUI application. Fully automated. Custom one-time installation, no Conda required. Runs as a launcher afterwards. Portable install. New pyTorch. Enjoy!

Usage:
Double click "NAM-Runner.cmd". That's it.

Needs internet access and ~5.5GB of free drive space for the installed system.
So it needs a few minutes more to install at the first run.
In case anything goes wrong or the installation was corrupted, simply delete the folder "neural-amp-modeler-0.5.0" and run the batch file and let it install again.

What it does:
The program does a download of NAM release 0.5.0/latest.
The program does a silent python 3.10 standard install.
The program runs a pip install of all required python packages in a virtual environment inside the NAM folder.
The packages are, what the normal conda install of the trainer would install, except an updated pyTorch package, that brings it's own CUDA runtimes, so no additional CUDA installation required.
The program builds the NAM package and runs the default simple GUI app.
In case that the installation has already been made, the batch file just acts as a launcher, activating the virtual environment and run the GUI app.
A nice little one-trick-pony for people who want to avoid using the command line and conda.
No deeper knowledge required.

Deinstallation: Just delete the folder. That's it.

A huge THANK YOU to Steve Ack, who programmed NAM, and the helpful and generous NAM community on Facebook and Discord.
Have fun!

#nam #neural-amp-modeler #guitar #amp #modelling #easy #neural #network #bass #daw #audio #vst #plugin #WaveNet #ML #AI #machine #learning

