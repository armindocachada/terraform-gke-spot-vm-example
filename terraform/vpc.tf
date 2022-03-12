resource "google_compute_network" "vpc" {
  name                    = "codemental-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.gke_subnetwork
  region        = var.gcp_region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
