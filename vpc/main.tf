resource "google_compute_network" "vpc" {
  name = var.vpc-name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "mansubnet" {
  name          = var.subnet-name1
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  private_ip_google_access = true
  network = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "ressubnet" {
  name          = var.subnet-name2
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  private_ip_google_access = true
  network = google_compute_network.vpc.id
}

