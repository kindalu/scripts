cd ~
git clone https://github.com/BVLC/caffe.git
cd caffe/python
for req in $(cat requirements.txt); do sudo pip install $req; done

# Adjust Makefile.config (for example, if using Anaconda Python)
cd ~/caffe
cp Makefile.config.example Makefile.config

make all -j8
make test
#if you found cannot find cuda library error...please check the .bashrc is updated by "line 10" or not
make runtest

