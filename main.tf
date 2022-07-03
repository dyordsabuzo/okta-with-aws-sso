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

resource "okta_app_saml" "saml" {
  preconfigured_app  = "amazon_aws_sso"
  label              = "AWS Single Sign On (Main Account)"
  user_name_template = "$${source.email}"

  app_settings_json = jsonencode({
    acsURL   = data.aws_ssm_parameter.acs_url.value
    entityID = data.aws_ssm_parameter.issuer_url.value
  })

  status = "ACTIVE"
}

resource "okta_group" "group" {
  for_each    = { for group in var.okta_group_list : group.name => group }
  name        = each.value.name
  description = each.value.description
}

resource "okta_app_group_assignments" "assignments" {
  app_id = okta_app_saml.saml.id

  dynamic "group" {
    for_each = { for group in var.okta_group_list : group.name => group }
    content {
      id       = okta_group.group[group.key].id
      priority = index(values(okta_group.group)[*].name, group.key)
    }
  }
}
