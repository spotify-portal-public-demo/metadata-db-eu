terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.30.0"
    }
  }

  backend "gcs" {
    bucket = "spotify-portal-public-demo-terraform"
    prefix = "metadata-db-eu"
  }
}

provider "google" {
  project = "spotify-portal-public-demo"
  region  = "europe-west1"
}

resource "google_sql_database_instance" "metadata-db-eu" {
  name = "metadata-db-eu"

  database_version = "POSTGRES_16"
  root_password    = var.db_password

  settings {
    edition = "ENTERPRISE"
    tier    = "db-f1-micro"
  }

  deletion_protection = true
}
