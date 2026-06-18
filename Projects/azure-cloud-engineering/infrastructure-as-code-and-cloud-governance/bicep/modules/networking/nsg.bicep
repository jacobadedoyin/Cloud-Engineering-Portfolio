@description('Name of the NSG')
param nsgName string

@description('Location for the NSG')
param location string = resourceGroup().location

@description('Environment tag')
param environment string

@description('Resource ID of the Log Analytics Workspace')
param logAnalyticsWorkspaceId string

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: []
  }
  tags: {
    environment: environment
    'managed-by': 'bicep'
    project: 'azure-landing-zone-lite'
  }
}

resource nsgDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: '${nsgName}-diagnostics'
  scope: nsg
  properties: {
    workspaceId: logAnalyticsWorkspaceId
    logs: [
      {
        categoryGroup: 'allLogs'
        enabled: true
      }
    ]
  }
}

output nsgId string = nsg.id
output nsgName string = nsg.name
