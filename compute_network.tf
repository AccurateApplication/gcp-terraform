resource "google_compute_network" "vpc_network" {
  name    = "star-vpc"
  project = var.project_id
  # region = var.region
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom-subnet" {
  name          = google_compute_network.vpc_network.name
  region        = var.region
  ip_cidr_range = var.vpc_subnet_pub
  network       = google_compute_network.vpc_network.id
}
