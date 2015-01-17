#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
    sudo apt-get -y install build-essential
    sudo apt-get update
    sudo apt-get -y dist-upgrade
    sudo apt-get install -y linux-image-generic
    sudo apt-get install -y linux-generic

    #this version will support Nvidia GTX 980 & 970
    wget http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda-repo-ubuntu1404-6-5-prod_6.5-19_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1404-6-5-prod_6.5-19_amd64.deb
    sudo apt-get update
    sudo apt-get install -y cuda
    echo "export PATH=/usr/local/cuda/bin/:\$PATH; export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:\$LD_LIBRARY_PATH; " >>~/.bashrc && source ~/.bashrc

    #this install cudnn, you need to manually download the cudnn R1 library, and put it to your home directory from Nvidia
    cd ~
    tar -xvf cudnn-6.5-linux-R1.tar
    sudo cp cudnn-6.5-linux-R1/*.h /usr/local/cuda/include
    sudo cp cudnn-6.5-linux-R1/*.so* /usr/local/cuda/lib64

    sudo reboot
