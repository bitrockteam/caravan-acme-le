variable "project_id" {
    type = string
}
variable "google_account_file" {
    type = string
}
variable "common_name" {
    type = string
}
variable "email_address" {
    type = string
    default = "letsencrypt@example.it"
}
variable "dns_provider" {
    type = string
}
variable "le_endpoint" {
    type = string
}