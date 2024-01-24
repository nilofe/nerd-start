terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }

  required_version = ">=1.1.0"
}

provider "azurerm" {
  # Configuration options
  features {}
}


