resource "google_compute_network" "my-vpc" {
  project                 = "esraa-366113"
  name                    = "my-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}