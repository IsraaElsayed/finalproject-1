terraform {
  backend "gcs" {
    bucket  = "esraa-gcp-project"
    prefix  = "terraform/state"
  }
}