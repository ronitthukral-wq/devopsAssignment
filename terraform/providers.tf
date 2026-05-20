terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Keeps syntax standard and stable
    }
  }
  backend "azurerm" {} # Intentionally blank: Configured at runtime by the DevOps agent
}

provider "azurerm" {
  features {}
}