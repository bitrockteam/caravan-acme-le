// Common
variable "common_name" {
  type = string
}
variable "email_address" {
  type    = string
  default = "letsencrypt@example.it"
}
variable "use_le_staging" {
  type    = bool
  default = false
}
variable "le_staging_endpoint" {
  type        = string
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
  description = "LE's endpoint when use_le_staging==true"
}
variable "le_production_endpoint" {
  type        = string
  default     = "https://acme-v02.api.letsencrypt.org/directory"
  description = "LE's endpoint when use_le_staging==false"
}
variable "private_key" {
  type        = string
  description = "Private key pem"
}
variable "dns_provider" {
  type = string
  validation {
    condition     = contains(["aws", "gcp"], var.dns_provider)
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
