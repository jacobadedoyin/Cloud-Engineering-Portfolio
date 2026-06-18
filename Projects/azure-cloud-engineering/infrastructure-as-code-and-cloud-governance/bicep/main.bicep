cat > ~/Cloud-Engineering-Portfolio/Projects/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/bicep/main.bicep << 'EOF'
@description('Environment name')
param environment string

@description('Location for all resources')
param location string = resourceGroup().location

@description('Storage account name')
param storageAccountName string

@description('Log Analytics workspace name')
param workspaceName string

@description('NSG name')
param nsgName string

@description('Alert rule name')
param alertRuleName string

module storage 'modules/storage/storage-account.bicep' = {
  name: 'storage-deployment'
  params: {
    storageAccountName: storageAccountName
    location: location
    environment: environment
  }
}

module logAnalytics 'modules/monitoring/log-analytics.bicep' = {
  name: 'log-analytics-deployment'
  params: {
    workspaceName: workspaceName
    location: location
    environment: environment
  }
}

module nsg 'modules/networking/nsg.bicep' = {
  name: 'nsg-deployment'
  params: {
    nsgName: nsgName
    location: location
    environment: environment
    logAnalyticsWorkspaceId: logAnalytics.outputs.workspaceId
  }
}

module alertRule 'modules/monitoring/alert-rule.bicep' = {
  name: 'alert-rule-deployment'
  params: {
    alertRuleName: alertRuleName
    location: location
    environment: environment
    logAnalyticsWorkspaceId: logAnalytics.outputs.workspaceId
  }
}
EOF
