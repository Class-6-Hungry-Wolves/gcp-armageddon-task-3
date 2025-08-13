# change this to be your backend, include your credentials file
# and the bucket you created in GCP
terraform {
  backend "gcs" {
    bucket      = "gcp-armageddon-bucket-for-tfstate12345"
    prefix      = "terraform/state"
    credentials = "lizzoandme-00273d54b785.json"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}