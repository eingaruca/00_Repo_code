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

#Crear Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg_unit4"
  location = "eastus"
}

#Primera vnet
resource "azurerm_virtual_network" "CoreServicesVnet" {
  name                = "CoreServicesVnet"
  location = "eastus"
  //location            = azurerm_resource_group.proyecto1.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.20.0.0/16"]
  
  #Subnets
  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.20.0.0/27"
  }

  subnet {
    name           = "SharedServicesSubnet"
    address_prefix = "10.20.10.0/24"
  }

  subnet {
    name           = "DatabaseSubnet"
    address_prefix = "10.20.20.0/24"
  }

  subnet {
    name           = "PublicWebServiceSubnet"
    address_prefix = "10.20.30.0/24"
  }

}

#Segunda vnet
resource "azurerm_virtual_network" "ManufacturingVnet" {
  name                = "ManufacturingVnet"
  location = "westeurope"
  //location            = azurerm_resource_group.proyecto1.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.30.0.0/16"]
  
  subnet {
    name           = "ManufacturingSystemSubnet"
    address_prefix = "10.30.10.0/24"
  }

  subnet {
    name           = "SensorSubnet1"
    address_prefix = "10.30.20.0/24"
  }

  subnet {
    name           = "SensorSubnet2"
    address_prefix = "10.30.21.0/24"
  }

  subnet {
    name           = "SensorSubnet3"
    address_prefix = "10.30.22.0/24"
  }

}

#Tercera vnet
resource "azurerm_virtual_network" "ResearchVnet" {
  name                = "ResearchVnet"
  location = "southeastasia"
  //location            = azurerm_resource_group.proyecto1.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.40.0.0/16"]
  
  subnet {
    name           = "ResearchSystemSubnet"
    address_prefix = "10.40.0.0/24"
  }

}

###########################################################################
###########################################################################

resource "azurerm_private_dns_zone" "dnszone" {
  name                = "emic.dnszone.com"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "CoreServicesVnetLink" {
  name                  = "CoreServicesVnetLink"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dnszone.name
  virtual_network_id    = azurerm_virtual_network.CoreServicesVnet.id
  registration_enabled = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "ManufacturingVnetLink" {
  name                  = "ManufacturingVnetLink"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dnszone.name
  virtual_network_id    = azurerm_virtual_network.ManufacturingVnet.id
  registration_enabled = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "ResearchVnetLink" {
  name                  = "ResearchVnetLink"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.dnszone.name
  virtual_network_id    = azurerm_virtual_network.ResearchVnet.id
  registration_enabled = true
}