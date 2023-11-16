# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, module.mod_bastion_rg.*.resource_group_name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, module.mod_bastion_rg.*.resource_group_location, [""]), 0)
  bastion_name        = coalesce(var.custom_bastion_name, data.azurenoopsutils_resource_name.bastion.result)
  bastion_pip_name    = coalesce(var.custom_public_ip_name, data.azurenoopsutils_resource_name.bastion_pip.result)
}
