terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.1.2"
    }
  }
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {

  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "tls_cert_request" "req" {
  count = local.private_key_provided ? 1 : 0

  private_key_pem = var.private_key
  subject {
    common_name = "*.${var.common_name}"
  }
}

resource "null_resource" "dns_check" {
  provisioner "local-exec" {
    command = "while [[ `nslookup -type=SOA ${var.common_name} | grep -i \"can\\'t\"` ]]; do printf 'Still checking..'; sleep 5; done"
  }
}

locals {
  private_key_provided = var.from_csr
  cloud_to_dns_provider_map = {
    "gcp" : "gcloud"
    "aws" : "route53"
    "azure" : "azure"
  }
  acme_config = {
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
    AZURE_SUBSCRIPTION_ID = var.azure_subscription_id
    AZURE_TENANT_ID       = var.azure_tenant_id
    AZURE_RESOURCE_GROUP  = var.azure_resource_group
    AZURE_CLIENT_ID       = var.azure_client_id
    AZURE_CLIENT_SECRET   = var.azure_client_secret
    AZURE_ENVIRONMENT     = var.azure_environment
  }
}

resource "acme_certificate" "certificate_from_csr" {
  depends_on = [null_resource.dns_check]
  count      = local.private_key_provided ? 1 : 0

  account_key_pem         = acme_registration.reg.account_key_pem
  certificate_request_pem = tls_cert_request.req[0].cert_request_pem

  recursive_nameservers = ["8.8.8.8:53", "208.67.222.222:53", "208.67.220.220:53"]

  dns_challenge {
    provider = local.cloud_to_dns_provider_map[var.dns_provider]
    config   = local.acme_config
  }
}

resource "acme_certificate" "certificate_auto" {
  depends_on = [null_resource.dns_check]
  count      = local.private_key_provided ? 0 : 1

  account_key_pem = acme_registration.reg.account_key_pem
  common_name     = "*.${var.common_name}"

  recursive_nameservers = ["8.8.8.8:53", "208.67.222.222:53", "208.67.220.220:53"]

  dns_challenge {
    provider = local.cloud_to_dns_provider_map[var.dns_provider]
    config   = local.acme_config
  }
}
