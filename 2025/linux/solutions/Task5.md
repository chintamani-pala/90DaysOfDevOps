### **5️⃣ Process Management & Monitoring**
- **Task:**  
  - Start a background process (`ping google.com > ping_test.log &`).
  - Use `ps`, `top`, and `htop` to monitor it.
  - Kill the process and verify it's gone.

---

## Guide: Linux Process Management

### Step 1: Start a Background Process
The `&` symbol at the end of a command runs it in the background, allowing you to continue using the terminal.
```bash
ping google.com > ping_test.log &
```
*(This command will output the process ID (PID) of the background task.)*

### Step 2: Monitoring the Process

#### **`ps` (Process Status)**
Use `ps` to see a snapshot of current processes.
```bash
# Find the specific ping process
ps aux | grep ping
```

#### **`top` (Interactive Monitoring)**
Displays a real-time, dynamic view of a running system.
```bash
top
# Inside top, you can press 'q' to quit.
```

#### **`htop` (User-friendly Monitoring)**
An interactive and colorful process viewer (usually requires installation via `sudo apt install htop`).
```bash
htop
```

### Step 3: Kill the Process
To stop a process, use the `kill` command followed by the PID.
```bash
# Find the PID first using ps
# kill <PID>
kill $(pgrep ping)

# Verify it's gone
pgrep ping || echo "Process terminated."
```

---

## Why this matters for DevOps?

1.  **Application Management:** In production, services (like web servers or database proxies) run as background processes. You must know how to identify them, check their resource consumption (CPU/RAM), and restart them if they hang.
2.  **Resource Optimization:** Monitoring tools like `top` or `htop` help you identify "zombie" processes or applications leaking memory, which could otherwise crash a server.
3.  **Automated Scaling:** Metrics from `ps` or `top` are often the triggers for **Auto-Scaling Groups**. If the cumulative CPU usage of your app processes is too high, your infrastructure might automatically spin up two more instances.
4.  **Signal Handling:** In DevOps automation (like Jenkins or GitHub Actions), scripts often need to gracefully stop a service using `SIGTERM` (`kill -15`) before resorting to `SIGKILL` (`kill -9`).

---
