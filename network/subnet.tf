resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.management_cider_range
  region        = var.region
  network       = google_compute_network.my-vpc.id
}

resource "google_compute_subnetwork" "restricted-subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = var.restricted_cider_range
  region        = var.region
  network       = google_compute_network.my-vpc.id
}