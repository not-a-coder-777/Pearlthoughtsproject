terraform {
  backend "s3" {
    bucket = "007truebucket"
    key    = "ecs/terraform.tfstate"
    region = "us-west-2"
  }
}
