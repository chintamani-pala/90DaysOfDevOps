#!/bin/bash
# Part 1: Account Creation

read -p "Enter new username: " username

# Check if username exists
if id "$username" &>/dev/null; then
    echo "Error: Username '$username' already exists."
    exit 1
fi

read -sp "Enter password: " password
echo

# Create user
sudo useradd -m "$username"

# Set password
echo "$username:$password" | sudo chpasswd

echo "Success: User '$username' has been created."
