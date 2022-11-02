resource "google_container_cluster" "mycluster" {
  name               = "mycluster"
  location           = "${var.region}-a"
  network = var.network_name
  subnetwork = var.subnet_name
  remove_default_node_pool = true
  initial_node_count       = 2
  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"


  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  release_channel {
      channel = "STABLE"
  }

  workload_identity_config {
  workload_pool = "${var.project}.svc.id.goog"
}

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.master_authorized_networks_cidr
    
    }
  }

}
