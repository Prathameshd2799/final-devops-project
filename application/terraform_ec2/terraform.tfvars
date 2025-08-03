ami_id                 = "ami-0e58b56aa4d64231b"
instance_type          = "t3.micro"
key_name               = "jenkins"
subnet_id              = "subnet-07a03466eb3c47a8f"
instance_profile_name  = "fqts-ec2"
associate_public_ip    = true
security_group_ids     = ["sg-01cdc207113c9f14e"]

user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "Hello from Terraform and Apache!" > /var/www/html/index.html
  echo "Hello from Terraform!" > /home/ec2-user/hello.txt
EOF

tags = {
  Name        = "FQTS Project 3"
  Environment = "Dev"
}
