# Part 3: Password Reset

1. Implement an option `-r` or `--reset` that allows the script to reset the password of an existing user account. The script should prompt the user to enter the username and the new password.

2. Ensure that the script checks whether the username exists before attempting to reset the password. If the username does not exist, display an appropriate message and exit gracefully.

3. After resetting the password, display a success message with the username and the updated password.

## Part 3: Logic
1. Prompt for username and the new password.
2. Check if the username exists using `id`.
3. Update the password using `chpasswd`.

## Script Implementation
Check out [Task3.sh](./Task3.sh) for the full script.

## Why this matters for DevOps?
- **Self-Service & Support:** Automating password resets reduces the manual workload on system administrators and DevOps engineers.
- **Security Policy Enforcement:** Scripts can be extended to enforce password complexity or rotation policies.
- **Access Control:** Providing a controlled script for resets (using `sudo`) ensures that only authorized personnel can change passwords with an audit trail.
