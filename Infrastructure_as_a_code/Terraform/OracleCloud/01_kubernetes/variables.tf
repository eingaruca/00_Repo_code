#Login
variable "config_file_profile" {
  default = "DEFAULT"
}

variable "auth" {
  default = "SecurityToken"
}

#Resources location
variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaazbfitcg6462z3tnctvy5nnyp4h6dwv6ujq7h6o56hu2fro4wybya"
}

variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaagn57cx532npt744sixovs2onuazscob67rzlqyirkzuplzvdehza"
}

variable "region" {
  default = "eu-madrid-1"
}

variable "compartment_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaartbyvu3ygxljnpsumzuybdorkhixmxtrkoffwje6v5aqeeulz6sa"
}

#Cluster
variable "cluster_name"{
    default ="my_cluster"
}

variable "vcn_id"{
    default ="ocid1.vcn.oc1.eu-madrid-1.amaaaaaatqvamxaawoy53rfcxe5ukjho6dajk2yukdtodnd5tdv75isftbcq"
}

variable "subnet_id"{
    default ="ocid1.subnet.oc1.eu-madrid-1.aaaaaaaalnpabgx6xipeswekc7ko6x6p5t5evsqd2tenmrs2tjqxmp62yf2a"
}

# https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm#vmshapes__vm-standard
variable "node_shape"{
    default ="VM.Standard3.Flex"
}

# https://docs.oracle.com/en-us/iaas/images/image/60a97912-3445-4208-8c11-490f38581ded/
variable "image_ocid"{
    default = "ocid1.image.oc1.eu-madrid-1.aaaaaaaab342qihocaqffg5jw5pbfwjwbo372rtorppscxixc63fkmtdbzqq"
}

variable "availability_domain"{
    default = "xxje:EU-MADRID-1-AD-1"
}

variable "list_subnets"{
    default = "ocid1.subnet.oc1.eu-madrid-1.aaaaaaaalnpabgx6xipeswekc7ko6x6p5t5evsqd2tenmrs2tjqxmp62yf2a"
}