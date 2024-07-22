## Creates Database
resource "google_sql_database" "database" {
  name     = var.database
  project  = var.project
  instance = google_sql_database_instance.database.name
}


## Creates SQL DB Instance 
resource "google_sql_database_instance" "database" {
  name                = var.database
  project             = var.project
  region              = var.region
  database_version    = var.database_version
  deletion_protection = var.deletion_protection
  root_password       = var.root_password
  
  depends_on = [
    google_service_networking_connection.connect-cloud-connection
  ]

  settings {
    tier = var.tier
    ip_configuration {
      # ipv4_enabled    = var.ipv4_enabled
      # private_network = var.network
      ssl_mode = var.ssl_mode
    }

    backup_configuration {
      enabled    = true   # Enable automated backups
      start_time = "8:00" # Set the start time for the daily backup window

    }
  }
}
