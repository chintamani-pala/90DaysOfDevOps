### **2️⃣ File & Directory Permissions**
- **Task:**  
  - Create `/devops_workspace` and a file `project_notes.txt`.
  - Set permissions:
    - **Owner can edit**, **group can read**, **others have no access**.
  - Use `ls -l` to verify permissions.

---

## Guide: Linux File & Directory Permissions

### Step 1: Create Directory and File
```bash
# Create the workspace directory
sudo mkdir /devops_workspace

# Create the notes file inside the workspace
sudo touch /devops_workspace/project_notes.txt
```

### Step 2: Set Permissions
We need to set:
- **Owner:** Read, Write, Execute (so they can edit/browse) -> `7` or `rwx`
- **Group:** Read Only -> `4` or `r--`
- **Others:** No access -> `0` or `---`

#### Using Numeric Mode (Recommended):
```bash
# Set permissions for the directory (750 to allow group to 'enter' the dir via 'x')
sudo chmod 750 /devops_workspace

# Set permissions for the file
sudo chmod 640 /devops_workspace/project_notes.txt
```
*(Note: For directories, 'execute' permission is required to enter them. So 750 is used for the dir and 640 for the file.)*

#### Using Symbolic Mode:
```bash
sudo chmod u=rwx,g=r,o= /devops_workspace
sudo chmod u=rw,g=r,o= /devops_workspace/project_notes.txt
```

### Step 3: Verify Permissions
```bash
ls -ld /devops_workspace
ls -l /devops_workspace/project_notes.txt
```

---

## Why this matters for DevOps?

1.  **Security & Isolation:** In CI/CD pipelines, you must ensure that sensitive files (like `.env` files, SSH keys, or kubeconfigs) are only accessible by the specific user running the automation. Overly permissive settings (like `777`) are a massive security risk.
2.  **Application Stability:** Many applications (like MySQL or SSH) will refuse to start if their configuration files or keys have insecure permissions. 
3.  **Compliance:** Regulatory standards (SOC2, HIPAA) require strict access controls. Understanding Linux permissions allows you to implement **Least Privilege Access** automatically via infrastructure-as-code (Ansible, Terraform).
4.  **Shared Workspaces:** In a team environment, you might want developers to *read* logs but not *delete* them. Correct group permissions make this possible.

---
