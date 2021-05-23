
data "azurerm_resource_group" "existing-rg" {
  count    = var.create_new_resource_group ? 0 : 1
  name     = var.resource_group_name
}


resource "azurerm_resource_group" "new-rg" {
  count    = var.create_new_resource_group ? 1 : 0
  location = var.location
  name     = var.resource_group_name != "" ? "${upper(var.environment)}_${upper(var.resource_group_name)}" : "${upper(var.environment)}_${upper(var.app_name)}"
  tags     = var.tags
}

output "resource_group_name" {
  value    = var.create_new_resource_group ? azurerm_resource_group.new-rg[0].name : data.azurerm_resource_group.existing-rg[0].name
}