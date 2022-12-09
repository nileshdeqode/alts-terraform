variable "create" {
  description = "Control toggle to control creation of resources"
  type        = string
  default     = false
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
  default     = []
}

# If no values specified, this defaults to Azure DNS
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}

variable "nsg_ids" {
  description = "A map of subnet name to Network Security Group IDs"
  type        = map(string)
  default     = {}
}

variable "route_tables_ids" {
  description = "A map of subnet name to Route table ids"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  default     = {}
}

variable "vnet_location" {
  description = "The location of the vnet to create. Defaults to the location of the resource group."
  type        = string
}

# variable "vnet_location_short" {
#   description = "Short string for Azure location."
#   type        = string
# }

variable "create_peering_connection" {
  description = "Control toggle to control creation of resources for vnet peering connection"
  type        = string
  default     = false
}

variable "vnet_src_resource_group_name" {
  description = "Resource group name src vnet to peer"
  type        = string
  default     = ""
}

variable "peering_src_name" {
  description = "Source vnet peer name"
  type        = string
  default     = ""
}

variable "vnet_src_name" {
  description = "Source vnet name to peer"
  type        = string
  default     = ""
}

variable "peer_src_provider_alias" {
  description = "Provider alias for source subscription"
  type        = string
  default     = ""
}

variable "vnet_src_id" {
  description = "ID of the src vnet to peer"
  type        = string
  default     = ""
}

variable "allow_virtual_src_network_access" {
  description = "Option allow_virtual_network_access for the src vnet to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access"
  type        = bool
  default     = true
}

variable "allow_forwarded_src_traffic" {
  description = "Option allow_forwarded_traffic for the src vnet to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic"
  type        = bool
  default     = true
}

variable "allow_gateway_src_transit" {
  description = "Option allow_gateway_transit for the src vnet to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit"
  type        = bool
  default     = true
}

variable "use_remote_src_gateway" {
  description = "Option use_remote_gateway for the src vnet to peer. Controls if remote gateways can be used on the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#use_remote_gateways"
  type        = bool
  default     = false
}

variable "vnet_dest_id" {
  description = "ID of the dest vnet to peer"
  type        = string
  default     = ""
}
variable "nsg_rules" {
  description = "nsg rules"
  #type = any
  default = []
}

variable "subnets" {
  description = "Subnets attached to the virtual network"
  type        = list(any)
  default     = []
}

variable "create_log_workspace" {
  description = "Control toggle to control creation of log workspace resources"
  type        = string
  default     = false
}

variable "log_analytics_workspace_enable_iis_logs" {
  description = "Specifies if IIS logs should be collected for linked Virtual Machines"
  type        = bool
  default     = false
}

variable "logs_storage_account_enable_archiving" {
  description = "Enable/disable blob archiving lifecycle"
  type        = bool
  default     = true
}