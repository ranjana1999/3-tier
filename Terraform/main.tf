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
      // Ephemeral IP will be automatically assigned to vm
    }
  }
  metadata_startup_script = file("startup-script.sh")
  metadata = {
    "ssh-keys" = <<EOF
      c3ranjanacloud:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKF1blWO311QlZT9ih+D+iAu/r2TxyvhxPx1Q6om9R4A c3ranjanacloud
    EOF
  }
}

output "vm_external_ip" {
  value = google_compute_instance.vm_instance_new.network_interface[0].access_config[0].nat_ip
}
