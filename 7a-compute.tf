resource "google_compute_instance" "hq_rdp_vm" {
  name         = "hq-rdp-vm"
  machine_type = "n2-standard-2"
  zone         = "us-east4-b"

  tags = [ "hq-admin-allow-rdp" ]
  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2022"
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.windows-public-subnet.name 

    access_config {
      // Ephemeral public IP
    }
  }
}


resource "google_compute_instance" "iowa_vm" {
  name         = "iowa-vm"
  machine_type = "n2-standard-2"
  zone         = "us-central1-b"

  tags = ["jourdan-web" ]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.jourdan-linux-private-subnet.name  
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = file("./startup.sh")
}