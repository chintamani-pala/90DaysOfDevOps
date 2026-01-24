
### 2. **Protocols and Ports for DevOps**
- Study the most commonly used protocols (e.g., HTTP, HTTPS, FTP, SSH, DNS) and their port numbers.
- **Task:** Create a blog, article, GitHub page, or README listing these protocols and explaining their relevance to DevOps workflows.

---

## Common Networking Protocols & Ports

As a DevOps engineer, understanding which protocol runs on which port is essential for configuring security groups, firewalls, and load balancers.

| Protocol | Port | Full Name | DevOps Relevance |
| :--- | :--- | :--- | :--- |
| **SSH** | 22 | Secure Shell | Used for secure remote access to Linux servers for maintenance and automation. |
| **HTTP** | 80 | Hypertext Transfer Protocol | The basis for web communication; used for internal health checks and non-secure traffic. |
| **HTTPS** | 443 | HTTP Secure | Secure web traffic using SSL/TLS; critical for secure public-facing applications. |
| **DNS** | 53 | Domain Name System | Translates human-readable names to IP addresses; essential for service discovery. |
| **FTP/SFTP** | 21/22 | File Transfer Protocol | Traditionally used for file transfers; SFTP (over SSH) is preferred for security. |
| **SMTP** | 25 | Simple Mail Transfer Protocol| Used by CI/CD pipelines or apps to send email notifications/alerts. |
| **MySQL** | 3306 | MySQL Database | Standard port for connecting to MySQL/MariaDB databases. |
| **PostgreSQL**| 5432 | PostgreSQL Database | Standard port for connecting to PostgreSQL databases. |
| **Redis** | 6379 | Redis Cache | Standard port for caching and message brokerage. |
| **Kubernetes**| 6443 | K8s API Server | The primary entry point for managing a Kubernetes cluster. |

---

### Why this matters for DevOps?

1. **Firewall/Security Group Configuration:** You must know these ports to allow or block traffic to your instances. For example, you wouldn't open port 22 (SSH) to the entire internet for security reasons.
2. **Troubleshooting:** If an application isn't responding, you check if the port is "listening" using commands like `telnet`, `nc`, or `netstat`.
3. **Service Discovery:** In environments like Kubernetes or Docker, services communicate via these protocols, and misconfiguring a port can break internal communications.

---