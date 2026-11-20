
#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y wget curl tar ca-certificates

# Install Java 8
apt-get install -y openjdk-8-jdk

# Install Tomcat 9
TOMCAT_VERSION=9.0.115
wget -q "https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" -O /tmp/tomcat9.tar.gz

mkdir -p /opt/tomcat
tar -xzf /tmp/tomcat9.tar.gz -C /opt/tomcat --strip-components=1

# Configure Tomcat on port 7070
sed -i 's/port="8080"/port="7070"/' /opt/tomcat/conf/server.xml

cat > /etc/systemd/system/tomcat.service <<'EOF'
[Unit]
Description=Apache Tomcat 9
After=network.target

[Service]
Type=forking
Environment=JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
Environment=CATALINA_HOME=/opt/tomcat
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

chmod +x /opt/tomcat/bin/*.sh
systemctl daemon-reload
systemctl enable --now tomcat
