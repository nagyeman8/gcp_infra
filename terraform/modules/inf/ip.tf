### INTERNET-PROTOCOLS (IPs)
resource "google_compute_address" "external1" {
  name         = var.external1
  address_type = "EXTERNAL"
  network_tier = var.network_tier
  region       = var.region
  # subnetwork   = var.subnet_name
  # network      = var.network
}


resource "google_compute_address" "external2" {
  name         = var.external2
  address_type = "EXTERNAL"
  network_tier = var.network_tier
  region       = var.region
  # subnetwork   = var.subnet_name
  # network      = var.network
}


resource "google_compute_address" "internal1" {
  name         = var.internal1
  address_type = "INTERNAL"
  region       = var.region
  # subnetwork   = var.subnet_name
  # network      = var.network
  # network_tier = var.network_tier

}


resource "google_compute_address" "internal2" {
  name         = var.internal2
  address_type = "INTERNAL"
  region       = var.region
  # subnetwork   = var.subnet_name
  # network      = var.network
  # network_tier = var.network_tier
}