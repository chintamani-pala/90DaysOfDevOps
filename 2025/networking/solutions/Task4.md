### 4. **Hands-On with Networking Commands**
- Practice essential networking commands like:
  - `ping` (check connectivity)
  - `traceroute` / `tracert` (trace packet routes)
  - `netstat` (network statistics)
  - `curl` (make HTTP requests)
  - `dig` / `nslookup` (DNS lookup)
- **Task:** Create a cheat sheet or short guide explaining the purpose and usage of each command.

---

## Networking Commands Cheat Sheet

As a DevOps engineer, these commands are your primary tools for debugging connectivity, latency, and DNS issues.

### 1. `ping` (Packet InterNet Groper)
- **Purpose:** Checks if a host is reachable across an IP network. It measures the round-trip time for messages sent from the originating host to a destination computer.
- **Usage:**
  ```bash
  ping google.com
  ping 8.8.8.8
  ```

### 2. `traceroute` (Linux/Mac) / `tracert` (Windows)
- **Purpose:** Displays the path (route) and measuring transit delays of packets across an IP network. It helps identify which "hop" along the way is failing or slow.
- **Usage:**
  ```bash
  traceroute google.com   # Linux/macOS
  tracert google.com      # Windows
  ```

### 3. `netstat` (Network Statistics)
- **Purpose:** Displays network connections (both incoming and outgoing), routing tables, and a number of network interface and network protocol statistics. Use it to see if a port is listening.
- **Usage:**
  ```bash
  netstat -tuln          # List all listening ports (TCP & UDP)
  netstat -ano           # Windows: Show connections with PID
  ```

### 4. `curl` (Client URL)
- **Purpose:** A tool to transfer data from or to a server. In DevOps, it's widely used to test REST APIs, download files, or check if a web server is responding.
- **Usage:**
  ```bash
  curl https://api.github.com
  curl -I https://google.com   # Fetch only the HTTP headers
  ```

### 5. `dig` (Domain Information Groper) / `nslookup`
- **Purpose:** Tools for querying DNS name servers for information about host addresses, mail exchanges, name servers, and related information. `dig` is preferred on Linux due to its detailed output.
- **Usage:**
  ```bash
  dig google.com
  nslookup google.com
  dig @8.8.8.8 google.com      # Query a specific DNS server (Google DNS)
  ```

---

### Why this matters for DevOps?
When a service fails, you use these commands in sequence:
1. **`ping`** to see if the server is up.
2. **`nslookup/dig`** to see if DNS is resolving to the correct IP.
3. **`traceroute`** to see where the packet is getting stuck.
4. **`netstat`** (on the server) to see if the app is actually listening on the intended port.
5. **`curl`** to verify the application is returning the expected response.

---
