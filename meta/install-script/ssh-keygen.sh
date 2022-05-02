#!/bin/bash

# generate ssh key and upload to destination

# get ssh filename
# if filename is empty
#   exit
#
# if you wish to upload ssh key
#   get username@remote_host destination to upload ssh key
#   upload ssh key

read -p "Enter ssh key filename: " -r sshFilename
if [ -z $sshFilename ]; then
  echo "ssh filename cannot be empty"
  exit 1;
else
  ssh-keygen -t ed25519 -a 100 -f ~/.ssh/${sshFilename}
fi

read -p "Would you like to upload SSH key y/n? " uploadSshKey
if [[ $uploadSshKey =~ ^(y|Y) ]] ; then
  read -p "Destination username@remote_host : " sshDestination
  ssh-copy-id -i ~/.ssh/${sshFilename}.pub ${sshDestination}
else
  echo "Skipping SSH key upload"
fi