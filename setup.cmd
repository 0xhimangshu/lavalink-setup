@echo off
setlocal

:: Variables
set "lavalink_config=https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/application.yml"
set "start_script=https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/start.sh"
set "lavasrc_plugin_jar=https://github.com/topi314/LavaSrc/releases/download/4.0.1/lavasrc-plugin-4.0.1.jar"
set "lavalink_jar=https://github.com/lavalink-devs/Lavalink/releases/download/4.0.4/Lavalink.jar"

:: Function to install nvm for Windows
:install_nvm
powershell -Command "& {Invoke-WebRequest -Uri 'https://github.com/coreybutler/nvm-windows/archive/refs/heads/master.zip' -OutFile 'nvm-setup.zip'}"
tar -xvf nvm-setup.zip
cd nvm-windows-master
call install.cmd
cd ..
del nvm-setup.zip
rmdir /s /q nvm-windows-master

:: Function to check if Node.js is installed
:checkNode
set /p nodeInstalled=Have you already installed Node.js? (yes/no):
if /i "%nodeInstalled%"=="yes" (
    echo Node.js is already installed.
) else if /i "%nodeInstalled%"=="no" (
    :: Install Node.js 18
    nvm install 18
) else (
    echo Invalid input. Please enter 'yes' or 'no'.
    goto checkNode
)

:: Call function to install nvm
call :install_nvm

:: Call function to check Node.js installation
call :checkNode

:: Create plugins directory
mkdir plugins

:: Download and move lavasrc-plugin using wget
powershell -Command "& {Invoke-WebRequest -Uri '%lavasrc_plugin_jar%' -OutFile 'plugins\lavasrc-plugin-4.0.1.jar'}"

:: Download lavalink and start script using wget
powershell -Command "& {Invoke-WebRequest -Uri '%lavalink_jar%' -OutFile 'Lavalink.jar'}"
powershell -Command "& {Invoke-WebRequest -Uri '%start_script%' -OutFile 'start.sh'}"
powershell -Command "& {Invoke-WebRequest -Uri '%lavalink_config%' -OutFile 'application.yml'}"

:: Install pm2
npm install pm2 -g

:: Start Lavalink with pm2
pm2 start start.sh --interpreter=bash

echo Lavalink setup completed.
