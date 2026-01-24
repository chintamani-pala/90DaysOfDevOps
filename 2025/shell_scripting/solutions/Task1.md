# Part 1: Account Creation

1. Implement an option `-c` or `--create` that allows the script to create a new user account. The script should prompt the user to enter the new username and password.

2. Ensure that the script checks whether the username is available before creating the account. If the username already exists, display an appropriate message and exit gracefully.

3. After creating the account, display a success message with the newly created username.

## Part 1: Logic
1. Prompt for username and password.
2. Check if the username already exists in `/etc/passwd`.
3. Create the user with a home directory.
4. Set the password.

## Script Implementation
Check out [Task1.sh](./Task1.sh) for the full script.

## Why this matters for DevOps?
- **IAM (Identity and Access Management):** Managing local users is the foundation of server security.
- **Automation:** Scripting user creation allows for bulk onboarding or automated environment setup.
- **Principle of Least Privilege:** Automating creation ensures users are assigned to the correct groups and shells consistently.
