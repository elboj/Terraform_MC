#***Provider block***#
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}


#***Data Sources***#
data "azurerm_resource_group" "resource-group" {
  name = "NEU-RG-STG001"
}

data "azurerm_network_interface" "nic" {
  name                = "NEU-NIC-P001"
  resource_group_name = "NEU-RG-STG001"
}

#***Load Balancer***#
resource "azurerm_lb" "load-balancer" {
  name                = "NEU-LB-P001"
  location            = data.azurerm_resource_group.resource-group.location
  resource_group_name = data.azurerm_resource_group.resource-group.name
  sku                 = "Standard"

  #***EXPLICIT DEPENDENCY
  depends_on = [
    azurerm_public_ip.public-ip
  ]

  frontend_ip_configuration {
    name = "ipconfig"
    #***IMPLICIT DEPENDENCY
    public_ip_address_id = azurerm_public_ip.public-ip.id
  }
}

#***Creating a public Ip for the LB
resource "azurerm_public_ip" "public-ip" {
  name                = "NEU-PIP-P001"
  location            = data.azurerm_resource_group.resource-group.location
  resource_group_name = data.azurerm_resource_group.resource-group.name
  sku                 = "Standard"
  allocation_method   = "Static"
}

#***Backend Address Pool***#
resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = "NEU-BEP-P001"
}

#***Adding nic to backend pool
resource "azurerm_network_interface_backend_address_pool_association" "example" {
  network_interface_id    = data.azurerm_network_interface.nic.id
  ip_configuration_name   = "NEU-IP-P001"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
}

#***Adding health probe
resource "azurerm_lb_probe" "health-probe" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = "http-running-probe"
  port            = 80
}

#LB Rule
resource "azurerm_lb_rule" "lb-rule" {
  loadbalancer_id                = azurerm_lb.load-balancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.example.id]
  probe_id                       = azurerm_lb_probe.health-probe.id
  frontend_ip_configuration_name = "ipconfig"
}
