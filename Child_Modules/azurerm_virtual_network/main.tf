resource "azurerm_virtual_network" "testvnet" {
  name                = var.test1vnetname
  location            = var.test1location
  resource_group_name = var.test1rgname
  address_space       = var.test1addressspace
}
