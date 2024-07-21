#############################################
### CLOUD RUN ALERT POLICIES (ARKANA-WEB) ###
#############################################


## WEB CPU UTILIZATION
resource "google_monitoring_alert_policy" "web_cpu_util" {
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


## WEB MEMORY UTILIZATION
resource "google_monitoring_alert_policy" "web_memory_util" {
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


## WEB NETWORK TRAFFIC
resource "google_monitoring_alert_policy" "web_network_traffic" {
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


## WEB CONTAINER CALLED EXIT
resource "google_monitoring_alert_policy" "web_container_called_exit" {
  display_name = var.display_name
  documentation {
    content = "This alert policy indicates that \"Web\" container called exit"
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


## WEB CONTAINER FAILED STARTUP
resource "google_monitoring_alert_policy" "web_container_failed_startup" {
  display_name = var.display_name
  documentation {
    content = "This alert policy indicates that \"Web\" container failed to start"
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


## WEB REQUEST COUNT
resource "google_monitoring_alert_policy" "web_request_count" {
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


## WEB REQUEST CONCURRENCY 
resource "google_monitoring_alert_policy" "web_request_concurrency" {
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


## WEB UPTIME CHECK
resource "google_monitoring_alert_policy" "web_uptime_failure" {
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
      # threshold_value = "1"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_FRACTION_TRUE"
      }
      duration = "60s"
    }
  }
  notification_channels = var.notification_channels
}