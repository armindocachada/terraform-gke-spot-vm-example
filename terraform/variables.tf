

variable "gcp_credentials" {
    type = string
    description = "Location of service account for GCP"
    default = "../../gcp-infrastructure/terraform/creds/gcp-service-account.json"
}

variable "gcp_project_id" {
    type = string
    description ="GCP Project id"
}

variable "gcp_region" {
    type = string
    description = "GCP Region"
}

variable "gcp_zone" {
    type = string
    description = "GCP Zone"
}

variable "gke_regional" {
    default = false
    description = "GCP Region"
}

variable "gke_cluster_name" {
    type = string
    description = "GKE Cluster name"
}

variable "gke_zones" {
    type = list(string)
    description = "List of zones for the GKE Cluster"
}

variable "gke_network" {
    type = string
    description = "VPC Network name"
}

variable "gke_subnetwork" {
    type = string
    description = "VPC Sub Network name"
}

variable "gke_default_nodepool_name" {
  type = string
  description = "GKE Default node pool name"
}

variable "gke_sa_name" {
  type = string
  description = "GKE Service Account Name"
}