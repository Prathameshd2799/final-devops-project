#!/bin/bash

# Log all output to console and file for debugging
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
set -ex

# === Create ansadmin user with SSH access ===
useradd -m ansadmin
mkdir -p /home/ansadmin/.ssh
echo "${ANSADMIN_PUBLIC_KEY}" > /home/ansadmin/.ssh/authorized_keys
chmod 700 /home/ansadmin/.ssh
chmod 600 /home/ansadmin/.ssh/authorized_keys
chown -R ansadmin:ansadmin /home/ansadmin/.ssh

echo "ansadmin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansadmin
chmod 440 /etc/sudoers.d/ansadmin

# Optional: Auto update packages to prevent security warnings
yum update -y