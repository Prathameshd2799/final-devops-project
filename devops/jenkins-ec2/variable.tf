variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the existing EC2 Key Pair to allow SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

# variable "iam_instance_profile_name" {
#   description = "IAM instance profile name"
#   type        = string
# }

variable "company_name" {
  description = "Company name for tags"
  type        = string
}

variable "project_name" {
  description = "Project name for tags"
  type        = string
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
}

variable "env" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "user_data" {
  description = "User data script for EC2 initialization"
  type        = string
  default     = ""
}
