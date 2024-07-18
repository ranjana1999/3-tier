resource "google_compute_instance" "vm_instance_new" {
  name         = "my-vm-instance-new"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP will be automatically assigned
    }
  }
}

output "vm_external_ip" {
  value = google_compute_instance.vm_instance_new.network_interface[0].access_config[0].nat_ip
}
