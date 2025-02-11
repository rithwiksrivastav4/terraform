terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "9e901b2e-4481-4cb1-8138-901ef133ab32"
}
