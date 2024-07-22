locals {
  name_prefix       = join("-", [var.project, var.env])
  public_cidr_block = "0.0.0.0/0"

  default_tags = {
    CreatedOnDate = timestamp()
    env_name      = var.env
    project_name  = var.project
    CreatedBy     = "Terraform"
  }
}
