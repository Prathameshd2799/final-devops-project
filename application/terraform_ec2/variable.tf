variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "instance_profile_name" {}
variable "subnet_id" {}
variable "associate_public_ip" {
  type = bool
}
variable "security_group_ids" {
  type = list(string)
}
variable "user_data" {
  type = string
}
variable "tags" {
  type = map(string)
}
