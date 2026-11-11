terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

variable "primary_region" {}
variable "secondary_region" {}
variable "cidr_block" {
  type    = list(string)
  default = ["10.23.0.0/24"]
}


provider "aws" {
  region = var.primary_region
}

resource "aws_vpc" "star" {
  cidr_block           = var.cidr_block[0]
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name    = "star"
    Project = "Labtest"
    Env     = "Staging"
  }
}
