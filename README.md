# Azure Bastion Host Overlay Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-container-registry/azurerm/)

This Overlay terraform module can create a [Azure Bastion Host](https://docs.microsoft.com/en-us/azure/bastion) and manage related parameters (Private IPs, etc.) to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-management-hub/azurerm/latest).

## Contributing

If you want to contribute to this repository, feel free to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Resources Used

TBD

## Limitations

* none

## Overlay Module Usage for Bastion Host

```terraform
# Azurerm Provider configuration
provider "azurerm" {
  features {}
}

#---------------------------------------------------------
# Azure Region Lookup
#----------------------------------------------------------
module "mod_azure_region_lookup" {
  source  = "azurenoops/overlays-azregions-lookup/azurerm"
  version = "~> 1.0.0"

  azure_region = "eastus"
}
```


| <a name="output_sql_databases_id"></a> [sql\_databases\_id](#output\_sql\_databases\_id) | Map of the SQL Databases IDs |
| <a name="output_sql_elastic_pool"></a> [sql\_elastic\_pool](#output\_sql\_elastic\_pool) | SQL Elastic Pool |
| <a name="output_sql_elastic_pool_id"></a> [sql\_elastic\_pool\_id](#output\_sql\_elastic\_pool\_id) | ID of the SQL Elastic Pool |
| <a name="output_sql_server"></a> [sql\_server](#output\_sql\_server) | SQL Server |
| <a name="output_vulnerability_assessment_id"></a> [vulnerability\_assessment\_id](#output\_vulnerability\_assessment\_id) | ID of the MS SQL Server Vulnerability Assessment |
<!-- END_TF_DOCS -->
