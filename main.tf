terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.0.0"
    }
  }
}

locals {
  le_endpoint = var.use_le_staging ? var.le_staging_endpoint : var.le_production_endpoint
}

provider "acme" {
  server_url = local.le_endpoint
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {

  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "tls_cert_request" "req" {

  key_algorithm   = "RSA"
  private_key_pem = var.private_key
  subject {
    common_name = "*.${var.common_name}"
  }
}

resource "acme_certificate" "certificate" {

  account_key_pem         = acme_registration.reg.account_key_pem
  certificate_request_pem = tls_cert_request.req.cert_request_pem

  dns_challenge {
    provider = var.dns_provider
    config = {
      // GCP
      GCE_PROJECT              = var.gcp_project_id
      GCE_SERVICE_ACCOUNT_FILE = var.gcp_service_account_file

      // AWS
      AWS_PROFILE        = var.aws_profile
      AWS_REGION         = var.aws_region
      AWS_HOSTED_ZONE_ID = var.aws_zone_id
    }
  }
}
