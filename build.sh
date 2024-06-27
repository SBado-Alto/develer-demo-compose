#!/bin/bash

set -e

ROS_DISTRO="${ROS_DISTRO:-humble}"
DEV_DOCKERFILES_PATH="./dev-dockerfiles"
DEVELER_DEMO_SIM_PATH="${DEV_DOCKERFILES_PATH}/develer-demo-sim"
GRIMORIO_PATH="${DEVELER_DEMO_SIM_PATH}/grimorio"
REACT_GO_EMBED_PATH="./react-go-embed"
ROS2_REACT_PATH="./ros2-react"

[[ -d ${DEV_DOCKERFILES_PATH} ]] && rm -rf ${DEV_DOCKERFILES_PATH}
git clone git@github.com:AltoRobotics/dev-dockerfiles.git ${DEV_DOCKERFILES_PATH}

[[ -d ${GRIMORIO_PATH} ]] && rm -rf ${GRIMORIO_PATH}
git clone git@github.com:AltoRobotics/grimorio.git ${GRIMORIO_PATH}

[[ -d ${REACT_GO_EMBED_PATH} ]] && rm -rf ${REACT_GO_EMBED_PATH}
git clone git@github.com:SBado-Alto/react-go-embed.git ${REACT_GO_EMBED_PATH}

[[ -d ${ROS2_REACT_PATH} ]] && rm -rf ${ROS2_REACT_PATH}
git clone git@github.com:SBado-Alto/ros2-react.git ${ROS2_REACT_PATH}
cp -rvf ${ROS2_REACT_PATH}/ros-web/* ${REACT_GO_EMBED_PATH}/_ui/

export ROS_DISTRO=${ROS_DISTRO}
docker compose build

rm -rf ${GRIMORIO_PATH}
rm -rf ${ROS2_REACT_PATH}
