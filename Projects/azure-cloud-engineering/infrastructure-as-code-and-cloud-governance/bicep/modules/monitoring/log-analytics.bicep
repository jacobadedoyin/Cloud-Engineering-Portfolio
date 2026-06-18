@description('Name of the Log Analytics Workspace')
param workspaceName string

@description('Location for the workspace')
param location string = resourceGroup().location

@description('Environment tag')
param environment string

@allowed([30, 60, 90, 120, 180, 270, 365])
param retentionInDays int = 30

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: workspaceName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: retentionInDays
  }
  tags: {
    environment: environment
    'managed-by': 'bicep'
    project: 'azure-landing-zone-lite'
  }
}

resource workspaceLock 'Microsoft.Authorization/locks@2020-05-01' = {
  name: '${workspaceName}-lock'
  scope: logAnalyticsWorkspace
  properties: {
    level: 'CanNotDelete'
    notes: 'Locked to prevent accidental deletion'
  }
}

output workspaceId string = logAnalyticsWorkspace.id
output workspaceName string = logAnalyticsWorkspace.name
output customerId string = logAnalyticsWorkspace.properties.customerId
