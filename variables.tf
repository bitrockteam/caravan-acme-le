variable "project_id" {
  type    = string
  default = ""
}
variable "google_account_file" {
  type    = string
  default = ""
}
variable "common_name" {
  type = string
}
variable "email_address" {
  type    = string
  default = "letsencrypt@example.it"
}
variable "dns_provider" {
  type = string
}
variable "le_staging_endpoint" {
  default = "https://acme-staging-v02.api.letsencrypt.org/directory"
}
variable "le_production_endpoint" {
  default = "https://acme-v02.api.letsencrypt.org/directory"
}
variable "private_key" {
  default = ""
}
variable "aws_profile" {
  default = "default"
}
variable "aws_region" {
  default = ""
}
variable "aws_zone_id" {
  default = ""
}
variable "use_le_staging" {
  type    = bool
  default = false
}
