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
  cloud_to_dns_provider_map = {
    "gcp" : "gcloud"
    "aws" : "route53"
  }
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

  recursive_nameservers = ["8.8.8.8:53", "208.67.222.222:53", "208.67.220.220:53"]

  dns_challenge {
    provider = local.cloud_to_dns_provider_map[var.dns_provider]
    config = {
      // GCP
      GCE_PROJECT              = var.gcp_project_id
      GCE_SERVICE_ACCOUNT_FILE = var.gcp_service_account_file
      GCE_PROPAGATION_TIMEOUT  = var.dns_propagation_timeout
      GCE_POLLING_INTERVAL     = var.dns_polling_interval

      // AWS
      AWS_PROFILE        = var.aws_profile
      AWS_REGION         = var.aws_region
      AWS_HOSTED_ZONE_ID = var.aws_zone_id

      // AZURE
      AZURE_TENANT_ID      = var.azure_tenant_id
      AZURE_RESOURCE_GROUP = var.azure_resource_group
      AZURE_CLIENT_ID      = var.azure_client_id
      AZURE_CLIENT_SECRET  = var.azure_client_secret
    }
  }
}
