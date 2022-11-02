resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

resource "google_container_node_pool" "cluster-pool" {
  name           = "cluster-pool"
  cluster        = google_container_cluster.mycluster.id
  node_count     = 3
  location     = google_container_cluster.mycluster.location
 
  max_pods_per_node = 10

  management {
    auto_repair  = true
    auto_upgrade = true
  }
  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }
  

  node_config {
    preemptible  = true
    disk_size_gb = 10
    machine_type = "e2-small"

    labels = {
      role = "cluster-pool"
    }
      
    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
        
    ]

  }

}