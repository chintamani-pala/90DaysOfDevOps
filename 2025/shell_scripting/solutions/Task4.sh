#!/bin/bash
# Part 4: List User Accounts

echo "List of all user accounts on the system (Username:UID):"
echo "----------------------------------------------------"

# Extract fields 1 (username) and 3 (UID) from /etc/passwd
awk -F: '{ printf "Username: %-15s | UID: %s\n", $1, $3 }' /etc/passwd
