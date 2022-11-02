output "myvpc_id" {
  value = google_compute_network.my-vpc.id
}

output "myvpc_name" {
  value = google_compute_network.my-vpc.name
}

output "management_name" {
  value = google_compute_subnetwork.management-subnet.name
}

output "restricted_name" {
  value = google_compute_subnetwork.restricted-subnet.name
}