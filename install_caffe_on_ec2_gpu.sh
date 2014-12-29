#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
sh ./install_nvidia_cuda.sh

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

