module "iam_role" {
  source    = "../../module/iam-role"
  role_name = "fqts-project-3"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# output "iam_role_arn" {
#   value = module.iam_role.role_arn
# }
