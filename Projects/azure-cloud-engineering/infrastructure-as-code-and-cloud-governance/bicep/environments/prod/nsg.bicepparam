using '../../modules/networking/nsg.bicep'

param nsgName = 'nsg-core-prod-uks-001'
param environment = 'prod'
param logAnalyticsWorkspaceId = '/subscriptions/fabeabb5-99b7-4630-ad42-fec31e866644/resourceGroups/rg-core-prod-uks-001/providers/Microsoft.OperationalInsights/workspaces/law-core-prod-uks-001'
