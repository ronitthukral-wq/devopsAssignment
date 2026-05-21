# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}"
  location = var.location
}

# 2. Modern App Service Plan (No longer uses deprecated sku blocks)
resource "azurerm_service_plan" "asp" {
  name                = "asp-${var.project_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "F1" # Practice-level free tier
}

# 3. Modern Linux Web Application 
resource "azurerm_linux_web_app" "app" {
  name                = "app-${var.project_name}" 
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = true

  site_config {
    always_on = false 
    application_stack {
      dotnet_version = "6.0" 
    }
  }
}