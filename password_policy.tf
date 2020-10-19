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
  name                   = "example"
  status                 = "INACTIVE"
  description            = "Example"
  password_history_count = 4
  groups_included        = ["${data.okta_group.everyone.id}"]
  priority               = 5
}