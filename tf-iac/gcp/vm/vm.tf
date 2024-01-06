resource "google_compute_instance" "doki" {
  name         = "doki"
  machine_type = "f1-micro"

  tags = ["http-server"]

  boot_disk {
    auto_delete = true

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20231213"
      size  = 10
      type  = "pd-standard"
      labels = {
        my_label = "dev"
      }
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false
    

  network_interface {
    network = "red-a"
    access_config {
      network_tier = "PREMIUN"
    }

    subnetwork = "project/test-dev-54830/regions/us-east1/subnetworks/red-a-subnet"

  }
  
  scheduling {
    automatic_restart   = false
    on_host_maintenance = "TERMINATE"
    preemptible         = true
    provisioning_model  = "SPOT"
  }

  metadata = {
    startup-script = file("./script.sh")
       
  }

  service_account {
    email  = "compute-engine-test@test-dev-54830.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }
  
}