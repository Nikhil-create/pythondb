#--Creating VPC Network
resource "google_compute_network" "private_vpc_network" {

  for_each = var.name-map-private-vpc
  name = each.value 
  project = var.project-name
  description = "VPC network By Nikhil Rawal"
  routing_mode = var.regional-or-global
  auto_create_subnetworks = false
}


#--Creating Subnet for VPC
resource "google_compute_subnetwork" "private_vpc_subnetwork"{
  for_each = var.name-map-private-vpc
  name = "${each.key}-subnet"
  ip_cidr_range =  var.ip-range-for-private-subnetwork
  network= google_compute_network.private_vpc_network[each.key].id
  region= var.gcp-region
  project = var.project-name

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

#--Compute Router Encrypted Interconnect(DOUBT)
#--Compute Router Interconnect
resource "google_compute_router" "router" {
  for_each = var.name-map-private-vpc
  project = var.project-name
  name= "vpc-router-${each.key}"
  region= google_compute_subnetwork.private_vpc_subnetwork[each.key].region
  network= google_compute_network.private_vpc_network[each.key].id 

  #encrypted_interconnect_router = true

  bgp {
    asn = 64514
  }
}

#--Creating NAT for Secure Internet Connection
resource "google_compute_router_nat" "nat" {
  for_each = var.name-map-private-vpc
  project = var.project-name
  name= "vpc-nat-${each.key}"
  router= google_compute_router.router[each.key].name
  region= google_compute_router.router[each.key].region 
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

#--firewall for VPC
resource "google_compute_firewall" "icmp" {
  for_each = var.name-map-private-vpc
  project = var.project-name
  name    = "${each.key}-firewall-icmp"
  network= google_compute_network.private_vpc_network[each.key].id
  direction   = "INGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
     protocol = "tcp"
     ports    = ["22"]
   }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

  target_tags   = ["${var.each}-firewall-icmp"]
  source_ranges = ["0.0.0.0/0"]
}





