variable "project" {
 type = string
}

variable "region" {
 type = string
}
variable "vpc_name" {
 type = string
}

variable "managment_subnet_cidr" {
 type = string
}

variable "managment_subnet_name" {
   type = string
}


variable "managment_subnet_region" {
   type = string
}

variable "restricted_subnet_cidr" {
 type = string
}

variable "restricted_subnet_name" {
   type = string
}


variable "restricted_subnet_region" {
   type = string
}

variable "vm_type" {
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