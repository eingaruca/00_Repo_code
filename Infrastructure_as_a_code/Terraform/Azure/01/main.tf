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

#Paso 1: Crear el Resource Group

resource "azurerm_resource_group" "Lab01" {
    location = var.localizacion
    name     = "rg_${var.base_name}"
}
#Paso 2 - Crear una VNET y SUBNET

resource "azurerm_virtual_network" "Lab01" {
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.Lab01.location
    name                = "vnet_${var.base_name}"
    resource_group_name = azurerm_resource_group.Lab01.name
    /*subnet {
        address_prefix = "[10.0.2.0/24]"
        //address_prefix = ["10.0.2.0/24"]
        name           = "${var.vnet_address}"
    }*/
}

resource "azurerm_subnet" "Lab01" {
  name                 = "${var.vnet_address}"
  resource_group_name  = azurerm_resource_group.Lab01.name
  virtual_network_name = azurerm_virtual_network.Lab01.name
  address_prefixes     = ["10.0.2.0/24"]
}

#Paso 3 - Crear NetworkInterface

resource "azurerm_network_interface" "Lab01" {
    location            = azurerm_resource_group.Lab01.location
    name                = "nic_vm-${var.base_name}"
    resource_group_name = azurerm_resource_group.Lab01.name
    //La ip dinámica y que pertenezca a la subnet creada.
    ip_configuration {
        name                          = "ipconfigx"
        private_ip_address_allocation = "Dynamic"
        //subnet_id = azurerm_virtual_network.Lab01.subnet.id
        subnet_id = azurerm_subnet.Lab01.id
    }
}

#Paso 4: Una vez creado el RG, Vnet, subnet y nic. Creamos la Virtual Machine

resource "azurerm_windows_virtual_machine" "Lab01" {
    location              = var.localizacion
    name                  = "vm-${var.base_name}"
    network_interface_ids = [azurerm_network_interface.Lab01.id,]
    resource_group_name   = azurerm_resource_group.Lab01.name
    size               = "Standard_F2"
    admin_username        = "student"
    admin_password        = "Pa55w0rd1234"
    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

    source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}