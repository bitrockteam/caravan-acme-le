output "certificate_pem" {
  value = acme_certificate.certificate.certificate_pem
}

output "private_key_pem" {
  value = tls_private_key.cert_private_key.private_key_pem
}