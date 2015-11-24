## DotFiles 

This github repository contains a few dotfiles like .bash_profile and .vimrc and .emacs(for both Linux and Windows)
The aim of this git repository is to store the common dotfile configurations so that configuring on another computer takes a little time.

### Instructions

After you clone the repository, please rename the vimrc file to .vimrc.
Similarly rename bash_profile to .bash_profile.
Place them into your $HOME directory.

Please note that Vundle is used as a package manager for ViM plugins.
It requires Git to be already installed.

Once you have the .vimrc in your $HOME, open terminal and type source ~/.vimrc

Then open vim, type the command :PluginInstall in normal mode.
Vundle will then install all the plugins listed in the .vimrc.
This may take sometime.


