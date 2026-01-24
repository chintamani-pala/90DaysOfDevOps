### 1. **Understand OSI & TCP/IP Models**
- Learn about the OSI and TCP/IP models, including their layers and purposes.
- **Task:** Write examples of how each layer applies to real-world scenarios (e.g., HTTP at the Application Layer, TCP at the Transport Layer).

---

## OSI Model (Open Systems Interconnection)

The OSI model is a conceptual framework used to understand how data is transmitted over a network. It consists of 7 layers:

| Layer | Name | Purpose | Real-World Example |
| :--- | :--- | :--- | :--- |
| **7** | **Application** | User-level interaction and network services. | **HTTP/HTTPS** used by your browser to load a website. |
| **6** | **Presentation** | Data formatting, encryption, and translation. | **SSL/TLS** for encryption or **JPEG/GIF** for image formats. |
| **5** | **Session** | Managing sessions between applications. | **NetBIOS** or **RPC** keeping a database connection alive during a query. |
| **4** | **Transport** | End-to-end communication and error recovery. | **TCP** ensuring every packet of an email arrives correctly (Transmission Control Protocol). |
| **3** | **Network** | Routing and path determination (Logical addressing). | **IP (Internet Protocol)** assigning an address like `192.168.1.1` to route packets. |
| **2** | **Data Link** | Physical addressing and error detection. | **MAC Address** used by a network switch to send data to the correct device on a LAN. |
| **1** | **Physical** | Physical transmission of data via hardware. | **Ethernet Cables**, Fiber Optics, or Wi-Fi radio waves transmitting bits. |

---

## TCP/IP Model

The TCP/IP model is the practical implementation of networking, simpler than OSI, with 4 main layers:

1. **Application Layer:** Combines OSI Layers 5, 6, and 7. (Example: **HTTP, DNS, SSH**)
2. **Transport Layer:** Maps to OSI Layer 4. (Example: **TCP, UDP**)
3. **Internet Layer:** Maps to OSI Layer 3. (Example: **IP, ICMP**)
4. **Network Access Layer:** Combines OSI Layers 1 and 2. (Example: **Ethernet, Wi-Fi**)

---

### Why this matters for DevOps?
Understanding these layers helps DevOps engineers troubleshoot connectivity issues, configure firewalls (Layer 4 vs Layer 7), and optimize load balancers.
