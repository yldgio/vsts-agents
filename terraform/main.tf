terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aci_rg" {
  name     = var.rg_name
  location = var.location
}

resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.aci_rg.name
  }

  byte_length = 4
}

resource "azurerm_storage_account" "aci_sa" {
  name                = "${var.name_prefix}stac${random_id.randomId.hex}"
  resource_group_name = azurerm_resource_group.aci_rg.name
  location            = azurerm_resource_group.aci_rg.location
  account_tier        = "Standard"

  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "aci_share" {
  name                 = "${var.name_prefix}stacshare"
  storage_account_name = azurerm_storage_account.aci_sa.name

  quota = 50
}

resource "azurerm_container_group" "aci_vsts" {
  name                = var.container_group_name
  location            = azurerm_resource_group.aci_rg.location
  resource_group_name = azurerm_resource_group.aci_rg.name
  ip_address_type     = "public"
  os_type             = "linux"

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.container_cpu
    memory = var.container_memory

    ports {
      port     = 80 #443
      protocol = "TCP"
    }
    environment_variables = {
      "VSTS_ACCOUNT" = var.vsts_account
      "VSTS_TOKEN"   = var.vsts_token
      "VSTS_AGENT"   = var.vsts_agent
      "VSTS_POOL"    = var.vsts_pool
    }

    volume {
      name       = "logs"
      mount_path = "/aci/logs"
      read_only  = false
      share_name = azurerm_storage_share.aci_share.name

      storage_account_name = azurerm_storage_account.aci_sa.name
      storage_account_key  = azurerm_storage_account.aci_sa.primary_access_key
    }
  }

  tags = {
    environment = "develop"
  }
}
