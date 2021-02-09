output "issuer_pem" {
  value = acme_certificate.certificate.issuer_pem
}

output "certificate_pem" {
  value = acme_certificate.certificate.certificate_pem
}

output "private_key_pem" {
  value = acme_certificate.certificate.private_key_pem
}

output "certificate_p12" {
  value = acme_certificate.certificate.certificate_p12
}

output "certificate_p12_password" {
  value = acme_certificate.certificate.certificate_p12_password
}
