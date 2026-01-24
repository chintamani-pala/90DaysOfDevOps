#!/bin/bash

# Week 3 Challenge 2: Automated Backup & Recovery using Cron
# This script performs a backup of a directory and rotates to keep only the last 3.

if [ -z "$1" ]; then
    echo "Usage: ./backup_with_rotation.sh <directory_path>"
    exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Create timestamped backup folder
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP"
BACKUP_PATH="$TARGET_DIR/$BACKUP_NAME"

mkdir -p "$BACKUP_PATH"
# Copy files into backup folder (maxdepth 1 to avoid infinite recursion)
find "$TARGET_DIR" -maxdepth 1 -type f -exec cp -t "$BACKUP_PATH" {} +

echo "Backup created: $BACKUP_PATH"

# Rotation Logic: Keep only the 3 most recent backups
backups=($(ls -d "$TARGET_DIR"/backup_* 2>/dev/null | sort -r))

if [ ${#backups[@]} -gt 3 ]; then
    echo "Found ${#backups[@]} backups. Rotating (keeping last 3)..."
    for (( i=3; i<${#backups[@]}; i++ )); do
        echo "Removing old backup: ${backups[$i]}"
        rm -rf "${backups[$i]}"
    done
fi
