param rgLocation string = resourceGroup().location
param servicePlanSku string = 'F1'

resource FrontEndAppPlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'FrontEndAppPlan'
  location: rgLocation
  sku: {
    name: servicePlanSku
  }
  kind: 'linux'
}

resource FrontEndApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'FrontEndApp${uniqueString(resourceGroup().id)}'
  location: rgLocation
  properties: {
    serverFarmId: FrontEndAppPlan.id
  }
}
