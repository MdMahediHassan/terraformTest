provider "azurerm" {
  #Configuration options
  features {

  }

}

resource "azurerm_resource_group" "myname"{
    name = "rgnew"
    location = "eastus"
}
resource "azurerm_virtual_network" "myname" {
    name ="vnet-test"
    location = azurerm_resource_group.myname.location
    resource_group_name = azurerm_resource_group.myname.name
    address_space = ["10.0.0.0/16"]
  
}

resource "azurerm_subnet" "myname" {
    name = "subnet-test"
    virtual_network_name = azurerm_virtual_network.myname.name
    address_prefixes = ["10.0.0.0/24"]

    depends_on = [ azurerm_virtual_network.myname ]
    resource_group_name = azurerm_resource_group.myname.name
}