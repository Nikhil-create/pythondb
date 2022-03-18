resource "google_sql_database_instance" "main_primary" {
  name             = "${var.db-name}-instance"
  database_version = "POSTGRES_13"
  project = var.project-name

  # Don't allow terraform to delete this resource
  lifecycle {
    prevent_destroy = false
  }

  settings {
    tier              = var.instance_type
    availability_type = "REGIONAL"
    disk_size         = var.disk_size

    ip_configuration {
      ipv4_enabled    = false # Has to be false to get a private IP
      private_network = var.vpc_link
    }


    # Automated backups for the database
    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
      transaction_log_retention_days = 7
      location                       = "us"

      backup_retention_settings {
        retention_unit   = "COUNT"
        retained_backups = var.retained_backups
      }
    }

  }

  deletion_protection = false # Set this to true for PROD
}