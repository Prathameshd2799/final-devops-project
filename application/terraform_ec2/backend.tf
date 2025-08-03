terraform {
  backend "s3" {
    bucket         = "pdhalkar-fqts-proj-3"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    //dynamodb_table = "terraform-lock-table"
  }
}
