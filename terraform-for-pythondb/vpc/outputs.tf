output "project-name" {
  description = "Project Name"
  value= var.project-name
}

output "vpc-name" {
    description = "Virtual Private Cloud Name"
    value = var.vpc-network-name
}

output "subnetwork-name" {
    description= "SubNetwork Name"
    value = var.subnetwork-name
}

output "ip-range-for-private-subnetwork" {
  description = "IP for private subnetwork"
  value= var.ip-range-for-private-subnetwork
}

output "gcp-region" {
  description = "GCP Region"
  value= var.gcp-region
}

