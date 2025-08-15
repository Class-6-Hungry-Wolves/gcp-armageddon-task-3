# public subnet
resource "google_compute_subnetwork" "windows-public-subnet" {
  name                     = "windows-public-subnet"
  ip_cidr_range            = "10.80.15.0/24"
  region                   = "us-east4"
  network                  = google_compute_network.main.id
  private_ip_google_access = false
}

# private subnets
resource "google_compute_subnetwork" "jourdan-linux-private-subnet" {
  name                     = "jourdan-linux-private-subnet"
  ip_cidr_range            = "10.80.35.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = false
}

resource "google_compute_subnetwork" "vito-linux-private-subnet" {
  name                     = "vito-linux-private-subnet"
  ip_cidr_range            = "10.80.45.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "joshua-linux-private-subnet" {
  name                     = "joshua-linux-private-subnet"
  ip_cidr_range            = "10.80.55.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
resource "google_compute_subnetwork" "nick-linux-private-subnet" {
  name                     = "nick-linux-private-subnet"
  ip_cidr_range            = "10.80.75.0/24"
  region                   = "europe-west2"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
resource "google_compute_subnetwork" "xavier-linux-private-subnet" {
  name                     = "xavier-linux-private-subnet"
  ip_cidr_range            = "10.80.115.0/24"
  region                   = "us-west1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "law-linux-private-subnet" {
  name                     = "law-linux-private-subnet"
  ip_cidr_range            = "10.80.125.0/24"
  region                   = "us-east1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "yashua-linux-private-subnet" {
  name                     = "yashua-linux-private-subnet"
  ip_cidr_range            = "10.80.135.0/24"
  region                   = "asia-east2"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "jourdan_proxy_subnet" {
  name          = "jourdan-proxy-subnet"
  ip_cidr_range = "10.69.0.0/24"
  region        = "us-central1"
  purpose       = "GLOBAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.main.id
}

resource "google_compute_subnetwork" "vito_proxy_subnet" {
  name          = "vito-linux-private-subnet"
  ip_cidr_range = "10.69.45.0/24"
  region        = "southamerica-east1"
  purpose       = "GLOBAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.main.id
}

resource "google_compute_subnetwork" "joshua_proxy_subnet" {
  name          = "jourdan-proxy-subnet"
  ip_cidr_range = "10.69.55.0/24"
  region        = "asia-northeast1"
  purpose       = "GLOBAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.main.id
}

resource "google_compute_subnetwork" "nick_proxy_subnet" {
  name          = "nick-proxy-subnet"
  ip_cidr_range = "10.69.75.0/24"
  region        = "europe-west2"
  purpose       = "GLOBAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.main.id
}

resource "google_compute_subnetwork" "xavier_proxy_subnet" {
  name          = "xavier-proxy-subnet"
  ip_cidr_range = "10.69.115.0/24"
  region        = "us-west1"
  purpose       = "GLOBAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.main.id
}

resource "google_compute_subnetwork" "law_proxy_subnet" {
  name          = "law-proxy-subnet"
  ip_cidr_range = "10.69.125.0/24"
  region        = "us-east1"
  purpose       = "GLOBAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.main.id
}

resource "google_compute_subnetwork" "yashua_proxy_subnet" {
  name          = "yashua-proxy-subnet"
  ip_cidr_range = "10.69.135.0/24"
  region        = "asia-east2"
  purpose       = "GLOBAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.main.id
}