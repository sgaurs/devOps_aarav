data "azurerm_client_config" "testaccount" {}

resource "azurerm_key_vault" "testkeyvault" {
  name                        = var.test1keyvaultname
  location                    = var.test1keyvaultlocation
  resource_group_name         = var.test1rgname
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.testaccount.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.testaccount.tenant_id
    object_id = data.azurerm_client_config.testaccount.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "testkvsecretun" {
  name         = var.test1keyvaultsecretunname
  value        = var.test1kvunvalue
  key_vault_id = azurerm_key_vault.testkeyvault.id
}

resource "azurerm_key_vault_secret" "testkvsecretpw" {
  name         = var.test1keyvaultsecretpwname
  value        = var.test1kvpwvalue
  key_vault_id = azurerm_key_vault.testkeyvault.id
}
