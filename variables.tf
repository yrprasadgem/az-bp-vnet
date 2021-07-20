
variable "vnet_address_space" {
    description = "vnet_address_space"
    default = []
}

variable "location" {
    default = "southeastasia"
}
###############################################################################
# HCF Blueprint-specific Variables
###############################################################################

#variable "vnet_ddos_enable" {
#  type  = bool
#}

variable "vnet_tags" {
  type = map(any)

  default = {
    tag_business_unit = "tftest-sg"
    tag_env           = "ms"
    tag_app_owner     = "tftest"
  }
}

variable "vnet_resource_group_name" {
  type  = string
}

variable "vnet_name" {
  type  = string
}

variable "azure_regions_map" {
  type = map(any)

  default = {
    az1 = "southeast asia"
    az2 = "east asia"
  }
}

#variable "vnet_network_mananger_name" {
#  type = string
#}

#variable "ddos_plan_name" {
#  type  = string
#}

