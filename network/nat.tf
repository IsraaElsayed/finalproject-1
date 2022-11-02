resource "google_compute_router_nat" "nat" {
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.management-subnet.id
    source_ip_ranges_to_nat = [var.management_cider_range]
  }
}


############################################### nat for k8s  (jenkins plugin)#######################################
resource "google_compute_router_nat" "k8s_nat" {
  name   = "k8snat"
  router = google_compute_router.restricted_router.name
  region = google_compute_router.restricted_router.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.restricted-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.k8s_nat_ip.self_link]
}


resource "google_compute_address" "k8s_nat_ip" {
  name         = "k8snat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"

 
}