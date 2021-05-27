resource "google_compute_instance" "bastion" {
  description  = "Wireguard instance, for now."
  name         = "yoda"
  machine_type = "e2-micro"
  zone         = var.zone
  #
  # boot_disks = {}
  boot_disk {
    initialize_params {
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

resource "google_compute_instance" "server" {
  description  = "used for something"
  name         = "elvis-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["hard-working-server"]
  #
  # boot_disks = {}
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
      size  = 20 # Minimum
    }
  }

  network_interface {
    network = "default"
    # network_ip = # Internal IP

    access_config {
      network_tier = "STANDARD"
    }
  }
  count = var.instance_count
}
