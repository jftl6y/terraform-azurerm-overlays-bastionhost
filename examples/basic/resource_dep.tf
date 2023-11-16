# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.


resource "azurerm_resource_group" "rg" {
  name     = "anoa-eus-dev-bas-dev-rg"
  location = module.mod_azure_region_lookup.location_cli
}

#-------------------------------------
# VNET Creation - Default is "true"
#-------------------------------------

resource "azurerm_virtual_network" "vnet" {
  name                = "bastion-vnet"
  location            = module.mod_azure_region_lookup.location_cli
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.100.0/24"]
}
