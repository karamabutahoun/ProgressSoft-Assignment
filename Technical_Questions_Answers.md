\# ProgressSoft Technical Assignment — Theoretical Questions and Answers



\## 1. Linux Fundamentals



\*\*What is Linux?\*\*



Linux is an open-source operating system based on the Linux kernel. It is widely used for servers, cloud computing, networking, and software development.



\*\*Linux Architecture\*\*



Linux consists of several main components:



\- \*\*Hardware:\*\* Physical resources such as CPU, memory, and storage.

\- \*\*Kernel:\*\* Manages hardware, memory, processes, and system resources.

\- \*\*Shell:\*\* Provides a command-line interface to interact with the operating system.

\- \*\*System Utilities and Applications:\*\* Programs and services running on Linux.



\*\*Important Linux Directories\*\*



\- `/` — Root directory.

\- `/home` — User home directories.

\- `/etc` — System configuration files.

\- `/var` — Logs and variable application data.

\- `/bin` — Essential commands.

\- `/usr` — Applications, libraries, and shared resources.

\- `/tmp` — Temporary files.



\*\*Linux Distributions\*\*



Common Linux distributions include Ubuntu, Debian, Red Hat Enterprise Linux, Rocky Linux, and Fedora.



\*\*Common Linux Commands\*\*



\- `pwd` — Display current directory.

\- `ls -la` — List files and permissions.

\- `cd` — Change directory.

\- `mkdir` — Create a directory.

\- `cp` — Copy files.

\- `mv` — Move or rename files.

\- `chmod` — Modify permissions.

\- `ps aux` — Display running processes.

\- `systemctl status` — Check a service.

\- `df -h` — Display disk usage.

\- `free -h` — Display memory usage.



\## 2. SQL and PL/SQL Fundamentals



\*\*What is SQL?\*\*



SQL (Structured Query Language) is used to create, retrieve, update, and manage data in relational databases.



\*\*What is PL/SQL?\*\*



PL/SQL is Oracle's procedural extension of SQL. It supports variables, conditions, loops, procedures, functions, and exception handling.



\*\*DML, DDL, and DCL\*\*



\- \*\*DML (Data Manipulation Language):\*\* `INSERT`, `UPDATE`, `DELETE`, and `MERGE`.

\- \*\*DDL (Data Definition Language):\*\* `CREATE`, `ALTER`, `DROP`, and `TRUNCATE`.

\- \*\*DCL (Data Control Language):\*\* `GRANT` and `REVOKE`.



\*\*Types of SQL JOINs\*\*



\- \*\*INNER JOIN:\*\* Returns matching records from both tables.

\- \*\*LEFT JOIN:\*\* Returns all rows from the left table and matching rows from the right table.

\- \*\*RIGHT JOIN:\*\* Returns all rows from the right table and matching rows from the left table.

\- \*\*FULL OUTER JOIN:\*\* Returns matched and unmatched rows from both tables.

\- \*\*CROSS JOIN:\*\* Returns the Cartesian product of two tables.

\- \*\*SELF JOIN:\*\* Joins a table with itself.



\*\*RDBMS vs. NoSQL\*\*



An RDBMS stores data in related tables and typically uses SQL. Examples include Oracle, PostgreSQL, and MySQL.



NoSQL databases use flexible data models such as documents, key-value pairs, graphs, and wide-column stores. Examples include MongoDB and Redis.



\*\*Aggregate Functions\*\*



`COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`.



\*\*Date Functions (Oracle)\*\*



`SYSDATE`, `ADD\_MONTHS()`, `MONTHS\_BETWEEN()`, and `TRUNC()`.



\*\*String Functions\*\*



`UPPER()`, `LOWER()`, `SUBSTR()`, `LENGTH()`, and `TRIM()`.



\*\*Database Constraints\*\*



\- \*\*PRIMARY KEY:\*\* Uniquely identifies each row.

\- \*\*FOREIGN KEY:\*\* Enforces relationships between tables.

\- \*\*NOT NULL:\*\* Prevents null values.

\- \*\*UNIQUE:\*\* Prevents duplicate values.

\- \*\*CHECK:\*\* Enforces a condition on values.



\*\*Indexes\*\*



Indexes are database structures that help speed up data retrieval. However, they consume storage and can add overhead to data modification operations.



