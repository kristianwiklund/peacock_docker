#!/bin/bash

# Define ANSI escape codes for text formatting
BOLD='\e[1m'
RESET='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'

# Success message function
success_message() {
  echo -e "[${GREEN}${BOLD}✔${RESET}] $1!"
}

# Error message function
error_message() {
  echo -e "[${RED}${BOLD}Error${RESET}] $1"
}

# Information message function
info_message() {
  echo -e "\n[${BLUE}${BOLD}Info${RESET}] $1"
}

# Clone Peacock from github

git config --global --add safe.directory /Peacock

if [ ! -d /Peacock/.git ]; then
    cd /Peacock
    git init
    git remote add origin https://github.com/thepeacockproject/Peacock
    info_message "Pulling Peacock from github"
    git pull origin master
else
    info_message "Checking for Peacock updates"
    cd /Peacock; git pull origin master
fi

# Build the server

info_message "Building the server"
cd /Peacock && yarn install && yarn build

# Install contracts
#info_message "Installing/Updating contracts"
#git config --global --add safe.directory /Contracts

#if [ ! -d /Contracts ]; then
#    git clone https://github.com/thepeacockproject/Contracts /Contracts
#else
#    cd /Contracts
#    git pull
#fi

#info_message "Running rsync to update contracts in server data directory"
#rsync -av /Contracts/contracts/h3/ /Peacock/contracts/

info_message "Running backup of player metadata"
mkdir -p /Peacock/backups
name=userdata_$(date '+%Y-%m-%d_%H%M')
cd /Peacock && tar zcvf /Peacock/backups/$name.tgz userdata



info_message "Starting Peacock"
node /Peacock/chunk0.js

trap popd EXIT
