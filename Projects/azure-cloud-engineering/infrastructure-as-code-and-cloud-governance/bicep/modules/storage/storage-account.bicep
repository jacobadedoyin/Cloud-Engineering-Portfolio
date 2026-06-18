@description('Name of the storage account')
param storageAccountName string

@description('Location for the storage account')
param location string = resourceGroup().location

@description('Environment tag')
param environment string

@allowed(['Hot', 'Cool'])
param accessTier string = 'Hot'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: accessTier
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
  tags: {
    environment: environment
    'managed-by': 'bicep'
    project: 'azure-landing-zone-lite'
  }
}

resource storageLock 'Microsoft.Authorization/locks@2020-05-01' = {
  name: '${storageAccountName}-lock'
  scope: storageAccount
  properties: {
    level: 'CanNotDelete'
    notes: 'Locked to prevent accidental deletion'
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
