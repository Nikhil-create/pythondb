#--Project name
variable "project-name" {
    type= string
    description = "Project name"
}

#--IP range for subnet
variable "ip-range-for-private-subnetwork" {
  type= string 
  description = "IP for private subnetwork"
}

#--GCP Region
variable "gcp-region" {
  type= string 
  description = "GCP Region"
}

#--You Can Create Multiple VPCs
variable "name-map-private-vpc" {
  type= map(string)
  description="Name Map for VPC" 
}

#--REGIONAL or GLOBAL By default its REGIONAL
variable "regional-or-global" {
  type=string
  description = "By Default region-or-global is REGIONAL"
  default = "REGIONAL"
}

