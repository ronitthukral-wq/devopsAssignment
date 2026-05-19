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