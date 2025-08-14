#Instance Template 
#Jourdan - subnet: us-central1
resource "google_compute_instance_template" "jourdan" {
  name        = "jourdan-template"
  description = "jourdan's VM template us-central1 subnet"
  region      = "us-central1"
  # or write region argument statically as
  # region = "" (optional if provider default is set)
  machine_type = "e2-medium"


  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations - connecting to us-central1 
  network_interface {
    subnetwork = google_compute_subnetwork.jourdan-linux-private-subnet.id
  }

   lifecycle {
    create_before_destroy = true
  }

  tags = ["jourdan-web"]

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}


# #Instance Template
# #Joshua - subnet: asia-northeast1
# resource "google_compute_region_instance_template" "joshua" {
#   name        = "joshua-template"
#   description = "joshua's VM template asia-northeast1 subnet"
#   region      = "asia-northeast1"
#   # or write region argument statically as
#   # region = "" (optional if provider default is set)
#   machine_type = "e2-medium"


#   # Create a new disk from an image and set as boot disk
#   disk {
#     source_image = "debian-cloud/debian-12"
#     boot         = true
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.joshua-linux-private-subnet.id
#     access_config {}
#   }

#    lifecycle {
#     create_before_destroy = true
#   }

#   # Install Webserver using file() function
#   metadata_startup_script = file("./startup.sh")
# }

#Instance Template
#Vito - subnet: southamerica-east1
resource "google_compute_instance_template" "vito" {
  name        = "vito-template"
  description = "vito's VM template southamerica-east1 subnet"
  region      = "southamerica-east1"
  # or write region argument statically as
  # region = "" (optional if provider default is set)
  machine_type = "e2-medium"


  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.vito-linux-private-subnet.id
    access_config {}
  }

   lifecycle {
    create_before_destroy = true
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}

# #Instance Template
# #Yashua - subnet: asia-east2
# resource "google_compute_region_instance_template" "yashua" {
#   name        = "yashua-template"
#   description = "yashua's VM template asia-east2 subnet"
#   region      = "asia-east2"
#   # or write region argument statically as
#   # region = "" (optional if provider default is set)
#   machine_type = "e2-medium"


#   # Create a new disk from an image and set as boot disk
#   disk {
#     source_image = "debian-cloud/debian-12"
#     boot         = true
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.yashua-linux-private-subnet.id
#     access_config {} #Allows external IP 
#   }

#    lifecycle {
#     create_before_destroy = true
#   }

#   # Install Webserver using file() function
#   metadata_startup_script = file("./startup.sh")
# }

# #Instance Template
# #Nick - subnet: europe-west2
# resource "google_compute_region_instance_template" "nick" {
#   name        = "nick-template"
#   description = "nick's VM template europe-west2 subnet"
#   region      = "europe-west2"
#   # or write region argument statically as
#   # region = "" (optional if provider default is set)
#   machine_type = "e2-medium"


#   # Create a new disk from an image and set as boot disk
#   disk {
#     source_image = "debian-cloud/debian-12"
#     boot         = true
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.nick-linux-private-subnet.id
#     access_config {}
#   }

#    lifecycle {
#     create_before_destroy = true
#   }

#   # Install Webserver using file() function
#   metadata_startup_script = file("./startup.sh")
# }

# #Instance Template
# #Xavier - subnet: us-west1
# resource "google_compute_region_instance_template" "xavier" {
#   name        = "xavier-template"
#   description = "xavier's VM template us-west1 subnet"
#   region      = "us-west1"
#   # or write region argument statically as
#   # region = "" (optional if provider default is set)
#   machine_type = "e2-medium"


#   # Create a new disk from an image and set as boot disk
#   disk {
#     source_image = "debian-cloud/debian-12"
#     boot         = true
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.xavier-linux-private-subnet.id
#     access_config {}
#   }

#    lifecycle {
#     create_before_destroy = true
#   }

#   # Install Webserver using file() function
#   metadata_startup_script = file("./startup.sh")
# }

# #Instance Template
# #Law - subnet: us-east1
# resource "google_compute_region_instance_template" "law" {
#   name        = "law-template"
#   description = "law's VM template us-east1 subnet"
#   region      = "us-east1"
#   # or write region argument statically as
#   # region = "" (optional if provider default is set)
#   machine_type = "e2-medium"


#   # Create a new disk from an image and set as boot disk
#   disk {
#     source_image = "debian-cloud/debian-12"
#     boot         = true
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.law-linux-private-subnet.id
#     access_config {}
#   }

#   # Install Webserver using file() function
#   metadata_startup_script = file("./startup.sh")
# }


