#This script should be used on Amazon EC2 g2.2xlarge server with ubuntu 14.04 trusty version
    sudo apt-get update
    sudo apt-get -y dist-upgrade
    sudo apt-get install -y linux-image-generic
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_6.5-14_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1404_6.5-14_amd64.deb
    sudo apt-get update
    sudo apt-get install -y cuda
    echo "\nexport PATH=/usr/local/cuda-6.5/bin:$PATH\nexport LD_LIBRARY_PATH=/usr/local/cuda-6.5/lib64" >> .bashrc
    sudo reboot

#install torch7
    sudo curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
    sudo curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-luajit+torch | bash
    sudo luarocks install env
    sudo luarocks install cutorch
    sudo luarocks install cunn

#running the MNIST Digit Classfication on GPU
    #sudo luarocks install dp
    #git clone https://github.com/nicholas-leonard/dp.git
    #cd dp/examples
    #th neuralnetwork.lua --cuda

#misc optional
sudo luarocks install https://raw.githubusercontent.com/soumith/cuda-convnet2.torch/master/ccn2-scm-1.rockspec
#cd ~
#git clone https://github.com/clementfarabet/torch-tutorials.git
#git clone https://github.com/nagadomi/kaggle-cifar10-torch7.git

#references from http://techupdates.com/go/935241
#                https://forums.aws.amazon.com/thread.jspa?messageID=558414
#                http://torch.ch

#tips:
#   use tmux/screen
#   running on cheap spot instance
#   get latest Ubuntu AMI by search "trusty daily 20141x" in community AMI
#   set proper security. only allow inbound SSH connection from your ip
#   get tutorial from http://code.madbits.com/wiki/doku.php
#   get state of art model from https://github.com/nagadomi/kaggle-cifar10-torch7
#   be sure connect the server with 'ssh -C' option
