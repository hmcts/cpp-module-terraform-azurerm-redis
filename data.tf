#data "azurerm_subnet" "delegated_subnet_id" {
#  count                = var.subnet_config.enable_data_lookup ? 1 : 0
#  name                 = var.subnet_config.subnet_name
#  virtual_network_name = var.subnet_config.virtual_network_name
#  resource_group_name  = var.subnet_config.resource_group_name
#}
