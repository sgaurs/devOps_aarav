resource "azurerm_subnet" "testsubnet" {
  name                 = var.test1subnetname
  resource_group_name  = var.test1rgname
  address_prefixes     = var.test1addressprefixes
  virtual_network_name = var.test1vnetname
}
