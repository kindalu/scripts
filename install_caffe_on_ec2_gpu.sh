#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
    sudo apt-get update
    sudo apt-get -y dist-upgrade
    sudo apt-get install -y linux-image-generic
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_6.5-14_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1404_6.5-14_amd64.deb
    sudo apt-get update
    sudo apt-get install -y cuda
    #sometimes this will fail => add manually
    echo -e "\nexport PATH=/usr/local/cuda-6.5/bin:$PATH\n\nexport LD_LIBRARY_PATH=/usr/local/cuda-6.5/lib64:$LD_LIBRARY_PATH" >> .bashrc
    sudo reboot

#install caffe with python wrapper
sudo apt-get install -y libatlas-base-dev python-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

cd ~
git clone https://github.com/BVLC/caffe.git
cd caffe/python
for req in $(cat requirements.txt); do sudo pip install $req; done

# Adjust Makefile.config (for example, if using Anaconda Python)
cd ~/caffe
cp Makefile.config.example Makefile.config

make all
make test
#if you found cannot find cuda library error...please check the .bashrc is updated by "line 10" or not
make runtest

