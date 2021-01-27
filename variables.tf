variable "project_id" {
  type = string
  default = ""
}
variable "google_account_file" {
  type = string
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
variable "le_endpoint" {
  default = ""
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