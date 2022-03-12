module "gke" {
  depends_on = [google_service_account.gke-sa, google_project_service.kubernetes, google_project_service.compute, google_project_service.iam]
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"
  version                    = "19.0.0"
  project_id                 = var.gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gcp_region
  regional                   = false
  ip_range_pods              = ""
  ip_range_services          = ""
  zones                      = var.gke_zones
  network                    = google_compute_network.vpc.name
  subnetwork                 = google_compute_subnetwork.subnet.name
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false
  remove_default_node_pool   = true
  create_service_account = false
  logging_service = "none"
  node_pools = [
    {
      name               = var.gke_default_nodepool_name
      machine_type       = "e2-medium"
      min_count          = 1
      max_count          = 1
      local_ssd_count    = 0
      disk_size_gb       = 25
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = "${var.gke_sa_name}@${var.gcp_project_id}.iam.gserviceaccount.com"
      preemptible        = false
      #preemptible        = false
      initial_node_count = 1
    },
    {
      name               = "ephemeral-node-pool"
      machine_type       = "e2-medium"
      min_count          = 1
      max_count          = 1
      local_ssd_count    = 0
      disk_size_gb       = 25
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = "${var.gke_sa_name}@${var.gcp_project_id}.iam.gserviceaccount.com"
      preemptible        = true
      #preemptible        = false
    },
        {
      name               = "spot-node-pool"
      machine_type       = "e2-medium"
      min_count          = 1
      max_count          = 1
      local_ssd_count    = 0
      disk_size_gb       = 25
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = "${var.gke_sa_name}@${var.gcp_project_id}.iam.gserviceaccount.com"
      spot        = true
    }

  ]


  node_pools_labels = {
    all = {}
     "${var.gke_default_nodepool_name}" = {
      core-node-pool = true
    }

    ephemeral-node-pool = {
      ephemeral-node-pool = true
    }

  }

  node_pools_taints = {
    all = []

    "${var.gke_default_nodepool_name}" = []
  }

}
