#!/bin/bash
EMAIL=$1
function setup_ssh(EMAIL) {
  ssh-keygen -t ed25519 -C "${EMAIL}"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  cat ~/.ssh/id_ed25519
  echo "copy and paste that into GitHub or whatever"
}
setup_ssh($EMAIL)

# Install Brew
function install_brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/cloudshell-user/.bash_profile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo yum groupinstall 'Development Tools'
  brew install asdf
}


sudo yum install gcc openssl-devel bzip2-devel libffi-devel
wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
tar xzf Python-3.9.5.tgz
cd Python-3.9.5
./configure --enable-optimizations
sudo make altinstall
