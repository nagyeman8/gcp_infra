### DB-RUN-MIGRATIONS 
resource "google_monitoring_alert_policy" "db_run_migrations_failure" {
  display_name = var.display_name
  documentation {
    content   = "This alert policy indicates that \"db-run-migrations\" job has failed to successfully execute."
  }
  
  combiner = "OR"
  enabled = "true"

  conditions {
    display_name = var.display_name
    
      condition_threshold {
      filter = var.filter
      comparison = "COMPARISON_EQ"
      duration = "60s"
    }
  }

  notification_channels = var.notification_channels

  user_labels = {
    severity ="error"
  }
}