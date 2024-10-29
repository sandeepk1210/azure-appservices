# Random string for unique web app name
resource "random_string" "unique" {
  length  = 4
  special = false
  upper   = false
}

# App Service Plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

# Web App
resource "azurerm_linux_web_app" "web_app" {
  name                = "${var.web_app_name}-${lower(random_string.unique.result)}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  # Specify the runtime stack for the Web App
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  # Use this block for setting the runtime
  site_config {}
}
