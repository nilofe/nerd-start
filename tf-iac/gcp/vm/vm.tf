resource "google_compute_instance" "doki" {
  name         = "doki"
  machine_type = "f1-micro"

  tags = ["dev", "test"]

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
    "foo"          = "bar"
    startup_script =  "sudo apt update ; sudo snap install docker ; sudo docker pull nilofe/test-challege-ia:main ; sudo docker run -d -p 80:8000 --name dev-a nilofe/test-challege-ia:main"
       
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