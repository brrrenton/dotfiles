# Source the default .bashrc
force_color_prompt=yes
source /etc/skel/.bashrc

# Shorten command prompt to one directory
export PROMPT_DIRTRIM=1 

# Neovim
if [ `which nvim` ]; then export EDITOR=nvim; fi

# Syntax highlighting in less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -NR '

# Switch between light and dark themes
dark()
{
    sed -i 's/\#include\ \".Xresources.d\/tango-light.Xresources\"/\#include\ \".Xresources.d\/tango-dark.Xresources\"/' ~/.Xresources
    xrdb ~/.Xresources
}

light()
{
    sed -i 's/\#include\ \".Xresources.d\/tango-dark.Xresources\"/\#include\ \".Xresources.d\/tango-light.Xresources\"/' ~/.Xresources
    xrdb ~/.Xresources
}

# Clang
if [ `which clang` ]; then export CC=clang; fi
if [ `which clang++` ]; then export CXX=clang++; fi

# ROS
if [ `which rosversion` ]
then
    unset ROS_MASTER_URI
    unset ROS_IP
    unset ROS_HOSTNAME

    source ~/.local/bin/setup.bash

    export ROS_MASTER_URI=http://$HOSTNAME.local:11311/
    export ROS_HOSTNAME=$HOSTNAME.local
    #export ROS_IP=192.168.10.76

    ros_master_localhost() { export ROS_MASTER_URI='http://localhost:11311/'; }
    ros_hostname_localhost() { export ROS_HOSTNAME=$HOSTNAME.local; }

    ros_master_workboat1() { export ROS_MASTER_URI='http://workboat1.local:11311/'; }
fi

# PlatformIO
export PATH=$PATH:$HOME/.platformio/penv/bin

