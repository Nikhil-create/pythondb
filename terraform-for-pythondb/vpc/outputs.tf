output "project-name" {
  description = "Project Name"
  value= var.project-name
}

output "name-map-private-vpc" {
  description = "Virtual Private Cloud Names"
  value= var.name-map-private-vpc
}

output "regional-or-global" {
  description = "GCP Region REGIONAL/GLOBAL"
  value= var.regional-or-global
}

output "ip-range-for-private-subnetwork" {
  description = "IP for private subnetwork"
  value= var.ip-range-for-private-subnetwork
}

output "gcp-region" {
  description = "GCP Region"
  value= var.gcp-region
}

