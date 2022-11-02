resource "google_compute_router" "router" {
  name    = "management"
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.my-vpc.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router" "restricted_router" {
  name    = "restricted"
  region  = google_compute_subnetwork.restricted-subnet.region
  network = google_compute_network.my-vpc.id

  bgp {
    asn = 64514
  }
}