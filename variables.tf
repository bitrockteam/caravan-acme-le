// Common
variable "common_name" {
  type = string
}
variable "email_address" {
  type    = string
  default = "letsencrypt@example.it"
}
variable "private_key" {
  type        = string
  description = "Private key pem"
  default     = null
  sensitive   = true
}
variable "from_csr" {
  type    = bool
  default = true
}
variable "dns_provider" {
  type = string
  validation {
    condition     = contains(["aws", "gcp", "azure"], var.dns_provider)
    error_message = "Unsupported dns_provider."
  }
}
variable "dns_propagation_timeout" {
  type        = string
  default     = ""
  description = "The DNS propagation timeout"
}
variable "dns_polling_interval" {
  type        = string
  default     = ""
  description = "The DNS polling interval"
}


variable "recursive_nameservers" {
  type        = list(string)
  default     = ["1.1.1.1:53", "8.8.8.8:53", "208.67.222.222:53", "208.67.220.220:53"]
  description = "DNS servers to check"
}
variable "disable_complete_propagation" {
  type        = bool
  default     = false
  description = "https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/certificate#about-dns-propagation-checks"

}

// GCLOUD
variable "gcp_project_id" {
  type        = string
  default     = ""
  description = "When using dns_provider==gcp, the GCP projec ID"
}
variable "gcp_service_account_file" {
  type        = string
  default     = ""
  description = "When using dns_provider==gcp, the GCP service account file"
}

// AWS
variable "aws_profile" {
  type        = string
  default     = "default"
  description = "When using dns_provider==aws, the AWS profile name"
}
variable "aws_region" {
  type        = string
  default     = ""
  description = "When using dns_provider==aws, the AWS region"
}
variable "aws_zone_id" {
  type        = string
  default     = ""
  description = "When using dns_provider==aws, the AWS zone id"
}

// Azure
variable "azure_subscription_id" {
  type    = string
  default = ""
}
variable "azure_tenant_id" {
  type    = string
  default = ""
}
variable "azure_resource_group" {
  type    = string
  default = ""
}
variable "azure_client_id" {
  type    = string
  default = ""
}
variable "azure_client_secret" {
  type      = string
  default   = null
  sensitive = true
}
variable "azure_environment" {
  type    = string
  default = "public"
}
