# Caravan ACME LE

This module uses Let's Encrypt to generate a TLS key and certificate pair.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_acme"></a> [acme](#requirement\_acme) | 2.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_acme"></a> [acme](#provider\_acme) | 2.10.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [acme_certificate.certificate_auto](https://registry.terraform.io/providers/vancluever/acme/2.10.0/docs/resources/certificate) | resource |
| [acme_certificate.certificate_from_csr](https://registry.terraform.io/providers/vancluever/acme/2.10.0/docs/resources/certificate) | resource |
| [acme_registration.reg](https://registry.terraform.io/providers/vancluever/acme/2.10.0/docs/resources/registration) | resource |
| [null_resource.dns_check](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [tls_cert_request.req](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_private_key.private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | Common | `string` | n/a | yes |
| <a name="input_dns_provider"></a> [dns\_provider](#input\_dns\_provider) | n/a | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | When using dns\_provider==aws, the AWS profile name | `string` | `"default"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | When using dns\_provider==aws, the AWS region | `string` | `""` | no |
| <a name="input_aws_zone_id"></a> [aws\_zone\_id](#input\_aws\_zone\_id) | When using dns\_provider==aws, the AWS zone id | `string` | `""` | no |
| <a name="input_azure_client_id"></a> [azure\_client\_id](#input\_azure\_client\_id) | n/a | `string` | `""` | no |
| <a name="input_azure_client_secret"></a> [azure\_client\_secret](#input\_azure\_client\_secret) | n/a | `string` | `null` | no |
| <a name="input_azure_environment"></a> [azure\_environment](#input\_azure\_environment) | n/a | `string` | `"public"` | no |
| <a name="input_azure_resource_group"></a> [azure\_resource\_group](#input\_azure\_resource\_group) | n/a | `string` | `""` | no |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | Azure | `string` | `""` | no |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | n/a | `string` | `""` | no |
| <a name="input_disable_complete_propagation"></a> [disable\_complete\_propagation](#input\_disable\_complete\_propagation) | https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/certificate#about-dns-propagation-checks | `bool` | `false` | no |
| <a name="input_dns_polling_interval"></a> [dns\_polling\_interval](#input\_dns\_polling\_interval) | The DNS polling interval | `string` | `""` | no |
| <a name="input_dns_propagation_timeout"></a> [dns\_propagation\_timeout](#input\_dns\_propagation\_timeout) | The DNS propagation timeout | `string` | `""` | no |
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | n/a | `string` | `"letsencrypt@example.it"` | no |
| <a name="input_from_csr"></a> [from\_csr](#input\_from\_csr) | n/a | `bool` | `true` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | When using dns\_provider==gcp, the GCP projec ID | `string` | `""` | no |
| <a name="input_gcp_service_account_file"></a> [gcp\_service\_account\_file](#input\_gcp\_service\_account\_file) | When using dns\_provider==gcp, the GCP service account file | `string` | `""` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | Private key pem | `string` | `null` | no |
| <a name="input_recursive_nameservers"></a> [recursive\_nameservers](#input\_recursive\_nameservers) | DNS servers to check | `list(string)` | <pre>[<br>  "1.1.1.1:53",<br>  "8.8.8.8:53",<br>  "208.67.222.222:53",<br>  "208.67.220.220:53"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_p12"></a> [certificate\_p12](#output\_certificate\_p12) | n/a |
| <a name="output_certificate_p12_password"></a> [certificate\_p12\_password](#output\_certificate\_p12\_password) | n/a |
| <a name="output_certificate_pem"></a> [certificate\_pem](#output\_certificate\_pem) | n/a |
| <a name="output_issuer_pem"></a> [issuer\_pem](#output\_issuer\_pem) | n/a |
| <a name="output_private_key_pem"></a> [private\_key\_pem](#output\_private\_key\_pem) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
