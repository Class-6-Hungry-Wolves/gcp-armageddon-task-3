resource "google_compute_firewall" "hq-admin-allow-rdp" {
  network = google_compute_network.main.name
  name    = "hq-admin-allow-rdp"

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["hq-admin-allow-rdp"]
}

resource "google_compute_firewall" "private-allow-http" {
  network = google_compute_network.main.name
  name    = "private-allow-http"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["jourdan-web", "joshua-web", "vito-web", "nick-web", "xavier-web", "law-web", "yahshua-web"]
}