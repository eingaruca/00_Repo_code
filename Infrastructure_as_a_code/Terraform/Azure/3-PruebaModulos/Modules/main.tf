resource "azurerm_virtual_network" "proyecto3_vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = var.localizacion
  name                = "vnet_${var.nombre_base}"
  resource_group_name = "rg_${var.nombre_base}"
}

