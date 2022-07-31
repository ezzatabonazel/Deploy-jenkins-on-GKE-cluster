resource "google_service_account" "service_account" {
  account_id   = "gke-node-sa"
  display_name = "gke-node-sa"
}