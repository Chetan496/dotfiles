# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export TERM=xterm-256color

if [ -e /usr/bin/vimx ]; then
   alias vim='/usr/bin/vimx';
fi

# some common commands for mounting archives containing tutorials and opening them in pcmanfm

STUDY_DIR=~/Study

alias mountGIMPTuts="fuse-zip -r $STUDY_DIR/books/DesignTools/Lynda\ -\ GIMP\ Essential\ Training\ \(Updated\ Sep\ 04\,\ 2014\)\ -\ E_M_A.zip /mnt/tuts/gimp/ && pcmanfm /mnt/tuts/gimp/"

alias mountRxJSTuts="fuse-zip -r $STUDY_DIR/books/Javascript_and_HTML5/Egghead\ -\ RxJS\ lessons.zip /mnt/tuts/rxjs && pcmanfm /mnt/tuts/rxjs"


alias mountDockerTuts="fuse-zip -r $STUDY_DIR/books/Cloud_Computing_and_Virtualization/O'Reilly\ -\ Learning\ Docker.zip /mnt/tuts/docker && pcmanfm /mnt/tuts/docker"


alias mountReactTuts="fuse-zip -r $STUDY_DIR/books/Javascript_and_HTML5/Modern\ React\ with\ Redux.zip /mnt/tuts/react && pcmanfm /mnt/tuts/react"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
