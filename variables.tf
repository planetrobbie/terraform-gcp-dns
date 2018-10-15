variable "gcp_region" {
  description = "The region to operate under"
}

variable "gcp_project" {
  description = "GCP project targeted"
}

variable "gcp_dns_zone" {
  description = "Google Cloud zone name to create"	
}

variable "gcp_dns_domain" {
  description = "DNS Domain where to add entry"
}

variable "server_rrdatas" {
  description = "Vault LB IP Address"
  type = "list"
}

#### OPTIONAL PARAMETERS ####

variable "server_hostname" {
  description = "Vault Load Balancer DNS Hostname, left part of FQDN"
  default = "vault"
}

variable "ttl" {
  description = "DNS ttl of entry"
  default = "300"
}