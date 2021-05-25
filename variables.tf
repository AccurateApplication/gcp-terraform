variable "gcp_auth_file" {
  description = "Authentication file"
  # sensitive   = true # is the file contents or filepath considered sensitive? I guess path
  type = string

}

variable "project_id" {
  type      = string
  sensitive = true
}

variable "region" {
  default = "europe-west1"
  type    = string

}

variable "zone" {
  default = "europe-west1-b"
  type    = string

}

variable "project_name" {
  description = "My first GCP project"
  default     = " Lucas First Project "
  type        = string
}

variable "vpc_subnet_pub" {
  type    = string
  default = "10.132.0.0/20"
}
