module "jenkins_instance" {
  source                 = "../../module/ec2/v3"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  security_group_ids     = var.security_group_ids
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  iam_instance_profile_name = "fqts-ec2"

  company_name = var.company_name
  project_name = var.project_name
  env          = var.env
  name         = var.name

  # tags = {
  #   Name        = "FQTS-DEV-Jenkins-ec2"
  #   Environment = "dev"
  #   Role        = "Jenkins"
  

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y

    # Install Java 17 (Amazon Corretto)
    sudo amazon-linux-extras enable corretto17
    sudo yum install -y java-17-amazon-corretto

    # Install Jenkins
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum install -y jenkins

    # Enable and start Jenkins
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
  EOF
}
