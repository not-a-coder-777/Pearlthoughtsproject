provider "aws" {
  region = "us-east-1"
}

variable "app_name" {
  default = "hello-world-app"
}

variable "app_port" {
  default = 3000
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}

variable "aws_region" {
  default = "us-east-1"
}
