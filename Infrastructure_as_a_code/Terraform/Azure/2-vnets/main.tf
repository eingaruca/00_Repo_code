terraform {
    required_version =">=1.0"

    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.5.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "proyecto1" {
  name     = "rg_${var.nombre_recursos}"
  location = "${var.localizacion}"
}

resource "azurerm_virtual_network" "proyecto1_vnet" {
  name                = "vnet_${var.nombre_recursos}"
  location            = azurerm_resource_group.proyecto1.location
  resource_group_name = azurerm_resource_group.proyecto1.name
  address_space       = ["10.0.0.0/16"]
  
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    environment = "Production"
  }
}

