# jourdan NAT
resource "google_compute_router_nat" "jourdan-nat" {
  name   = "jourdan-nat"
  router = google_compute_router.jourdan-router.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.jourdan-linux-private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.jourdan-nat.self_link]
}
resource "google_compute_address" "jourdan-nat" {
  name         = "jourdan-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-central1"
}

# joshua NAT
resource "google_compute_router_nat" "joshua-nat" {
  name   = "joshua-nat"
  router = google_compute_router.joshua-router.name
  region = "asia-northeast1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.joshua-linux-private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.joshua-nat.self_link]
}
resource "google_compute_address" "joshua-nat" {
  name         = "joshua-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "asia-northeast1"
}

# vito NAT
resource "google_compute_router_nat" "vito-nat" {
  name   = "vito-nat"
  router = google_compute_router.vito-router.name
  region = "southamerica-east1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.vito-linux-private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.vito-nat.self_link]
}
resource "google_compute_address" "vito-nat" {
  name         = "vito-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "southamerica-east1"
}
# yashua NAT
resource "google_compute_router_nat" "yashua-nat" {
  name   = "yashua-nat"
  router = google_compute_router.yashua-router.name
  region = "asia-east2"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.yashua-linux-private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.yashua-nat.self_link]
}
resource "google_compute_address" "yashua-nat" {
  name         = "yashua-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "asia-east2"
}
# nick NAT
resource "google_compute_router_nat" "nick-nat" {
  name   = "nick-nat"
  router = google_compute_router.nick-router.name
  region = "europe-west2"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.nick-linux-private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nick-nat.self_link]
}
resource "google_compute_address" "nick-nat" {
  name         = "nick-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "europe-west2"
}

# Xavier NAT
resource "google_compute_router_nat" "xavier-nat" {
  name   = "xavier-nat"
  router = google_compute_router.xavier-router.name
  region = "us-west1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.xavier-linux-private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.xavier-nat.self_link]
}
resource "google_compute_address" "xavier-nat" {
  name         = "xavier-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-west1"
}
# law NAT
resource "google_compute_router_nat" "law-nat" {
  name   = "law-nat"
  router = google_compute_router.law-router.name
  region = "us-east1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.law-linux-private-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.law-nat.self_link]
}
resource "google_compute_address" "law-nat" {
  name         = "law-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-east1"
}