resource "google_project_iam_binding" "logWriter" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

resource "google_project_iam_binding" "metricWriter" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}


resource "google_project_iam_binding" "monitoring-viewer" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

resource "google_project_iam_binding" "resourceMetadata-writer" {
  project = var.project_id
  role    = "roles/stackdriver.resourceMetadata.writer"
  
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

resource "google_project_iam_binding" "objectViewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}