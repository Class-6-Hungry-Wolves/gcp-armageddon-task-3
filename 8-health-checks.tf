resource "google_compute_region_health_check" "jourdan-hc" {
  name                = "jourdan-hc"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port         = 80
  }
}

resource "google_compute_region_health_check" "vito-hc" {
  name                = "vito-hc"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port         = 80
  }
}

resource "google_compute_region_health_check" "joshua-hc" {
  name                = "joshua-hc"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port         = 80
  }
}

resource "google_compute_region_health_check" "nick-hc" {
  name                = "nick-hc"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port         = 80
  }
}

resource "google_compute_region_health_check" "xavier-hc" {
  name                = "xavier-hc"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port         = 80
  }
}

resource "google_compute_region_health_check" "law-hc" {
  name                = "law-hc"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port         = 80
  }
}

resource "google_compute_region_health_check" "yashua-hc" {
  name                = "yashua-hc"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port         = 80
  }
}

