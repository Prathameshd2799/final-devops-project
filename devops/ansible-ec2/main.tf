module "myec2" {
  source                 = "../../module/ec2/v2"
  count                  = length(var.unique_ids)
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  name                   = "${var.project_name}-${var.unique_ids[count.index]}"
  project_name           = var.project_name
  env                    = var.env
  iam_instance_profile   = var.iam_instance_profile

  # 👇 This is the fix — correctly reference the file path
  user_data = file("${path.module}/scripts/${var.user_data}")
}
