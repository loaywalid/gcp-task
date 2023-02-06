resource "google_compute_router_nat" "nat" {
  name   = var.nat-name
  router = var.router-name
  region = var.region-name
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

   subnetwork {
    name  = var.subnet-name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

resource "google_compute_router" "router" {
  name = "tf-nat"
  region = var.router-region
  network = var.router-network
}