# change this to be your backend, include your credentials file
# and the bucket you created in GCP
terraform {
  backend "gcs" {
    bucket      = "terraform-state-jourdan"
    prefix      = "terraform/state"
    credentials = "appdeploy-467712-21a6ba8a2566.json"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}