variable "gcp_auth_file" {
  type = string
  description = "Authentication file"
  sensitive = true

}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
  default = "europe-west1"

}

variable "zone" {
  type = string
  default = "europe-west1-b"

}

variable "project_name" {
  description = "My first GCP project"
  default = " Lucas First Project "
  type        = string
}

variable "vpc_subnet_pub" {
  default = "10.132.0.0/20"
  type = string
}
