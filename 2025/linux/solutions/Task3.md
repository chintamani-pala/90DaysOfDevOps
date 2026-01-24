### **3️⃣ Log File Analysis with AWK, Grep & Sed**
Logs are crucial in DevOps! You’ll analyze logs using the **Linux_2k.log** file from **LogHub** ([GitHub Repo](https://github.com/logpai/loghub/blob/master/Linux/Linux_2k.log)).

- **Task:**  
  - **Download the log file** from the repository.
  - **Extract insights using commands:**
    - Use `grep` to find all occurrences of the word **"error"**.
    - Use `awk` to extract **timestamps and log levels**.
    - Use `sed` to replace all IP addresses with **[REDACTED]** for security.
  - **Bonus:** Find the most frequent log entry using `awk` or `sort | uniq -c | sort -nr | head -10`.

---

## Guide: Linux Log Analysis

### 1. Download the log file
```bash
wget https://raw.githubusercontent.com/logpai/loghub/master/Linux/Linux_2k.log
```

### 2. Extract Insights Using Commands

#### **Grep: Finding "error"**
```bash
# Case-insensitive search for "error"
grep -i "error" Linux_2k.log
```

#### **Awk: Extracting Timestamps and Log Levels**
```bash
# Assuming the first three columns are the timestamp and the next is the log level
awk '{print $1, $2, $3, $6}' Linux_2k.log
```
*(Note: Column numbers may vary depending on the log structure; $6 often represents the component/level in Linux logs.)*

#### **Sed: Redacting IP Addresses**
```bash
# Simple regex to find and replace IP-like patterns
sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/[REDACTED]/g' Linux_2k.log
```

### 3. Bonus: Find the Most Frequent Log Entry
```bash
awk '{print $0}' Linux_2k.log | sort | uniq -c | sort -nr | head -10
```

---

## Why this matters for DevOps?

1.  **Troubleshooting:** When an automated deployment fails, logs are the first place you look. Knowing how to quickly filter thousands of lines with `grep` saves time during critical outages.
2.  **Monitoring & Alerting:** DevOps engineers often write scripts that use `awk` to parse logs and send metrics to Prometheus or CloudWatch.
3.  **Security & Compliance:** `sed` is vital for data anonymization. Before sharing logs with developers or external partners, you must redact PII (Personally Identifiable Information) like IPs or email addresses to comply with GDPR/SOC2.
4.  **Automation:** Instead of manually reading files, these tools allow you to build automated log-rotation and analysis pipelines that can detect anomaies before they become incidents.

---