The practical SQL and PL/SQL solutions for questions Q1–Q6 are provided in `ProgressSoft\_SQL.sql`.



\## 3. Apache Tomcat



\*\*Q1: What is JVM?\*\*



JVM stands for Java Virtual Machine. It executes Java bytecode and enables Java applications to run on different operating systems without recompiling the application for each platform.



\*\*Q2: What is an Application Server?\*\*



An application server provides an environment for running and managing applications. It can offer services such as request processing, application lifecycle management, security, and integration with other systems.



Apache Tomcat is primarily a Java Servlet and JSP web container.



\*\*Q3: What is a WAR file?\*\*



WAR stands for Web Application Archive. It packages a Java web application, including compiled classes, libraries, configuration files, and web resources.



Tomcat can deploy a WAR file placed in its `webapps` directory. With automatic deployment enabled, Tomcat extracts or deploys the application and makes it accessible through a context path.



For example, `sample.war` can be accessed through `/sample/`.



\*\*What is a Reverse Proxy?\*\*



A reverse proxy receives client requests and forwards them to a backend server.



In this assignment, Nginx forwards HTTP requests on port 80 to Apache Tomcat running on port 7070.



\## 4. Docker



\*\*What is Docker?\*\*



Docker is a containerization platform used to package applications and their dependencies into portable containers.



\*\*Docker Use Cases\*\*



\- Consistent development and production environments.

\- Microservices deployment.

\- Application testing.

\- CI/CD pipelines.

\- Simplified application distribution.



\*\*Basic Docker Commands\*\*



\- `docker --version` — Check Docker version.

\- `docker pull nginx` — Download an image.

\- `docker images` — List local images.

\- `docker ps` — List running containers.

\- `docker ps -a` — List all containers.

\- `docker build -t myapp:v1 .` — Build an image.

\- `docker run -d --name web -p 8080:80 nginx` — Run an Nginx container.

\- `docker logs web` — Display container logs.

\- `docker stop web` — Stop a container.

\- `docker rm web` — Remove a container.

\- `docker push username/image:tag` — Push an image to a registry.



\*\*Docker Image vs. Container\*\*



An image is a reusable package containing application files and dependencies. A container is a running or stopped instance created from an image.



\## 5. Kubernetes



\*\*Q1: What is Kubernetes?\*\*



Kubernetes is an open-source container orchestration platform that automates deployment, scaling, and management of containerized applications.



\*\*Q2: Master (Control Plane) vs. Worker Nodes\*\*



\*\*Control Plane Node:\*\*



Manages the Kubernetes cluster, scheduling, API requests, and desired cluster state. Important components include the API server, scheduler, controller manager, and etcd.



\*\*Worker Node:\*\*



Runs application workloads using Pods. Important components include kubelet, kube-proxy, and a container runtime.



\*\*How to identify node roles:\*\*



Run:



`kubectl get nodes -o wide`



The `ROLES` column identifies nodes labeled as control-plane nodes. Worker nodes may display `<none>` because the worker role is not necessarily represented by a role label.



\*\*Q3: Sample Deployment\*\*



A single-node Kubernetes cluster was created using Docker Desktop with kind.



\- Kubernetes version: `v1.36.1`

\- Node: `desktop-control-plane`

\- Deployment: `ps-nginx`

\- Pod status: `Running`



Useful commands:



\- `kubectl get nodes`

\- `kubectl get pods`

\- `kubectl get deployments`

\- `kubectl describe pod POD\_NAME`

\- `kubectl logs POD\_NAME`

\- `kubectl create deployment ps-nginx --image=nginx`



\## 6. Git and GitHub



\*\*What is Git?\*\*



Git is a distributed version control system used to track changes in files and collaborate on software projects.



\*\*What is GitHub?\*\*



GitHub is a platform for hosting Git repositories, collaboration, code review, and project management.



\*\*Common Git Commands\*\*



\- `git init` — Initialize a repository.

\- `git clone URL` — Download a repository.

\- `git status` — Check working directory status.

\- `git add .` — Stage changes.

\- `git commit -m "message"` — Create a commit.

\- `git push` — Upload commits to a remote repository.

\- `git pull` — Download and integrate remote changes.

\- `git branch` — List branches.

\- `git checkout` — Switch branches or restore files.

\- `git log` — View commit history.



\## 7. RAID



\*\*What is RAID?\*\*



