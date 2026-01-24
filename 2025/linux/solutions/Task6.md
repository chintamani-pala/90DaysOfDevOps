### **6️⃣ Automate Backups with Shell Scripting**
- **Task:**  
  - Write a shell script to back up `/devops_workspace` as `backup_$(date +%F).tar.gz`.
  - Save it in `/backups` and schedule it using `cron`.
  - Make the script display a success message in **green text** using `echo -e`.

---

## Guide: Automating Backups with Shell Scripting

### Step 1: Create the Backup Script
Create a file named `backup_script.sh`:
```bash
#!/bin/bash

# Configuration
SOURCE_DIR="/devops_workspace"
BACKUP_DIR="/backups"
TIMESTAMP=$(date +%F)
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Create backup directory if it doesn't exist
sudo mkdir -p $BACKUP_DIR

# Perform the backup using tar
sudo tar -czf $BACKUP_DIR/$BACKUP_FILE $SOURCE_DIR

# Display success message in green text
echo -e "${GREEN}Backup completed successfully: $BACKUP_DIR/$BACKUP_FILE${NC}"
```
*(Remember to make it executable: `chmod +x backup_script.sh`)*

### Step 2: Schedule with Cron
`cron` is the standard Linux utility for scheduling repetitive tasks.
1. Open the crontab for editing:
   ```bash
   sudo crontab -e
   ```
2. Add a line to run the script every day at midnight:
   ```bash
   0 0 * * * /path/to/backup_script.sh
   ```

---

## Why this matters for DevOps?

1.  **Automation (DR):** **Disaster Recovery (DR)** is a pillar of DevOps. Manual backups are prone to human error; automated scripts ensure that the latest state of your application or data is saved without manual intervention.
2.  **Infrastructure as Code (IaC):** In modern DevOps, these scripts are often baked into custom AMIs or deployed via Ansible. This ensures that every server you spin up has built-in backup capabilities.
3.  **CI/CD Pipeline Tasks:** Simple shell scripts like this are the "glue" of many CI/CD pipelines. For instance, a script might package up an application's assets before uploading them to an S3 bucket or Artifactory.
4.  **Feedback & Observability:** The green text output might seem simple, but providing **visual feedback** and clear logs within automation workflows helps engineers quickly identify successful runs during big deployments.
5.  **Data Reliability:** By scheduling backups via `cron`, you guarantee a **Point-in-Time Recovery (PITR)** goal, which is essential for maintaining Service Level Agreements (SLAs).

---
