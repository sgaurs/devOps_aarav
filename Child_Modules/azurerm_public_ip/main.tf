resource "azurerm_public_ip" "testpip" {
  name                = var.test1pipname
  location            = var.test1location
  resource_group_name = var.test1rgname
  allocation_method   = var.test1allocationmethod
  sku                 = var.test1sku
}
