#Creating VPC Network
resource "google_compute_network" "private_vpc_network" {

  name = var.vpc-network-name
  project = var.project-name
  description = "VPC network By Nikhil Rawal"
  routing_mode = "GLOBAL"
  auto_create_subnetworks = false 
}


#Creating Subnet for VPC
resource "google_compute_subnetwork" "private_vpc_subnetwork"{
  name = var.subnetwork-name
  ip_cidr_range =  var.ip-range-for-private-subnetwork
  network= google_compute_network.private_vpc_network.id
  region= var.gcp-region

  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

  depends_on = [
    google_compute_network.private_vpc_network
  ]


}

