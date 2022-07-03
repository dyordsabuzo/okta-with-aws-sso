data "aws_ssm_parameter" "acs_url" {
  name            = "/tool/aws-sso/ACS_URL"
  with_decryption = true
}

data "aws_ssm_parameter" "issuer_url" {
  name            = "/tool/aws-sso/ISSUER_URL"
  with_decryption = true
}
