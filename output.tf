output "issuer_pem" {
  value = acme_certificate.certificate.issuer_pem
}

output "certificate_pem" {
  value = acme_certificate.certificate.certificate_pem
}

output "private_key_pem" {
  value = acme_certificate.certificate.private_key_pem
}
