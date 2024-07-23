### SUBNETWORK 
resource "google_compute_subnetwork" "default" {
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.network
  stack_type    = var.stack_type
}