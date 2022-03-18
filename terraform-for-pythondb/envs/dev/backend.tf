terraform {
  backend "gcs" {
    bucket = "pythondb-infrastructure-tf-state"
    prefix = "terraform/state"
  }
}