resource "google_compute_instance" "bhanu-tf" {
  name         = "bhanu-tf-1"
  machine_type = "e2-medium"
  zone         = "asia-southeast2-a"

  labels = {
       name = "bhanu-tf"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20210514"
      size  = "10"
      type  = "pd-ssd"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "bhanu-vpc"

    access_config {
      network_tier = "STANDARD"
      // Ephemeral IP
    }
  }
    

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "820356890971-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
