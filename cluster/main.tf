resource "google_container_cluster" "private-cluster" {
  name     = "private-clusterr"
  location = "us-central1"
  network = var.vpc-name
  subnetwork = var.subnet-name
  release_channel {
    channel = "REGULAR"
  }

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

   ip_allocation_policy {
   
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.0.1.0/24"
    }
  }
}



resource "google_service_account" "gke-cluster-service" {
  account_id   = "gke-cluster-service"
  display_name = "gke-cluster-service"
}

resource "google_project_iam_member" "bind" {
  project = "loayproject"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke-cluster-service.email}"
}



resource "google_container_node_pool" "pv-node" {
  name       = "pv-node"
  location   = "us-central1"
  cluster    = google_container_cluster.private-cluster.name
  node_count = 1
 
  node_config {
    preemptible  = true
    machine_type = "e2-micro"
    disk_type    = "pd-standard"
    disk_size_gb = 10
    image_type   = "ubuntu_containerd"
    service_account = google_service_account.gke-cluster-service.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"

    ]
  }
}

