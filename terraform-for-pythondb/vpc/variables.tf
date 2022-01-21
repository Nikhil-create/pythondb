variable "project-name" {
    type= string
    description = "Project name"
}

variable "vpc-network-name" {
    type= string
    description = "VPC Network name"
}

variable "subnetwork-name" {
    type= string
    description= "SubNetwork Name"
  
}

variable "ip-range-for-private-subnetwork" {
  type= string 
  description = "IP for private subnetwork"
}

variable "gcp-region" {
  type= string 
  description = "GCP Region"
}