#Install CUDA
sudo apt-get install -y build-essential
sudo apt-get -y dist-upgrade
sudo apt-get install -y linux-generic

wget http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda-repo-ubuntu1404-6-5-prod_6.5-19_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404-6-5-prod_6.5-19_amd64.deb
sudo apt-get update
sudo apt-get install -y cuda
echo "export PATH=/usr/local/cuda/bin/:\$PATH; export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:\$LD_LIBRARY_PATH; " >>~/.bashrc && source ~/.bashrc

#Now you need to restart your computer

#Install Cudnn, need to download the libray from Nvidia manually
cd ~
tar -xvf cudnn-6.5-linux-R1.tar
sudo cp cudnn-6.5-linux-R1/*.h /usr/local/cuda/include
sudo cp cudnn-6.5-linux-R1/*.so* /usr/local/cuda/lib64


#Install Torch Dependencies
curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash

#Install Torch in a local folder
cd ~/
git clone https://github.com/soumith/torch-distro.git
cd torch-distro
bash install.sh
echo "export PATH=~/torch-distro/install/bin:\$PATH; export LD_LIBRARY_PATH=~/torch-distro/install/lib:\$LD_LIBRARY_PATH; " >>~/.bashrc && source ~/.bashrc

#Install Folly, fbthrift, thpp and fblualib
curl -sk https://raw.githubusercontent.com/soumith/fblualib/master/install_all.sh | bash

#Install fbcunn
git clone https://github.com/torch/nn && cd nn && git checkout getParamsByDevice && luarocks make rocks/nn-scm-1.rockspec
git clone https://github.com/facebook/fbcunn.git
cd fbcunn && luarocks make rocks/fbcunn-scm-1.rockspec # go get a coffee

#asked to install after running
sudo apt-get install -y GraphicsMagick
