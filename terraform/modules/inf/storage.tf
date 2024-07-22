### ARKANA-STORAGE-BUCKETS
resource "google_storage_bucket" "image_storage_bucket_name" {
  name                        = var.image_storage_bucket_name
  project                     = var.project
  location                    = var.region
  force_destroy               = var.force_destroy
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  labels = {
    environment               = var.environment
  }
}


resource "google_storage_bucket" "image_storage_bucket1" {
  name                        = var.image_storage_bucket1
  location                    = var.region
  project                     = var.project
  force_destroy               = var.force_destroy
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  labels = {
    environment               = var.environment
  }
}