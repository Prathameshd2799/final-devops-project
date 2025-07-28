variable "role_name" {
  description = "IAM Role name"
  type        = string
}

variable "tags" {
  description = "Tags for IAM role"
  type        = map(string)
  default     = {}
}
variable "iam_role_name" {
  description = "Existing IAM role name to attach to the EC2 instance"
  type        = string
}

