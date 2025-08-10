resource "google_compute_firewall" "web_traffic" {
  name    = "jourdan-allow-web-traffic"                  # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2   
  network = google_compute_network.main.name                                         # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2   

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]         
  target_tags = ["test"]                                           # Do not change as you want to have connectivity to the internet
}