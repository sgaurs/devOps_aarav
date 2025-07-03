data "azurerm_network_interface" "datatestnic" {
  name                = var.datatest1nicname
  resource_group_name = var.test1rgname
}

data "azurerm_key_vault" "testdatakv" {
  name                = var.test1keyvaultname
  resource_group_name = var.test1rgname
}

data "azurerm_key_vault_secret" "testvmusername" {
  name         = var.vmusername
  key_vault_id = data.azurerm_key_vault.testdatakv.id
}

data "azurerm_key_vault_secret" "testvmpassword" {
  name         = var.vmuserpassword
  key_vault_id = data.azurerm_key_vault.testdatakv.id
}

resource "azurerm_linux_virtual_machine" "testvm" {
  name                            = var.test1vmname
  resource_group_name             = var.test1rgname
  location                        = var.test1location
  size                            = var.vmsize
  disable_password_authentication = "false"
  network_interface_ids           = [data.azurerm_network_interface.datatestnic.id]
  admin_username                  = data.azurerm_key_vault_secret.testvmusername.value
  admin_password                  = data.azurerm_key_vault_secret.testvmpassword.value

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    sku       = var.image_sku
    version   = var.image_version
    offer     = var.image_offer
  }

  
}
