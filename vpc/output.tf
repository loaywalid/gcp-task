output "vpc-id" {
    value = google_compute_network.vpc.id
}

output "subnet-name" {
    value = google_compute_subnetwork.mansubnet.name
}