#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
sh ./install_nvidia_cuda.sh

#install torch7
    sudo curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
    sudo curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-luajit+torch | bash
    sudo luarocks install env
    sudo luarocks install cutorch
    sudo luarocks install cunn

curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
cd ~/
git clone https://github.com/soumith/torch-distro.git
cd torch-distro
bash install.sh
echo "export PATH=~/torch-distro/install/bin:\$PATH; export LD_LIBRARY_PATH=~/torch-distro/install/lib:\$LD_LIBRARY_PATH; " >>~/.bashrc && source ~/.bashrc
curl -sk https://raw.githubusercontent.com/soumith/fblualib/master/install_all.sh | bash

git clone https://github.com/torch/nn && cd nn && git checkout getParamsByDevice && luarocks make rocks/nn-scm-1.rockspec
git clone https://github.com/facebook/fbcunn.git
cd fbcunn && luarocks make rocks/fbcunn-scm-1.rockspec # go get a coffee
