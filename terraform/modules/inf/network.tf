### VPC NETWORK
resource "google_compute_network" "default" {
  name                    = var.vpc_network
  project                 = var.project
  auto_create_subnetworks = var.auto_create_subnetworks
}


### CLOUD NAT GATEWAY 
resource "google_compute_router_nat" "nat" {
  name                               = var.nat
  router                             = var.router
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  log_config {
    enable = var.enable
    filter = var.filter
  }
}


### CLOUD ROUTER
resource "google_compute_router" "router" {
  name    = var.router
  region  = var.region
  network = var.network

  # bgp {
  #   asn = 64514
  # }
}


### VPC PEERING
resource "google_compute_network_peering" "peering" {
  name         = var.peering
  network      = var.network2
  peer_network = var.peer_network2
}


### VPC-CONNECTOR
resource "google_vpc_access_connector" "connector" {
  name          = var.connector
  ip_cidr_range = var.ipv4_range
  network       = var.network
  machine_type  = var.machine_type
  min_instances = var.min_instances
  max_instances = var.max_instances
}


## Private Service Connect
resource "google_service_networking_connection" "connect-cloud-connection" {
  network                 = var.network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["vpc-network-ip-range"]
}


## IP address range for Private Connect
resource "google_compute_address" "default" {
  name          = var.default
  project       = var.project
  purpose       = var.purpose
  address_type  = var.address_type
  address       = var.address
  prefix_length = var.prefix_length
  network       = var.network
  ip_version    = var.ip_version
}