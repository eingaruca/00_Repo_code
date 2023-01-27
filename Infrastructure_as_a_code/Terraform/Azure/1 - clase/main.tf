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
    //alias = "prueba"
    //subscription_id = var.subscription_id
    //client_id = var.client_id
    //client_secret = var.client_secret
      
}

resource "azurerm_resource_group" "rg_eldo_terraform" {
  
  name = "rg_eldo_terraform_1"
  location = "eastus"

}

resource "azurerm_resource_group" "rg2" {
  
  name = "rg2"
  location = "eastus"
  #Dependencia implícita:
  #Estamos indicando que el tag lo recibirá del grupo anterior. 
  tags = {
    dependency = azurerm_resource_group.rg_eldo_terraform.name
  }
}

resource "azurerm_resource_group" "rg3" {
  
  name = "rg3"
  location = "eastus"
  #Dependencia explícita:
  #Se indica que depende "explícitamente" de rg2
  depends_on = [
    azurerm_resource_group.rg2
  ]

}

output "example-output" {

    value = azurerm_resource_group.rg_eldo_terraform.id
  
}


output "example-output-2" {

    value = azurerm_resource_group.rg_eldo_terraform.name
  
}



resource "azurerm_resource_group" "example_variable" {
    name = var.group_name
    location = "eastus"
    depends_on = [
      azurerm_resource_group.rg2
    ]
}

resource "azurerm_resource_group" "variable_interpolacion" {
    //Utilizar una variable para un nombre agregando más texto
    name = "rg_${var.group_name}"  
    location = "eastus"
}


#########################################
############# VARIABLES #################
#########################################

variable "group_name" {
    type = string
    //Si no se especifica "default" pide el valor por consola.
    //default = "grupo_variable"
    description = "Nombre del grupo de recursos"
    //Validaciones a la variable. Es decir, que tendrá que tener la condición de ser mayor de 4 caracteres
    validation {
      condition = length(var.group_name) > 4
      //El mensaje de error tiene que empezar con una mayúscula y terminar con un punto.
      error_message = "Nombre del grupo de recursos es muy corto."
    }
}



variable "image_id" {
    type = list(string)
    default = ["abc"]
}

/*
variable "docker_ports" {
    type = list(object({
        internal = number
        external = number
        protocol = string
    }))  

    default = [ {
      external = 5000
      internal = 4000
      protocol = "tcp"
    } ]
}
*/


#################################################
############# VARIABLES LOCALES #################
#################################################

locals {
  rg1 = azurerm_resource_group.variable_interpolacion.id
  tag = "development"
}

resource "azurerm_resource_group" "grupo_var_locals" {
    count = 3
    name = "rg_${var.group_name}_tercero${count.index}"
    location = "eastus"
    tags = {
      //para invocar la variable hay que usar "local", sin la S
      "team" = local.tag
    }
  
}


locals {
  names = {
      name01 = "name01"
      name02 = "name02"
      name03 = "name03"
  }
}
resource "azurerm_resource_group" "grupo_for_each" {
    for_each = local.names
    name = "rg_${each.value}"
    location = "eastus"
    tags = {
      "team" = local.tag
    }

}

locals {
  t_string = "Test"  
  t_number = 853.52
  t_bool = true
  t_list = [
      "element1",
      98765,
      true
  ]
  t_map = {
      type = "cliente"
  }

  //Crear tu propio tipo de variable
  customer = {
      name = "Eldo I",
      edad = 37,
      list_address = {
          home = "Calle 122"
          office = "3 A"
      }
  }

}
//Imprimir invocando la variable tipo lista dentro del objeto customer
output "c_phone" {
 value =  local.customer.list_address.home
}

//Oeraciones aritméticas
locals{
    t_sum = 1+1
    t_div = 1 / 1
    t_logical = 5 < 3 //Esto sería false
    t_logical2 = (5 < 3) && (3 < 2)

    //Asignación ¿ternaria?. Usamos la variable definida rg_variable líneas abajo de esta estructura
    min_rg_number = 3
     //esto quiere decir. Sin rg_variable es mayor a 0, "?" entonces, rg_num valdrá var.rg_name. Si no es así ":"
     //tendrá el valor de la variable local local.min_rg_number
    rg_num = var.rg_variable > 0 ? var.rg_variable : local.min_rg_number

}
variable "rg_variable"{
    type = number
}

resource "azurerm_resource_group" "rg_variable_operaciones_aritmeticas" {
    count = local.rg_num
    name = "rg_${count.index}"
    location = "eastus"
}

###########################################
### Ejemplo iteraciones

locals {
  nombres_list = ["Lilo","Eldo", "Dina"]
  mayus = [for i in local.nombres_list : upper(i) ]

  //substr(cadena,punto_de_inicio,cantidad_de_caracteres)
  a_name = [for i in local.nombres_list: i if substr(i,0,1) == "E" ]

}

output "mayusc" {
    value = local.mayus
}

output "filtrado" {
    value = local.a_name
}