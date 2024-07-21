#######################################
### CLOUD RUN ALERT POLICY (SERVER) ###
#######################################


## SERVER CPU UTILIZATION
resource "google_monitoring_alert_policy" "server_cpu_util" {
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
        per_series_aligner = "ALIGN_PERCENTILE_99"
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels
}


## SERVER MEMORY UTILIZATION
resource "google_monitoring_alert_policy" "server_memory_util" {
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
        per_series_aligner = "ALIGN_PERCENTILE_99"
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels
}


## SERVER NETWORK TRAFFIC
resource "google_monitoring_alert_policy" "server_network_traffic" {
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
        per_series_aligner = "ALIGN_RATE"
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels
}


## SERVER CONTAINER CALLED EXIT
resource "google_monitoring_alert_policy" "server_container_called_exit" {
  display_name = var.display_name
  documentation {
    content = "This alert policy indicates that \"Server-Prod\" container called exit"
  }
  combiner     = "OR"
  enabled = "true"

  conditions {
    display_name = var.display_name

    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_EQ"
      duration = "60s"
    }
  }
  notification_channels = var.notification_channels

  user_labels = {
    severity ="error"
  }
}


## SERVER CONTAINER FAILED STARTUP
resource "google_monitoring_alert_policy" "server_container_failed_startup" {
  display_name = var.display_name
  documentation {
    content = "This alert policy indicates that \"Server\" container failed to start"
  }

  combiner     = "OR"
  enabled = "true"

  conditions {
    display_name = var.display_name

    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_EQ"
      duration = "60s"
    }
  }
  notification_channels = var.notification_channels

  user_labels = {
    severity ="error"
  }
}


## SERVER REQUEST COUNT
resource "google_monitoring_alert_policy" "server_request_count" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_GT"
      threshold_value = "20"
      aggregations {
        alignment_period   = "120s"
        per_series_aligner = "ALIGN_RATE"
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels
}


## SERVER REQUEST CONCURRENCY
resource "google_monitoring_alert_policy" "server_request_concurrency" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      comparison = "COMPARISON_GT"
      threshold_value = "20"
      aggregations {
        alignment_period   = "120s"
        per_series_aligner = "ALIGN_PERCENTILE_50"
      }
      duration = "120s"
    }
  }
  notification_channels = var.notification_channels
}


## SERVER UPTIME CHECK
resource "google_monitoring_alert_policy" "uptime_failure" {
  display_name = var.display_name
  combiner     = "OR"

  conditions {
    display_name = var.display_name
    condition_threshold {
      filter     = var.filter
      trigger {
        count = "1"
      }
      comparison = "COMPARISON_GT"
      threshold_value = "70"
      aggregations {
        alignment_period   = "60S"
        per_series_aligner = "ALIGN_FRACTION_TRUE"
      }
      duration = "60s"
    }
  }
  notification_channels = var.notification_channels
}
