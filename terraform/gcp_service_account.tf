resource "google_service_account" "gke-sa" {
  depends_on = [google_project_service.iam]
  account_id = var.gke_sa_name
  display_name = "A Service Account for the Code Mental GKE Cluster"
}
