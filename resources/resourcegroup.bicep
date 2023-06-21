targetScope = 'subscription'

@description('Resource group name')
param rgName string = 'compute-rg'

@description('Location for resources')
param location string = deployment().location

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName
  location: location
  tags: {
    environment: 'test'
  }
}
