targetScope = 'resourceGroup'

@description('Location for resource deployment')
param location string

@description('Name of Vnet')
param vnetName string

@description('Vnet prefix')
param vnetPrefixes array

@description('List of subnets')
param subnets array

resource weuVnet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: vnetPrefixes
    }
    subnets: subnets
  }
}
