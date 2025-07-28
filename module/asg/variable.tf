variable "subnets" {
  type = list(string)
}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "target_group_arn" {}
variable "security_group_id" {}
variable "user_data" {
  type = string
}
variable "asg_name" {
  type = string
}
variable "scale_up_threshold" {
  default = 70
}
variable "scale_down_threshold" {
  default = 30
}
