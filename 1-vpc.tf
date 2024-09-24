provider "aws" {
  region  = "eu-west-2"
  profile = "cloudy"
}

resource "aws_vpc" "custom-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "custom-vpc"
  }
}
