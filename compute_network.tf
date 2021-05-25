resource "google_compute_network" "default" {
  name                    = "star-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_firewall" "default" {
  name        = "firewall"
  description = "Used for wireguard"
  network     = google_compute_network.default.name

  allow {
    protocol = "udp"
    ports    = ["51820"]
  }
  source_ranges = ["0.0.0.0/0"] # Default?
  source_tags   = ["wireguard"]

}

resource "google_compute_subnetwork" "custom-subnet" {
  name          = google_compute_network.default.name
  region        = var.region
  ip_cidr_range = var.vpc_subnet_pub
  network       = google_compute_network.default.id
}

resource "google_compute_address" "external" {
  name         = "my-external-address"
  address_type = "EXTERNAL"
  region       = var.region
  network_tier = "STANDARD"
}


output "external_address" {
  value = google_compute_address.external.address
}
