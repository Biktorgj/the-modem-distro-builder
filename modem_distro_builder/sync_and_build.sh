#!/usr/bin/env bash
set -e

BASE_PATH=`pwd`
TARGET_PATH="/modem_build_vol/repos"
TARGET_BRANCH="mickledore"
if [ ! -d ${TARGET_PATH}/docs ]
then
    echo "--> Fetching the main repo..."
    git clone -b ${TARGET_BRANCH} https://github.com/the-modem-distro/pinephone_modem_sdk ${TARGET_PATH} 
else
    echo "--> Updating the main repo..."
    cd ${TARGET_PATH} && \
    git pull && \
    cd $BASE_PATH
fi
cd ${TARGET_PATH} && ./init.sh && chown -R buildusr:buildusr ${TARGET_PATH} && sudo -u buildusr make build 
