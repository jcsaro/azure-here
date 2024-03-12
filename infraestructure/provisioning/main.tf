module "vnet" {
  source          = "../modules/terraform-azurerm-vnet"
  location        = var.location
  short_company   = var.short_company
  short_cloud     = var.short_cloud
  short_env       = var.short_env
  short_project   = var.short_project
  resource_number = "01"
}

module "postgresql" {
  source          = "../modules/terraform-azurerm-postgresql"
  location        = var.location
  short_company   = var.short_company
  short_cloud     = var.short_cloud
  short_env       = var.short_env
  short_project   = var.short_project
  resource_number = "01"
  rg_reference = {
    name     = module.rgshare.rgName
    location = module.rgshare.rgLocation
  }
}

module "postgresql" {
  source          = "../modules/terraform-azurerm-postgresql"
  location        = var.location
  short_company   = var.short_company
  short_cloud     = var.short_cloud
  short_env       = var.short_env
  short_project   = var.short_project
  resource_number = "01"
  rg_reference = {
    name     = module.rgshare.rgName
    location = module.rgshare.rgLocation
  }
}
