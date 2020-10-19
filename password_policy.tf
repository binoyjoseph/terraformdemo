variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

terraform {
  required_providers {
    okta = {
      source  = "oktadeveloper/okta"
      version = "3.5.1"
    }
  }
}
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  api_token = var.api_token
}

resource "okta_policy_password" "example" {
  name                   = "Some description"
  status                 = "INACTIVE"
  description            = "Example"
  password_history_count = 4
  priority               = 4
}

resource "okta_policy_rule_password" "example_allow_rule" {
  policyid              = "${okta_policy_password.example.id}"
  name                  = "Allow Password Reset"
}
