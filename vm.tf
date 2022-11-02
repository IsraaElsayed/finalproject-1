resource "google_service_account" "service_bastion" {
  account_id   = "esraa-366113-bastion"
  display_name = "Service_bastion"
}
resource "google_project_iam_binding" "admin-iam" {
  project = var.project
  role    = "roles/container.admin"

  members = [
    "serviceAccount:${google_service_account.service_bastion.email}",
  ]
}

#resource "google_project_iam_member" "project" {
 # project = var.project
 # role    = "roles/container.admin"
  #member  = "serviceAccount:${google_service_account.service_bastion.email}"
#}
  
resource "google_compute_instance" "private-vm" {
  name         = "private-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags = ["bastion"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

 network_interface {
    network = "${module.network.myvpc_name}"
    subnetwork = "${module.network.management_name}"

  }

  service_account {
     #Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.service_bastion.email
    scopes = ["cloud-platform"]
  }

}