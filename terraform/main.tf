module "network" {
    
source = "./network"
vpc_name=var.vpc_name
managment_subnet_cidr= var.managment_subnet_cidr
managment_subnet_name= var.managment_subnet_name
managment_subnet_region= var.managment_subnet_region
restricted_subnet_cidr= var.restricted_subnet_cidr
restricted_subnet_name= var.restricted_subnet_name
restricted_subnet_region= var.restricted_subnet_region
  
}

module "GKE-cluster" {
    source = "./GKE-cluster"
    project_id = var.project
    network_id = module.network.vpc_id
    subnetwork_id = module.network.restricted_subnet_id
    restricted_subnet_region= var.restricted_subnet_region
    managment_subnet_cidr = var.managment_subnet_cidr
    machine_type = var.machine_type
    node-count = var.node-count
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
    pods_ipv4_cidr_block = var.pods_ipv4_cidr_block
  
}