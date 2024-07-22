### BIGQUERY SCRIPTS ###
resource "google_bigquery_dataset" "connect" {
  dataset_id                  = var.dataset_id
  friendly_name               = var.friendly_name
  description                 = "This is a table representing Data in Big Query"
  location                    = var.location
  default_table_expiration_ms = var.default_table_expiration_ms
  project                     = var.project
  labels                      = {
  env                         = var.env
  }

  etag = merge(local.default_tags, var.inf_override_tags, { Name = "${var.project}-${var.env}-rds-instance" })
  
  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}


resource "google_bigquery_table" "table" {
  dataset_id           = google_bigquery_dataset.connect.dataset_id
  table_id             = var.table_id
  deletion_protection  = var.deletion_protection
  project = var.project
  depends_on           = [ google_bigquery_dataset.connect ]

  time_partitioning {
    type = var.type
  }

  labels = {
    env = var.env
  }

  schema = <<EOF
  [
   {
   "name": "id",
   "type": "STRING",
   "mode": "REQUIRED",
   "description": "UUID row identifier"
   },

   {
   "name": "event_date",
   "type": "DATETIME",
   "mode": "REQUIRED",
   "description": "Date and time of event"
   },

   {
   "name": "event_type",
   "type": "STRING",
   "mode": "REQUIRED",
   "description": "Endpoint path accessed, or other type of event"
   }, 

   {
   "name": "data_type",
   "type": "STRING",
   "mode": "NULLABLE",
   "description": "Data type e.g. \"acc_image_id\", \"acc_id\", \"patient_id\""
   },

   {
   "name": "data_object",
   "type": "JSON",
   "mode": "NULLABLE",
   "description": "The value associated with the data_object"
   },

   {
   "name": "refmd_id",
   "type": "STRING",
   "mode": "NULLABLE",
   "description": "The Arkana referring physician id who performed the action, if applicable"
   },

   {
   "name": "user_id",
   "type": "STRING",
   "mode": "NULLABLE",
   "description": "Firebase UID who performed the action, if applicable"
   }
  ]
  EOF
}