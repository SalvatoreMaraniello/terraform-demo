variable "path_to_credentials" {
  default     = "./keys/terraform-runner-gcp.json"
  description = "Path to service account json key. The service account must have permissions to create/destroy all reasources used in the project."
}

variable "region" {
  default     = "europe-west2"
  description = "Default region for resources"
}

variable "zone" {
  default     = "europe-west2-a"
  description = "Default region-zone for resources"
}