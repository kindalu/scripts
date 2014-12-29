#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
    sudo apt-get update
    sudo apt-get -y dist-upgrade
    sudo apt-get install -y linux-image-generic
    wget http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda-repo-ubuntu1404-6-5-prod_6.5-19_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1404-6-5-prod_6.5-19_amd64.deb
    sudo apt-get update
    sudo apt-get install -y cuda
    #sometimes this will fail => add manually
    echo -e "\nexport PATH=/usr/local/cuda-6.5/bin:$PATH\n\nexport LD_LIBRARY_PATH=/usr/local/cuda-6.5/lib64:$LD_LIBRARY_PATH" >> .bashrc
    sudo reboot
