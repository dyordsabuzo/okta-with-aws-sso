terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "pablosspot"

    workspaces {
      prefix = "ps-aws-sso-with-okta-"
    }
  }

  required_providers {
    okta = {
      source  = "okta/okta"
      version = "3.30.0"
    }
  }
}
