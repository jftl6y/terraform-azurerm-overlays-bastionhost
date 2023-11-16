#---------------------------------------------------------
# Azure Region Lookup
#----------------------------------------------------------
module "mod_azure_region_lookup" {
  source  = "azurenoops/overlays-azregions-lookup/azurerm"
  version = "~> 1.0.0"

  azure_region = "eastus"
}

module "mod_bastion_host" {
  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet
  ]
  source = "../.."
  #source  = "azurenoops/overlays-bastionhost/azurerm"
  #version = "x.x.x"

  # By default, this module will create a resource group and 
  # provide a name for an existing resource group. If you wish 
  # to use an existing resource group, change the option 
  # to "create_sql_resource_group = false." The location of the group 
  # will remain the same if you use the current resource.
  existing_resource_group_name = azurerm_resource_group.rg.name
  location                     = module.mod_azure_region_lookup.location_cli
  environment                  = "public"
  deploy_environment           = "dev"
  org_name                     = "anoa"
  workload_name                = "dev-bas"

  // Bastion Host Settings
  virtual_network_name             = azurerm_virtual_network.vnet.name
  subnet_bastion_cidr              = "10.0.100.160/27"
  subnet_bastion_service_endpoints = []

  # Tags for Azure Resources
  add_tags = {
    example = "basic"
  }
}

