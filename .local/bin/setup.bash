#!/bin/bash

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

