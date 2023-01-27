variable "base_name" {
  type = string
  description = "Nombre base para crear los recursos"
}

variable "localizacion" {
  type = string
  description = "Localización de la máquina virtual"
}

variable "vnet_address" {
    type = string
    description = "Dirección de la vnet/subnet - SIN /16 NI /24"
    default = "192.168.0.0"
}

//variable "" {}
