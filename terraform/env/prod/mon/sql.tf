################################
### CLOUD SQL ALERT POLICIES ###
################################


## CLOUD SQL CPU UTILIZATION
resource "google_monitoring_alert_policy" "cloud_SQL_cpu_util" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_GT"
      threshold_value = "70"
      aggregations {
        alignment_period   = "120s"
        # per_series_aligner = var.per_series_aligner
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels  
}

  
## CLOUD SQL DISK UTILIZATION
resource "google_monitoring_alert_policy" "cloud_SQL_disk_util" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_GT"
      threshold_value = "70"
      aggregations {
        alignment_period   = "120s"
        # per_series_aligner = var.per_series_aligner
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels
}


## CLOUD SQL MEMORY UTILIZATION
resource "google_monitoring_alert_policy" "cloud_SQL_memory_util" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_GT"
      threshold_value = "70"
      aggregations {
        alignment_period   = "120s"
        # per_series_aligner = var.per_series_aligner
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels
}

  
## CLOUD SQL CONNECTION COUNT 80%
resource "google_monitoring_alert_policy" "cloud_SQL_connection_count" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_GT"
      threshold_value = "26214"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MAX"
      }
      duration = "60s"
    }
  }
  notification_channels = var.notification_channels
}

  
## CLOUD SQL QUERY EXECUTION COUNT
resource "google_monitoring_alert_policy" "cloud_SQL_query_execution" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_GT"
      threshold_value = "70"
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MAX"
      }
      duration = "300s"
    }
  }
  notification_channels = var.notification_channels
}


## CLOUD SQL SERVER DOWN
resource "google_monitoring_alert_policy" "cloud_SQL_server_down" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_LT"
      threshold_value = "70"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
      duration = "60s"
    }
  }
  notification_channels = var.notification_channels
}