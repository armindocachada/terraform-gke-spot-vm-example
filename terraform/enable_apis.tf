
resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
}

resource "google_project_service" "cloud-resources-manager" {
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "compute" {
  depends_on = [google_project_service.cloud-resources-manager]
  service = "compute.googleapis.com"
}

resource "google_project_service" "kubernetes" {
  service = "container.googleapis.com"
}

