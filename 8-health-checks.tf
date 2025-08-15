resource "google_compute_region_health_check" "jourdan-hc" {
  name                = "jourdan-hc"
  region              = "us-central1"
  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "vito-hc" {
  name                = "vito-hc"
  region              = "southamerica-east1"
  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "joshua-hc" {
  name                = "joshua-hc"
  region              = "asia-northeast1"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "nick-hc" {
  name                = "nick-hc"
  region              = "europe-west2"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "xavier-hc" {
  name                = "xavier-hc"
  region              = "us-west1"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "law-hc" {
  name                = "law-hc"
  region              = "us-east1"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "yashua-hc" {
  name                = "yashua-hc"
  region              = "asia-east2"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}

