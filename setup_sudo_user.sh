#!/bin/bash

#This script is for setting up sudo user on Linux

read -p "enter username " USERNAME

#create a User if it does not exist
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists"
else 
   sudo useradd -m "$USERNAME"
   echo "user '$USERNAME' created"
fi


#Password for user
echo "Set password for '$USERNAME' :"
sudo passwd "$USERNAME"


#add user to wheel group for sudo access
sudo usermod -aG wheel "$USERNAME"
echo "user '$USERNAME' added to wheel group"

echo "Setup Done; Now use 'su - $USERNAME' and run sudo commands"
