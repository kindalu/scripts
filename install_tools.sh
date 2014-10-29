sudo apt-get update
sudo apt-get -y dist-upgrade

sudo apt-get install tmux
sudo apt-get install weechat
sudo apt-get install git
sudo apt-get install htop
sudo apt-get install bmon

#vim
cd ~
git clone https://github.com/kindalu/scripts.git
cp scripts/.vimrc ~

#zsh
sudo apt-get install zsh
sudo curl -L http://install.ohmyz.sh | sh
sudo chsh -s /bin/zsh
echo ZSH_THEME=\"muse\" >> ~/.zshrc

#anaconda python


