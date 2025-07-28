module "alb" {
  source = "../../module/alb"

  alb_name            = var.alb_name
  sg_name             = var.sg_name
  vpc_id              = var.vpc_id
  subnet_ids          = var.subnet_ids

  target_group1_name  = var.target_group1_name
  target_group1_port  = var.target_group1_port
  instance_ids1       = var.instance_ids1

  target_group2_name  = var.target_group2_name
  target_group2_port  = var.target_group2_port
  instance_ids2       = var.instance_ids2
}

output "alb_dns" {
  value = module.alb.alb_dns_name
}
