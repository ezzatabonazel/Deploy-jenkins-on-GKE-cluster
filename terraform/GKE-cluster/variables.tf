
variable "project_id" {
  type = string
}


variable "network_id" {
  type = string
}


variable "subnetwork_id" {
  type = string
}

variable "managment_subnet_cidr" {
 type = string
}


variable "restricted_subnet_region" {
   type = string
}

variable "machine_type" {
  type = string
}

variable "node-count" {
  type = number
}


variable "master_ipv4_cidr_block" {
  type = string
}

variable "services_ipv4_cidr_block" {
  type = string
}

variable "pods_ipv4_cidr_block" {
  type = string
}
