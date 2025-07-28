variable "alb_name" {}
variable "sg_name" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}

variable "target_group1_name" {}
variable "target_group1_port" {}
variable "instance_ids1" {
  type = list(string)
}

variable "target_group2_name" {}
variable "target_group2_port" {}
variable "instance_ids2" {
  type = list(string)
}
