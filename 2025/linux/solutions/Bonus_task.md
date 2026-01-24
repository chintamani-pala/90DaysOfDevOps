## 🎯 Bonus Tasks (Optional 🚀)

---

### 1. Top 5 Most Common Log Messages
Use `awk` to extract the message, `sort` to group identical ones, `uniq -c` to count, and `sort -nr` to list in descending order.
```bash
awk -F': ' '{print $2}' Linux_2k.log | sort | uniq -c | sort -nr | head -5
```

### 2. List All Files Modified in the Last 7 Days
The `find` command is powerful for searching files by metadata like modification time (`mtime`).
```bash
# Search in the current directory
find . -type f -mtime -7
```

### 3. Extract ERROR and WARNING logs
You can use `egrep` (extended grep) or `grep -E` for multiple patterns.

**Script Version (`extract_logs.sh`):**
```bash
#!/bin/bash
LOG_FILE="Linux_2k.log"

echo "--- ERROR and WARNING logs ---"
grep -E "ERROR|WARNING" $LOG_FILE
```

---

## Why this matters for DevOps?

1.  **Fast Incident Response:** During a production outage, browsing every log line manually is impossible. Mastering **advanced CLI one-liners** allows you to strip away the noise and find the root cause (e.g., the top reoccurring error) in seconds.
2.  **Health Auditing:** Using `find` to check for recently changed files is a key part of **forensics**. If a system starts failing, checking what files were touched in the last hour helps you identify if a manual change (hotfix) might have caused the issue.
3.  **Log Pattern Recognition:** Identifying the "most common" messages helps DevOps teams identify **chatty logs** or recurring but non-critical issues that should be addressed to reduce logger overhead and improve signal-to-noise ratio.
4.  **Security Monitoring:** Shell-based log filtering is the first step toward building a **SOC (Security Operations Center)** or **SIEM**-like functionality. Identifying failed login attempts or unauthorized access patterns relies on these exact string manipulation skills.

---
