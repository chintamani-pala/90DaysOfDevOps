# Bonus Points (Optional)

If you want to challenge yourself further, you can add additional features to the script, such as:

- Displaying more detailed information about user accounts (e.g., home directory, shell, etc.).
- Allowing the modification of user account properties (e.g., username, user ID, etc.).

Remember to handle errors gracefully, provide appropriate user prompts, and add comments to explain the logic and purpose of each part of the script.

## Logic Overview
1. Take a directory path as a command-line argument.
2. Create a timestamped folder inside that directory.
3. Copy all files from the source directory into the new backup folder.
4. List all backup folders in the directory.
5. If more than 3 backups exist, sort them by time and delete the oldest ones.

## Script Implementation
Check out [Task6.sh](./Task6.sh) for the full script.

## Why this matters for DevOps?
- **Retention Policies:** Storing infinite backups is costly and unmanageable. Rotation logic ensures you have enough history for recovery without wasting storage.
- **Resource Management:** Automatically cleaning up old data is essential for maintaining disk space on high-traffic servers.
- **Service Reliability:** Reliable, timestamped backups are the literal "undo button" for any failed deployment or data corruption incident.
