# Create an Azure Resource Group
resource "azurerm_resource_group" "pipeline_rg" {
  name     = "rg-pipeline-deployed-demo"
  location = "East US"
}

# Create a Virtual Network inside that Resource Group
resource "azurerm_virtual_network" "pipeline_vnet" {
  name                = "vnet-pipeline-demo"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.pipeline_rg.location
  resource_group_name = azurerm_resource_group.pipeline_rg.name
}


# Create a Storage Account inside the same Resource Group
resource "azurerm_storage_account" "pipeline_storage" {
  name                     = "storagepipelinedemo22"   
  resource_group_name      = azurerm_resource_group.pipeline_rg.name
  location                 = azurerm_resource_group.pipeline_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"                   
}