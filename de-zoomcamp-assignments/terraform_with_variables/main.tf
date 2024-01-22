# be sure to add a .terraform to .gitignore :)
terraform {
  required_providers {
    # from hashicorp site
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

# use env variable GOOGLE_CREDENTIALS to store key
# if you don't then you will get an error
# you can also set this as a variable
provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      # delete if hasn't finished multipart in a day
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo-dataset" {
  dataset_id                 = var.bq_dataset_name
  delete_contents_on_destroy = "true"
  location                   = var.location
}
