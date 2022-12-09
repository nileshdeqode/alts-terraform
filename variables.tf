############################
### Common Variables
############################
variable "environment" {
  description = "Project environment"
  type        = string
  default     = "TS"
}

variable "region" {
  description = "Azure region to use"
  type        = string
  default     = "US North Central"
}

variable "tags" {
  description = "Custom tags to add"
  type        = map(string)
  default     = {}
}

####################################
## Resource Group
####################################
variable "resource_groups" {
  description = "Resource group configuration map"
  type = map(object({
    resource_group_name   = optional(string)
    create_resource_group = optional(bool)
    location              = optional(string)
  }))
  default = {}
}

#########################################
## Virutal Network
#########################################
variable "vnets" {
  description = "Virtual network configuration map"
  type = map(object({
    create_resource_group            = optional(bool)
    create_vnet                      = optional(bool)
    vnet_name                        = optional(string)
    resource_group_name              = optional(string)
    address_space                    = list(string)
    subnets                          = optional(list(any))
  }))
  default = {}
}