variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "asg-name" {
  type = string
}