RAID stands for Redundant Array of Independent Disks. It combines multiple disks to improve performance, availability, or both.



\*\*Common RAID Levels\*\*



\- \*\*RAID 0:\*\* Striping for performance, without redundancy.

\- \*\*RAID 1:\*\* Mirroring for redundancy.

\- \*\*RAID 5:\*\* Striping with distributed parity; tolerates one disk failure.

\- \*\*RAID 6:\*\* Distributed dual parity; tolerates two disk failures.

\- \*\*RAID 10:\*\* Combines mirroring and striping for performance and redundancy.



RAID is not a replacement for backups.



\## 8. DevOps



\*\*What is DevOps?\*\*



DevOps is a combination of practices, culture, and tools that improves collaboration between development and operations teams.



Its goals include faster software delivery, automation, reliability, and continuous improvement.



\*\*Common DevOps Practices\*\*



\- Continuous Integration (CI).

\- Continuous Delivery and Deployment (CD).

\- Infrastructure as Code (IaC).

\- Automated testing.

\- Monitoring and logging.

\- Containerization and orchestration.



\*\*Common DevOps Tools\*\*



Git, GitHub Actions, Jenkins, Docker, Kubernetes, Terraform, Ansible, and Prometheus.



\## 9. High Availability and Disaster Recovery



\*\*High Availability (HA)\*\*



High Availability minimizes service interruptions by using redundancy, failover, clustering, and load balancing.



Examples:



\- PostgreSQL primary/standby replication with automatic failover tooling.

\- Oracle Data Guard and RAC, depending on the availability requirements.

\- Multiple Tomcat instances behind an Nginx or HAProxy load balancer.



\*\*Disaster Recovery (DR)\*\*



Disaster Recovery focuses on restoring applications and data after major failures such as infrastructure outages or data center disasters.



Common DR techniques include backups, database replication, standby environments, and recovery procedures.



\*\*RPO vs. RTO\*\*



\- \*\*RPO (Recovery Point Objective):\*\* Maximum acceptable data loss measured in time.

\- \*\*RTO (Recovery Time Objective):\*\* Maximum acceptable time to restore service.



\*\*HA vs. DR\*\*



HA primarily aims to keep systems available during component failures, while DR focuses on restoring services after major disruptions.



\## 10. Cloud Computing



\*\*What is Cloud Computing?\*\*



Cloud computing provides computing resources such as servers, storage, networking, databases, and software over the internet on demand.



\*\*Cloud Providers\*\*



Examples include Amazon Web Services (AWS), Microsoft Azure, Google Cloud, and Oracle Cloud Infrastructure.



\*\*Cloud Deployment Models\*\*



\- \*\*Public Cloud:\*\* Resources provided by a third-party cloud provider.

\- \*\*Private Cloud:\*\* Cloud infrastructure dedicated to one organization.

\- \*\*Hybrid Cloud:\*\* Combination of private and public cloud environments.



\*\*Cloud Service Models\*\*



\*\*IaaS (Infrastructure as a Service)\*\*



Provides virtual machines, storage, and networking. The customer manages the operating system and applications.



Example: Amazon EC2.



\*\*PaaS (Platform as a Service)\*\*



Provides a managed platform for developing and deploying applications.



Example: Azure App Service.



\*\*SaaS (Software as a Service)\*\*



Provides ready-to-use applications accessed over the internet.



Example: Google Workspace.



\## 11. DNS and Load Balancers



\*\*What is DNS?\*\*



DNS stands for Domain Name System. It translates domain names into IP addresses so users can access services without remembering numerical addresses.



For example, a DNS A record can map `app.example.com` to a server's IPv4 address.



\*\*What is a Load Balancer?\*\*



A load balancer distributes incoming traffic across multiple backend servers to improve performance, scalability, and availability.



\*\*Types of Load Balancing\*\*



\- \*\*Layer 4:\*\* Routes traffic using transport-level information such as IP addresses and TCP/UDP ports.

\- \*\*Layer 7:\*\* Routes application traffic using information such as HTTP paths and headers.



\*\*Common Load Balancing Algorithms\*\*



\- Round Robin.

\- Least Connections.

\- Weighted Round Robin.



\*\*Examples of Load Balancers\*\*



Nginx, HAProxy, and cloud-managed load balancers.



In this assignment, Nginx was configured as a reverse proxy for Apache Tomcat.

