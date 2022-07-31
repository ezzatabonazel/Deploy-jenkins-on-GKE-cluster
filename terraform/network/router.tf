resource "google_compute_router" "router" {
  name    = "gcp-router"
  region  = var.managment_subnet_region
  network = google_compute_network.vpc.id
}

