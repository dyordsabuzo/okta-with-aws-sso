terraform {
  backend "s3" {
    bucket         = "pablosspot-terraform-s3-backend"
    dynamodb_table = "terraform-s3-locking-table"
    region         = "ap-southeast-2"
    encrypt        = true
    key            = "pablosspot-aws-sso-infrastructure/terraform.tfstate"
  }

  required_providers {
    okta = {
      source  = "okta/okta"
      version = "3.30.0"
    }
  }
}
