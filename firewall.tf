resource "google_compute_firewall" "allowssh" {
  depends_on = [module.network]
  target_tags   = ["bastion"]
  name    = "allowssh"
  network = module.network.myvpc_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["35.235.240.0/20",]


}