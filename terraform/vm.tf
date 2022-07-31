resource "google_compute_instance" "vm" {
  name         = "managment-vm"
  machine_type = var.vm_type
  zone         = "${var.managment_subnet_region}-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = module.network.managment_subnet_id
  }

service_account {
    email  = google_service_account.managmet-sa.email
    scopes = ["cloud-platform"]
  }

}

resource "google_service_account" "managmet-sa" {
  account_id   = "vm--managment-sa"
  display_name = "vm-sa"
}

resource "google_project_iam_binding" "cluster-admin" {
  project = var.project
  role    = "roles/container.admin"
  
  members = [
    "serviceAccount:${google_service_account.managmet-sa.email}",
  ]
}

resource "google_project_iam_binding" "gcr-viewer" {
  project = var.project
  role    = "roles/storage.objectViewer"
  
  members = [
    "serviceAccount:${google_service_account.managmet-sa.email}",
  ]
}


resource "google_compute_instance" "test" {
  name         = "managment-vm"
  machine_type = var.vm_type
  zone         = "${var.managment_subnet_region}-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = module.network.restricted_subnet_id
  }

service_account {
    email  = google_service_account.managmet-sa.email
    scopes = ["cloud-platform"]
  }
}