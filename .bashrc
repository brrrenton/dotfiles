# Source the default .bashrc
force_color_prompt=yes
source /etc/skel/.bashrc

export HISTCONTROL=ignoreboth:erasedups

# Shorten command prompt to one directory
export PROMPT_DIRTRIM=1 

# Neovim
if [ `which nvim` ]; then EDITOR=nvim; fi

# Syntax highlighting in less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -NR '

# Switch between light and dark themes
dark()
{
    sed -i 's/colors\:\ \*light/colors\:\ \*dark/' ~/.config/alacritty/alacritty.yml
}

light()
{
    sed -i 's/colors\:\ \*dark/colors\:\ \*light/' ~/.config/alacritty/alacritty.yml
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

    ROS_DISTRO=melodic
	CATKIN_WS_PATH=~/Development/catkin_ws

	if [ -f $CATKIN_WS_PATH/devel_isolated/setup.bash ]
	then
    	source $CATKIN_WS_PATH/devel_isolated/setup.bash
	elif [ -f $CATKIN_WS_PATH/devel/setup.bash ]
	then
    	source $CATKIN_WS_PATH/devel/setup.bash
	elif [ -f /opt/ros/$ROS_DISTRO/setup.bash ]
	then
    	source /opt/ros/$ROS_DISTRO/setup.bash
	fi

    export ROS_MASTER_URI=http://$HOSTNAME.local:11311/
    export ROS_HOSTNAME=$HOSTNAME.local

    ros_master_localhost() { export ROS_MASTER_URI='http://localhost:11311/'; }

    ros_hostname_local() {
        unset ROS_IP
        export ROS_HOSTNAME=$HOSTNAME.local
    }

    ros_ip_enp0s31f6() {
        unset ROS_HOSTNAME
        export ROS_IP=`ip -4 addr show dev enp0s31f6 | grep -Po 'inet \K[0-9.]*'`
    }

    ros_ip_wlp2s0() {
        unset ROS_HOSTNAME
        export ROS_IP=`ip -4 addr show dev wlp2s0 | grep -Po 'inet \K[0-9.]*'`
    }

    ros_hostname_bee_wifi() {
        unset ROS_IP
        export ROS_HOSTNAME=bee-wifi.lan
    }
    
    ros_hostname_bee_eth() {
        unset ROS_IP
        export ROS_HOSTNAME=bee-eth.lan
    }

    ros_master_workboat1() { export ROS_MASTER_URI='http://workboat1.lan:11311/'; }

    ros_master_wamv() { export ROS_MASTER_URI='http://172.16.154.230:11311/'; }
fi

# PlatformIO
export PATH=$PATH:$HOME/.platformio/penv/bin

