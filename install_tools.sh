sudo apt-get update
sudo apt-get -y dist-upgrade

sudo apt-get install tmux
sudo apt-get install git
sudo apt-get install htop
sudo apt-get install neovim

#node
sudo apt-get install nodejs
curl -L https://npmjs.org/install.sh | sudo sh
sudo npm install -g n
sudo n stable


#vim
cd ~
git clone https://github.com/kindalu/scripts.git
cp scripts/.vimrc ~

#zsh
sudo apt-get install zsh
sudo curl -L http://install.ohmyz.sh | sh
sudo chsh -s /bin/zsh
echo ZSH_THEME=\"muse\" >> ~/.zshrc
