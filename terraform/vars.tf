variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-west-2"
}

variable "private_key" {
  default = "mykey"
}

variable "public_key" {
  default = "mykey.pub"
}

# variable "gitlab_postgres_password" {
#   default = "supersecret"
# }

variable "availability_zones" {
  default = ["us-west-1a", "us-west-1b"]
}
