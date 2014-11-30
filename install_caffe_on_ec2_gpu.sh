#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
    sudo apt-get update
    sudo apt-get -y dist-upgrade
    sudo apt-get install -y linux-image-generic
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_6.5-14_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1404_6.5-14_amd64.deb
    sudo apt-get update
    sudo apt-get install -y cuda
    echo -e "\nexport PATH=/usr/local/cuda-6.5/bin:$PATH\n\nexport LD_LIBRARY_PATH=/usr/local/cuda-6.5/lib64" >> .bashrc
    sudo reboot

#install caffe with python wrapper
sudo apt-get install -y libatlas-base-dev
sudo apt-get install -y python-dev
sudo apt-get install -y pip
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler


git clone https://github.com/BVLC/caffe.git
cd ~/caffe
for req in $(cat requirements.txt); do sudo pip install $req; done

#editing the Makefile.Config.Example
cp Makefile.config.example Makefile.config
# Adjust Makefile.config (for example, if using Anaconda Python)
make all
make test
make runtest

