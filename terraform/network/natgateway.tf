resource "google_compute_router_nat" "mynat_gateway" {
  name   = "router-nat"
  router = google_compute_router.router.name
  region = var.managment_subnet_region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.management_subnet.id
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
  }
}