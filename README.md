\# ProgressSoft Technical Assignment



\## Overview

This repository contains the configuration files, scripts, and SQL solutions prepared for the ProgressSoft technical assignment.



\## 1. Linux Administration

The Linux tasks were performed using Ubuntu Server on Oracle VirtualBox.



Activities included:

\- Creating a system information and resource usage shell script.

\- Creating the `PS` user and configuring the required groups.

\- Updating the root password.

\- Installing MySQL and HAProxy.

\- Configuring UFW firewall rules.

\- Transferring a file from Windows to Ubuntu using FTP.



\## 2. SQL and PL/SQL

\*\*File:\*\* `ProgressSoft\_SQL.sql`



The SQL work includes:

\- Creating tables with primary keys, foreign keys, and other constraints.

\- Writing SQL queries using joins, filtering, and aggregation.

\- Implementing the `F\_HR\_QUERY` Oracle function.

\- Implementing the `P\_COPY\_EMPLOYEE` stored procedure.



The SQL scripts were tested using Oracle FreeSQL.



\## 3. Apache Tomcat and Nginx

\- Installed Apache Tomcat 9 on Ubuntu Server.

\- Configured Tomcat to listen on port `7070`.

\- Configured Nginx as a reverse proxy.

\- Verified the Nginx HTTP endpoint.



\## 4. Vagrant

\*\*Files:\*\* `Vagrantfile`, `provision.sh`



The Vagrant configuration:

\- Uses `bento/ubuntu-24.04`.

\- Allocates 2048 MB of memory.

\- Forwards guest port `7070` to host port `9090`.

\- Provisions Java 8 and Apache Tomcat 9.



The application server was tested through `http://localhost:9090`.



\## 5. Docker

\*\*File:\*\* `Dockerfile`



Docker tasks included:

\- Building a custom Tomcat Docker image.

\- Deploying a sample WAR application.

\- Running Nginx and PostgreSQL containers.



The sample application was tested at:



`http://localhost:8082/sample/`



Docker image name: `progresssoft-tomcat:v1`



\## 6. Kubernetes

A local Kubernetes cluster was created using Docker Desktop and kind.



\- Kubernetes version: `v1.36.1`

\- Cluster type: Single-node

\- Node role: Control plane

\- Sample deployment: `ps-nginx`

\- Pod status verified as `Running`



Commands used:



```bash

kubectl get nodes -o wide

kubectl get pods -o wide

```



\## 7. Git and GitHub

Git was used to manage the assignment files and publish them to this repository.



Commands practiced:



```bash

git clone

git add

git commit

git push

```



\## Repository Contents

\- `Dockerfile` — Tomcat container image configuration.

\- `Vagrantfile` — Virtual machine configuration.

\- `provision.sh` — Automated Java and Tomcat provisioning.

\- `ProgressSoft\_SQL.sql` — SQL and PL/SQL solutions.



\## Notes

The repository contains source files and configuration scripts rather than virtual machine images or binary packages.

