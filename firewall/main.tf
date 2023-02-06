resource "google_compute_firewall" "default" {
  name    = var.firewall-name
  network = var.firewall-network
  allow {
    protocol = var.protocol
    ports    = var.port
  }
  source_ranges = var.source_ranges
  direction     = var.direction

}
