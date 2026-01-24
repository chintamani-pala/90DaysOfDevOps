### **1️⃣ User & Group Management**
- Learn about Linux **users, groups, and permissions** (`/etc/passwd`, `/etc/group`).
- **Task:**  
  - Create a user `devops_user` and add them to a group `devops_team`.
  - Set a password and grant **sudo** access.
  - Restrict SSH login for certain users in `/etc/ssh/sshd_config`.



# Answers

### 1. Create a user `devops_user` and add them to a group `devops_team`

First, create the group:
```bash
sudo groupadd devops_team
```

Next, create the user and assign them to the group:
```bash
sudo useradd -m -g devops_team devops_user
```
*(The `-m` flag creates the home directory)*

### 2. Set a password and grant **sudo** access

Set the password:
```bash
sudo passwd devops_user
```

Add the user to the `sudo` group (Debian/Ubuntu) or `wheel` group (RHEL/CentOS):
```bash
# For Ubuntu/Debian
sudo usermod -aG sudo devops_user

# For RHEL/CentOS/Fedora
sudo usermod -aG wheel devops_user
```

### 3. Restrict SSH login for certain users

To restrict SSH access, edit the configuration file:
```bash
sudo vi /etc/ssh/sshd_config
```

Add one of the following lines at the end of the file:
- **To allow only specific users:** `AllowUsers devops_user user1`
- **To deny specific users:** `DenyUsers baduser hacker`

After saving, restart the SSH service:
```bash
sudo systemctl restart ssh
```

---

### 📖 Understanding `/etc/passwd` and `/etc/group`

- **`/etc/passwd`**: This file contains essential information for each user account. Each line represents a user and follows this format:
  `username:x:UID:GID:comment:home_directory:login_shell`
  - `x` means the password is encrypted in `/etc/shadow`.
  - `UID` is the unique User ID.
  - `GID` is the primary Group ID.

- **`/etc/group`**: This file defines the groups on the system. Format:
  `group_name:password:GID:user_list`
  - `user_list` shows secondary members of the group.

---

### Why this matters for DevOps?

- **Security**: Implementing the **Principle of Least Privilege (PoLP)** ensures that users and services only have the permissions necessary for their specific roles, reducing the attack surface.
- **Automation**: CI/CD pipelines and configuration management tools (like Ansible or Chef) rely on dedicated service accounts to deploy code and manage infrastructure securely.
- **Auditing & Accountability**: Proper user management allows teams to track changes and identify who accessed the system, which is vital for troubleshooting and regulatory compliance.
- **Environment Consistency**: Standardizing user and group configurations across environments prevents permission-related failures when moving applications from development to production.
