resource "random_id" "rg_name" {
  byte_length = 8
}

resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "OXZRGOXHD01-${random_id.rg_name.hex}"
}
resource "azurerm_network_security_group" "nsg1" {
  location            = var.vnet_location
  name                = "test-${random_id.rg_name.hex}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_route_table" "rt1" {
  location            = var.vnet_location
  name                = "test-${random_id.rg_name.hex}-rt"
  resource_group_name = azurerm_resource_group.rg.name
}

module "vnet" {
  source              = "../modules/terraform-azurerm-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  use_for_each        = var.use_for_each
  address_space       = ["172.26.0.0/16"]
  subnet_prefixes     = ["172.26.250.32/27", "172.26.250.96/27", "172.26.253.160/28"]
  subnet_names        = ["oxzsnetoxhnprdap01", "oxzsnetoxhnprdws01", "oxzsnetoxhnprddb01"]
  vnet_location       = var.vnet_location

  nsg_ids = {
    subnet1 = azurerm_network_security_group.nsg1.id
  }

  subnet_service_endpoints = {
    oxzsnetoxhnprdap01 = ["Microsoft.Storage"],
    oxzsnetoxhnprddb01 = ["Microsoft.Sql"]
  }

  route_tables_ids = {
    oxzsnetoxhnprdap01 = azurerm_route_table.rt1.id
  }

  tags = {
    environment = "dev"
  }

  subnet_enforce_private_link_endpoint_network_policies = {
    oxzsnetoxhnprdap01 = true,
    oxzsnetoxhnprdws01 = true,
    oxzsnetoxhnprddb01 = true
  }

  subnet_enforce_private_link_service_network_policies = {
    oxzsnetoxhnprdap01 = true,
    oxzsnetoxhnprdws01 = true,
    oxzsnetoxhnprddb01 = true
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
