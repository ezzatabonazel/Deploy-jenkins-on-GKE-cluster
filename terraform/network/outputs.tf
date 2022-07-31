output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "managment_subnet_id" {
   value = google_compute_subnetwork.management_subnet.id
}

output "restricted_subnet_id" {
    value = google_compute_subnetwork.restricted_subnet.id
  
}

output "nat_id" {
  value = google_compute_router_nat.mynat_gateway.id
}