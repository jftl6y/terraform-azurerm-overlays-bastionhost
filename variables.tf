# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###########################
# Global Configuration   ##
###########################

variable "environment" {
  description = "The Terraform backend environment e.g. public or usgovernment"
  type        = string
  default     = null
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
}

variable "org_name" {
  description = "A name for the organization. It defaults to anoa."
  type        = string
  default     = "anoa"
}

variable "workload_name" {
  description = "A name for the workload. It defaults to acr."
  type        = string
  default     = "acr"
}

variable "deploy_environment" {
  description = "The environment to deploy. It defaults to dev."
  type        = string
  default     = "dev"
}

#######################
# RG Configuration   ##
#######################

variable "create_bastion_resource_group" {
  description = "Controls if the resource group should be created. If set to false, the resource group name must be provided. Default is false."
  type        = bool
  default     = false
}

variable "custom_resource_group_name" {
  description = "The name of the custom resource group to create. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables."
  type        = string
  default     = null
}

variable "use_location_short_name" {
  description = "Use short location name for resources naming (ie eastus -> eus). Default is true. If set to false, the full cli location name will be used. if custom naming is set, this variable will be ignored."
  type        = bool
  default     = true
}

variable "existing_resource_group_name" {
  description = "The name of the existing resource group to use. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables."
  type        = string
  default     = null
}

#####################################
# Private Endpoint Configuration   ##
#####################################

variable "enable_private_endpoint" {
  description = "Manages a Private Endpoint to Azure Container Registry. Default is false."
  default     = false
}

variable "existing_private_dns_zone" {
  description = "Name of the existing private DNS zone"
  default     = null
}

variable "private_subnet_address_prefix" {
  description = "The name of the subnet for private endpoints"
  default     = null
}

variable "create_private_endpoint_subnet" {
  description = "Controls if the subnet should be created. If set to false, the subnet name must be provided. Default is false."
  type        = bool
  default     = false
}

variable "existing_private_subnet_name" {
  description = "Name of the existing subnet for the private endpoint"
  default     = null
}

variable "virtual_network_name" {
  description = "Name of the virtual network for the private endpoint"
  default     = null
}

#################################
# Bastion Host Configuration
#################################

variable "bastion_sku" {
  description = "The SKU of the bastion host. Accepted values are Basic and Standard. Defaults to Basic"
  default     = "Basic"
}

variable "subnet_bastion_cidr" {
  description = "CIDR range for the dedicated Bastion subnet. Must be a range available in the VNet."
  type        = string
  default     = "10.0.100.160/27"
}

variable "subnet_bastion_service_endpoints" {
  description = "List of service endpoints to be enabled on the Bastion Host subnet."
  type        = list(string)
  default     = []
}

variable "network_security_group_bastion_id" {
  description = " The id of the network security group to associate with the Bastion Host subnet."
  type        = string
  default     = " "
}

variable "bastion_host_nsg_inbound_rules" {
  type        = list(map(string))
  default     = []
  description = "List of objects that represent the configuration of each inbound rule."
  # inbound_rules = [
  #   {
  #     name                       = ""
  #     priority                   = ""
  #     access                     = ""
  #     protocol                   = ""
  #     source_address_prefix      = ""
  #     source_port_range          = ""
  #     destination_address_prefix = ""
  #     destination_port_range     = ""
  #     description                = ""
  #   }
  # ]
}

variable "bastion_host_nsg_outbound_rules" {
  type        = list(map(string))
  default     = []
  description = "List of objects that represent the configuration of each outbound rule."
  # outbound_rules = [
  #   {
  #     name                       = ""
  #     priority                   = ""
  #     access                     = ""
  #     protocol                   = ""
  #     source_address_prefix      = ""
  #     source_port_range          = ""
  #     destination_address_prefix = ""
  #     destination_port_range     = ""
  #     description                = ""
  #   }
  # ]
}

variable "domain_name_label" {
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system"
  default     = null
}

variable "enable_copy_paste" {
  description = "Is Copy/Paste feature enabled for the Bastion Host?"
  default     = true
}

variable "enable_file_copy" {
  description = "Is File Copy feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`"
  default     = false
}

variable "bastion_host_sku" {
  description = "The SKU of the Bastion Host. Accepted values are `Basic` and `Standard`"
  default     = "Basic"
}

variable "enable_ip_connect" {
  description = "Is IP Connect feature enabled for the Bastion Host?"
  default     = false
}

variable "enable_shareable_link" {
  description = "Is Shareable Link feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`"
  default     = false
}

variable "enable_tunneling" {
  description = "Is Tunneling feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`"
  default     = false
}

variable "scale_units" {
  description = "The number of scale units which to provision the Bastion Host. Possible values are between `2` and `50`."
  type        = number
  default     = 2
  validation {
    condition     = var.scale_units >= 2 && var.scale_units <= 50
    error_message = "The scale_units must be between 2 and 50."
  }
}

################################## 
# Bastion PIP Configuration    ###
##################################

variable "public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  default     = "Standard"
}

variable "public_ip_zones" {
  description = "Zones for public IP attached to the Bastion Host. Can be `null` if no zone distpatch."
  type        = list(number)
  default     = [1, 2, 3]
}

