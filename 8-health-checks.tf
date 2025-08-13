resource "google_compute_region_health_check" "jourdan-hc" {
  name                = "jourdan-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/jourdan-index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "vito-hc" {
  name                = "vito-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/vito-index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "joshua-hc" {
  name                = "joshua-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/joshua-index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "nick-hc" {
  name                = "nick-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/nick-index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "xavier-hc" {
  name                = "xavier-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/xavier-index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "law-hc" {
  name                = "law-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/law-index.html"
    port         = 80
  }
}

resource "google_compute_region_health_check" "yashua-hc" {
  name                = "yashua-hc"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/yashua-index.html"
    port         = 80
  }
}

