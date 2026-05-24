#! /bin/bash
#Launch an instance with 9000 and t2.medium
cd /opt/
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip
unzip sonarqube-8.9.6.50800.zip
amazon-linux-extras install java-openjdk11 -y
useradd sonar
chown sonar:sonar sonarqube-8.9.6.50800 -R
chmod 777 sonarqube-8.9.6.50800 -R
su - sonar

#run this on server manually
#sh /opt/sonarqube-8.9.6.50800/bin/linux/sonar.sh start
#echo "user=admin & password=admin"

=========================================================== installing Sonarqube using Dockerhub ==============================================


sudo apt update && sudo apt upgrade -y

sudo systemctl enable docker
sudo systemctl start docker

docker --version

Fix Docker Permission

sudo usermod -aG docker $USER
newgrp docker

docker ps

sudo sysctl -w vm.max_map_count=524288
sudo sysctl -w fs.file-max=131072

sudo nano /etc/sysctl.conf

vm.max_map_count=524288
fs.file-max=131072

sudo sysctl -p

docker pull sonarqube:lts-community

docker pull sonarqube:latest

docker run -d \
  --name sonarqube \
  -p 9000:9000 \
  sonarqube:lts-community

  docker run -d \
  --name sonarqube \
  -p 9000:9000 \
  -v sonarqube_data:/opt/sonarqube/data \
  -v sonarqube_logs:/opt/sonarqube/logs \
  -v sonarqube_extensions:/opt/sonarqube/extensions \
  sonarqube:lts-community

  docker ps

  docker logs -f sonarqube

  
