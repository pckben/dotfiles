# CONDA

conda create --name myenv python=3.7
conda activate myenv
conda env export > one.yml
pip freeze > requirements.txt
conda deactivate

# GitHub CLI
wget https://github.com/cli/cli/releases/download/v0.6.2/gh_0.6.2_linux_amd64.deb
sudo dpkg -i gh_0.6.2_linux_amd64.deb

# gh pr [status, list, view, checkout, create]
# gh issue [status, list, view, create]
# gh repo [view, create, clone, fork]
# gh help


# Python
# setuptools install local using symlinks:
pip install -e .


# MongoDB
#--------
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod


# NVIDIA-docker
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

docker run --gpus ll nvidia/cuda:10.0-base nvidia-smi

# docker machine
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

# Pull docker AWS image
#----------------------

# login to personal ECR
aws ecr get-login-password | docker login -u AWS --password-stdin \
  https://$(aws sts get-caller-identity --query 'Account' --output text).dkr.ecr.us-west-2.amazonaws.com

# login to machine learning images ECR
aws ecr get-login-password | docker login -u AWS --password-stdin \
  https://763104351884.dkr.ecr.us-west-2.amazonaws.com

vim Dockerfile
#
# FROM 763104351884.dkr.ecr.us-west-2.amazonaws.com/tensorflow-training:2.1.0-gpu-py36-cu101-ubuntu18.04
# reference: https://docs.aws.amazon.com/deep-learning-containers/latest/devguide/deep-learning-containers-images.html
#
docker build -t pckben/card-reader .
docker run --gpus all -it pckben/card-reader nvidia-smi
