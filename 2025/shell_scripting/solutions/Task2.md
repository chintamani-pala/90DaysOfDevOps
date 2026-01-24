# Part 2: Account Deletion

1. Implement an option `-d` or `--delete` that allows the script to delete an existing user account. The script should prompt the user to enter the username of the account to be deleted.

2. Ensure that the script checks whether the username exists before attempting to delete the account. If the username does not exist, display an appropriate message and exit gracefully.

3. After successfully deleting the account, display a confirmation message with the deleted username.

## Part 2: Logic
1. Prompt for username.
2. Check if the username exists using `id`.
3. Delete the user and their home directory.

## Script Implementation
Check out [Task2.sh](./Task2.sh) for the full script.

## Why this matters for DevOps?
- **Offboarding:** Ensuring that users are removed correctly when they leave is critical for security compliance (e.g., SOC2).
- **Cleanup:** Automated user deletion helps prevent "ghost" accounts that can be exploited by attackers.
- **Resource Management:** Deleting the home directory (`-r` flag) ensures storage is reclaimed in dynamic environments.
