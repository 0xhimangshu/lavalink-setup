## Lavalink Setup Guide
This guide provides step-by-step instructions to set up Lavalink on both Windows and Linux systems using provided scripts.

## Prerequisites
Ensure you have the following software installed on your system:

* [Java Development Kit](https://www.oracle.com/java/technologies/downloads) (JDK) 13 or higher
* [Node.js](https://nodejs.org/downloads) 17+ and [npm](https://www.npmjs.com/) (if not already installed)
* [pm2](https://pm2.keymetrics.io/) (Process Manager 2) for managing Lavalink

## For Linux:
Install JDK:
```bash
sudo apt-get update
sudo apt-get install openjdk-11-jdk
```
Install Node.js and npm:
```bash
sudo apt-get install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install 18
```
Install pm2:
```bash
npm install pm2 -g
```
## For Windows:

Install JDK:
* [Download and install Java SE Development Kit.](https://www.oracle.com/java/technologies/downloads/#java17)

Install Node.js and npm:

* [Download and install Node.js.](https://nodejs.org/dist/v18.20.2/node-v18.20.2-x64.msi) after download double click the `node-v{x.y.z}-x64.msi` file and run it.

Install pm2:
```batch
npm install pm2 -g
```
## Installation Steps

### For Linux:
Download Scripts:
```bash
mkdir lavalink-setup
cd lavalink-setup
wget https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/setup.sh
wget https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/start.sh
```
Run Setup Script:

```bash
chmod +x setup.sh
./setup.sh
```

Start Lavalink:
```bash
chmod +x start.sh
./start.sh
```

### For Windows:

* Create a folder named lavalink-setup.
* Download the following files and save them in the lavalink-setup folder:
* [setup.bat](https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/setup.bat)
* [start.bat](https://raw.githubusercontent.com/himangshu147-git/lavalink-setup/main/start.bat)

Run Setup Script:
* Right-click on setup.bat and select "Run as administrator".
Start Lavalink:
* Right-click on start.bat and select "Run as administrator".
## Additional Notes
* The setup scripts will download Lavalink jar files and configuration.
* Ensure you have internet access during the setup process.
* For Linux users without wget, install it using sudo apt-get install wget.
* For Windows users without curl or wget, ensure you have internet access or install them manually.
### Troubleshooting
* Permission Issues: If you encounter permission issues on Linux, use sudo before commands where necessary.
* Internet Connection: Ensure a stable internet connection during the setup process.
* [Node.js](https://nodejs.org/en/download) Installation: If nvm fails to install Node.js on Linux, try installing it manually and update [npm](https://www.npmjs.com/) and [pm2](https://pm2.keymetrics.io/) versions.