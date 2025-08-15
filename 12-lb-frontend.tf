# Client -> Static IP -> Fwd Rule -> HTTP Proxy -> URL Map (URL Map chooses backend service)


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
# Resource: Reserve Regional Static IP Address
resource "google_compute_global_address" "lb" {
  name = "lb-static-ip"
  # region = "" (optional if provider default is set)
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule
# Resource: Regional Forwarding Rule
# Defines how incoming traffic is forwarded to the load balancer proxy based on port and protocol
resource "google_compute_global_forwarding_rule" "jourdan_lb" {
  name       = "jourdan-lb-forwarding-rule"
  depends_on = [google_compute_subnetwork.jourdan_proxy_subnet]

  # We are sending traffic to a HTTP Proxy as this is an application LB
  target = google_compute_target_http_proxy.lb.self_link

  # Listen for traffic on Port 80 using TCP
  port_range  = "80"
  ip_protocol = "TCP"
  #   ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)

  # Regional LB have forwaring rules that are scoped to a VPC
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.jourdan-linux-private-subnet.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
}

resource "google_compute_global_forwarding_rule" "vito_lb" {
  name       = "vito-lb-forwarding-rule"
  depends_on = [google_compute_subnetwork.vito_proxy_subnet]

  # We are sending traffic to a HTTP Proxy as this is an application LB
  target = google_compute_target_http_proxy.lb.self_link

  # Listen for traffic on Port 80 using TCP
  port_range  = "80"
  ip_protocol = "TCP"
  #   ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)

  # Regional LB have forwaring rules that are scoped to a VPC
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.vito-linux-private-subnet.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
}

resource "google_compute_global_forwarding_rule" "joshua_lb" {
  name       = "joshua-lb-forwarding-rule"
  depends_on = [google_compute_subnetwork.joshua_proxy_subnet]

  # We are sending traffic to a HTTP Proxy as this is an application LB
  target = google_compute_target_http_proxy.lb.self_link

  # Listen for traffic on Port 80 using TCP
  port_range  = "80"
  ip_protocol = "TCP"
  #   ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)

  # Regional LB have forwaring rules that are scoped to a VPC
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.joshua-linux-private-subnet.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
}

resource "google_compute_global_forwarding_rule" "nick_lb" {
  name       = "nick-lb-forwarding-rule"
  depends_on = [google_compute_subnetwork.nick_proxy_subnet]

  # We are sending traffic to a HTTP Proxy as this is an application LB
  target = google_compute_target_http_proxy.lb.self_link

  # Listen for traffic on Port 80 using TCP
  port_range  = "80"
  ip_protocol = "TCP"
  #   ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)

  # Regional LB have forwaring rules that are scoped to a VPC
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.nick-linux-private-subnet.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
}

resource "google_compute_global_forwarding_rule" "xavier_lb" {
  name       = "xavier-forwarding-rule"
  depends_on = [google_compute_subnetwork.xavier_proxy_subnet]

  # We are sending traffic to a HTTP Proxy as this is an application LB
  target = google_compute_target_http_proxy.lb.self_link

  # Listen for traffic on Port 80 using TCP
  port_range  = "80"
  ip_protocol = "TCP"
  #   ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)

  # Regional LB have forwaring rules that are scoped to a VPC
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.xavier-linux-private-subnet.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
}

resource "google_compute_global_forwarding_rule" "law_lb" {
  name       = "law-lb-forwarding-rule"
  depends_on = [google_compute_subnetwork.law_proxy_subnet]

  # We are sending traffic to a HTTP Proxy as this is an application LB
  target = google_compute_target_http_proxy.lb.self_link

  # Listen for traffic on Port 80 using TCP
  port_range  = "80"
  ip_protocol = "TCP"
  #   ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)

  # Regional LB have forwaring rules that are scoped to a VPC
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.law-linux-private-subnet.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
}

resource "google_compute_global_forwarding_rule" "yashua_lb" {
  name       = "yashua-lb-forwarding-rule"
  depends_on = [google_compute_subnetwork.yashua_proxy_subnet]

  # We are sending traffic to a HTTP Proxy as this is an application LB
  target = google_compute_target_http_proxy.lb.self_link

  # Listen for traffic on Port 80 using TCP
  port_range  = "80"
  ip_protocol = "TCP"
  #   ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)

  # Regional LB have forwaring rules that are scoped to a VPC
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.yashua-linux-private-subnet.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_target_http_proxy
# Resource: Regional HTTP Proxy
# Acts as the HTTP frontend proxy that uses the URL map to decide where to send traffic.
# This resource's behavior takes place in the proxy only subnet
resource "google_compute_target_http_proxy" "lb" {
  name = "lb-http-proxy"
  # region = "" (optional if provider default is set)

  # URL Map is declared below
  url_map = google_compute_url_map.lb.self_link
}


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_url_map
# Resource: Regional URL Map
# Maps incoming HTTP request URLs to backend services.
# We only use one backend service here so we simply set a default service and have the URL map route all traffic to it.
resource "google_compute_url_map" "lb" {
  name = "lb-url-map"

  # region = "us-central1"
  default_service = google_compute_backend_service.lb.self_link
}