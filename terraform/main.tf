# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.scenario_suffix}-dev"
  location = var.location
}

# 2. Storage Account (required for Function App)
resource "azurerm_storage_account" "sa" {
  name                     = "safunc${var.scenario_suffix}${replace(var.project_name, "-", "")}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# 3. App Service Plan - Y1 Consumption (Free Tier Eligible)
resource "azurerm_service_plan" "asp" {
  name                = "asp-${var.project_name}-${var.scenario_suffix}-dev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

# 4. Linux Function App
resource "azurerm_linux_function_app" "func" {
  name                       = "app-${var.project_name}-${var.scenario_suffix}-dev"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  service_plan_id            = azurerm_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  https_only                 = true

  site_config {
    always_on = false
    application_stack {
      node_version = "18"
    }
  }
}