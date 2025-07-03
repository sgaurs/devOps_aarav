data "azurerm_subnet" "datatestsubnet" {
  name                 = var.test1subnetname
  resource_group_name  = var.test1rgname
  virtual_network_name = var.test1vnetname
}

data "azurerm_public_ip" "datatestpip" {
  name                = var.test1pipname
  resource_group_name = var.test1rgname
}

resource "azurerm_network_interface" "testnic" {
  name                = var.test1nicname
  resource_group_name = var.test1rgname
  location            = var.test1location

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = data.azurerm_subnet.datatestsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.datatestpip.id
  }
}
