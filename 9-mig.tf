# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones
# Datasource: Get a list of Google Compute zones that are UP in a region
data "google_compute_zones" "available-1" {
  status = "UP"
  region = "us-central1" 
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "jourdan-app" { # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.jourdan-nat]          # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "jourdan-app-mig"
  base_instance_name = "jourdan-app" # Change base instance name app to name of your choosing
  region             = "us-central1" # (optional if provider default is set)cle

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available-1.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_instance_template.jourdan.id
  }

  # Set a port to be used by backend service
  named_port {
    name = "webserver"
    port = 80
  }

  #Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.jourdan-hc.id # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
}


data "google_compute_zones" "available-2" {
  status = "UP"
  region = "southamerica-east1" 
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "vito-app" { # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.vito-nat]          # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "vito-app-mig"
  base_instance_name = "vito-app"           # Change base instance name app to name of your choosing
  region             = "southamerica-east1" # (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available-2.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_instance_template.vito.id
  }

  # Set a port to be used by backend service
  named_port {
    name = "webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.vito-hc.id # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
}


# data "google_compute_zones" "available-3" {
#   status = "UP"
#   region = "asia-northeast1" 
# }


# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "joshua-app" { # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
#   depends_on         = [google_compute_router_nat.joshua-nat]          # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
#   name               = "joshua-app-mig"
#   base_instance_name = "joshua-app"      # Change base instance name app to name of your choosing
#   region             = "asia-northeast1" # (optional if provider default is set)

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available-3.names

#   # Instance Template argument for MIG
#   version {
#     instance_template = google_compute_region_instance_template.joshua.id
#   }

#   # Set a port to be used by backend service
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.joshua-hc.id # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
#     initial_delay_sec = 300
#   }
# }


# data "google_compute_zones" "available-4" {
#   status = "UP"
#   region = "europe-west2" 
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "nick-app" { # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
#   depends_on         = [google_compute_router_nat.nick-nat]          # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
#   name               = "nick-app-mig"
#   base_instance_name = "nick-app"     # Change base instance name app to name of your choosing
#   region             = "europe-west2" # (optional if provider default is set)

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available-4.names

#   # Instance Template argument for MIG
#   version {
#     instance_template = google_compute_region_instance_template.nick.id
#   }

#   # Set a port to be used by backend service
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.nick-hc.id # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
#     initial_delay_sec = 300
#   }
# }

# data "google_compute_zones" "available-5" {
#   status = "UP"
#   region = "us-west1" 
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "xavier-app" { # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
#   depends_on         = [google_compute_router_nat.xavier-nat]          # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
#   name               = "xavier-app-mig"
#   base_instance_name = "xavier-app" # Change base instance name app to name of your choosing
#   region             = "us-west1"   # (optional if provider default is set)

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available-5.names

#   # Instance Template argument for MIG
#   version {
#     instance_template = google_compute_region_instance_template.xavier.id
#   }

#   # Set a port to be used by backend service
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.xavier-hc.id # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
#     initial_delay_sec = 300
#   }
# }



# data "google_compute_zones" "available-6" {
#   status = "UP"
#   region = "us-east1" 
# }


# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "law-app" { # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
#   depends_on         = [google_compute_router_nat.law-nat]          # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
#   name               = "law-app-mig"
#   base_instance_name = "law-app"  # Change base instance name app to name of your choosing
#   region             = "us-east1" # (optional if provider default is set)

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available-6.names

#   # Instance Template argument for MIG
#   version {
#     instance_template = google_compute_region_instance_template.law.id
#   }

#   # Set a port to be used by backend service
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.law-hc.id # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
#     initial_delay_sec = 300
#   }
# }


# data "google_compute_zones" "available-7" {
#   status = "UP"
#   region = "asia-east2" 
# }



# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "yahshua-app" { # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
#   depends_on         = [google_compute_router_nat.yashua-nat]           # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
#   name               = "yahshua-app-mig"
#   base_instance_name = "yahshua-app" # Change base instance name app to name of your choosing
#   region             = "asia-east2"  # (optional if provider default is set)

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available-7.names

#   # Instance Template argument for MIG
#   version {
#     instance_template = google_compute_region_instance_template.yashua.id
#   }

#   # Set a port to be used by backend service
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.yashua-hc.id # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
#     initial_delay_sec = 300
#   }
# }
