terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

variable "primary_region" {
  default = "us-east-1"
}
variable "cidr_block" {
  type    = list(string)
  default = ["10.23.0.0/24"]
}


provider "aws" {
  region = var.primary_region
}

resource "aws_s3_bucket" "sample" {
  bucket = "cliser-storage-1234567"

  tags = {
    Name    = "cliser-storage-1234567"
    Project = "cliser"
    Env     = "Staging"
  }
}
