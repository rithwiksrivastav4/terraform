terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
    null = {
      source  = "hashicorp/null" # or your chosen namespace
      version = "~> 3.1"         # Replace with a suitable version constraint
    }
  }
}

