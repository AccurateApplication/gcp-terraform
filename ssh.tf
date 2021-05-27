resource "google_compute_project_metadata_item" "ssh-keys" {
  key     = "ssh-keys"
  value   = "${var.admin_user}:${file(var.ssh_key)}"
  project = var.project_id
}

output "ssh_key_added" {
  value = google_compute_project_metadata_item.ssh-keys.value
}
