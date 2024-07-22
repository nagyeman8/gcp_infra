locals {
  name_prefix = join("-", [var.project, var.env_name])

  default_tags = {
    CreatedOnDate = timestamp()
    env_name      = var.env_name
    project_name  = var.project
    CreatedBy     = "Terraform"
  }
}