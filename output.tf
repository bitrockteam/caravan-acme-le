output "issuer_pem" {
  value = local.private_key_provided ? acme_certificate.certificate_from_csr[0].issuer_pem : acme_certificate.certificate_auto[0].issuer_pem
}

output "certificate_pem" {
  value = local.private_key_provided ? acme_certificate.certificate_from_csr[0].certificate_pem : acme_certificate.certificate_auto[0].certificate_pem
}

output "private_key_pem" {
  value     = local.private_key_provided ? var.private_key : acme_certificate.certificate_auto[0].private_key_pem
  sensitive = true
}

output "certificate_p12" {
  value     = local.private_key_provided ? acme_certificate.certificate_from_csr[0].certificate_p12 : acme_certificate.certificate_auto[0].certificate_p12
  sensitive = true
}

output "certificate_p12_password" {
  value     = local.private_key_provided ? acme_certificate.certificate_from_csr[0].certificate_p12_password : acme_certificate.certificate_auto[0].certificate_p12_password
  sensitive = true
}
