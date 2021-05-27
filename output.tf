resource "local_file" "ansible_inventory" {
  content = templatefile("./templates/inventory.tpl",
    {
      ec2-ip   = google_compute_address.external.address,
      ec2-desc = google_compute_instance.bastion.description,

      ec2-instances             = google_compute_instance.server[*], # Loop over
      ec2-instances-name        = concat(google_compute_instance.server.*.name),
      ec2-instances-description = concat(google_compute_instance.server.*.description),
      ec2-instances-ip          = concat(google_compute_instance.server[*].network_interface[0].network_ip)
    }

  )
  filename = "./ansible/inventory.yml"
}
