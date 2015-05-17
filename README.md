# elementary-post-install
Original author: Ryan Bottoms

License: MIT

Script for configuring a fresh install of elementary OS (64-bit)

This script depends on my dotfiles configuration. Currently it clones [my dotfiles](https://github.com/rkbottoms/dotfiles) to configure git, bash, fonts as well as installing all the programs I need for everyday use. You are free to download/fork but make sure to change the dotfiles that set up my git username, email address, and the part of the script that sets up a ssh key for github. You can also use your own dotfiles if you want but remember to change the address git clones in the script. 

# Instructions
On a brand new installation of elementary OS Freya, paste the following commands to the terminal: 

    wget https://raw.githubusercontent.com/rkbottoms/elementary-post-install/master/elementary-post-install.sh
    sudo bash elementary-post-install.sh
