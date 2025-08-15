resource "google_compute_region_health_check" "jourdan-hc" {
  name               = "jourdan-hc"
  region             = "us-central1"
  timeout_sec        = 5
  check_interval_sec = 5
  http_health_check {
    port = 80
  }
}

resource "google_compute_region_health_check" "vito-hc" {
  name               = "vito-hc"
  region             = "southamerica-east1"
  timeout_sec        = 5
  check_interval_sec = 5
  http_health_check {
    port = 80
  }
}

resource "google_compute_region_health_check" "joshua-hc" {
  name               = "joshua-hc"
  region             = "asia-northeast1"
  timeout_sec        = 5
  check_interval_sec = 5
  http_health_check {
    port = 80
  }
}

resource "google_compute_region_health_check" "nick-hc" {
  name               = "nick-hc"
  region             = "europe-west2"
  timeout_sec        = 5
  check_interval_sec = 5
  http_health_check {
    port = 80
  }
}

resource "google_compute_region_health_check" "xavier-hc" {
  name               = "xavier-hc"
  region             = "us-west1"
  timeout_sec        = 5
  check_interval_sec = 5
  http_health_check {
    port = 80
  }
}

resource "google_compute_region_health_check" "law-hc" {
  name               = "law-hc"
  region             = "us-east1"
  timeout_sec        = 5
  check_interval_sec = 5
  http_health_check {
    port = 80
  }
}

resource "google_compute_region_health_check" "yashua-hc" {
  name               = "yashua-hc"
  region             = "asia-east2"
  timeout_sec        = 5
  check_interval_sec = 5
  http_health_check {
    port = 80
  }
}

