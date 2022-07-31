resource "google_compute_subnetwork" "management_subnet" {
  name          = var.managment_subnet_name
  ip_cidr_range = var.managment_subnet_cidr
  region        = var.managment_subnet_region
  network       = google_compute_network.vpc.id
  private_ip_google_access= true
}

resource "google_compute_subnetwork" "restricted_subnet" {
  name          = var.restricted_subnet_name
  ip_cidr_range = var.restricted_subnet_cidr
  region        = var.restricted_subnet_region
  network       = google_compute_network.vpc.id
    private_ip_google_access= true
}