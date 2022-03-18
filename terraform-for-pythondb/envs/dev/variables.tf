variable "gcp_project_id" {
  description = "The name of the GCP project where the db and Cloud SQL Proxy will be created"
  type        = string
  default     = "myside-infrastructure"
}

variable "gcp_region" {
  description = "The GCP region where the db and Cloud SQL Proxy will be created"
  type        = string
  default     = "us-east1"
}