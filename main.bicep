targetScope = 'subscription'

param location string = deployment().location

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'connectivity-rg'
  location: location
  tags: {}
}

module vnet 'resources/vnet.bicep' = {
  scope: resourceGroup
  name: 'module-virtual-network'
  params: {
    location: location
    vnetName: 'weu-vnet'
    vnetPrefixes: [
      '10.0.0.0/23'
    ]
    subnets: [
      {
        name: 'compute-snet'
        properties: {
          addressPrefix: '10.0.0.0/27'
        }
      }
      {
        name: 'shared-snet'
        properties: {
          addressPrefix: '10.0.0.32/27'
        }
      }
    ]
  }
}