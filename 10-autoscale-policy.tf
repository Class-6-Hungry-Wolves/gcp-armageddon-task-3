resource "google_compute_region_autoscaler" "joshua-autoscaler-region" {
  name   = "joshua-autoscaler-region"
  region = "asia-northeast1"
  target = google_compute_region_instance_group_manager.joshua-app.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_region_autoscaler" "vito-autoscaler-region" {
  name   = "vito-autoscaler-region"
  region = "southamerica-east1"
  target = google_compute_region_instance_group_manager.vito-app.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}
resource "google_compute_region_autoscaler" "yashua-autoscaler-region" {
  name   = "yashua-autoscaler-region"
  region = "asia-east2"
  target = google_compute_region_instance_group_manager.yashua-app.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_region_autoscaler" "xavier-autoscaler-region" {
  name   = "xavier-autoscaler-region"
  region = "us-west1"
  target = google_compute_region_instance_group_manager.xavier-app.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_region_autoscaler" "law-autoscaler-region" {
  name   = "law-autoscaler-region"
  region = "us-east1"
  target = google_compute_region_instance_group_manager.law-app.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_region_autoscaler" "jourdan-autoscaler-region" {
  name   = "jourdan-autoscaler-region"
  region = "us-central1"
  target = google_compute_region_instance_group_manager.jourdan-app.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}
resource "google_compute_region_autoscaler" "nick-autoscaler-region" {
  name   = "nick-autoscaler-region"
  region = "europe-west2"
  target = google_compute_region_instance_group_manager.nick-app.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}
