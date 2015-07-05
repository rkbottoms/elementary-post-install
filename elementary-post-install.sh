#!/bin/bash

EMAIL="ryan.bottoms1@gmail"
SSH-PASSWORD="";

# upgrade the system
sudo apt-get update
sudo apt-get -y upgrade

# sources, keys, and ppa's necessary to install everything
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo add-apt-repository -y ppa:mpstark/elementary-tweaks-daily
sudo sh -c 'echo "deb http://dl.google.com/linux/musicmanager/deb/ stable main" >> /etc/apt/sources.list.d/google-musicmanager.list'
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo add-apt-repository -y ppa:fossfreedom/rhythmbox
sudo add-apt-repository -y ppa:snwh/pulp
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:noobslab/themes
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:webupd8team/popcorntime
sudo add-apt-repository -y ppa:djcj/screenfetch
sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' >> /etc/apt/sources.list.d/virtualbox.list"
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository ppa:tsbarnes/indicator-keylock
sudo add-apt-repository ppa:emptythevoid/syspeeknew
sudo add-apt-repository ppa:i-nex-development-team/stable
sudo apt-get update

# fix gtk theme bug
sudo apt-get install -y gtk-engines-pixbuf gtk2-engines-murrine

# install google chrome
sudo apt-get install -y google-chrome-stable

# install video codecs
sudo apt-get install -y ubuntu-restricted-extras

# install elementary tweaks
sudo apt-get install -y elementary-tweaks
sudo apt-get install dconf-tools

#install music programs
sudo apt-get install -y rhythmbox
sudo apt-get install -y google-musicmanager-beta
sudo apt-get install -y spotify-client

# install miscellaneous programs
sudo apt-get install -y ssh cable skype transmission gparted screenfetch ppa-purge i-nex gdebi-core
wget https://www.unifiedremote.com/static/builds/server/linux-x64/638/urserver-3.2.4.638.deb
sudo gdebi -y urserver-3.2.4.638.deb

# install image manipulation programs
sudo apt-get install -y gimp inkscape

# install video programs
sduo apt-get install -y vlc

# install file archiving/extraction tools
sudo apt-get install -y unace rar unrar p7zip-rar p7zip zip unzip sharutils uudeview mpack lha arj cabextract file-roller

# install c++ tools
sudo apt-get install -y build-essential libgl1-mesa-dev
wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
chmod +x qt-unified-linux-x64-online.run
sudo apt-get install -y gcc-5 g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5

# install python tools
sudo apt-get install -y python python-pip
sudo pip install -U pip

# install java tools
sudo apt-get install -y oracle-java7-installer
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-installer
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

# install git tools 
sudo apt-get install -y git gitk

#install sublime text 3, package control, and preferences
sudo apt-get install -y sublime-text-installer
git clone https://github.com/rkbottoms/dotfiles.git
if [[ ! -d ~/.config/sublime-text-3/Installed\ Packages/ ]]; 
	then mkdir -p ~/.config/sublime-text-3/Installed\ Packages/; 
fi
cp ~/dotfiles/sublime/Package\ Control.sublime-package ~/.config/sublime-text-3/Installed\ Packages/
if [[ ! -d ~/.config/sublime-text-3/Packages/User/ ]]; 
	then mkdir -p ~/.config/sublime-text-3/Packages/User/; 
fi
cp ~/dotfiles/sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/
cp ~/dotfiles/sublime/Package\ Control.sublime.settings ~/.config/sublime-text-3/Packages/User/

# install dotfiles
cp ~/dotfiles/.bash_prompt ~/.bash_prompt
cp ~/dotfiles/.bashrc ~/.bashrc
cp ~/dotfiles/.gitconfig ~/.gitconfig
cp ~/dotfiles/.git-prompt.sh ~/.git-prompt.sh
cp ~/dotfiles/general.aliases ~/general.aliases

# install android tools
wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
tar -xvzf android-sdk_r24.2-linux.tgz
wget https://static.realm.io/downloads/java/realm-java-0.80.1.zip
unzip realm-java-0.80.1.zip
wget https://services.gradle.org/distributions/gradle-2.4-all.zip
unzip gradle-2.4-all.zip
mkdir software-development
mv android-sdk-linux/ ~/software-development/
mv realm-java-0.80.1/ ~/software-development/
mv gradle-2.4-all.zip ~/software-development/
echo -e "export PATH=~/development/gradle-2.4/bin/:$PATH" >> .bashrc
echo -e "export ANDROID_HOME=~/development/android-sdk-linux" >> .bashrc
echo -e "export PATH=$ANDROID_HOME/platform-tools:$PATH" >> .bashrc
echo -e "export PATH=$ANDROID_HOME/tools:$PATH" >> .bashrc
# install virtualbox
sudo apt-get install -y virtualbox-4.3 dkms

# install vagrant
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
sudo gdebi -y vagrant_1.7.2_x86_64.deb

#install IntelliJ community edition
wget https://download.jetbrains.com/idea/ideaIC-14.1.2.tar.gz
tar -xvzf ideaIC-14.1.2.tar.gz
sudo mv ideaIC-14.1.2/ /opt/idea/

# install office tools
sudo apt-get install -y libreoffice
sudo apt-get install -y libreoffice-gnome libreoffice-gtk libreoffice-style-sifr libreoffice-gtk3

# install indicators
sudo apt-get install -y indicator-keylock
sudo apt-get install -y syspeek

# install icons and themes
sudo apt-get install -y paper-gtk-theme
sudo apt-get install -y numix-gtk-theme
sudo apt-get install -y numix-icon-theme-circle
sudo apt-get install -y libra-theme
sudo apt-get install -y elementary-dark-theme
# fixing hardcoded icons for numix-circle-theme
git clone https://github.com/Foggalong/hardcode-fixer.git
sudo bash fix.sh

# display hidden startup processes
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

# install fonts
sudo apt-get install -y ttf-mscorefonts-installer --quiet
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
cp -r ~/dotfiles/.fonts/  ~/.fonts/

# set up ssh for github
ssh-keygen -t rsa -b 4096 -C $EMAIL -f ~/.ssh/id_rsa -N $SSH_PASSWORD
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
google-chrome-stable https://github.com/settings/ssh

# clean up
sudo apt-get purge -y midori
sudo apt-get -y autoclean
sudo apt-get -y autoremove

# installed last because of interaction with terms of service
sudo apt-get install -y popcorn-time
echo '***Remember to add the ssh key to github and test the connection***'
echo '***Open a terminal and use the command "ssh -T git@github.com" to test***' 
echo '***Remember to switch to the latest gcc compiler'
echo '***Open a terminal and use the command "sudo update-alternative --config gcc" to switch***'
echo '***Remember to run the IntelliJ for the first time with script at /opt/idea/bin/idea.sh'
