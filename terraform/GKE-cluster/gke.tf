resource "google_container_cluster" "gke_cluster" {
  name     = "my-gke-cluster"
  location =  var.restricted_subnet_region
  network    = var.network_id
  subnetwork = var.subnetwork_id

   master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.managment_subnet_cidr
    }
   }

    addons_config {
    network_policy_config {
      disabled = false
    }
  }
  network_policy {
    enabled = "true"
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    master_global_access_config {
      enabled = true
    }
  }

  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode = "VPC_NATIVE"
  
  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
}
