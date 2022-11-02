variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
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