module "terraform_instance" {
  source                    = "../../module/ec2/v0"
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  iam_instance_profile_name = var.instance_profile_name
  subnet_id                 = var.subnet_id
  associate_public_ip       = var.associate_public_ip
  security_group_ids        = var.security_group_ids
  user_data                 = var.user_data
  tags                      = var.tags
}
