variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "iam_instance_profile_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "associate_public_ip" {
  type = bool
}

variable "security_group_ids" {
  type = list(string)
}

variable "user_data" {
  type    = string
  default = ""
}

variable "tags" {
  type = map(string)
}
