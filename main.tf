# ---------------------------------------------------------------------------------------------------------------------
# CONFIGURE GOOGLE CLOUD DNS
# This is the place where you can manage your Google Cloud DNS Zones and Records
# ---------------------------------------------------------------------------------------------------------------------

provider google {
  region = "${var.gcp_region}"
  project = "${var.gcp_project}"
}

resource "google_dns_record_set" "server_fqdn" {
  name = "${var.server_hostname}.${google_dns_managed_zone.dns_zone.dns_name}"
  type = "A"
  ttl  = "${var.ttl}"

  managed_zone = "${google_dns_managed_zone.dns_zone.name}"

  rrdatas = "${var.server_rrdatas}"
}

resource "google_dns_managed_zone" "dns_zone" {
  name     = "${var.gcp_dns_zone}"
  dns_name = "${var.gcp_dns_domain}"
}
