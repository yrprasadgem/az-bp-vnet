provider "azurerm" {
    version  = ">= 2.35.0"
    features {}
}

terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "rg-tftest-aksapp01"
    storage_account_name = "saitgrtftest01"
    container_name       = "cntrtftest01"
    key                  = "tfbp_vnet.tfstate"
  }
}