resource "local_file" "ansible_inventory" {
  content = templatefile("./templates/inventory.tpl",
    {
      ec2-ip   = google_compute_address.external.address,
      ec2-desc = google_compute_instance.default.description

    }

  )
  filename = "./ansible/inventory.yml"
}
