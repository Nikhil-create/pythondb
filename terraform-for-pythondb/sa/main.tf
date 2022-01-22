#--GCP Service Account
resource "google_service_account" "sa-name" {
  for_each = var.name
  account_id = "${each.key}-account"
  display_name = "service-accounts-terraform"
  project = var.project-name
}

#--GCP IAM Member
resource "google_project_iam_member" "owner-binding" {
  for_each = var.name
  project = var.project-name
  role    = each.value
  member  = "serviceAccount:${google_service_account.sa-name[each.key].email}"
}