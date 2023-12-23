#/bin/sh

# install some tools
# sudo yum install -y git vim gcc glibc-static telnet bridge-utils

# install docker
curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh --dry-run
sudo sh install-docker.sh --mirror Aliyun

# start docker service
sudo groupadd docker
sudo usermod -aG docker vagrant
sudo systemctl start docker

rm -rf get-docker.sh
