@description('Name of the alert rule')
param alertRuleName string

@description('Location for the alert rule')
param location string = resourceGroup().location

@description('Environment tag')
param environment string

@description('Resource ID of the Log Analytics Workspace')
param logAnalyticsWorkspaceId string

resource alertRule 'Microsoft.Insights/scheduledQueryRules@2022-06-15' = {
  name: alertRuleName
  location: location
  properties: {
    description: 'Alert on privileged role assignments'
    severity: 2
    enabled: true
    scopes: [
      logAnalyticsWorkspaceId
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          query: 'AzureActivity | where OperationNameValue == "Microsoft.Authorization/roleAssignments/write" | where ActivityStatusValue == "Success"'
          timeAggregation: 'Count'
          operator: 'GreaterThan'
          threshold: 0
          failingPeriods: {
            numberOfEvaluationPeriods: 1
            minFailingPeriodsToAlert: 1
          }
        }
      ]
    }
    actions: {
      actionGroups: []
    }
  }
  tags: {
    environment: environment
    'managed-by': 'bicep'
    project: 'azure-landing-zone-lite'
  }
}

output alertRuleId string = alertRule.id
