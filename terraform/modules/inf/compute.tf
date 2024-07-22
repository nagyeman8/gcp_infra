### ARKANA-COMPUTE-INSTANCE: BASTION-HOST
resource "google_compute_instance" "default" {
  name                   = var.default
  project                = var.project
  machine_type           = var.machine_type
  deletion_protection    = var.deletion_protection
  metadata = {
    block-project-ssh    = var.block-project-ssh
    integrity-monitoring = var.integrity-monitoring
    vtpm                 = var.vtpm
  }

  tags = merge(local.default_tags, var.inf_override_tags, { Name = "${var.project}-${var.env}-rds-instance" })
  
  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
  
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet_name
  }

  scheduling {
    preemptible = var.preemptible
  }

  shielded_instance_config {
    enable_vtpm = var.enable_vtpm
  }
}