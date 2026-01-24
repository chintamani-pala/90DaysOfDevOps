#!/bin/bash
# Part 2: Account Deletion

read -p "Enter username to delete: " username

# Check if username exists
if ! id "$username" &>/dev/null; then
    echo "Error: Username '$username' does not exist."
    exit 1
fi

# Delete user -r (removes home directory)
sudo userdel -r "$username"

echo "Success: User '$username' has been deleted."
