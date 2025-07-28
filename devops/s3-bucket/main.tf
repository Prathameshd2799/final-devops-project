module "terraform_state_bucket" {
  source      = "../../module/s3/v0"
  bucket_name = var.bucket_name
}
  