terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
   backend "azurerm" {
        resource_group_name  = "__STORAGERG__"
        storage_account_name = "__TERRAFORMSTORAGEACCOUNT__"
        container_name       = "neblus-eastus"
        key                  = "terraform.tfstate"
        access_key  ="__storagekey__"
    }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "resource-group" {
  name     = "NEU-RG-PRD001"
  location = "east us"
}

resource "azurerm_virtual_network" "virtual-network" {
  name                = "NEU-VN-P001"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "NEU-WSB-P001"
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.virtual-network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "NEU-NIC-P001"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name

  ip_configuration {
    name                          = "NEU-IP-P001"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "virtual-machine" {
  name                = "NEU-WIN-P001"
  resource_group_name = azurerm_resource_group.resource-group.name
  location            = azurerm_resource_group.resource-group.location
  size                = "Standard_F2"
  admin_username      = "neblus"
  tags = {
    "env" = "production"
  }
  timezone            = "Eastern Standard Time"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}




