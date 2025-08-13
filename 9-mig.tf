# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones
# Datasource: Get a list of Google Compute zones that are UP in a region
data "google_compute_zones" "available" {
  status = "UP"
  # region = "" (optional if provider default is set)
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "jourdan-app" {      # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.jourdan-nat]              # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "jourdan-app-mig"
  base_instance_name = "jourdan-app"                                         # Change base instance name app to name of your choosing
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_region_instance_template.jourdan.id 
  }

  # Set a port to be used by backend service
  named_port {
    name = "jourdan-webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.jourdan-hc.id     # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
} 


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "vito-app" {      # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.vito-nat]              # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "vito-app-mig"
  base_instance_name = "vito-app"                                         # Change base instance name app to name of your choosing
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_region_instance_template.vito.id 
  }

  # Set a port to be used by backend service
  named_port {
    name = "vito-webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.vito-hc.id     # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
} 

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "joshua-app" {      # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.joshua-nat]              # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "joshua-app-mig"
  base_instance_name = "joshua-app"                                         # Change base instance name app to name of your choosing
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_region_instance_template.joshua.id 
  }

  # Set a port to be used by backend service
  named_port {
    name = "joshua-webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.joshua-hc.id     # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
} 

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "nick-app" {      # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.nick-nat]              # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "nick-app-mig"
  base_instance_name = "nick-app"                                         # Change base instance name app to name of your choosing
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_region_instance_template.nick.id
  }

  # Set a port to be used by backend service
  named_port {
    name = "nick-webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.nick-hc.id     # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
} 

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "xavier-app" {      # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.xavier-nat]              # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "xavier-app-mig"
  base_instance_name = "xavier-app"                                         # Change base instance name app to name of your choosing
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_region_instance_template.xavier.id 
  }

  # Set a port to be used by backend service
  named_port {
    name = "xavier-webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.xavier-hc.id     # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
} 

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "law-app" {      # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.law-nat]              # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "law-app-mig"
  base_instance_name = "law-app"                                         # Change base instance name app to name of your choosing
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_region_instance_template.law.id
  }

  # Set a port to be used by backend service
  named_port {
    name = "law-webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.law-hc.id     # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
} 
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# Resource: Managed Instance Group
resource "google_compute_region_instance_group_manager" "yahshua-app" {      # Change name of resource google_compute_region_instance_group_manager "app" to a name of your choosing, preferably correlating to region of subnetwork i.e. "virginia-app"
  depends_on         = [google_compute_router_nat.yashua-nat]              # Change iowa part of google_compute_router_nat.iowa to name of nat you created in file 5
  name               = "yahshua-app-mig"
  base_instance_name = "yahshua-app"                                         # Change base instance name app to name of your choosing
  #region = "" (optional if provider default is set)

  # Compute zones to be used for VM creation
  distribution_policy_zones = data.google_compute_zones.available.names

  # Instance Template argument for MIG
  version {
    instance_template = google_compute_region_instance_template.yashua.id
  }

  # Set a port to be used by backend service
  named_port {
    name = "yahshua-webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_region_health_check.yashua-hc.id     # Change app part of google_compute_region_health_check.app.id to the name of your healthcheck(s) in file 8
    initial_delay_sec = 300
  }
}