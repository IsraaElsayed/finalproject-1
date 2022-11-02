variable "region" {
  type = string
}


variable "project" {
  type = string
}

variable "management_cider_range" {
  type = string
}

variable "restricted_cider_range" {
  type = string
}

variable "pods_ipv4_cidr_block" {
  type = string
}

variable "services_ipv4_cidr_block" {
  type = string
}

variable "master_ipv4_cidr_block" {
  type = string
}
variable "master_authorized_networks_cidr" {
  type = string
}