terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.0.0"
    }
  }
}

provider "acme" {
  server_url = var.le_endpoint
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
      GCE_PROJECT              = var.project_id
      GCE_SERVICE_ACCOUNT_FILE = var.google_account_file
      # GCE_POLLING_INTERVAL     = 120
      # GCE_PROPAGATION_TIMEOUT  = 600
      AWS_PROFILE              = var.aws_profile
      AWS_REGION               = var.aws_region
      //AWS_POLLING_INTERVAL     = 120
      //AWS_PROPAGATION_TIMEOUT  = 600
      AWS_HOSTED_ZONE_ID       = var.aws_zone_id
      //AWS_TTL                  = 30
    }
  }
}