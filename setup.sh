sudo apt install openjdk-17-jdk-headless
wget https://github.com/lavalink-devs/Lavalink/releases/download/4.0.4/Lavalink.jar
wget https://github.com/himangshu147-git/himangshu147-git/blob/main/application.yml
wget https://github.com/topi314/LavaSrc/releases/download/4.0.1/lavasrc-plugin-4.0.1.jar

mkdir plugins 
mv lavasrc-plugin-4.0.1.jar plugins

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install 18
npm install pm2 -g

wget https://github.com/himangshu147-git/himangshu147-git/blob/main/start.sh 

pm2 start start.sh --interpreter=bash
