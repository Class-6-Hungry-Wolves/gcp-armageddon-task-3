# Public Routing
resource "google_compute_router" "windows-public" {
  name    = "us-east4-router"
  region  = "us-east4"
  network = google_compute_network.main.id
}

# Private Routing
resource "google_compute_router" "jourdan-router" {
  name                     = "jourdan-router"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
}
resource "google_compute_router" "joshua-router" {
  name                     = "joshua-router"
  region                   = "asia-northeast1"
  network                  = google_compute_network.main.id
}
resource "google_compute_router" "vito-router" {
  name                     = "vito-router"
  region                   = "southamerica-east1"
  network                  = google_compute_network.main.id
}
resource "google_compute_router" "yashua-router" {
  name                     = "yashua-router"
  region                   = "asia-east2"
  network                  = google_compute_network.main.id
}
resource "google_compute_router" "nick-router" {
  name                     = "nick-router"
  region                   = "europe-west2"
  network                  = google_compute_network.main.id
}
resource "google_compute_router" "xavier-router" {
  name = "xavier-router"
  region = "us-west1"
  network = google_compute_network.main.id
}
resource "google_compute_router" "law-router" {
  name    = "law-router"
  region  = "us-east1"
  network = google_compute_network.main.id
}