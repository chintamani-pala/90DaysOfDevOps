# Part 4: List User Accounts

1. Implement an option `-l` or `--list` that allows the script to list all user accounts on the system. The script should display the usernames and their corresponding user IDs (UID).

## Part 4: Logic
1. Read the `/etc/passwd` file.
2. Use `awk` or `cut` to extract the first (username) and third (UID) fields.
3. Display the information in a readable format.

## Script Implementation
Check out [Task4.sh](./Task4.sh) for the full script.

## Why this matters for DevOps?
- **Auditing:** Regularly listing users is a basic auditing step to ensure only authorized entities have access to the system.
- **Troubleshooting:** Identifying UIDs is important when debugging permission or ownership issues across different services.
- **Reporting:** Scripts like this can be used to generate reports for security reviews or system inventories.
