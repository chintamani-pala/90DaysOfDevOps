### **4️⃣ Volume Management & Disk Usage**
- **Task:**  
  - Create a directory `/mnt/devops_data`.
  - Mount a new volume (or loop device for local practice).
  - Verify using `df -h` and `mount | grep devops_data`.

---

## Guide: Linux Volume Management & Disk Usage

Managing storage is a core responsibility for DevOps engineers, especially when managing databases or stateful applications.

### Step 1: Create Mount Point
```bash
sudo mkdir -p /mnt/devops_data
```

### Step 2: Create and Mount a Loop Device
(Using a loop device is a great way to practice mounting without needing extra physical disks.)

```bash
# 1. Create a 100MB empty file to act as our "virtual disk"
dd if=/dev/zero of=~/devops_volume.img bs=1M count=100

# 2. Format the file with the ext4 filesystem
mkfs.ext4 ~/devops_volume.img

# 3. Mount the file to our directory
sudo mount -o loop ~/devops_volume.img /mnt/devops_data
```

### Step 3: Verify the Mount
```bash
# Check disk usage (look for /mnt/devops_data)
df -h

# Check specific mount details
mount | grep devops_data
```

### Step 4: Unmount (Optional)
```bash
sudo umount /mnt/devops_data
```

---

## Why this matters for DevOps?

1.  **Cloud Storage Management:** In AWS, Azure, or GCP, you'll constantly attach and resize volumes (like EBS or Managed Disks). Knowing how to mount and extend filesystems is critical for scaling data storage.
2.  **Container Persistence:** Docker and Kubernetes use volumes to ensure data survives even if a container restarts. Understanding Linux mounts helps in troubleshooting "Permission Denied" or "Volume Not Found" errors in K8s.
3.  **Preventing Downtime:** One of the most common causes of server failure is a **full disk**. DevOps engineers use `df -h` and `du -sh` in automated monitoring scripts to alert before a partition hits 100% capacity.
4.  **Database Management:** Databases require specific mount options (like `noatime`) for performance or specific filesystems (like XFS) for large data handling.

---
