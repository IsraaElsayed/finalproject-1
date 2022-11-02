module "network" {
  source = "./network"
  project = var.project
  region = var.region
  restricted_cider_range = var.restricted_cider_range
  management_cider_range = var.management_cider_range
}

module "gke" {
  source = "./gke"
  project = var.project
  region = var.region
  network_name = module.network.myvpc_name
  subnet_name = module.network.restricted_name
  pods_ipv4_cidr_block = var.pods_ipv4_cidr_block
  services_ipv4_cidr_block = var.services_ipv4_cidr_block
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  master_authorized_networks_cidr = var.management_cider_range

  depends_on = [module.network] 
}