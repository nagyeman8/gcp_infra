## DB-MAINT-JOB
resource "google_monitoring_alert_policy" "db_maint_job_failure" {
  display_name = var.display_name
  documentation {
    content   = "This alert policy indicates that \"db-maint-job\" job has failed to successfully execute."
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