### 3. **AWS EC2 and Security Groups**
- Launch an AWS EC2 instance (free tier is fine).
- Learn about Security Groups, their rules, and their significance in securing cloud instances.
- **Task:** Write a step-by-step guide or blog on how to create and configure Security Groups.

---

## Guide: Creating and Configuring AWS Security Groups

An AWS **Security Group (SG)** acts as a virtual firewall for your EC2 instances. It controls inbound and outbound traffic at the instance level (not the subnet level).

### Step-by-Step Configuration

#### 1. Navigate to EC2 Console
- Log in to your [AWS Management Console](https://aws.amazon.com/console/).
- Search for **EC2** and navigate to the EC2 Dashboard.

#### 2. Create a Security Group
- In the left navigation pane, under **Network & Security**, click on **Security Groups**.
- Click the **Create security group** button.
- **Name:** E.g., `web-server-sg`.
- **Description:** Provide a brief summary (e.g., "Allow SSH and HTTP traffic").
- **VPC:** Select the default VPC (or your custom VPC).

#### 3. Configure Inbound Rules
These rules define what traffic is allowed *into* your instance. By default, all inbound traffic is blocked.
- Click **Add rule**.
- **Rule 1 (SSH):** Type: SSH | Port: 22 | Source: My IP (Highly Recommended for security).
- **Rule 2 (HTTP/HTTPS):** Type: HTTP (Port 80) / HTTPS (Port 443) | Source: Anywhere (0.0.0.0/0) if it's a public web server.

#### 4. Configure Outbound Rules
These rules define what traffic can *leave* your instance.
- By default, AWS allows **All traffic** to **Anywhere (0.0.0.0/0)**. This allows your server to download updates or connect to external APIs.

#### 5. Review and Create
- Scroll down and click **Create security group**.

#### 6. Attach to an EC2 Instance
- Go to your **Running Instances**.
- Select the instance, go to **Actions** -> **Security** -> **Change security groups**.
- Add your new security group and save.

---

### Best Practices for Security Groups
- **Least Privilege:** Only open the ports you absolutely need.
- **Source IP Limiting:** Avoid opening port 22 (SSH) or 3389 (RDP) to `0.0.0.0/0`. Always restrict to your specific IP or a VPN CIDR.
- **Stateful Nature:** Security groups are *stateful*. If you allow inbound traffic on port 80, the return traffic is automatically allowed, regardless of outbound rules.

---
