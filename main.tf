terraform {
  # This block contains terraform settings. Be mindful when changind this - e.g. upgrading the 
  # version - on existing projects, as this may break the code.
  required_providers {
    google = {
      source = "hashicorp/google"
      # Be mindful if upgrading version!
      version = "4.51.0"
    }
  }
}

provider "google" {
  # multiple providers blocks are allowed (manage resources on different clouds)

  # Credentials:
  # To authenticate to GCP, you can:
  # 1. hardcode a path to a service account credentials file on your local machine
  # 2. add the path under GOOGLE_CREDENTIALS environmental variable
  # 3. authenticate with the gcloud cli. In that case, Terraform will use your privileges, which may
  # lead to inconsistent behaviours when different users run the code. 
  credentials = file("./keys/terraform-runner-gcp.json")

  project = "terraform-demo-414219"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}

# Add resources below. A resource might be (1) a physical component such as a 
# server, or (2) a logical resource, such as a Heroku application.

resource "google_storage_bucket" "demo-bucket" {
  # This is a GCP bucket with a auto-expiry date. Its name MUST be globally unique.
  name          = "terraform-demo-bucket-auto-expirying"
  location      = "EU"
  force_destroy = true

  lifecycle_rule {
    # autodelete after xx days
    condition {
      age = 3 
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    # if a file upload has not completed within xx days, abort upload
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }

}