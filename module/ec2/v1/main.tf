resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }

  user_data = <<-EOF
              #!/bin/bash
              useradd -m ansadmin
              mkdir -p /home/ansadmin/.ssh
              echo "${var.public_key_content}" > /home/ansadmin/.ssh/authorized_keys
              chown -R ansadmin:ansadmin /home/ansadmin/.ssh
              chmod 700 /home/ansadmin/.ssh
              chmod 600 /home/ansadmin/.ssh/authorized_keys
              echo "ansadmin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
              EOF

  provisioner "remote-exec" {
    inline = [
      "echo 'Provisioned for Ansible access.'"
    ]

    connection {
      type        = "ssh"
      user        = "ansadmin"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}
