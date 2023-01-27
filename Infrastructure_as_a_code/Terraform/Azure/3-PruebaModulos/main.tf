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

resource "azurerm_resource_group" "lab03_rg" {
  location = var.localizacion
  name     = "rg_${var.nombre_base}"
}

module "vnet" {
  source = "./Modules"
  localizacion = azurerm_resource_group.lab03_rg.location
  nombre_base = "vnet_${var.nombre_base}"
}

