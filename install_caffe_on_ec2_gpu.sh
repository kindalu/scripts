#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
sh ./install_nvidia_cuda.sh

cd ~
git clone https://github.com/BVLC/caffe.git
cd caffe/python
for req in $(cat requirements.txt); do sudo pip install $req; done

# Adjust Makefile.config (for example, if using Anaconda Python)
cd ~/caffe
cp Makefile.config.example Makefile.config

make all -j8
make test
make runtest

