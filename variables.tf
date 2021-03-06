variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-southeast-2"
}

variable "okta_base_url" {
  type        = string
  description = "Okta base url"
  default     = "okta.com"
}

variable "okta_org_name" {
  type        = string
  description = "Okta org name"
  default     = "UNSET"
}

variable "okta_token" {
  type        = string
  description = "Okta token"
  default     = "UNSET"
}

variable "okta_group_list" {
  type = list(object({
    name        = string
    description = string
  }))
  description = "List of okta group definition"
  default = [{
    description = "Administrator"
    name        = "PS-Administrator"
  }]
}
