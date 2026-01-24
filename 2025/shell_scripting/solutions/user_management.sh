#!/bin/bash

# Week 3 Challenge 1: User Account Management Script
# This script provides options to create, delete, reset passwords, and list users.

# Function to display usage/help
show_help() {
    echo "Usage: ./user_management.sh [OPTION]"
    echo "Options for managing user accounts:"
    echo "----------------------------------------------------"
    echo "  -c, --create    Create a new user account"
    echo "  -d, --delete    Delete an existing user account"
    echo "  -r, --reset     Reset the password of an existing user account"
    echo "  -l, --list      List all user accounts on the system"
    echo "  -h, --help      Display this help message"
    echo "----------------------------------------------------"
}

# Function to create a user
create_user() {
    read -p "Enter new username: " username
    if id "$username" &>/dev/null; then
        echo "Error: Username '$username' already exists."
        exit 1
    fi
    read -sp "Enter password: " password
    echo
    sudo useradd -m "$username"
    echo "$username:$password" | sudo chpasswd
    echo "Success: User '$username' has been created."
}

# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " username
    if ! id "$username" &>/dev/null; then
        echo "Error: Username '$username' does not exist."
        exit 1
    fi
    sudo userdel -r "$username"
    echo "Success: User '$username' has been deleted."
}

# Function to reset password
reset_password() {
    read -p "Enter username: " username
    if ! id "$username" &>/dev/null; then
        echo "Error: Username '$username' does not exist."
        exit 1
    fi
    read -sp "Enter new password: " password
    echo
    echo "$username:$password" | sudo chpasswd
    echo "Success: Password for '$username' has been updated."
}

# Function to list users
list_users() {
    echo "List of all user accounts (Username:UID):"
    echo "----------------------------------------------------"
    awk -F: '{ printf "Username: %-15s | UID: %s\n", $1, $3 }' /etc/passwd
}

# Main Logic using case statement for flags
case "$1" in
    -c|--create)
        create_user
        ;;
    -d|--delete)
        delete_user
        ;;
    -r|--reset)
        reset_password
        ;;
    -l|--list)
        list_users
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Invalid option. Use -h or --help for instructions."
        exit 1
        ;;
esac
