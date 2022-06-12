resource "aws_ssm_parameter" "okta_base_url" {
  name  = "/tool/okta/BASE_URL"
  type  = "String"
  value = var.okta_base_url

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "okta_org_name" {
  name  = "/tool/okta/ORG_NAME"
  type  = "String"
  value = var.okta_org_name

  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "okta_token" {
  name  = "/tool/okta/TOKEN"
  type  = "SecureString"
  value = var.okta_token

  lifecycle {
    ignore_changes = [value]
  }
}
