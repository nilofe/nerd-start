terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "loki-tf"

    workspaces {
      name = "gcp-"
    }
  }
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

resource "azurerm_resource_group" "rg" {
  name     = "myTestResourceGroupMany"
  location = "westus2"
}

