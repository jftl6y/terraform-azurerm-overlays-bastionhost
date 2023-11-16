# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#------------------------------------------------------------------
# Azure Bastion Host Lock configuration - Default (required). 
#------------------------------------------------------------------
resource "azurerm_management_lock" "bastion_level_lock" {
  count      = var.enable_resource_locks ? 1 : 0
  name       = "${local.bastion_name}-${var.lock_level}-lock"
  scope      = azurerm_bastion_host.main.id
  lock_level = var.lock_level
  notes      = "Azure Bastion Host '${local.bastion_name}' is locked with '${var.lock_level}' level."
}

#------------------------------------------------------------------
# Azure Bastion Host PIP Lock configuration - Default (required). 
#------------------------------------------------------------------
resource "azurerm_management_lock" "bastion_pip_level_lock" {
  count      = var.enable_resource_locks ? 1 : 0
  name       = "${local.bastion_pip_name}-${var.lock_level}-lock"
  scope      = azurerm_public_ip.pip.id
  lock_level = var.lock_level
  notes      = "Azure Bastion Host PIP '${local.bastion_pip_name}' is locked with '${var.lock_level}' level."
}
