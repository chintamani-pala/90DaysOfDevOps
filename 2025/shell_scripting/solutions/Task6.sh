#!/bin/bash
# Challenge 2: Backup with Rotation

# Check if directory path is provided
if [ -z "$1" ]; then
    echo "Usage: ./backup_with_rotation.sh <directory_path>"
    exit 1
fi

TARGET_DIR="$1"

# Check if directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Create timestamped backup folder name
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP"
BACKUP_PATH="$TARGET_DIR/$BACKUP_NAME"

# Create the backup (Copying files into the backup folder)
mkdir -p "$BACKUP_PATH"
# Use find to copy only files (not previous backup directories to avoid recursion)
find "$TARGET_DIR" -maxdepth 1 -type f -exec cp -t "$BACKUP_PATH" {} +

echo "Backup created: $BACKUP_PATH"

# --- Rotation Mechanism (Keep only last 3) ---

# List all backup folders in the target directory, sorted by name (which includes timestamp)
# Assuming backup folders start with 'backup_'
backups=($(ls -d "$TARGET_DIR"/backup_* 2>/dev/null | sort -r))

# If there are more than 3, remove the older ones
if [ ${#backups[@]} -gt 3 ]; then
    # The elements from index 3 onwards are the ones to be deleted
    for (( i=3; i<${#backups[@]}; i++ )); do
        echo "Removing old backup: ${backups[$i]}"
        rm -rf "${backups[$i]}"
    done
fi
