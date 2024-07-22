################################
### ARTIFACT REGISTRY SCRIPT ###
################################

resource "google_artifact_registry_repository" "repository" {
  location      = var.location
  repository_id = var.repository_id
  description   = "Docker Repository for Servers"
  format        = var.format
  project       = var.project

  docker_config {
    immutable_tags = var.immutable_tags
  }

  terraform_labels = merge(local.default_tags, var.inf_override_tags, { Name = "${var.project}-${var.env}-rds-instance" })
  
  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}


# resource "google_artifact_registry_repository" "arkana-web" {
#   location       = var.location
#   repository_id  = var.repository_id
#   description    = "Docker Repository for arkana web"
#   format         = var.format
#   docker_config {
#   immutable_tags = var.immutable_tags
#   }
# }