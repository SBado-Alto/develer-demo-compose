#!/bin/bash

set -e

ROS_DISTRO="${ROS_DISTRO:-humble}"
DEVELER_DEMO_SIM_PATH="./dev-dockerfiles/develer-demo-sim"
GRIMORIO_PATH="${DEVELER_DEMO_SIM_PATH}/grimorio"
TELEOP_CONTROL_PATH="./teleop-control"
ROS2_REACT_PATH="${TELEOP_CONTROL_PATH}/ros2-react"


[[ -d ${GRIMORIO_PATH} ]] && rm -rf ${GRIMORIO_PATH}
git clone git@github.com:AltoRobotics/grimorio.git ${GRIMORIO_PATH}

[[ -d ${ROS2_REACT_PATH} ]] && rm -rf ${ROS2_REACT_PATH}
git clone git@github.com:SBado-Alto/ros2-react.git ${ROS2_REACT_PATH}
cp -rvf ${ROS2_REACT_PATH}/ros-web/* ${TELEOP_CONTROL_PATH}/_ui/

export ROS_DISTRO=${ROS_DISTRO}
docker compose build

rm -rf ${GRIMORIO_PATH}
rm -rf ${ROS2_REACT_PATH}
