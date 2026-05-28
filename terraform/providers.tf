terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
backend "azurerm" {
    resource_group_name  = "rg-firstresource"
    storage_account_name = "storagergfirst13"
    container_name       = "tfstate"
  }
  
  }

provider "azurerm" {
  features {}
}