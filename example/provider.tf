terraform {

  experiments = [module_variable_optional_attrs]
}
provider "azurerm" {
  features {}
}
