#!/bin/bash

# Redirect all output to a log file for debugging
exec > /var/log/ansible-setup.log 2>&1
set -eux

# System update
yum update -y

# Create ansadmin user
useradd -m ansadmin
echo "ansadmin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansadmin
chmod 440 /etc/sudoers.d/ansadmin

# Generate SSH keys for ansadmin
mkdir -p /home/ansadmin/.ssh
ssh-keygen -t rsa -b 2048 -f /home/ansadmin/.ssh/id_rsa -q -N ""
cp /home/ansadmin/.ssh/id_rsa.pub /home/ansadmin/.ssh/authorized_keys

# Set permissions
chmod 600 /home/ansadmin/.ssh/id_rsa
chmod 600 /home/ansadmin/.ssh/id_rsa.pub
chmod 600 /home/ansadmin/.ssh/authorized_keys
chown -R ansadmin:ansadmin /home/ansadmin/.ssh

# Install Python and Ansible
amazon-linux-extras enable epel -y
yum install -y epel-release python3 ansible
pip3 install --upgrade pip

# Final check file
echo "✅ Ansible control node ready" > /home/ansadmin/ready.txt
chown ansadmin:ansadmin /home/ansadmin/ready.txt
