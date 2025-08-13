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
  network = google_compute_network.main.name   # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2     
  name    = "private-allow-http"   

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["jourdan-web", "joshua-web", "vito-web", "nick-web", "xavier-web", "law-web", "yahshua-web"]      # Change target tag names to whatever you want
 }