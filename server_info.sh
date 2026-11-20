echo "===== SERVER INFORMATION ====="

echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Private IP: $(hostname -I)"
echo "Public IP: $(curl -4 -s ifconfig.me)"

 echo "===== OPERATING SYSTEM ====="

echo "OS: $(lsb_release -ds)"
echo "Kernal: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Virtualization: $(systemd-detect-virt)"

echo "===== TIME INFORMATION ====="

echo "Server Time: $(date)"
echo "Timezone: $(cat /etc/timezone)"
echo "Uptime: $(uptime -p)"

echo "===== HARDWARE INFORMATION ====="


echo "Memory and swap:"
free -h
echo "CPU Cores: $(nproc)"


