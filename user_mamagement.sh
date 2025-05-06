#!/bin/bash


#Basic user management tasks
# By Hood117


set -e

echo "Choose one"
echo "1) Create a user"
echo "2) Delete a user"
echo "3) Lock a user"
echo "4) Unlock a user"
read -p "Enter choice 1-4 " ACTION

read -p "Enter the username: " USER

case $ACTION in
    1)
        sudo useradd -m "$USER"
        echo "User '$USER' created"
        sudo passwd "$USER"
        ;;
    2)
        sudo userdel -r "$USER"
        echo "User '$USER' deleted"
        ;;
    3)
        sudo usermod -L "$USER"
        echo "User '$USER' locked"
        ;;
    4)
        sudo usermod -U "$USER"
        echo "User '$USER' unlocked"
        ;;
    *)
        echo "❌ Invalid choice"
        ;;
esac

