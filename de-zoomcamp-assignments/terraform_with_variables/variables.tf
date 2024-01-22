variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-creds.json"
}

variable "project" {
  description = "Project name to use"
  default     = "aerobic-form-411600"
}

variable "region" {
  description = "Google cloud region to use"
  default     = "us-central1"
}

variable "location" {
  description = "Project location to use"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My storage bucket name"
  default     = "terraform-demo-bucket-dezoom1"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
