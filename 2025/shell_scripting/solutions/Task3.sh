#!/bin/bash
# Part 3: Password Reset

read -p "Enter username: " username

# Check if username exists
if ! id "$username" &>/dev/null; then
    echo "Error: Username '$username' does not exist."
    exit 1
fi

read -sp "Enter new password: " password
echo

# Update password
echo "$username:$password" | sudo chpasswd

echo "Success: Password for '$username' has been updated."
