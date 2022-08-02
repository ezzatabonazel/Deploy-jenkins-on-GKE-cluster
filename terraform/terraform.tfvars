project = "mahmoudrizk"
region = "us-central1"
vpc_name="gcp-project-vpc"
managment_subnet_cidr="10.0.0.0/24"
managment_subnet_name="managment"
managment_subnet_region= "us-central1"
restricted_subnet_cidr= "10.0.1.0/24"
restricted_subnet_name= "restricted"
restricted_subnet_region= "us-central1"
vm_type="f1-micro"
machine_type = "e2-micro"
node-count = 1
master_ipv4_cidr_block = "172.12.0.0/28"
services_ipv4_cidr_block = "192.168.0.0/16"
pods_ipv4_cidr_block = "172.17.0.0/16"