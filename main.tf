# ---------------------------------------------------------------------------------------------------------------------
# CONFIGURE GOOGLE CLOUD DNS
# This is the place where you can manage your Google Cloud DNS Zones and Records
# ---------------------------------------------------------------------------------------------------------------------

provider google {
  region = "${var.gcp_region}"
  project = "${var.gcp_project}"
  credentials = "/Users/sebbraun/in/gcp/sebastien-demo.json"
}

resource "google_dns_record_set" "vault_lb_fqdn" {
  name = "${var.vault_hostname}.${google_dns_managed_zone.dns_zone.dns_name}"
  type = "A"
  ttl  = "${var.ttl}"

  managed_zone = "${google_dns_managed_zone.dns_zone.name}"

  rrdatas = "${var.vault_rrdatas}"
}

resource "google_dns_managed_zone" "dns_zone" {
  name     = "${var.gcp_dns_zone}"
  dns_name = "${var.gcp_dns_domain}"
}