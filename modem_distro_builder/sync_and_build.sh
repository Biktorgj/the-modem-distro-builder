#!/usr/bin/env bash
set -e

BASE_PATH=`pwd`
TARGET_PATH="/modem_build_vol/repos"
TARGET_BRANCH="langdale"
if [ ! -d ${TARGET_PATH}/docs ]
then
    echo "--> Fetching the main repo..."
    sudo -u buildusr git clone -b ${TARGET_BRANCH} https://github.com/the-modem-distro/pinephone_modem_sdk ${TARGET_PATH} 
else
    echo "--> Updating the main repo..."
    cd ${TARGET_PATH} && \
    sudo -u buildusr git pull && \
    cd $BASE_PATH
fi
cd ${TARGET_PATH} && sudo -u buildusr ./init.sh && sudo -u buildusr make build 
