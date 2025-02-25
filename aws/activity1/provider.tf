terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key               = "AKIAYQNJSQS7JKHRZ4FF"
  secret_key               = "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"
  # Configuration options
}