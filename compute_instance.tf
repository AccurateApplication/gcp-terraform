resource "google_compute_instance" "default" {
  description  = "Wireguard instance, for now."
  name         = "yoda"
  machine_type = "e2-micro"
  zone         = var.zone
  #
  # boot_disks = {}
  boot_disk {
    initialize_params {
      # image = "debian-cloud/debian-9"
      image = "centos-cloud/centos-8"
      size  = 20 # Minimum
    }
  }

  network_interface {
    network = "default"
    # network_ip = # Internal IP

    access_config {
      network_tier = "STANDARD"
      # public_ptr_domain_name = ""
      nat_ip = google_compute_address.external.address
    }
  }
}
